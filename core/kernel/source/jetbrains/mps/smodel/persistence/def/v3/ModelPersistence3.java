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
package jetbrains.mps.smodel.persistence.def.v3;

import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.BaseSModelDescriptor.ModelLoadResult;
import jetbrains.mps.smodel.persistence.def.IHashProvider;
import jetbrains.mps.smodel.persistence.def.IModelPersistence;
import jetbrains.mps.smodel.persistence.def.IModelReader;
import jetbrains.mps.smodel.persistence.def.IModelWriter;
import jetbrains.mps.smodel.persistence.lines.LineContent;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.xmlQuery.runtime.XMLSAXHandler;

import java.util.List;

public class ModelPersistence3 implements IModelPersistence {
  public IModelWriter getModelWriter() {
    return new ModelWriter3();
  }

  public IModelReader getModelReader() {
    return new ModelReader3();
  }

  public IHashProvider getHashProvider() {
    return new HashProvider3();
  }

  public boolean needsRecreating(IFile file) {
    String fileName = file.getName();
    int index = fileName.indexOf('.');
    String rawModelName = (index >= 0) ? fileName.substring(0, index) : fileName;
    String modelStereotype = "";
    int index1 = rawModelName.indexOf("@");
    if (index1 >= 0) {
      modelStereotype = rawModelName.substring(index1 + 1);
    }
    return SModelStereotype.TEMPLATES.equals(modelStereotype);
  }

  protected String upgradeStereotype(String stereotype) {
    if (SModelStereotype.TEMPLATES.equals(stereotype)) {
      return SModelStereotype.GENERATOR;
    }
    return stereotype;
  }

  public XMLSAXHandler<ModelLoadResult> getModelReaderHandler(ModelLoadingState state, SModelHeader header) {
    return null;
  }

  public XMLSAXHandler<List<LineContent>> getLineToContentMapReaderHandler() {
    return null;
  }

  public SModelReference upgradeModelUID(SModelReference modelReference) {
    return new SModelReference(new SModelFqName(modelReference.getLongName(), upgradeStereotype(modelReference.getStereotype())), modelReference.getSModelId());
  }
}
