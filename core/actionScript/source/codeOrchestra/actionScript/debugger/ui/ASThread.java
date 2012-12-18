package codeOrchestra.actionScript.debugger.ui;

import codeOrchestra.actionScript.debugger.session.ASDebugSession;
import flash.tools.debugger.Frame;
import flash.tools.debugger.NotConnectedException;
import flash.tools.debugger.Session;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.integration.ui.icons.Icons;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASThread implements IThread {

  private ASDebugSession session;

  public ASThread(ASDebugSession session) {
    this.session = session;
  }

  @Override
  public List<IStackFrame> getFrames() {
    List<IStackFrame> result = new ArrayList<IStackFrame>();

    Session fdbSession = session.getFDBEventsProcessor().getFdbSession();
    if (fdbSession != null) {
      Frame[] frames = new Frame[0];
      try {
        frames = fdbSession.getFrames();
      } catch (NotConnectedException e) {
        // ignore
      }
      
      for (int i = 0; i < frames.length; i++) {
        result.add(new ASStackFrame(session.getFDBEventsProcessor(), this, i));
      }
    }

    return result;
  }

  @Override
  public int getFramesCount() {
    return getFrames().size();
  }

  @Override
  public String getName() {
    return "Execution Thread";
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
    List<IStackFrame> frames = getFrames();
    if (index < frames.size()) {
        return frames.get(index);
    }
    return null;
  }
}
