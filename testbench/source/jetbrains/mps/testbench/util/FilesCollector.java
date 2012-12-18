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
package jetbrains.mps.testbench.util;

import com.intellij.openapi.util.Pair;
import com.intellij.openapi.util.io.FileUtil;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.resources.FileResource;

import java.io.File;
import java.util.*;
import java.util.regex.Pattern;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: Aug 27, 2010
 * Time: 2:56:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class FilesCollector {

  public static Iterable<File> collectFiles(Iterable<FilePattern> filePtns, Iterable<File> path) {

    Map<File, Set<String>> includePathsMap = new HashMap<File, Set<String>> ();
    Map<File, Set<String>> excludePathsMap = new HashMap<File, Set<String>> ();

    for (FilePattern fp : filePtns) {
      PatternFileSearcher pfs = new PatternFileSearcher(fp.filePtn, path);

      for (Pair<File,String> pear: pfs.getRelativePaths()) {
        Map<File, Set<String>> pathsMap = fp.include ? includePathsMap : excludePathsMap;
        Set<String> paths = pathsMap.get(pear.getFirst());
        if (paths == null) {
          paths = new HashSet<String> ();
          pathsMap.put(pear.getFirst(), paths);
        }
        paths.add (pear.getSecond());
      }
    }

    final List<File> files = new ArrayList<File>();

    for (Map.Entry<File, Set<String>> en: includePathsMap.entrySet()) {
      Set<String> include = en.getValue();
      Set<String> exclude = excludePathsMap.get(en.getKey());
      if (exclude != null) {
        include.removeAll(exclude);
      }
      for (String p: include) {
        files.add(new File (p));
      }
    }

    return Collections.unmodifiableCollection(files);
  }

  public static Iterable<File> fastCollectFiles(Iterable<FilePattern> filePtns, Iterable<File> path) {
    Project p = new Project();
    ArrayList<File> res = new ArrayList<File>();
    for (File dir: path) {
      FileSet fs = new FileSet();
      fs.setProject(p);
      fs.setDir(dir);
      for (FilePattern fp : filePtns) {
        (fp.include ? fs.createInclude() : fs.createExclude()).setName(fp.filePtn);
      }
      for (Iterator it = fs.iterator(); it.hasNext();) {
        res.add(((FileResource) it.next()).getFile());
      }
    }
    return res;
  }

  public static class FilePattern {

    public static enum Type {
      INCLUDE,
      EXCLUDE
    }

    public final boolean include;
    public final String filePtn;

    private FilePattern(boolean include, String filePtn) {
      this.include = include;
      this.filePtn = filePtn;
    }

    public static FilePattern fromTypeAndPattern(Object... objs) {
      Type t = (Type) objs[0];
      boolean include = (t == Type.INCLUDE);
      return new FilePattern(include, (String) objs[1]);
    }

    public String toString () {
      return
        (include ? Type.INCLUDE.toString() : Type.EXCLUDE.toString()) +
        " " +
        filePtn;
    }
  }

  private static class PatternFileSearcher {
    private String pattern;
    private Iterable<File> sourcePath;

    public PatternFileSearcher(String pattern, Iterable<File> sourcePath) {
      this.sourcePath = sourcePath;
      this.pattern = pattern;
    }

    public Iterable<Pair<File, String>> getRelativePaths () {
      Pattern ptn = Pattern.compile(FileUtil.convertAntToRegexp(pattern));
      List<Pair <File, String>> res = new ArrayList<Pair<File, String>>();

      for (File spd: sourcePath) {
        List<File> files = new ArrayList<File> ();
        FileUtil.collectMatchedFiles(spd, ptn, files);
        for (File match: files) {
          res.add(new Pair<File, String> (spd, FileUtil.getRelativePath(spd, match)));
        }
      }
      return Collections.unmodifiableList(res);
    }

  }
}
