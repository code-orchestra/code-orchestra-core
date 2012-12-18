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
package jetbrains.mps.testbench.util;


import com.intellij.openapi.util.Pair;
import org.apache.log4j.AppenderSkeleton;
import org.apache.log4j.Priority;
import org.apache.log4j.spi.LoggingEvent;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: Aug 18, 2010
 * Time: 2:13:11 PM
 * To change this template use File | Settings | File Templates.
 */
public class CachingAppender extends AppenderSkeleton implements Output {

  private int events;
  private List<String> messages = new ArrayList<String>();
  private List<Pair<Integer, String>> expectedEvents = new ArrayList<Pair<Integer, String>>();
  private List<Pair<Integer, String>> receivedExpectedEvents = new ArrayList<Pair<Integer, String>>();

  @Override
  protected void append(LoggingEvent loggingEvent) {
    if (!isExpected(loggingEvent)) {
      events++;
      messages.add (loggingEvent.getRenderedMessage());
      String[] stackTrace = loggingEvent.getThrowableStrRep();
      if (stackTrace != null) {
        messages.add("++ =============StackTrace================");
        messages.addAll(Arrays.asList(stackTrace));
        messages.add("-- =============StackTrace================");
      }
    }
  }

  private boolean isExpected(LoggingEvent event) {
    for (Pair<Integer, String> pr: expectedEvents) {
      if (event.level.isGreaterOrEqual(Priority.toPriority(pr.first))) {
        if (pr.second == null || pr.second.equals(event.getRenderedMessage())) {
          receivedExpectedEvents.add (pr);
          return true;
        }
      }
    }
    return false;
  }

  @Override
  public boolean isNotEmpty() {
    return events > 0;
  }

  @Override
  public String getDescription() {
    return events + " events";
  }

  @Override
  public String getText() {
    StringBuilder sb = new StringBuilder();
    String sep = "";
    for (String s: messages) {
      sb.append(sep); sep = "\n";
      sb.append(s);
    }
    sb.append("\n");
    return sb.toString();
  }

  @Override
  public void close() {
  }

  @Override
  public boolean requiresLayout() {
    return false;
  }

  public void sealEvents() {
    List<Pair<Integer, String>> list = new ArrayList<Pair<Integer, String>>(expectedEvents);
    list.removeAll(receivedExpectedEvents);
    for (Pair<Integer, String> pr: list) {
      events++;
      messages.add ("MISSING: "+pr.second);
    }
  }

  public void expectEvent(int level, String text) {
    expectedEvents.add (new Pair<Integer, String>(level, text));
  }
}
