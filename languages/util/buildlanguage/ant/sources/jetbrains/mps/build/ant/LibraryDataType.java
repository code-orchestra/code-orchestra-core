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
package jetbrains.mps.build.ant;

import org.apache.tools.ant.types.DataType;

import java.io.File;

public class LibraryDataType extends DataType {
  private String myName;
  private File myDir;
  private boolean myCompile = false;

  public String getName() {
    return myName;
  }

  public void setName(String name) {
    myName = name;
  }

  public File getDir() {
    return myDir;
  }

  public void setDir(File dir) {
    myDir = dir;
  }

  public boolean getCompile() {
    return myCompile;
  }

  public void setCompile(boolean compile) {
    myCompile = compile;
  }
}
