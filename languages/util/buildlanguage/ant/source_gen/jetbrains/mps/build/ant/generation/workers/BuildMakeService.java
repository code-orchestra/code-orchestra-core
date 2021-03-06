package jetbrains.mps.build.ant.generation.workers;

/*Generated by MPS */

import jetbrains.mps.make.service.AbstractMakeService;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.messages.IMessageHandler;
import java.util.concurrent.Future;
import jetbrains.mps.make.script.IResult;
import jetbrains.mps.make.MakeSession;
import jetbrains.mps.make.resources.IResource;
import jetbrains.mps.make.script.IScript;
import jetbrains.mps.make.script.IScriptController;
import jetbrains.mps.make.IMakeNotificationListener;
import jetbrains.mps.internal.make.runtime.util.FutureValue;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.messages.Message;
import jetbrains.mps.messages.MessageKind;
import jetbrains.mps.make.script.IConfigMonitor;
import jetbrains.mps.make.script.IOption;
import jetbrains.mps.make.script.IQuery;
import jetbrains.mps.make.script.IJobMonitor;
import jetbrains.mps.make.script.IFeedback;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import com.intellij.openapi.application.impl.ApplicationImpl;
import jetbrains.mps.make.script.IPropertiesPool;
import jetbrains.mps.baseLanguage.tuples.runtime.Tuples;
import com.intellij.openapi.project.Project;
import jetbrains.mps.make.facet.ITarget;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.make.script.ScriptBuilder;
import jetbrains.mps.make.facet.IFacet;
import jetbrains.mps.make.service.MakeTask;
import com.intellij.openapi.progress.PerformInBackgroundOption;
import com.intellij.openapi.progress.ProgressManager;

public class BuildMakeService extends AbstractMakeService implements IMakeService {
  private static Logger LOG = Logger.getLogger(BuildMakeService.class);

  private IOperationContext context;
  private IMessageHandler messageHandler;

  public BuildMakeService(IOperationContext context, IMessageHandler messageHandler) {
    this.context = context;
    this.messageHandler = messageHandler;
  }

  public Future<IResult> make(MakeSession session, Iterable<? extends IResource> resources, IScript script, IScriptController controller) {
    return null;
  }

  public Future<IResult> make(MakeSession session, Iterable<? extends IResource> resources, IScript script) {
    return null;
  }

  public Future<IResult> make(MakeSession session, Iterable<? extends IResource> resources) {
    return null;
  }

  public boolean isSessionActive() {
    return false;
  }

  public boolean openNewSession(MakeSession session) {
    return false;
  }

  public void closeSession(MakeSession session) {
  }

  public void addListener(IMakeNotificationListener listener) {
    throw new UnsupportedOperationException();
  }

  public void removeListener(IMakeNotificationListener listener) {
    throw new UnsupportedOperationException();
  }

  public Future<IResult> make(Iterable<? extends IResource> resources) {
    return doMake(resources, defaultMakeScript(), null);
  }

  public Future<IResult> make(Iterable<? extends IResource> resources, IScript script) {
    return doMake(resources, script, null);
  }

  public Future<IResult> make(Iterable<? extends IResource> resources, IScript script, IScriptController controller) {
    return new FutureValue(doMake(resources, script, controller));
  }

  private Future<IResult> doMake(Iterable<? extends IResource> inputRes, IScript defaultScript, IScriptController controller) {
    String scrName = "Build";

    if (Sequence.fromIterable(inputRes).isEmpty()) {
      String msg = scrName + " aborted: nothing to do";
      this.showError(msg);
      return new FutureValue(new IResult.FAILURE(null));
    }

    return new BuildMakeService.TaskRunner(scrName, messageHandler).runTask(inputRes, defaultScript, controller);
  }

  private void showError(String msg) {
    messageHandler.handle(new Message(MessageKind.ERROR, msg));
  }

  private IScriptController completeController(final IScriptController ctl) {
    final IConfigMonitor cmon = new IConfigMonitor.Stub() {
      public <T extends IOption> T relayQuery(IQuery<T> query) {
        return query.defaultOption();
      }
    };
    final IJobMonitor jmon = new IJobMonitor.Stub() {
      @Override
      public void reportFeedback(IFeedback fdbk) {
        new BuildMakeService.MessageFeedbackStrategy(messageHandler).reportFeedback(fdbk);
      }
    };

    final ProgressIndicator pind = new EmptyProgressIndicator();
    return new IScriptController.Stub() {
      public void runConfigWithMonitor(_FunctionTypes._void_P1_E0<? super IConfigMonitor> code) {
        code.invoke(cmon);
      }

      public void runJobWithMonitor(_FunctionTypes._void_P1_E0<? super IJobMonitor> code) {
        final boolean oldFlag = ApplicationImpl.setExceptionalThreadWithReadAccessFlag(true);
        try {
          code.invoke(jmon);
        } catch (Throwable e) {
          BuildMakeService.LOG.error("error running job", e);
        } finally {
          ApplicationImpl.setExceptionalThreadWithReadAccessFlag(oldFlag);
        }
      }

      public void setup(IPropertiesPool pool) {
        Tuples._4<Project, IOperationContext, Boolean, _FunctionTypes._return_P0_E0<? extends ProgressIndicator>> vars = (Tuples._4<Project, IOperationContext, Boolean, _FunctionTypes._return_P0_E0<? extends ProgressIndicator>>) pool.properties(new ITarget.Name("jetbrains.mps.lang.core.Generate.checkParameters"), Object.class);
        if (vars != null) {
          vars._0(BuildMakeService.this.context.getProject());
          vars._1(BuildMakeService.this.context);
          vars._2(true);
          vars._3(new _FunctionTypes._return_P0_E0<ProgressIndicator>() {
            public ProgressIndicator invoke() {
              return pind;
            }
          });
        }

        if (ctl != null) {
          ctl.setup(pool);
        }
      }
    };
  }

  public void disposeComponent() {
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return null;
  }

  public void initComponent() {
  }

  public static IScript defaultMakeScript() {
    return new ScriptBuilder().withFacetNames(new IFacet.Name("jetbrains.mps.lang.plugin.Binaries"), new IFacet.Name("jetbrains.mps.lang.core.Generate"), new IFacet.Name("jetbrains.mps.lang.core.TextGen"), new IFacet.Name("jetbrains.mps.baseLanguage.JavaCompile"), new IFacet.Name("jetbrains.mps.lang.core.Make")).withFinalTarget(new ITarget.Name("jetbrains.mps.lang.core.Make.make")).toScript();
  }

  public class TaskRunner extends AbstractMakeService.AbstractInputProcessor {
    private String taskName;
    private IMessageHandler mh;

    private TaskRunner(String taskName, IMessageHandler mh) {
      this.taskName = taskName;
      this.mh = mh;
    }

    public Future<IResult> runTask(Iterable<? extends IResource> inputRes, IScript defaultScript, IScriptController controller) {
      return processRawInput(inputRes, defaultScript, controller);
    }

    @Override
    protected Future<IResult> processClusteredInput(Iterable<? extends Iterable<IResource>> clustRes, Iterable<IScript> scripts, IScriptController controller) {
      IScriptController ctl = BuildMakeService.this.completeController(controller);

      MakeTask task = new MakeTask(context.getProject(), taskName, scripts, taskName, clustRes, ctl, mh, PerformInBackgroundOption.DEAF);
      ProgressManager.getInstance().run(task);

      return task;
    }
  }

  public static class MessageFeedbackStrategy {
    private IMessageHandler handler;

    public MessageFeedbackStrategy(IMessageHandler handler) {
      this.handler = handler;
    }

    public void reportFeedback(IFeedback fdk) {
      MessageKind messageKind;
      switch (fdk.getSeverity()) {
        case ERROR:
          messageKind = MessageKind.ERROR;
          break;
        case WARNING:
          messageKind = MessageKind.WARNING;
          break;
        case INFO:
          messageKind = MessageKind.INFORMATION;
          break;
        default:
          messageKind = MessageKind.ERROR;
          break;
      }
      Message message = new Message(messageKind, fdk.getMessage());
      message.setException(fdk.getException());
      message.setHintObject(fdk.getSource());
      handler.handle(message);
    }
  }
}
