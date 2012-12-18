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
package jetbrains.mps.ide.navigation;

import com.intellij.openapi.extensions.ExtensionPointName;

/**
 * Evgeny Gryaznov, Aug 24, 2010
 */
public interface NavigationProvider {

  public static ExtensionPointName<NavigationProvider> EP_NAME =
    ExtensionPointName.create("com.intellij.mps.NavigationProvider");

  boolean openClass(String projectPath, String fqName);

  boolean openMethod(String projectPath, String className, String name, int parameterCount);

  boolean openField(String projectPath, String className, String name);

  boolean openConstructor(String projectPath, String className, int parameterCount);
}
