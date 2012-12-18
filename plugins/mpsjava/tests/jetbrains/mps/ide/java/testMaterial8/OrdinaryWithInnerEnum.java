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
package jetbrains.mps.ide.java.testMaterial8;

public class OrdinaryWithInnerEnum<U> {

  public static enum Kind {
    UNION,
    INTERSECTION,
    SUBSTRACTION,
    DISJUNCTION
  }

  private final Kind kind = Kind.DISJUNCTION;

  private class ComparingIterator {

    private void init() {
      switch (kind) {

        case SUBSTRACTION:
        case INTERSECTION:
        case UNION:
        case DISJUNCTION:
        default:
          break;
      }
    }

    private void moveToNext() {
      do {
        switch (kind) {

          case SUBSTRACTION:

          case INTERSECTION:


          case UNION:


          case DISJUNCTION:


          default:
            break;
        }
      } while (true);

    }

  }

}