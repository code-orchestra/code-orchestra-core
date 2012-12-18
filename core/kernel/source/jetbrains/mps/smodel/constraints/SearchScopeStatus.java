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
package jetbrains.mps.smodel.constraints;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.search.ISearchScope;
import jetbrains.mps.util.Status;

/**
 * Igor Alshannikov
 * Aug 2, 2007
 */
public class SearchScopeStatus extends Status {
  protected boolean myDefault;
  protected ISearchScope mySearchScope;
  protected SNodePointer myReferenceValidator;
  protected IReferencePresentation myPresentation;

  /*package*/

  SearchScopeStatus(Code code, String message) {
    super(code, message);
  }

  public ISearchScope getSearchScope() {
    return mySearchScope;
  }

  public IReferencePresentation getPresentation() {
    return myPresentation;
  }

  public boolean isDefault() {
    return myDefault;
  }

  public SNode getReferenceValidatorNode() {
    return myReferenceValidator == null ? null : myReferenceValidator.getNode();
  }

  /*package*/

  static class OK extends SearchScopeStatus {
    public OK(ISearchScope ss, IReferencePresentation presentation, boolean isDefault, SNodePointer validatorNode) {
      super(Code.OK, "");
      mySearchScope = ss;
      myReferenceValidator = validatorNode;
      myPresentation = presentation;
      myDefault = isDefault;
    }
  }

  /*package*/

  static class ERROR extends SearchScopeStatus {
    public ERROR(String message) {
      super(Code.ERROR, message);
    }
  }

}
