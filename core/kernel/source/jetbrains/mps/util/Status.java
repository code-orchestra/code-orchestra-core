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
package jetbrains.mps.util;

public class Status implements IStatus {
  public static final Status NO_ERRORS = new OK();

  private Code myCode;
  private String myMessage;
  private Object myUserObject;

  public Status(Code code, String message) {
    myCode = code;
    myMessage = message;
  }

  public boolean isOk() {
    return myCode == Code.OK;
  }

  public boolean isError() {
    return myCode == Code.ERROR;
  }

  public Code getCode() {
    return myCode;
  }

  public String getMessage() {
    return myMessage;
  }

  public void addMessage(String s) {
    myMessage = myMessage + "\n" + s;
  }

  public Object getUserObject() {
    return myUserObject;
  }

  public void setUserObject(Object userObject) {
    myUserObject = userObject;
  }

  public static class OK extends Status {
    public OK() {
      super(Code.OK, "");
    }

    public OK(Object userObject) {
      super(Code.OK, "");
      setUserObject(userObject);
    }
  }

  public static class ERROR extends Status {
    public ERROR(String message) {
      super(Code.ERROR, message);
    }
  }
}
