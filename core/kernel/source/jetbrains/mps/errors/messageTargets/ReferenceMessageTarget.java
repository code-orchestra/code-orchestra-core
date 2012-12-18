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

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 18.02.2010
 * Time: 19:25:45
 * To change this template use File | Settings | File Templates.
 */
public class ReferenceMessageTarget implements MessageTarget {
   private String myRole;

  public ReferenceMessageTarget(String role) {
    myRole = role;
  }

  public MessageTargetEnum getTarget() {
    return MessageTargetEnum.REFERENCE;
  }

  public String getRole() {
    return myRole;
  }

  public boolean sameAs(MessageTarget errorTarget) {
    return errorTarget instanceof ReferenceMessageTarget
      && ((ReferenceMessageTarget) errorTarget).myRole.equals(myRole);
  }
}
