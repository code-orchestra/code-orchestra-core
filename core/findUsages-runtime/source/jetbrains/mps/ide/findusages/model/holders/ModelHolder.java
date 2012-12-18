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
package jetbrains.mps.ide.findusages.model.holders;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.NameUtil;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

public class ModelHolder implements IHolder<SModel> {
  private static final String MODEL = "model";
  private static final String UID = "uid";

  public SModelReference myModelReference = SModelReference.fromString("");

  public ModelHolder(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public ModelHolder(SModel model) {
    myModelReference = model.getModelDescriptor().getSModelReference();
  }

  private SModelDescriptor getModelDescriptor() {
    return SModelRepository.getInstance().getModelDescriptor(myModelReference);
  }

  public SModel getObject() {
    SModelDescriptor modelDescriptor = getModelDescriptor();
    if (modelDescriptor == null) return null;
    return modelDescriptor.getSModel();
  }

  @NotNull
  public String getCaption() {
    return NameUtil.shortNameFromLongName(myModelReference.getLongName());
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    Element modelXML = new Element(MODEL);
    modelXML.setAttribute(UID, myModelReference.toString());
    element.addContent(modelXML);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    Element modelXML = element.getChild(MODEL);
    myModelReference = SModelReference.fromString(modelXML.getAttributeValue(UID));
  }
}
