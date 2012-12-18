package codeOrchestra.actionScript.stubs;

import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.stubs.StubLocation;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class ASClassPathItemRegistry {

  static {
    ClassLoaderManager.getInstance().addReloadHandler(new ReloadAdapter() {
      @Override
      public void unload() {
        clear();
      }
    });
  }

  private static Map<StubLocation, Object> registry = new HashMap<StubLocation, Object>();

  public static void clear() {
    ASClassPathItemRegistry.registry.clear();
  }

  public static void addClassPathItem(StubLocation stubLocation, Object classPathItem) {
    registry.put(stubLocation, classPathItem);
  }

  public static Object getClassPathItem(StubLocation stubLocation) {
    return registry.get(stubLocation);
  }

}
