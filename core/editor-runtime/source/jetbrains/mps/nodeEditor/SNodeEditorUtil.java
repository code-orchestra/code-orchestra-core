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
package jetbrains.mps.nodeEditor;

import jetbrains.mps.smodel.SNode;

public class SNodeEditorUtil {
  public static final String RIGHT_TRANSFORM_HINT = "right_transform_hint";
  public static final String LEFT_TRANSFORM_HINT = "left_transform_hint";


  public static void addRightTransformHint(SNode node) {
    node.setBooleanProperty(RIGHT_TRANSFORM_HINT, true);
  }

  public static boolean hasRightTransformHint(SNode node) {
    return node.getBooleanProperty(RIGHT_TRANSFORM_HINT);
  }

  public static void removeRightTransformHint(SNode node) {
    node.setBooleanProperty(RIGHT_TRANSFORM_HINT, false);
  }

  public static void addLeftTransformHint(SNode node) {
    node.setBooleanProperty(LEFT_TRANSFORM_HINT, true);
  }

  public static boolean hasLeftTransformHint(SNode node) {
    return node.getBooleanProperty(LEFT_TRANSFORM_HINT);
  }

  public static void removeLeftTransformHint(SNode node) {
    node.setBooleanProperty(LEFT_TRANSFORM_HINT, false);
  }
}
