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
package jetbrains.mps.project;

import junit.framework.TestFailure;
import org.jetbrains.annotations.NotNull;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

public class TestResult {
  public final List<String> myGenerationErrors;
  public final List<String> myGenerationWarnings;
  public final List<String> myCompilationProblems;
  public final List<TestFailure> myFailedTestReports;
  public final List<String> myDiffReports;

  public TestResult(@NotNull List<String> generationErrors, @NotNull List<String> generationWarnings, @NotNull List<String> compilationProblems,
                    @NotNull List<TestFailure> testResults, @NotNull List<String> diff) {
    this.myGenerationErrors = generationErrors;
    this.myGenerationWarnings = generationWarnings;
    this.myCompilationProblems = compilationProblems;
    this.myFailedTestReports = testResults;
    this.myDiffReports = diff;
  }

  public TestResult(List<String> generationErrors, List<String> generationWarnings, List<String> compilationProblems) {
    this(generationErrors, generationWarnings, compilationProblems, new ArrayList<TestFailure>(), new ArrayList<String>());
  }

  public boolean isOk() {
    return !hasGenerationErrors() && !hasCompilationProblems() && !hasFailedTestReports() && !hasDiffReports();
  }

  public int warningsStartsWith(String warn) {
    int i = 0;
    for (String w : myGenerationWarnings) {
      if (w.startsWith(warn)) {
        i++;
      }
    }

    return i;
  }

  public boolean hasGenerationErrors() {
    return myGenerationErrors.size() != 0;
  }

  public boolean hasGenerationWarnings() {
    return myGenerationWarnings.size() != 0;
  }

  public boolean hasFailedTestReports() {
    return myFailedTestReports.size() != 0;
  }

  public boolean hasCompilationProblems() {
    return myCompilationProblems.size() != 0;
  }

  public boolean hasDiffReports() {
    return myDiffReports.size() != 0;
  }

  public void dump(PrintStream out) {
    out.println("[Test Resuls]============================================================");

    if (hasGenerationErrors()) {
      out.println("Generation errors:");
      for (String e : myGenerationErrors) {
        out.println("  " + e);
      }
    } else {
      out.println("No generation errors.");
    }
    out.println("");

    if (hasGenerationWarnings()) {
      out.println("Generation warnings:");
      for (String w : myGenerationWarnings) {
        out.println("  " + w);
      }
    } else {
      out.println("No generation warnings.");
    }
    out.println("");

    if (hasCompilationProblems()) {
      out.println("Compilation problems:");
      for (String c : myCompilationProblems) {
        out.println("  " + c);
      }
    } else {
      out.println("No compilation problems.");
    }
    out.println("");

    if (hasDiffReports()) {
      out.println("Difference:");
      for (String d : myDiffReports) {
        out.println("  " + d);
      }
    } else {
      out.println("No difference reports.");
    }
    out.println("");

    if (hasFailedTestReports()) {
      out.println("Test problems:");
      for (TestFailure tf : myFailedTestReports) {
        out.println("" + tf);
        tf.thrownException().printStackTrace(out);
        out.println();
      }
    } else {
      out.println("No test problems.");
    }
    out.println("=========================================================================");
  }

}
