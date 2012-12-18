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
package jetbrains.mps.errors.messageTargets;

import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;


public class DeletedNodeMessageTarget implements MessageTarget {
  private String myRole;
  private int myNextChildIndex = -1; // -1 for deleted in single role

  public DeletedNodeMessageTarget(String role, int nextChildIndex) {
    myRole = role;
    myNextChildIndex = nextChildIndex;
  }

  public DeletedNodeMessageTarget(String role) {
    myRole = role;
  }

  public MessageTargetEnum getTarget() {
    return MessageTargetEnum.DELETED_CHILD;
  }

  public String getRole() {
    return myRole;
  }

  public int getNextChildIndex() {
    return myNextChildIndex;
  }

  public boolean sameAs(@NotNull MessageTarget errorTarget) {
    return errorTarget instanceof DeletedNodeMessageTarget && ObjectUtils.equals(errorTarget.getRole(), getRole())
      && myNextChildIndex == ((DeletedNodeMessageTarget) errorTarget).myNextChildIndex;
  }
}
