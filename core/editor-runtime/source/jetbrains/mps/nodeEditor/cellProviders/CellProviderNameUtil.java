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
package jetbrains.mps.nodeEditor.cellProviders;

public class CellProviderNameUtil {
  public static final String CELL_PROVIDER_POSTFIX = "CellProvider";
  public static final String CELL_MODEL_PREFIX = "CellModel_";
  public static final String CELL_PROVIDERS_PACKAGE = "cellProviders";
  public static final String CELL_LIST_HANDLER_POSTFIX = "Handler";

  public static String getProviderClassName(String cellModelClassName) {
    int index = cellModelClassName.lastIndexOf(".");
    String prefix = cellModelClassName.substring(0, index + 1);
    String name = cellModelClassName.substring(index+  1);
    if (!name.startsWith(CELL_MODEL_PREFIX)) return null;
    return prefix + CELL_PROVIDERS_PACKAGE + "." + name.substring(CELL_MODEL_PREFIX.length()) + CELL_PROVIDER_POSTFIX;
  }
}
