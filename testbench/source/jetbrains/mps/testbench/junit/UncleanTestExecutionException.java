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
package jetbrains.mps.testbench.junit;

import jetbrains.mps.testbench.util.Output;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: Aug 18, 2010
 * Time: 2:33:37 PM
 * To change this template use File | Settings | File Templates.
 */
public class UncleanTestExecutionException extends Exception {


  public UncleanTestExecutionException(Output... outputs) {
    super (outputToMessage(outputs));
  }

  private static String outputToMessage(Output... outputs) {
    StringBuilder sb = new StringBuilder();
    String sep = "\n";
    for (Output f:outputs) {
      if (f.isNotEmpty()) {
        sb.append(sep).append(f.getDescription()); sep ="; ";
      }
    }
    sb.append("\n---8<---------");
    for (Output f:outputs) {
      if (f.isNotEmpty()) {
        sb.append("\n[").append(f.getDescription()).append("]\n");
        sb.append(f.getText());
      }
    }
    sb.append("--------->8---");
    return sb.toString();
  }
}
