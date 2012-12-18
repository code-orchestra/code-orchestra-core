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
package jetbrains.mps.build.ant.generation;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.DataType;

import java.io.File;

public class PerfomanceReport extends DataType {
  private File myFile;
  private boolean myIsToConsole;
  public static final String STDOUT = "stdout";

  public File getFile() {
    return myFile;
  }

  public void setFile(File file) {
    myFile = file;
  }

  public boolean getStdOut() {
    return myIsToConsole;
  }

  public void setStdOut(boolean isToConsole) {
    myIsToConsole = isToConsole;
  }

  @Override
  public String toString() {
    if (myFile != null) {
      return myFile.getAbsolutePath();
    } else if (myIsToConsole) {
      return STDOUT;
    } else {
      throw new BuildException("Missing file or stdout attributes.");
    }
  }
}
