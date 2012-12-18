package codeOrchestra.flex.processors;

import org.apache.flex.compiler.internal.parsing.as.IProblemReporter;
import org.apache.flex.compiler.problems.ICompilerProblem;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class FakeProblemReporter implements IProblemReporter {

  private List<ICompilerProblem> problems = new ArrayList<ICompilerProblem>();

  @Override
  public void addProblem(ICompilerProblem problem) {
    problems.add(problem);
  }

  @Override
  public String getSourceFilePath() {
    return null;
  }

  public void handleProblems() throws SNodeProcessorException {
    if (!problems.isEmpty()) {
      // We do not expect any regexp parsing problems
      throw new SNodeProcessorException();
    }
  }

}
