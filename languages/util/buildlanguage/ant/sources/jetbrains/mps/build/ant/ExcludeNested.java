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
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.resources.FileResource;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * Evgeny Gryaznov, 1/17/11
 */
public class ExcludeNested extends DataType {

  private List<FileSet> excluded = new ArrayList<FileSet>();

  public List<File> getExcludedFromDiffFiles() {
    List<File> result = new ArrayList<File>();
    for (FileSet inner : excluded) {
      Iterator it = inner.iterator();
      while (it.hasNext()) {
        FileResource next = (FileResource) it.next();
        File file = next.getFile();
        if (file.exists()) {
          result.add(file);
        }
      }
    }
    return Collections.unmodifiableList(result);
  }

  public void addFile(FileSet inner) {
    excluded.add(inner);
  }

  public void addFiles(FileSet inner) {
    excluded.add(inner);
  }
}
