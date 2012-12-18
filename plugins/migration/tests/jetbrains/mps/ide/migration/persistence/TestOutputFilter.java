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
package jetbrains.mps.ide.migration.persistence;

import org.apache.log4j.Appender;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.Filter;
import org.apache.log4j.spi.LoggingEvent;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.Enumeration;
import java.util.Scanner;

public class TestOutputFilter {
  private PrintStream myOldOut;
  private PrintStream myOldErr;
  private ByteArrayOutputStream myOut = new ByteArrayOutputStream();
  private ByteArrayOutputStream myErr = new ByteArrayOutputStream();
  private Filter myFilter = new Filter() {
    @Override
    public int decide(LoggingEvent event) {
      return isEventOK(event) ? NEUTRAL : DENY;
    }
  };

  public void start() {
    myOldOut = System.out;
    myOldErr = System.err;
    for (Enumeration<Appender> en = Logger.getRootLogger().getAllAppenders(); en.hasMoreElements(); )
      en.nextElement().addFilter(myFilter);
    System.err.flush();
    System.setErr(new PrintStream(myErr));
    System.out.flush();
    System.setOut(new PrintStream(myOut));
  }

  public void stop() {
    for (Enumeration<Appender> en = Logger.getRootLogger().getAllAppenders(); en.hasMoreElements(); ) {
      Appender ap = en.nextElement();
      Filter f = ap.getFilter();
      ap.clearFilters();
      for (; f != null; f = f.next) {
        if (f != myFilter)  ap.addFilter(f);
      }
    }

    System.err.flush();
    if (myOldErr != null)  System.setErr(myOldErr);
    for (Scanner s = new Scanner(new ByteArrayInputStream(myErr.toByteArray())); s.hasNextLine(); ) {
      String line = s.nextLine();
      if (isErrLineOK(line))  System.err.println(line);
    }

    System.out.flush();
    if (myOldOut != null)  System.setOut(myOldOut);
    for (Scanner s = new Scanner(new ByteArrayInputStream(myOut.toByteArray())); s.hasNextLine(); ) {
      String line = s.nextLine();
      if (isOutLineOK(line))  System.out.println(line);
    }
  }

  protected boolean isLineOK(String line) {
    return false;
  }
  protected boolean isOutLineOK(String line) {
    return isLineOK(line);
  }
  protected boolean isErrLineOK(String line) {
    return isLineOK(line);
  }
  protected boolean isEventOK(LoggingEvent event) {
    return isLineOK(event.getRenderedMessage());
  }
}
