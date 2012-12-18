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
package jetbrains.mps.nodeEditor.selection;

/**
 * This exception should be used to indicate that selection wa not properly restored
 * most probably because of the changes in corresponding places in model. This is normal
 * situation, so this exception should be skipped and should not be logged as error.
 *
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/29/11
 * Time: 4:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class SelectionRestoreException extends Exception {
  public SelectionRestoreException() {
    super("Canot restore selection");
  }
}
