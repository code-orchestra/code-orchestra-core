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
 * Date: 14.04.2010
 * Time: 18:08:56
 * To change this template use File | Settings | File Templates.
 */
public class WatchablesCategory implements Comparable<WatchablesCategory> {
  public static final WatchablesCategory NONE = new WatchablesCategory("");

  private final String myCategoryName;

  public WatchablesCategory(String categoryName) {
    myCategoryName = categoryName;
  }

  public String getCategoryName() {
    return myCategoryName;
  }

  @Override
  public int compareTo(WatchablesCategory o) {
    return this.getCategoryName().compareTo(o.getCategoryName());
  }
}
