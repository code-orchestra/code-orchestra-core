package codeOrchestra.actionscript.statistics;

import com.intellij.openapi.actionSystem.AnActionEvent;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jetbrains.annotations.NotNull;

import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class TypeSystemStatisticsResetAction  extends GeneratedAction {

  protected static Log log = LogFactory.getLog(TypeSystemStatisticsResetAction.class);

   public TypeSystemStatisticsResetAction() {
    super("Reset Typesystem Statistics");
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
        log.error("User's action doUpdate method failed. Action:" + "TypeSystemStatisticsResetAction", t);
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
      SubtypingRuleStatistics.instance().reset();
      InferenceRuleStatistics.instance().reset();
      NonTypeSystemRuleStatistics.instance().reset();
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action execute method failed. Action:" + "TypeSystemStatisticsResetAction", t);
      }
    }
  }

}
