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
package jetbrains.mps.newTypesystem.state.blocks;

public enum RelationKind {
  WEAK("<=", ">=", "SubTyping", true, false, false),
  STRONG("<<=", ">>=", "SubTyping (strong)", false, false, false),
  WEAK_CHECK("<='", ">='", "Check-only subTyping", true, true, false),
  STRONG_CHECK("<<='", ">>='","Check-only subTyping (strong)", false, true, false),
  WEAK_COMPARABLE("~", "Comparable", true, false, true),
  STRONG_COMPARABLE("~~", "Comparable (strong)", false, false, true),
  WEAK_COMPARABLE_CHECK("~", "Comparable", true, true, true),
  STRONG_COMPARABLE_CHECK("~~", "Comparable (strong)", false, true, true),
  CHECK_EQUATION("=='", "Check-only equation", true, true, false);

  private String myRelationSign;
  private String myReversedRelationSign;
  private String myTitle;

  private boolean myWeak;
  private boolean myCheckOnly;
  private boolean myComparable;

  RelationKind(String relationSign, String title, boolean weak, boolean checkOnly, boolean comparable) {
    this(relationSign, relationSign, title, weak, checkOnly, comparable);
  }

  RelationKind(String relationSign, String reversedRelationSign, String title, boolean weak, boolean checkOnly, boolean comparable) {
    myRelationSign = relationSign;
    myReversedRelationSign = reversedRelationSign;
    myTitle = title;
    myWeak = weak;
    myCheckOnly = checkOnly;
    myComparable = comparable;
  }

  public String getRelationSign() {
    return myRelationSign;
  }

  public String getReversedRelationSign() {
    return myReversedRelationSign;
  }

  public String getTitle() {
    return myTitle;
  }

  public boolean isWeak() {
    return myWeak;
  }

  public boolean isCheckOnly() {
    return myCheckOnly;
  }

  public boolean isComparable() {
    return myComparable;
  }

  public static RelationKind fromFlags(boolean isWeak, boolean isCheckOnly, boolean isComparable) {
    if (isComparable) {
      if (isCheckOnly) {
        if (isWeak) {
          return WEAK_COMPARABLE_CHECK;
        } else {
          return STRONG_COMPARABLE_CHECK;
        }
      } else {
        if (isWeak) {
          return WEAK_COMPARABLE;
        } else {
          return STRONG_COMPARABLE;
        }
      }
    } else {
      if (isCheckOnly) {
        if (isWeak) {
          return WEAK_CHECK;
        } else {
          return STRONG_CHECK;
        }
      } else {
        if (isWeak) {
          return WEAK;
        } else {
          return STRONG;
        }
      }
    }
  }
}
