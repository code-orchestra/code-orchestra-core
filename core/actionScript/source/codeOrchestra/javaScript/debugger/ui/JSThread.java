package codeOrchestra.javaScript.debugger.ui;

import codeOrchestra.javaScript.debugger.session.JSDebugSession;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.integration.ui.icons.Icons;
import org.chromium.sdk.CallFrame;
import org.chromium.sdk.DebugContext;
import org.chromium.sdk.InvalidContextException;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JSThread implements IThread {

  private JSDebugSession session;

  public JSThread(JSDebugSession session) {
    this.session = session;
  }

  @Override
  public List<IStackFrame> getFrames() {
    List<IStackFrame> result = new ArrayList<IStackFrame>();

    DebugContext debugContext = session.getEventsProcessor().getDebugContext();
    if (debugContext == null) {
      return result;
    }

    List<? extends CallFrame> callFrames;

    try {
      callFrames = debugContext.getCallFrames();
    } catch (InvalidContextException e) {
      // Context became invalid, i.e. it got resumed
      return result;
    }

    int framesCount = callFrames.size();
    for (int i = 0; i < framesCount; i++) {
      result.add(new JSStackFrame(session.getEventsProcessor(), this, i++));
    }
    
    return result;
  }

  @Override
  public int getFramesCount() {
    return getFrames().size();
  }

  @Override
  public String getName() {
    return "JS Execution Thread";
  }

  @Override
  public String getPresentation() {
    return getName();
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.THREAD_RUNNING; // TODO: implement
  }

  public IStackFrame getFrame(int index) {
    return getFrames().get(index);
  }
}
