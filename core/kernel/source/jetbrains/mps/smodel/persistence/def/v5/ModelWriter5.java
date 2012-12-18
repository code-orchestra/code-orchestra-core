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
package jetbrains.mps.smodel.persistence.def.v5;

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.persistence.def.v4.ModelWriter4;
import org.jdom.Document;
import org.jdom.Element;

/**
 * Evgeny Gryaznov, Aug 2, 2010
 */
public class ModelWriter5 extends ModelWriter4 {
  protected int getModelPersistenceVersion() {
    return 5;
  }

  protected void saveRefactorings(Element rootElement, SModel sourceModel) {
    // refactorings are extracted into separate file in version 5
  }
}
