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

import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.BuildException;

import java.io.File;

public class ProjectNested extends FileSet {
  private boolean myWholeProject = false;
  private static final String[] EXCLUDES = new String[]{"**/*.msd, **/*.mpl, **/*.class, **/*.java, **/*.mps, **/.svn/"};

  @Override
  public void setDir(File dir) throws BuildException {
    super.setDir(dir);
    appendExcludes(EXCLUDES);
  }

  public boolean getWholeProject() {
    return myWholeProject;
  }

  public void setWholeProject(boolean wholeProject) {
    myWholeProject = wholeProject;
  }
}
