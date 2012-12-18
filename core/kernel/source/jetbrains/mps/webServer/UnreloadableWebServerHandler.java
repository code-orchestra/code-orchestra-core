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
package jetbrains.mps.webServer;

import jetbrains.mps.project.Solution;

/**
 * User: vadim
 * TODO: this class handles web server process. it's placed into MPS core classpath to avoid it's reload.
 */
public class UnreloadableWebServerHandler {

  private static UnreloadableWebServerHandler instance = new UnreloadableWebServerHandler();

  public enum State {
    STOPPED,
    STOPPING,
    STARTED,
    STARTING;
  }

  public State myState = null;
  public Process myServer = null;
  public Solution myRunningSolution = null;

  public static UnreloadableWebServerHandler getInstance() {
    return instance;
  }

}
