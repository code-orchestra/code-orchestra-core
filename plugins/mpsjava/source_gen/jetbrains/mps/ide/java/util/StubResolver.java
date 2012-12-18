package jetbrains.mps.ide.java.util;

/*Generated by MPS */

import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.smodel.LanguageID;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.util.Set;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.internal.collections.runtime.SetSequence;
import java.util.HashSet;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.internal.collections.runtime.ISelector;
import java.util.List;
import jetbrains.mps.smodel.SReference;
import java.util.Map;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SModelOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.SModelFqName;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.smodel.IOperationContext;
import java.util.HashMap;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.internal.collections.runtime.IVisitor;
import jetbrains.mps.smodel.MissingDependenciesFixer;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.search.ISearchScope;
import jetbrains.mps.typesystem.inference.TypeContextManager;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.util.Condition;
import jetbrains.mps.project.OptimizeImportsHelper;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;

public class StubResolver {
  private static final String JAVA_STUB = SModelStereotype.getStubStereotypeForId(LanguageID.JAVA);
  protected static Log log = LogFactory.getLog(StubResolver.class);

  private Set<SModelReference> myUsedModels;

  public StubResolver() {
    // resolve to any nonstub model 
    myUsedModels = null;
  }

  public StubResolver(Iterable<SModel> models) {
    // resolve only to models from sequence 
    myUsedModels = SetSequence.fromSetWithValues(new HashSet<SModelReference>(), Sequence.fromIterable(models).select(new ISelector<SModel, SModelReference>() {
      public SModelReference select(SModel it) {
        return it.getSModelReference();
      }
    }));
  }

  private List<SReference> getReferencesToResolve(SModel sourceModel, Map<SModelReference, SModelReference> models) {
    // fills models map with stub -> model correspondance 
    List<SReference> result = ListSequence.fromList(new ArrayList<SReference>());
    for (SNode node : ListSequence.fromList(SModelOperations.getNodes(sourceModel, null))) {
      for (SReference ref : Sequence.fromIterable(SNodeOperations.getReferences(node))) {
        SModelReference targetModelRef = ref.getTargetSModelReference();
        if (targetModelRef == null || !(JAVA_STUB.equals(targetModelRef.getStereotype()))) {
          continue;
        }
        // trying to find correspondent nonstub model 
        SModelFqName modelName = new SModelFqName(targetModelRef.getLongName(), null);
        SModelReference modelRef = check_ar1im2_a0e0a0c0a(SModelRepository.getInstance().getModelDescriptor(modelName));
        if (modelRef == null) {
          continue;
        }
        if (myUsedModels == null || SetSequence.fromSet(myUsedModels).contains(modelRef)) {
          MapSequence.fromMap(models).put(targetModelRef, modelRef);
          ListSequence.fromList(result).addElement(ref);
        }
      }
    }
    return result;
  }

  public void resolveInModel(final SModel model, IOperationContext context) {
    Map<SModelReference, SModelReference> models = MapSequence.fromMap(new HashMap<SModelReference, SModelReference>());
    List<SReference> toResolve = getReferencesToResolve(model, models);
    if (ListSequence.fromList(toResolve).isEmpty()) {
      return;
    }

    Iterable<SModelReference> modelsToAdd = Sequence.fromIterable(MapSequence.fromMap(models).values()).where(new IWhereFilter<SModelReference>() {
      public boolean accept(SModelReference it) {
        return !(jetbrains.mps.smodel.SModelOperations.getImportedModelUIDs(model).contains(it));
      }
    });
    Sequence.fromIterable(modelsToAdd).visitAll(new IVisitor<SModelReference>() {
      public void visit(SModelReference it) {
        model.addModelImport(it, false);
      }
    });
    if (Sequence.fromIterable(modelsToAdd).isNotEmpty()) {
      new MissingDependenciesFixer(null, model.getModelDescriptor()).fix(false);
    }

    int cnt = 0;
    boolean found;
    do {
      found = false;
      for (SReference ref : ListSequence.fromList(toResolve).toGenericArray(SReference.class)) {
        SNode node = ref.getSourceNode();
        final SModelReference modelRef = MapSequence.fromMap(models).get(ref.getTargetSModelReference());
        final String resolveInfo = SLinkOperations.getResolveInfo(ref);
        if (modelRef == null || resolveInfo == null) {
          continue;
        }
        final ISearchScope scope = SNodeOperations.getReferentSearchScope(node, SLinkOperations.getRole(ref), context);
        if (scope == null) {
          continue;
        }
        List<SNode> resolved = TypeContextManager.getInstance().runResolveAction(new Computable<List<SNode>>() {
          public List<SNode> compute() {
            return scope.getNodes(new Condition<SNode>() {
              public boolean met(SNode n) {
                return modelRef.equals(SNodeOperations.getModel(n).getSModelReference()) && resolveInfo.equals(n.getResolveInfo());
              }
            });
          }
        });
        if (ListSequence.fromList(resolved).count() > 1) {
          if (log.isErrorEnabled()) {
            log.error("more than 1 possible resolution for " + SLinkOperations.getResolveInfo(ref) + " in model " + modelRef.getLongName());
          }
        }
        if (ListSequence.fromList(resolved).count() > 0) {
          node.setReferent(SLinkOperations.getRole(ref), ListSequence.fromList(resolved).first());
          ListSequence.fromList(toResolve).removeElement(ref);
          ++cnt;
          found = true;
        }
      }
    } while (found);

    new OptimizeImportsHelper(context).optimizeModelImports(model.getModelDescriptor());
    if (log.isInfoEnabled()) {
      log.info(cnt + " stub references were re-resolved in model " + SModelOperations.getModelName(model) + ". (" + ListSequence.fromList(toResolve).count() + ")");
    }
  }

  public void resolveInModels(List<SModelDescriptor> models, IOperationContext context) {
    for (SModelDescriptor model : ListSequence.fromList(models)) {
      resolveInModel(model.getSModel(), context);
    }
  }

  public void resolveInProject(MPSProject project, IOperationContext context) {
    for (IModule module : ListSequence.fromList(project.getModulesWithGenerators())) {
      if (module.isPackaged()) {
        continue;
      }
      for (SModelDescriptor model : ListSequence.fromList(module.getOwnModelDescriptors())) {
        if (SModelStereotype.isUserModel(model) && model instanceof EditableSModelDescriptor) {
          resolveInModel(model.getSModel(), context);
        }
      }
    }
  }

  private static SModelReference check_ar1im2_a0e0a0c0a(SModelDescriptor checkedDotOperand) {
    if (null != checkedDotOperand) {
      return checkedDotOperand.getSModelReference();
    }
    return null;
  }
}
