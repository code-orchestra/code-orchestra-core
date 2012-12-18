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
package jetbrains.mps.intentions;

import jetbrains.mps.intentions.icons.Icons;

import javax.swing.Icon;

public enum IntentionType {
  NORMAL(Icons.REAL_INTENTION, 3),
  MIGRATION(Icons.MIGRATION, 2),
  QUICKFIX(Icons.QUICKFIX, 1), //todo remove
  ERROR(Icons.ERROR_INTENTION, 0);

  private static final IntentionType LOWEST_PRIORITY_TYPE;

  private int myPriority;
  private Icon myIcon;

  static {
    IntentionType result = values()[0];
    for (IntentionType type : values()) {
      if (type.getPriority() > result.getPriority()) {
        result = type;
      }
    }
    LOWEST_PRIORITY_TYPE = result;
  }

  IntentionType(Icon icon, int priority) {
    myIcon = icon;
    myPriority = priority;
  }

  public Icon getIcon() {
    return myIcon;
  }

  public int getPriority() {
    return myPriority;
  }

  public static IntentionType getLowestPriorityType() {
    return LOWEST_PRIORITY_TYPE;
  }
}
