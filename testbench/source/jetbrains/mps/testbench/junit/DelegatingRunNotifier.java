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

import org.junit.runner.Description;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.junit.runner.notification.RunListener;
import org.junit.runner.notification.RunNotifier;
import org.junit.runner.notification.StoppedByUserException;

/**
* Created by IntelliJ IDEA.
* User: fyodor
* Date: Aug 18, 2010
* Time: 2:50:50 PM
* To change this template use File | Settings | File Templates.
*/
class DelegatingRunNotifier extends RunNotifier {
  private final RunNotifier delegate;

  DelegatingRunNotifier(RunNotifier delegate){
    this.delegate = delegate;
  }

  @Override
  public void addListener(RunListener listener) {
    delegate.addListener(listener);
  }

  @Override
  public void removeListener(RunListener listener) {
    delegate.removeListener(listener);
  }

  @Override
  public void fireTestRunStarted(Description description) {
    delegate.fireTestRunStarted(description);
  }

  @Override
  public void fireTestRunFinished(Result result) {
    delegate.fireTestRunFinished(result);
  }

  @Override
  public void fireTestStarted(Description description) throws StoppedByUserException {
    delegate.fireTestStarted(description);
  }

  @Override
  public void fireTestFinished(Description description) {
    delegate.fireTestFinished(description);
  }

  @Override
  public void fireTestFailure(Failure failure) {
    delegate.fireTestFailure(failure);
  }

  @Override
  public void fireTestAssumptionFailed(Failure failure) {
    delegate.fireTestAssumptionFailed(failure);
  }

  @Override
  public void fireTestIgnored(Description description) {
    delegate.fireTestIgnored(description);
  }

  @Override
  public void pleaseStop() {
    delegate.pleaseStop();
  }

  @Override
  public void addFirstListener(RunListener listener) {
    delegate.addFirstListener(listener);
  }

}
