package jetbrains.mps.messages;

import com.intellij.openapi.project.Project;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: 3/22/11
 * Time: 3:50 PM
 * To change this template use File | Settings | File Templates.
 */
public interface IMessage {
  MessageKind getKind();

  Throwable getException();

  String getText();

  String getSender();

  long getCreationTime();

  Object getHintObject();

  String getHelpUrl();

  // --- CodeOrchestra

  boolean canNavigate();

  String getCreationTimeString();

  List<String> getScopeIds();

  String getViewMarker();

}
