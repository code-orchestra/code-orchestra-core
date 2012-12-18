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

public interface ReloadListener {
  /**
   * If you want to clean caches/unload reloadable parts, do it here
   * <p/>
   * Postcondition : reloadable parts of current component are unloaded
   */
  void unload();

  /**
   * If you want to load reloadable parts, do it here
   * <p/>
   * Precondition : reloadable parts of current component are be unloaded
   * Postcondition : reloadable parts of current component loaded under a new classloader
   */
  void load();

  /**
   * If you want to update UI after reload do it here.
   * <p/>
   * Precondition: all reloadable parts are reloaded under a new classloader
   */
  void onAfterReload();
}
