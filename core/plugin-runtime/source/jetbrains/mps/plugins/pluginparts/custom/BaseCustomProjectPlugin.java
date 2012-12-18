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
package jetbrains.mps.plugins.pluginparts.custom;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.MPSProject;

public abstract class BaseCustomProjectPlugin {
  private static final Logger LOG = Logger.getLogger(BaseCustomProjectPlugin.class);
  private MPSProject myProject;

  public void init(MPSProject project) {
    try {
      myProject = project;
      doInit(project);
    } catch (Throwable t) {
      LOG.error("User custom plugin init method failed: ", t);
    }
  }

  public void dispose() {
    try {
      doDispose(myProject);
    } catch (Throwable t) {
      LOG.error("User custom plugin dispose method failed: ", t);
    }
  }

  public void doInit(MPSProject project) {
  }

  public void doDispose(MPSProject project) {
  }
}
