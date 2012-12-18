package codeOrchestra.generator.optimize;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNodePointer;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class UsagesCollectorFacade {

  private static final String SMALL_LANGUAGE = "codeOrchestra.smallLanguage";
  private static final String USAGES_COLLECTOR_CLASSNAME = "codeOrchestra.smallLanguage.behavior.UsagesCollector";
  private static final String WALK_METHOD_NAME = "walk";

  private Project project;
  private CodeOrchestraGenerationContext codeOrchestraGenerationContext;
  private List<SNodePointer> rootPointers;
  private List<SModelDescriptor> rawModelsGraph;
  private ProgressIndicator progressIndicator;

  public UsagesCollectorFacade(Project project, CodeOrchestraGenerationContext codeOrchestraGenerationContext, List<SNodePointer> rootPointers, List<SModelDescriptor> rawModelsGraph, ProgressIndicator indicator) {
    this.project = project;
    this.codeOrchestraGenerationContext = codeOrchestraGenerationContext;
    this.rootPointers = rootPointers;
    this.rawModelsGraph = rawModelsGraph;
    this.progressIndicator = indicator;

  }

  public void walk() {
    Language smallLanguage = MPSModuleRepository.getInstance().getLanguage(SMALL_LANGUAGE);
    if (smallLanguage == null) {
      throw new RuntimeException("Can't locate " + SMALL_LANGUAGE + " language");
    }

    ClassLoader cl = ClassLoaderManager.getInstance().getClassLoaderFor(smallLanguage, false);
    if (cl == null) {
      throw new RuntimeException("Can't locate classloader for " + SMALL_LANGUAGE + " language");
    }

    Class clazz = smallLanguage.getClass(USAGES_COLLECTOR_CLASSNAME);
    if (clazz == null) {
      throw new RuntimeException("Can't locate class " + USAGES_COLLECTOR_CLASSNAME + " from " + SMALL_LANGUAGE);
    }

    Constructor constructor;
    try {
      constructor = clazz.getDeclaredConstructor(Project.class, CodeOrchestraGenerationContext.class, List.class, List.class, ProgressIndicator.class);
    } catch (NoSuchMethodException e) {
      throw new RuntimeException("Can't locate the constructor for " + USAGES_COLLECTOR_CLASSNAME, e);
    }

    Object usagesCollector;
    try {
      usagesCollector = constructor.newInstance(project, codeOrchestraGenerationContext, rootPointers, rawModelsGraph, progressIndicator);
    } catch (Throwable t) {
      throw new RuntimeException("Can't instantiate the " + USAGES_COLLECTOR_CLASSNAME, t);
    }

    Method walkMethod;
    try {
      walkMethod = clazz.getMethod(WALK_METHOD_NAME);
    } catch (NoSuchMethodException e) {
      throw new RuntimeException("Can't locate the " + WALK_METHOD_NAME + " method in " + USAGES_COLLECTOR_CLASSNAME, e);
    }

    try {
      walkMethod.invoke(usagesCollector);
    } catch (Throwable t) {
      throw new RuntimeException("Can't invoke the " + WALK_METHOD_NAME + " method", t);
    }
  }

}
