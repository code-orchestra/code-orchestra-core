package codeOrchestra.actionscript.logging.scope;

import com.intellij.ui.content.Content;

import javax.swing.JComponent;
import javax.swing.JPanel;
import java.awt.BorderLayout;

/**
 * @author Alexander Eliseyev
 */
public class MessagesComponentHolder extends JPanel {

  private long creationTime;
  private String name;

  // backtrack
  private Content content;

  public MessagesComponentHolder(JComponent component) {
    this();
    setComponent(component);
  }
  
  public MessagesComponentHolder() {
    super(new BorderLayout());
    this.creationTime = System.currentTimeMillis();
  }

  public Content getContent() {
    return content;
  }

  public void setContent(Content content) {
    this.content = content;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public long getCreationTime() {
    return creationTime;
  }

  public void setComponentSafe(JComponent component) {
    if (component.getParent() != this) {
      setComponent(component);
    }
  }

  private void setComponent(JComponent component) {
    add(component, BorderLayout.CENTER);
  }
  

}
