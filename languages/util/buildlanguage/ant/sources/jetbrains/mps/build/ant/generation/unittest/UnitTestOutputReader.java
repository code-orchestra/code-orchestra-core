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
package jetbrains.mps.build.ant.generation.unittest;

import jetbrains.mps.logging.Logger;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NotNull;

import java.io.InputStream;
import java.util.Scanner;

public class UnitTestOutputReader {
  private final Process myUnitTestProcess;
  private final BaseOutputReader myInputReader;
  private final BaseOutputReader myErrorReader;
  private final UnitTestListener myUnitTestListener;
  private boolean myInsideTestError = false;
  private StringBuffer myLastError = new StringBuffer();
  private String myLastMessage = "";
  private String myCurrentlyRunningTest;

  public UnitTestOutputReader(@NotNull Process unitTestProcess, @NotNull UnitTestListener unitTestListener) {
    myUnitTestProcess = unitTestProcess;
    myUnitTestListener = unitTestListener;
    myInputReader = new BaseOutputReader(myUnitTestProcess.getInputStream()) {
      protected void addMessage(final String message) {
        parseMessage(message, false);
      }
    };
    myErrorReader = new BaseOutputReader(myUnitTestProcess.getErrorStream()) {
      protected void addMessage(final String message) {
        parseMessage(message, true);
      }
    };
  }

  private void parseMessage(String text, boolean error) {
    String textTrimmed = StringUtils.trim(text);
    if (text.startsWith(UnitTestRunner.START_TEST_PREFIX)) {
      saveLastTestIfNecessary();
      myCurrentlyRunningTest = removeTag(text, UnitTestRunner.START_TEST_PREFIX);
      myUnitTestListener.testStarted(myCurrentlyRunningTest);
    } else if (text.startsWith(UnitTestRunner.END_TEST_PREFIX)) {
      myCurrentlyRunningTest = null;
      myUnitTestListener.testFinished(removeTag(text, UnitTestRunner.END_TEST_PREFIX));
    } else if (text.startsWith(UnitTestRunner.FAILURE_TEST_PREFIX)) {
      myLastMessage = removeTag(text, UnitTestRunner.FAILURE_TEST_PREFIX);
      myInsideTestError = true;
    } else if (text.startsWith(UnitTestRunner.FAILURE_TEST_SUFFIX)) {
      myUnitTestListener.testFailed(removeTag(text, UnitTestRunner.FAILURE_TEST_SUFFIX), myLastMessage, myLastError.toString());
      myLastError = new StringBuffer();
      myInsideTestError = false;
    } else if (error) {
      if (myInsideTestError) {
        myLastError.append(textTrimmed);
        myLastError.append("\n");
      } else {
        myUnitTestListener.logError(text);
      }
    } else {
      myUnitTestListener.logMessage(text);
    }
  }

  private void saveLastTestIfNecessary() {
    if (myCurrentlyRunningTest != null) {
      myUnitTestListener.testFinished(myCurrentlyRunningTest);
      myCurrentlyRunningTest = null;
    }
  }

  private String removeTag(String text, String prefix) {
    return text.substring(prefix.length());
  }

  public int start() {
    myInputReader.start();
    myErrorReader.start();
    try {
      return myUnitTestProcess.waitFor();
    } catch (InterruptedException e) {
      //
    }
    return -1;
  }


  private static abstract class BaseOutputReader extends Thread {
    private InputStream myIs;

    public BaseOutputReader(InputStream is) {
      this.myIs = is;
    }

    public void run() {
      Scanner s = new Scanner(this.myIs);
      try {
        while (!(this.isInterrupted()) && s.hasNextLine()) {
          this.addMessage(s.nextLine());
        }
      } catch (Exception e) {
        Logger.getLogger(UnitTestOutputReader.class).error(e);
      }
    }

    protected abstract void addMessage(String message);
  }
}
