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

import org.apache.tools.ant.Task;

public class MyTeamcityAwareExecuteStreamHandler extends MyExecuteStreamHandler {
  private final IBuildServerMessageFormat myBuildServerMessageFormat;
  private boolean myMergeNext = false;

  public MyTeamcityAwareExecuteStreamHandler(Task task, IBuildServerMessageFormat buildServerMessageFormat) {
    super(task);
    myBuildServerMessageFormat = buildServerMessageFormat;
  }

  @Override
  protected void logOutput(String line) {
    if (myMergeNext || myBuildServerMessageFormat.isBuildServerMessage(line)){
       int c = myBuildServerMessageFormat.hasContinuation(line);
       if (c > 0) {
          this.myMergeNext = true;
          System.out.print(line.substring(0, line.length()-c));
       }
       else {
          this.myMergeNext = false;
          System.out.println(line);
       }
    } else {
      super.logOutput(line);
    }
  }
}
