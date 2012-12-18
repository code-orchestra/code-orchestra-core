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
package jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.model.SearchResult;
import jetbrains.mps.ide.findusages.view.treeholder.tree.TextOptions;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.INodeRepresentator;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.path.PathItemRole;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import org.jdom.Element;

import javax.swing.Icon;

public class ModelNodeData extends BaseNodeData {
  private static final String MODEL = "model";
  private static final String UID = "uid";

  public SModelReference myModelReference = SModelReference.fromString("");

  public ModelNodeData(PathItemRole role, SearchResult result, boolean isResult,
                       INodeRepresentator nodeRepresentator, boolean resultsSection) {
    super(role,
      (isResult && nodeRepresentator != null) ?
        nodeRepresentator.getPresentation(result.getObject()) :
        ((SModel) result.getPathObject()).getModelDescriptor().getLongName(),
      "",
      false,
      isResult,
      resultsSection);
    myModelReference = ((SModel) result.getPathObject()).getModelDescriptor().getSModelReference();
  }

  public ModelNodeData(PathItemRole role, SModel model, boolean isResult, boolean resultsSection) {
    super(role, model.getModelDescriptor().getLongName(), "", false, isResult, resultsSection);
    myModelReference = model.getModelDescriptor().getSModelReference();
  }

  public ModelNodeData(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public Icon getIcon() {
    SModelDescriptor modelDescriptor = getModelDescriptor();
    if (modelDescriptor != null) {
      return IconManager.getIconFor(modelDescriptor);
    }
    return jetbrains.mps.ide.projectPane.Icons.MODEL_ICON;
  }

  public Object getIdObject() {
    SModelDescriptor modelDescriptor = getModelDescriptor();
    if (modelDescriptor == null) return null;
    return modelDescriptor.getSModel();
  }

  public SModelDescriptor getModelDescriptor() {
    return SModelRepository.getInstance().getModelDescriptor(myModelReference);
  }

  public SModelReference getModelReference() {
    return myModelReference;
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    super.write(element, project);
    Element modelXML = new Element(MODEL);
    modelXML.setAttribute(UID, myModelReference.toString());
    element.addContent(modelXML);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    super.read(element, project);
    Element modelXML = element.getChild(MODEL);
    myModelReference = SModelReference.fromString(modelXML.getAttributeValue(UID));
  }

  public String getText(TextOptions options) {
    boolean showCounter = options.myCounters && isResultsSection();
    String counter = showCounter ? " " + sizeRepresentation(options.mySubresultsCount) : "";
    return super.getText(options) + counter;
  }

  private static String sizeRepresentation(int size) {
    return "<font color='gray'>(" + Integer.toString(size) + ")</font>";
  }
}
