package jetbrains.mps.uiLanguage.components;

/*Generated by MPS */

import javax.swing.JComponent;
import java.awt.Color;
import java.util.List;
import org.jdesktop.beansbinding.AutoBinding;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.uiLanguage.runtime.events.Events;

public class TextField extends JComponent {
  public TextField myThis;
  private String myText;
  private int myColumns;
  private Color myForeground;
  private boolean myEditable;
  public List<AutoBinding> myBindings = ListSequence.fromList(new ArrayList<AutoBinding>());
  private Events myEvents = new Events(null) {
    {
    }

    public void initialize() {
    }
  };

  public TextField() {
    this.myThis = this;
    TextField component = this;
    this.myEvents.initialize();
  }

  public Events getEvents() {
    return this.myEvents;
  }

  public void addNotify() {
    super.addNotify();
    this.bind();
  }

  public void removeNotify() {
    this.unbind();
    super.removeNotify();
  }

  private void bind() {
  }

  private void unbind() {
    for (AutoBinding binding : this.myBindings) {
      if (binding.isBound()) {
        binding.unbind();
      }
    }
  }

  public String getText() {
    return this.myText;
  }

  public int getColumns() {
    return this.myColumns;
  }

  public Color getForeground() {
    return this.myForeground;
  }

  public boolean getEditable() {
    return this.myEditable;
  }

  public void setText(String newValue) {
    String oldValue = this.myText;
    this.myText = newValue;
    this.firePropertyChange("text", oldValue, newValue);
  }

  public void setColumns(int newValue) {
    int oldValue = this.myColumns;
    this.myColumns = newValue;
    this.firePropertyChange("columns", oldValue, newValue);
  }

  public void setForeground(Color newValue) {
    Color oldValue = this.myForeground;
    this.myForeground = newValue;
    this.firePropertyChange("foreground", oldValue, newValue);
  }

  public void setEditable(boolean newValue) {
    boolean oldValue = this.myEditable;
    this.myEditable = newValue;
    this.firePropertyChange("editable", oldValue, newValue);
  }
}
