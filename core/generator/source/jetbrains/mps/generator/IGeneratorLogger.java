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
package jetbrains.mps.generator;

import jetbrains.mps.smodel.SNode;

/**
 * Evgeny Gryaznov, Feb 23, 2010
 */
public interface IGeneratorLogger {

  boolean needsInfo();

  boolean needsWarnings();

  void info(SNode node, String message);

  void info(String message);

  void warning(String message);

  void warning(SNode node, String message, ProblemDescription... descriptions);

  void error(String message);

  void error(SNode node, String message, ProblemDescription... descriptions);

  void handleException(Throwable t);

  /**
   * Contains description of the problem.
   */
  public class ProblemDescription {

    private SNode myNode;
    private String myMessage;

    public ProblemDescription(SNode node, String message) {
      myNode = node;
      myMessage = message;
    }

    public SNode getNode() {
      return myNode;
    }

    public String getMessage() {
      return myMessage;
    }
  }
}
