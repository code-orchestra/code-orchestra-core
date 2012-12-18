package codeOrchestra.actionScript.cache;

import codeOrchestra.actionscript.view.utils.Languages;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.Language;

import java.lang.reflect.Method;

/**
 * @deprecated use {@link codeOrchestra.actionscript.cache.CacheManagerFacade} instead
 * @author Eugene Potapenko
 * @author Alexander Eliseyev
 */
@Deprecated
public final class CacheStateManager {

  private static final String CACHE_MANAGER_CLASS = "codeOrchestra.actionScript.behavior.CacheManager";

  private static final String CACHE_CLEAR_KEY = "_model_cache_manager_clear_";
  private static final String LOCKER_KEY = "_model_cache_manager_locker_";

  private static final String CLEAR_METHOD_NAME = "clear";

  private static Object monitor = new Object();

  private CacheStateManager() {
  }

  @Deprecated
  public static void requestCacheClearAsync() {
    System.setProperty(CACHE_CLEAR_KEY, String.valueOf(1));
  }

  @Deprecated
  public static void requestCacheClearSync() {
    try {
      Language actionScript = GlobalScope.getInstance().getLanguage(Languages.ACTION_SCRIPT);
      Class cacheManagerClass = actionScript.getClass(CACHE_MANAGER_CLASS);

      Method clearMethod = null;
      for (Method method : cacheManagerClass.getMethods()) {
        if (CLEAR_METHOD_NAME.equals(method.getName())) {
          clearMethod = method;
          break;
        }
      }

      if (clearMethod != null) {
        clearMethod.invoke(null);
        return;
      }
    } catch (Throwable t) {
      // ignore
      t.printStackTrace();
    }

    // Request async if the sync method failed
    requestCacheClearAsync();
  }

  @Deprecated
  public static boolean isLocked() {
    return getLockerValue() > 0;
  }

  @Deprecated
  public static void lock() {
    System.setProperty(LOCKER_KEY, String.valueOf(getLockerValue() + 1));
  }

  @Deprecated
  public static void unlock() {
    System.setProperty(LOCKER_KEY, String.valueOf(getLockerValue() - 1));
  }

  private static int getLockerValue() {
    synchronized (monitor) {
      String locker = System.getProperty(LOCKER_KEY);
      Integer value = 0;
      if (locker != null) {
        value = Integer.valueOf(locker);
      }
      return value;
    }
  }

}
