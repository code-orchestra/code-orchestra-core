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
package jetbrains.mps.nodeEditor.cells;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.nodeEditor.EditorContext;

public class TransactionalPropertyAccessor extends PropertyAccessor implements TransactionalModelAccessor {
  private String myOldValue;
  private String myUncommitedValue;
  private boolean myHasValueToCommit = false;

  public TransactionalPropertyAccessor(SNode node, String propertyName, boolean readOnly, boolean allowEmptyText, EditorContext editorContext) {
    super(node, propertyName, readOnly, allowEmptyText, editorContext);
  }

  public TransactionalPropertyAccessor(SNode node, String propertyName, boolean readOnly, boolean allowEmptyText, IOperationContext context) {
    super(node, propertyName, readOnly, allowEmptyText, context);
  }

  protected String doGetValue() {
    if (myHasValueToCommit) {
      return myUncommitedValue;
    }
    return super.doGetValue();
  }

  protected void doSetValue(String newText) {
    myHasValueToCommit = true;
    myUncommitedValue = newText;
    myOldValue = super.doGetValue();
  }

  public void commit() {
    if (myHasValueToCommit) {
      doCommit(myOldValue, myUncommitedValue);
      myUncommitedValue = null;
      myHasValueToCommit = false;
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          myOldValue = doGetValue();
        }
      });
    }
  }

  protected void doCommit(String oldValue, String newValue) {
  }
}
