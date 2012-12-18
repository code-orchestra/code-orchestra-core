package codeOrchestra.rgs.generation;

import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public class GeneratorLoggerSplitter implements IGeneratorLogger {

  private IGeneratorLogger[] loggers;

  public GeneratorLoggerSplitter(IGeneratorLogger... loggers) {
    this.loggers = loggers;
  }

  @Override
  public boolean needsInfo() {
    return loggers[0].needsInfo();
  }

  @Override
  public boolean needsWarnings() {
    return loggers[0].needsWarnings();
  }

  @Override
  public void info(SNode node, String message) {
    for (IGeneratorLogger logger : loggers) {
      logger.info(node, message);
    }
  }

  @Override
  public void info(String message) {
    for (IGeneratorLogger logger : loggers) {
      logger.info(message);
    }
  }

  @Override
  public void warning(String message) {
    for (IGeneratorLogger logger : loggers) {
      logger.warning(message);
    }
  }

  @Override
  public void warning(SNode node, String message, ProblemDescription... descriptions) {
    for (IGeneratorLogger logger : loggers) {
      logger.warning(node, message, descriptions);
    }
  }

  @Override
  public void error(String message) {
    for (IGeneratorLogger logger : loggers) {
      logger.error(message);
    }
  }

  @Override
  public void error(SNode node, String message, ProblemDescription... descriptions) {
    for (IGeneratorLogger logger : loggers) {
      logger.error(node, message, descriptions);
    }
  }

  @Override
  public void handleException(Throwable t) {
    for (IGeneratorLogger logger : loggers) {
      logger.handleException(t);
    }
  }
}
