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
package jetbrains.mps.smodel.persistence.def;

import jetbrains.mps.smodel.BaseSModelDescriptor.ModelLoadResult;
import jetbrains.mps.smodel.ModelLoadingState;
import jetbrains.mps.smodel.SModelHeader;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.persistence.lines.LineContent;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.xmlQuery.runtime.XMLSAXHandler;

import java.util.List;

public interface IModelPersistence {
  IModelWriter getModelWriter();

  IModelReader getModelReader();

  IHashProvider getHashProvider();

  XMLSAXHandler<ModelLoadResult> getModelReaderHandler(ModelLoadingState state, SModelHeader header);

  XMLSAXHandler<List<LineContent>> getLineToContentMapReaderHandler();

  SModelReference upgradeModelUID(SModelReference modelReference);

  boolean needsRecreating(IFile file);
}
