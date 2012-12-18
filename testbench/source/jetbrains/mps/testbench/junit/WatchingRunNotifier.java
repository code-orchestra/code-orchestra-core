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
package jetbrains.mps.testbench.junit;

import jetbrains.mps.testbench.util.CachingAppender;
import jetbrains.mps.testbench.util.CachingPrintStream;
import jetbrains.mps.testbench.util.ThreadWatcher;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.junit.runner.Description;
import org.junit.runner.notification.Failure;
import org.junit.runner.notification.RunNotifier;
import org.junit.runner.notification.StoppedByUserException;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: Aug 18, 2010
 * Time: 2:52:25 PM
 * To change this template use File | Settings | File Templates.
 */
public class WatchingRunNotifier extends DelegatingRunNotifier {
  private static final Level WATCH_LEVEL = Level.ERROR;

  private static final com.intellij.openapi.diagnostic.Logger IGNORED_LOGGERS[] = new com.intellij.openapi.diagnostic.Logger []
    {
      com.intellij.openapi.diagnostic.Logger.getInstance("#com.intellij.openapi.application.impl.LaterInvocator"),
      com.intellij.openapi.diagnostic.Logger.getInstance("#com.intellij.application.impl.ApplicationImpl"),
    };

  private Level oldLevel;
  private CachingPrintStream cacheOut;
  private CachingPrintStream cacheErr;
  private CachingAppender app;
  private Map<Description, Object> testsToIgnore = new HashMap<Description, Object>();
  private ThreadWatcher threadWatcher;

  public WatchingRunNotifier(RunNotifier delegate) {
    super(delegate);
  }

  public void dispose () {
  }

  private void initCaches () {
    System.out.flush();
    System.err.flush();
    System.setOut(this.cacheOut = new CachingPrintStream(System.out, "output"));
    System.setErr(this.cacheErr = new CachingPrintStream(System.err, "error"));
    cacheOut.clear();
    cacheOut.startCaching();
    cacheErr.clear();
    cacheErr.startCaching();
  }

  private void disposeCaches() {
    cacheOut.flush();
    cacheOut.stopCaching();
    System.setOut(cacheOut.getOut());
    cacheErr.flush();
    cacheErr.stopCaching();
    System.setErr(cacheErr.getOut());
  }

  @Override
  public void fireTestStarted(Description description) throws StoppedByUserException {
    super.fireTestStarted(description);
    try {
      beforeTest(description);
    }
    catch (Throwable e) {
      super.fireTestFailure(new Failure (description, e));
    }
  }

  @Override
  public void fireTestFinished(Description description) {
    try {
      afterTest(description);
    }
    catch (Throwable e) {
      super.fireTestFailure(new Failure (description, e));
    }
    super.fireTestFinished(description);
  }

  @Override
  public void fireTestFailure(Failure failure) {
    testsToIgnore.put(failure.getDescription(), Boolean.TRUE);
    super.fireTestFailure(failure);
  }

  @Override
  public void fireTestAssumptionFailed(Failure failure) {
    testsToIgnore.put(failure.getDescription(), Boolean.TRUE);
    super.fireTestAssumptionFailed(failure);
  }

  @Override
  public void fireTestIgnored(Description description) {
    testsToIgnore.put(description, Boolean.TRUE);
    super.fireTestIgnored(description);
  }

  private void beforeTest (Description desc) {
    this.oldLevel = Logger.getRootLogger().getLevel();
    Logger.getRootLogger().setLevel(WATCH_LEVEL);
    initCaches();

    this.app = new CachingAppender();
    Logger.getRootLogger().addAppender(app);

    ExpectLogEvent ignoreEvent = desc.getAnnotation(ExpectLogEvent.class);
    if (ignoreEvent != null) {
      for (String text: ignoreEvent.text()) {
        app.expectEvent(ignoreEvent.level(), text);
      }
    }

    for (com.intellij.openapi.diagnostic.Logger ignore: IGNORED_LOGGERS) {
      ignore.setLevel(Level.FATAL);
    }

    this.threadWatcher = new ThreadWatcher(true);
  }

  private void afterTest (Description desc) {
    threadWatcher.waitUntilSettled(15000);
    
    disposeCaches();
    app.sealEvents();

    Logger.getRootLogger().removeAppender(app);
    Logger.getRootLogger().setLevel(oldLevel);

    Failure fail = null;
    if (!testsToIgnore.containsKey(desc) && (cacheOut.isNotEmpty()|| cacheErr.isNotEmpty()||app.isNotEmpty()||threadWatcher.isNotEmpty())) {
      fail = new Failure(desc, new UncleanTestExecutionException(cacheOut, cacheErr, app, threadWatcher));
    }
    cacheOut.clear();
    cacheErr.clear();

    if (fail != null) {
      super.fireTestFailure(fail);
    }
  }
}
