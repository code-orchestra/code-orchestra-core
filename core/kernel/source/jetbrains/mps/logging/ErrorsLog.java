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
package jetbrains.mps.logging;

/**
 * @author
 */
public class ErrorsLog {
  public static final int MAX_ERROR_LOG_SIZE = 10000;

  private static ErrorsLog ourInstance;

  public static ErrorsLog getInstance() {
    if (ourInstance == null) {
      ourInstance = new ErrorsLog();
    }
    return ourInstance;
  }

  private StringBuffer myMessages = new StringBuffer();

  public void append(String message) {
    if (myMessages.length() < MAX_ERROR_LOG_SIZE) {
      myMessages.append(message).append("\n");
    }
  }

  public void clear() {
    myMessages.delete(0, myMessages.length());
  }

  public String getText() {
    return myMessages.toString();
  }
}
