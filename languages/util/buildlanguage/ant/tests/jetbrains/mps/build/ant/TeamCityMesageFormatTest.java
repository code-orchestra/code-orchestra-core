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
package jetbrains.mps.build.ant;

import junit.framework.TestCase;

public class TeamCityMesageFormatTest extends TestCase {

  public void testOr() {
    assertEquals("text||text", new TeamCityMessageFormat().escapeBuildMessage(
      new StringBuffer("text|text")
    ).toString());
  }

  public void testQuote() {
    assertEquals("text|'text", new TeamCityMessageFormat().escapeBuildMessage(
      new StringBuffer("text'text")
    ).toString());
  }

  public void testBracket() {
    assertEquals("text|]text", new TeamCityMessageFormat().escapeBuildMessage(
      new StringBuffer("text]text")
    ).toString());
  }

  public void testBackSlashN() {
    assertEquals("text|ntext", new TeamCityMessageFormat().escapeBuildMessage(
      new StringBuffer("text\ntext")
    ).toString());
  }

  public void testBackSlashR() {
    assertEquals("text|rtext", new TeamCityMessageFormat().escapeBuildMessage(
      new StringBuffer("text\rtext")
    ).toString());
  }

  public void testOrSlow() {
    assertEquals("text||text", new TeamCityMessageFormat().escapeBuildMessage(
      "text|text"
    ));
  }

  public void testQuoteSlow() {
    assertEquals("text|'text", new TeamCityMessageFormat().escapeBuildMessage(
      "text'text"
    ));
  }

  public void testBracketSlow() {
    assertEquals("text|]text", new TeamCityMessageFormat().escapeBuildMessage(
      "text]text"
    ));
  }

  public void testBackSlashNSlow() {
    assertEquals("text|ntext", new TeamCityMessageFormat().escapeBuildMessage(
     "text\ntext"
    ));
  }

  public void testBackSlashRSlow() {
    assertEquals("text|rtext", new TeamCityMessageFormat().escapeBuildMessage(
     "text\rtext"
    ));
  }
}
