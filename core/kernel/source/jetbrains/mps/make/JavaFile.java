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
package jetbrains.mps.make;

import jetbrains.mps.util.FileUtil;

import java.io.File;

public class JavaFile {
  private final File myFile;
  private final String myClassName;
  private final long myLastModified;

  JavaFile(File file, String className, long lastModified) {
    myFile = file;
    myClassName = className;
    myLastModified = lastModified;
  }

  File getFile() {
    return myFile;
  }

  String getClassName() {
    return myClassName;
  }

  long getLastModified() {
    return myLastModified;
  }

  String getContents() {
    return FileUtil.read(myFile);
  }

  public String toString() {
    return "JavaFile " + myClassName + " at " + myFile;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    JavaFile javaFile = (JavaFile) o;

    if (!myClassName.equals(javaFile.myClassName)) return false;
    if (!myFile.equals(javaFile.myFile)) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = myFile.hashCode();
    result = 31 * result + myClassName.hashCode();
    return result;
  }
}
