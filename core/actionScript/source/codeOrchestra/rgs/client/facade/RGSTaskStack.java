package codeOrchestra.rgs.client.facade;

import javax.swing.SwingUtilities;

/**
 * @author Alexander Eliseyev
 */
public class RGSTaskStack {

  public static RGSTaskStack create(RGSTask... tasks) {
    return new RGSTaskStack(tasks);
  }

  private RGSTask[] tasks;

  private RGSTaskStack(RGSTask... tasks) {
    assert tasks != null && tasks.length > 0;

    this.tasks = tasks;

    // Wire the tasks together
    for (int i = 0; i < tasks.length; i++) {
      RGSTask task = tasks[i];
      if (i < tasks.length - 1) {
        RGSTask nextTask = tasks[i + 1];
        task.setNextTask(nextTask);
      }
    }
  }

  public void process() {
    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        tasks[0].queue();
      }
    });
  }

}
