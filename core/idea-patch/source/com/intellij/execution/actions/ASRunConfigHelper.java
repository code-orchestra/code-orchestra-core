package com.intellij.execution.actions;

import jetbrains.mps.execution.api.configurations.BaseMpsRunConfiguration;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.plugins.pluginparts.runconfigs.BaseRunConfig;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author Alexander Eliseyev
 */
@CodeOrchestraPatch
public class ASRunConfigHelper {

  private static final Logger LOG = Logger.getLogger(ASRunConfigHelper.class);

  private static final String AS_RUN_CONFIGURATION_CLASS = "DefaultActionScriptRunConfiguration_Configuration";
  private static final String STATE_GETTER_NAME = "getStateObject";

  public static String getConfiguredModuleName(BaseMpsRunConfiguration baseRunConfig) {
    try {
      Method getASRunSettings = null;
      for (Method method : baseRunConfig.getClass().getMethods()) {
        if ("getASRunSettings".equals(method.getName())) {
          getASRunSettings = method;
          break;
        }
      }

      if (getASRunSettings == null) {
        return null;
      }

      Object stateObject = getASRunSettings.invoke(baseRunConfig);
      if (stateObject != null) {
        Method getModuleName = null;
        for (Method method : stateObject.getClass().getMethods()) {
          if ("getModuleName".equals(method.getName())) {
            getModuleName = method;
            break;
          }
        }

        if (getModuleName != null) {
          return (String) getModuleName.invoke(stateObject);
        }
      }

    } catch (Throwable t) {
      LOG.error("Can't access run configuration state", t);
    }
    return null;
  }

  @Deprecated
  public static String getConfiguredModuleName(BaseRunConfig baseRunConfig) {
    Object stateObject = getStateObject(baseRunConfig);
    if (stateObject != null) {
      try {
        Field moduleNameField = stateObject.getClass().getField("moduleName");
        Object nameObj = moduleNameField.get(stateObject);

        if (nameObj instanceof String) {
          return (String) nameObj;
        }
      } catch (NoSuchFieldException e) {
        return null;
      } catch (IllegalAccessException e) {
        return null;
      }
    }
    return null;
  }

  public static Object getStateObject(BaseRunConfig baseRunConfig) {
    Class<? extends BaseRunConfig> configClass = baseRunConfig.getClass();

    if (!AS_RUN_CONFIGURATION_CLASS.equals(configClass.getSimpleName())) {
      return null;
    }

    Method stateGetter = getStateGetter(configClass);
    if (stateGetter == null) {
      return null;
    }

    try {
      return stateGetter.invoke(baseRunConfig);
    } catch (InvocationTargetException e) {
      return null;
    } catch (IllegalAccessException e) {
      return null;
    }
  }

  private static Method getStateGetter(Class<? extends BaseRunConfig> configClass) {
    for (Method method : configClass.getMethods()) {
      if (STATE_GETTER_NAME.equals(method.getName())) {
        return method;
      }
    }
    return null;
  }

} 