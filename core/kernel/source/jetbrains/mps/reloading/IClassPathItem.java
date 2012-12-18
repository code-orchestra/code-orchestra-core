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
package jetbrains.mps.reloading;

import jetbrains.mps.stubs.javastub.classpath.ClassifierKind;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.net.URL;
import java.util.List;
import java.util.Set;

/**
 * @author Kostik
 */
public interface IClassPathItem {
  @Nullable
  byte[] getClass(String name);

  @Nullable
  ClassifierKind getClassifierKind(String name);

  @Nullable
  URL getResource(String name);

  Iterable<String> getRootClasses(String namespace);

  Iterable<String> getAvailableClasses(String namespace);

  Iterable<String> getSubpackages(String namespace);

  long getClassesTimestamp(String namespace);

  long getTimestamp();

  List<RealClassPathItem> flatten();

  IClassPathItem optimize();

  void accept(IClassPathItemVisitor visitor);

  void addInvalidationAction(Runnable action);
}
