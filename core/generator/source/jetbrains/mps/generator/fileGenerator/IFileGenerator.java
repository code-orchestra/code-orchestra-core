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
package jetbrains.mps.generator.fileGenerator;

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

import java.io.File;
import java.io.IOException;

/**
 * author: Igor Alshannikov
 * Sep 14, 2006
 * @deprecated use IGenerationHandler
 */
public interface IFileGenerator {
  File generateFile(SNode outputRootNode, SNode originalInputNode, SModel inputModel, String content, File outputRootDir) throws IOException;

  boolean overridesDefault(SNode outputRootNode, SNode originalInputNode);

  boolean isDefault(SNode outputRootNode);
}
