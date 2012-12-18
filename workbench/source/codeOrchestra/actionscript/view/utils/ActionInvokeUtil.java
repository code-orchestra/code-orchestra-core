package codeOrchestra.actionscript.view.utils;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.application.impl.LaterInvocator;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public final class ActionInvokeUtil {

  private ActionInvokeUtil() {
  }

  public static void invoke(@NotNull ActionPlace place, String actionClassName, final Map<String, Object> params, boolean invokeLater) {
    final BaseAction action = (BaseAction) ActionManager.getInstance().getAction(actionClassName);
    if (action == null) {
      throw new IllegalStateException("Can't locate an action: " + actionClassName);
    }

    final AnActionEvent actionEvent = ActionUtils.createEvent(place.toString(), new DataContext() {
      public Object getData(@NonNls String s) {
        return params.get(s);
      }
    });

    Runnable invocationRunnable = new Runnable() {
      @Override
      public void run() {
        Map<String, Object> params = new HashMap<String, Object>();
        action._collectionActionData(actionEvent, params);
        action._doExecute(actionEvent, params);
      }
    };

    if (invokeLater) {
      LaterInvocator.invokeLater(invocationRunnable);
    } else {
      invocationRunnable.run();
    }
  }

}
