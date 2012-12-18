package jetbrains.mps.testbench.junit.runners;

/*Generated by MPS */

import org.junit.runners.ParentRunner;
import org.junit.runner.Runner;
import java.util.List;
import org.junit.runners.model.RunnerBuilder;
import org.junit.runners.model.InitializationError;
import org.junit.internal.builders.AllDefaultPossibilitiesBuilder;
import org.junit.runner.Description;
import org.junit.runner.notification.RunNotifier;
import java.util.ArrayList;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;

public class SymbolicSuite extends ParentRunner<Runner> {
  private final List<Runner> myRunners;

  protected SymbolicSuite(Class<?> klass, RunnerBuilder builder) throws InitializationError {
    this(builder, klass, SymbolicSuite.getAnnotatedClasses(klass));
  }

  protected SymbolicSuite(RunnerBuilder builder, Class<?>[] classes) throws InitializationError {
    this(null, builder.runners(null, classes));
  }

  protected SymbolicSuite(Class<?> klass, Class<?>[] suiteClasses) throws InitializationError {
    this(new AllDefaultPossibilitiesBuilder(true), klass, suiteClasses);
  }

  protected SymbolicSuite(RunnerBuilder builder, Class<?> klass, Class<?>[] suiteClasses) throws InitializationError {
    this(klass, builder.runners(klass, suiteClasses));
  }

  protected SymbolicSuite(Class<?> klass, List<Runner> runners) throws InitializationError {
    super(klass);
    myRunners = runners;
  }

  @Override
  protected List<Runner> getChildren() {
    return myRunners;
  }

  @Override
  protected Description describeChild(Runner child) {
    return child.getDescription();
  }

  @Override
  protected void runChild(Runner child, RunNotifier notifier) {
    child.run(notifier);
  }

  private static Class<?>[] getAnnotatedClasses(Class<?> klass) throws InitializationError {
    SymbolicSuite.SuiteClassSymbols annotation = klass.getAnnotation(SymbolicSuite.SuiteClassSymbols.class);
    if (annotation == null) {
      throw new InitializationError(String.format("class '%s' must have a SuiteClassSymbols annotation", klass.getName()));
    }
    List<Class<?>> foundClasses = new ArrayList<Class<?>>();
    List<String> notfoundClasses = new ArrayList<String>();
    for (String sym : annotation.value()) {
      try {
        foundClasses.add(Class.forName(sym));
      } catch (ClassNotFoundException e) {
        notfoundClasses.add(sym);
      }
    }
    if (!(notfoundClasses.isEmpty())) {
      throw new InitializationError("Not found classes: " + notfoundClasses);
    }
    return foundClasses.toArray(new Class<?>[foundClasses.size()]);
  }

  @Retention(RetentionPolicy.RUNTIME)
  @Target(value = {ElementType.TYPE})
public static   @interface SuiteClassSymbols {
    String[] value();
}
}
