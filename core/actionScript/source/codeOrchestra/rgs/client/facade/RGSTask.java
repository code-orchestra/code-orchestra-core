package codeOrchestra.rgs.client.facade;

import com.intellij.mock.MockProgressIndicator;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.Task.Backgroundable;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.state.model.GenerateInput;
import codeOrchestra.utils.ProjectHolder;
import org.jetbrains.annotations.NotNull;

import java.io.EOFException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public abstract class RGSTask extends Backgroundable {

  private static boolean TRACE_TIME = true;

  public final static RGSTask NOP = new RGSTask("Stepping", false) {
    @Override
    protected void doTask(ProgressIndicator indicator) throws RGSException {
      // do nothing
    }
  };

  private static final MockProgressIndicator MOCK_PROGRESS_INDICATOR = new MockProgressIndicator();

  private boolean failed;
  private RGSTask nextTask;
  private GenerateInput generateInput;

  private String internalTitle;
  private IRGSTaskCaller caller;

  protected RGSTask(@NotNull String title, boolean canBeCancelled) {
    this(new GenerateInput(null, BuildProvider.RGS), title, canBeCancelled);
  }

  protected RGSTask(GenerateInput generateInput, @NotNull String title, boolean canBeCancelled) {
    super(
      ProjectHolder.getProject(),
      generateInput.getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL ? "" : title,
      generateInput.getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL ? false : canBeCancelled);
    this.internalTitle = title;
    this.generateInput = generateInput;
  }

  public RGSTask getNextTask() {
    return nextTask;
  }

  public void setNextTask(RGSTask nextTask) {
    this.nextTask = nextTask;
  }

  public boolean isFailed() {
    return failed;
  }

  protected abstract void doTask(ProgressIndicator indicator) throws RGSException;

  protected boolean ignoreFail() {
    return false;
  }

  protected void onFail(RGSException exception, String message) {
    this.failed = true;
    ApplicationRGSClient.getInstance().reportGenerationError(generateInput, message, exception);
  }

  protected void onFail(RGSException exception) {
    // RF-1252 - Check whether the RGS must be restarted (locally)
    if (exception.isConnectionProblem()) {
      if (ApplicationRGSClient.getInstance().mustStartLocalRGS()) {
        caller.call(); // restart the queue
      } else {
        onFail(null, "Lost connection to the RGS server");
      }
    }

    onFail(exception, "Error while performing RGS task: " + getTitle());
  }

  protected void onFail(String message) {
    onFail(null, message);
  }

  @Override
  public final void run(@NotNull ProgressIndicator indicator) {
    try {
      // RE-4387
      if (mustSuppressProgressIndicatorOutput()) {
        indicator = MOCK_PROGRESS_INDICATOR;
      }

      long timeStarted = System.currentTimeMillis();
      doTask(indicator);
      long timeTook = System.currentTimeMillis() - timeStarted;

      if (TRACE_TIME) {
        System.out.println(internalTitle + " took " + timeTook + "ms");
      }
    } catch (RGSException e) {
      onFail(e);
    }
  }

  private boolean mustSuppressProgressIndicatorOutput() {
    return generateInput.getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL;
  }

  @Override
  public final void onSuccess() {
    if (!ignoreFail() && failed) {
      return;
    }

    if (nextTask != null) {
      nextTask.queue();
    }
  }

  public void setCaller(IRGSTaskCaller caller) {
    this.caller = caller;
  }

}
