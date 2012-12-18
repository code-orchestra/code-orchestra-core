package codeOrchestra.generator.listener;

import codeOrchestra.utils.ProjectHolder;

/**
 * @author Alexander Eliseyev
 */
public abstract class ExpendableBuildListener implements BuildListener {

  private boolean disposed;

  @Override
  public final synchronized void onBuild(BuildEvent buildEvent) {
    if (disposed) {
      return;
    }

    if (isThisMyBuild(buildEvent)) {
      doOnceOnBuild();
      dispose();
    }
  }

  protected abstract void doOnceOnBuild();

  protected abstract boolean isThisMyBuild(BuildEvent buildEvent);

  private void dispose() {
    if (disposed) {
      return;
    }

    disposed = true;
    BuildBroadcaster.getInstance().removeBuildListener(this);
  }

}
