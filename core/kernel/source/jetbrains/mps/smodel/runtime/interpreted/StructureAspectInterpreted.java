/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.smodel.runtime.interpreted;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.runtime.ConceptDescriptor;
import jetbrains.mps.smodel.runtime.StructureAspectDescriptor;
import jetbrains.mps.smodel.runtime.base.BaseConceptDescriptor;
import jetbrains.mps.smodel.runtime.illegal.IllegalConceptDescriptor;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class StructureAspectInterpreted implements StructureAspectDescriptor, ApplicationComponent {
  private Map<String, ConceptDescriptor> descriptors = new ConcurrentHashMap<String, ConceptDescriptor>();

  private ThreadLocal<Set<String>> inLoad = new ThreadLocal<Set<String>>() {
    @Override
    protected Set<String> initialValue() {
      return new HashSet<String>();
    }
  };

  public StructureAspectInterpreted() {
  }

  public static StructureAspectInterpreted getInstance() {
    return ApplicationManager.getApplication().getComponent(StructureAspectInterpreted.class);
  }

  @Override
  public ConceptDescriptor getDescriptor(String fqName) {
    ConceptDescriptor descriptor = descriptors.get(fqName);

    if (descriptor == null) {
      if (inLoad.get().contains(fqName)) {
        return null;
      }
      inLoad.get().add(fqName);
      descriptor = new InterpretedConceptDescriptor(fqName);
      if (!((InterpretedConceptDescriptor) descriptor).isLegal) {
        descriptor = new IllegalConceptDescriptor(fqName);
      }
      inLoad.get().remove(fqName);
      descriptors.put(fqName, descriptor);
    }

    return descriptor;
  }

  @Override
  public void initComponent() {
    MPSModuleRepository.getInstance().addModuleRepositoryListener(new ModuleRepositoryAdapter() {
      @Override
      public void repositoryChanged() {
        invalidateDescriptors();
      }
    });

    GlobalSModelEventsManager.getInstance().addGlobalCommandListener(new SModelCommandListener() {
      public void eventsHappenedInCommand(List<SModelEvent> events) {
        for (SModelEvent e : events) {
          if (!LanguageAspect.STRUCTURE.is(e.getModelDescriptor())) continue;
          invalidateDescriptors();
        }
      }
    });
  }

  private void invalidateDescriptors() {
    descriptors.clear();
  }

  @Override
  public void disposeComponent() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Structure aspect interpreted";
  }

  private class InterpretedConceptDescriptor extends BaseConceptDescriptor {
    private final String fqName;

    private boolean isLegal;

    private boolean isInterface;
    private String superConcept;
    private List<String> parents;

    private Set<String> ancestors;
    private List<String> propertyNames;
    private List<String> referenceNames;

    InterpretedConceptDescriptor(final String fqName) {
      this.fqName = fqName;

      final List<String> directProperties = new ArrayList<String>();
      final List<String> directReferences = new ArrayList<String>();

      NodeReadAccessCasterInEditor.runReadTransparentAction(new Runnable() {
        public void run() {
          SNode declaration = SModelUtil.findConceptDeclaration(fqName, GlobalScope.getInstance());
          if (declaration == null || !SNodeUtil.isInstanceOfAbstractConceptDeclaration(declaration)) {
            // todo: ?
            isLegal = false;
            return;
          } else {
            isLegal = true;
          }

          // isInterface
          isInterface = SNodeUtil.isInstanceOfInterfaceConceptDeclaration(declaration);

          // superconcept
          if (SNodeUtil.isInstanceOfConceptDeclaration(declaration)) {
            SNode superConceptNode = SNodeUtil.getConceptDeclaration_Extends(declaration);

            if (superConceptNode == null && !SNodeUtil.concept_BaseConcept.equals(fqName)) {
              superConcept = SNodeUtil.concept_BaseConcept;
            } else {
              superConcept = NameUtil.nodeFQName(superConceptNode);
            }
          }

          // parents
          Set<String> parentsSet = new LinkedHashSet<String>();

          if (SNodeUtil.isInstanceOfConceptDeclaration(declaration)) {
            parentsSet.add(superConcept);

            for (SNode interfaceConcept : SNodeUtil.getConceptDeclaration_Implements(declaration)) {
              parentsSet.add(NameUtil.nodeFQName(interfaceConcept));
            }
          } else if (SNodeUtil.isInstanceOfInterfaceConceptDeclaration(declaration)) {
            for (SNode interfaceConcept : SNodeUtil.getInterfaceConceptDeclaration_Extends(declaration)) {
              parentsSet.add(NameUtil.nodeFQName(interfaceConcept));
            }
          }

          parentsSet.remove(null);
          if (superConcept == null && !SNodeUtil.concept_BaseConcept.equals(fqName) && !isInterface) {
            parentsSet.add(SNodeUtil.concept_BaseConcept);
          }

          parents = new ArrayList<String>(parentsSet);

          // direct properties
          for (SNode property : SNodeUtil.getConcept_PropertyDeclarations(declaration)) {
            String name = property.getName();
            if (name != null) {
              directProperties.add(name);
            }
          }

          // direct references
          for (SNode link : SNodeUtil.getConcept_LinkDeclarations(declaration)) {
            if (SNodeUtil.getLinkDeclaration_IsReference(link)) {
              String role = SModelUtil.getLinkDeclarationRole(link);
              if (role != null) {
                directReferences.add(role);
              }
            }
          }
        }
      });

      if (isLegal) {
        // get parent descriptors
        List<ConceptDescriptor> parentDescriptors = new ArrayList<ConceptDescriptor>(parents.size());
        for (String parent : parents) {
          ConceptDescriptor descriptor = getDescriptor(parent);
          if (descriptor != null) {
            parentDescriptors.add(descriptor);
          }
        }

        // ancestors
        ancestors = new HashSet<String>(parents);
        ancestors.add(fqName);
        for (ConceptDescriptor parentDescriptor : parentDescriptors) {
          ancestors.addAll(parentDescriptor.getAncestorsNames());
        }

        // properties
        LinkedHashSet<String> properties = new LinkedHashSet<String>();
        properties.addAll(directProperties);

        for (ConceptDescriptor parentDescriptor : parentDescriptors) {
          properties.addAll(parentDescriptor.getPropertyNames());
        }

        propertyNames = new ArrayList<String>(properties);

        // references
        LinkedHashSet<String> references = new LinkedHashSet<String>();
        references.addAll(directReferences);

        for (ConceptDescriptor parentDescriptor : parentDescriptors) {
          references.addAll(parentDescriptor.getReferenceNames());
        }

        referenceNames = new ArrayList<String>(references);
      }
    }

    @Override
    public String getConceptFqName() {
      return fqName;
    }

    @Override
    public String getSuperConcept() {
      return superConcept;
    }

    @Override
    public boolean isInterfaceConcept() {
      return isInterface;
    }

    @Override
    public List<String> getPropertyNames() {
      return propertyNames;
    }

    @Override
    public List<String> getReferenceNames() {
      return referenceNames;
    }

    @Override
    public List<String> getParentsNames() {
      return parents;
    }

    @Override
    public Set<String> getAncestorsNames() {
      return ancestors;
    }
  }
}
