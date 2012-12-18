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
package jetbrains.mps.smodel;

import jetbrains.mps.util.annotation.UseCarefully;
import org.jetbrains.annotations.NotNull;

@UseCarefully
public final class HackSNodeUtil {

  private HackSNodeUtil() {
  }

  @UseCarefully
  public static void setConceptFqName(SNode node, String conceptFQName) {
    node.setConceptFqName(conceptFQName);
  }

  @UseCarefully
  public static void changePropertyName(SNode node, @NotNull String oldPropertyName, @NotNull String newPropertyName) {
    node.changePropertyName(oldPropertyName, newPropertyName);
  }
}
