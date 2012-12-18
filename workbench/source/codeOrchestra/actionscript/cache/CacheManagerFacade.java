package codeOrchestra.actionscript.cache;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;
import org.jetbrains.annotations.NonNls;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public final class CacheManagerFacade {

  private static final CacheManagerFacade INSTANCE = new CacheManagerFacade();

  private static final String CLEAR_CACHE_ACTION = "codeOrchestra.smallLanguage.plugin.ClearCache_Action";
  private static final String INVALIDATE_CACHE_ACTION = "codeOrchestra.smallLanguage.plugin.InvalidateCache_Action";
  private static final String REMOVE_SUBSTITUTE_USER_OBJECTS = "codeOrchestra.smallLanguage.plugin.RemoveSubstituteUserObjects_Action";

  public static CacheManagerFacade getInstance() {
    return INSTANCE;
  }

  private CacheManagerFacade() {
  }

  public void removeUserObjects(SModelDescriptor sModelDescriptor) {
    if (sModelDescriptor == null) {
      return;
    }

    // Get the remove substitute user objects action
    BaseAction removeSubstitutesAction = (BaseAction) ActionManager.getInstance().getAction(REMOVE_SUBSTITUTE_USER_OBJECTS);

    // Can be null in case no project is present
    if (removeSubstitutesAction != null) {
      // Fake event
      AnActionEvent actionEvent = ActionUtils.createEvent(ActionPlace.PROJECT_PANE.toString(), new DataContext() {
        public Object getData(@NonNls String dataId) {
          return null;
        }
      });

      // Execute
      Map<String, Object> params = new HashMap<String, Object>();
      params.put("modelDescriptor", sModelDescriptor);
      removeSubstitutesAction._doExecute(actionEvent, params);
    }
  }

  public void clearCache() {
    // Get the cache clear action
    BaseAction clearCacheAction = (BaseAction) ActionManager.getInstance().getAction(CLEAR_CACHE_ACTION);

    // Can be null in case no project is present
    if (clearCacheAction != null) {
      // Fake event
      AnActionEvent actionEvent = ActionUtils.createEvent(ActionPlace.PROJECT_PANE.toString(), new DataContext() {
        public Object getData(@NonNls String dataId) {
          return null;
        }
      });

      // Execute
      clearCacheAction._doExecute(actionEvent, Collections.EMPTY_MAP);
    }
  }

  public void invalidateCache() {
    // Get the cache invalidate action
    BaseAction invalidateCacheAction = (BaseAction) ActionManager.getInstance().getAction(INVALIDATE_CACHE_ACTION);

    // Can be null in case no project is present
    if (invalidateCacheAction != null) {
      // Fake event
      AnActionEvent actionEvent = ActionUtils.createEvent(ActionPlace.PROJECT_PANE.toString(), new DataContext() {
        public Object getData(@NonNls String dataId) {
          return null;
        }
      });

      // Execute
      invalidateCacheAction._doExecute(actionEvent, Collections.EMPTY_MAP);
    }
  }

}
