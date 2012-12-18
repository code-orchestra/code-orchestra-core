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

import com.intellij.ide.ClassloaderUtil;
import com.intellij.util.lang.UrlClassLoader;

import java.lang.reflect.Method;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class AntBootstrap {
  public static void main(String[] args) {
//    System.setProperty(ClassloaderUtil.PROPERTY_IGNORE_CLASSPATH, ".*trove4j.*trove4j.*\\.jar");
    System.setProperty("mps.vfs.useIoFile", "true");
    UrlClassLoader newClassLoader = ClassloaderUtil.initClassloader(new ArrayList<URL>());
    try {
      Class clazz = newClassLoader.loadClass(args[0]);

      Method mainMethod = clazz.getDeclaredMethod("main", String[].class);
      mainMethod.setAccessible(true);
      String[] passedArgs = new String[args.length - 1];
      System.arraycopy(args, 1, passedArgs, 0, passedArgs.length);
      mainMethod.invoke(null, (Object)passedArgs);
    } catch (Exception e) {
      e.printStackTrace(System.err);
    }
    System.exit(1);
  }
}
