package codeOrchestra.actionscript.statistics;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.workbench.MPSDataKeys;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jetbrains.annotations.NotNull;

import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class DataFlowStatisticsAction extends GeneratedAction {

  protected static Log log = LogFactory.getLog(DataFlowStatisticsAction.class);

   public DataFlowStatisticsAction() {
    super("Trace Dataflow Statistics");
    this.setIsAlwaysVisible(false);
    this.setExecuteOutsideCommand(true);
  }

  @NotNull
  public String getKeyStroke() {
    return "";
  }

  public void doUpdate(@NotNull AnActionEvent event, Map<String, Object> params) {
    try {
      if (!ViewUtils.isInActionScriptView()) {
        this.enable(event.getPresentation());
      } else {
        this.disable(event.getPresentation());
      }
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action doUpdate method failed. Action:" + "DataFlowStatisticsAction", t);
      }
      this.disable(event.getPresentation());
    }
  }

  protected boolean collectActionData(AnActionEvent event, Map<String, Object> params) {
    if (!(super.collectActionData(event, params))) {
      return false;
    }
    return true;
  }

  public void doExecute(@NotNull final AnActionEvent event, Map<String, Object> params) {
    try {
      DataFlowStatistics.instance().traceAverage();
      DataFlowStatistics.instance().traceMaximum();
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action execute method failed. Action:" + "ReloadAll", t);
      }
    }
  }

}
