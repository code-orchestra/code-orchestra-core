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
package jetbrains.mps.debug.api.programState;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 20.05.2010
 * Time: 19:12:58
 * To change this template use File | Settings | File Templates.
 */
public class NullLocation implements ILocation {
  @Override
  public String getFileName() {
    return null;
  }

  @Override
  public String getUnitName() {
    return null;
  }

  @Override
  public String getRoutineName() {
    return null;
  }

  @Override
  public int getLineNumber() {
    return -1;
  }
}
