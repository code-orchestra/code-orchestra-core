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
package jetbrains.mps.ide.blame.perform;

public class Response {
  private boolean mySuccess = true;
  private String myMessage = "";
  private Throwable myThrowable = null;
  private String myResponseString = null;

  public Response() {
  }

  public Response(String message, String response, boolean success, Throwable throwable) {
    myMessage = message;
    mySuccess = success;
    myThrowable = throwable;
    myResponseString = response;
  }

  public String getMessage() {
    return myMessage;
  }

  public boolean isSuccess() {
    return mySuccess;
  }

  public Throwable getThrowable() {
    return myThrowable;
  }

  public String getResponseString() {
    return myResponseString;
  }

  public void setResponseString(String responseString) {
    myResponseString = responseString;
  }

  public void setMessage(String message) {
    myMessage = message;
  }

  public void setSuccess(boolean success) {
    mySuccess = success;
  }

  public void setThrowable(Throwable throwable) {
    myThrowable = throwable;
  }
}
