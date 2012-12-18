package codeOrchestra.actionscript.wizards;

import com.intellij.ide.wizard.AbstractWizard;
import com.intellij.ide.wizard.Step;
import com.intellij.openapi.project.Project;

import javax.swing.JComponent;
import javax.swing.JPanel;
import java.lang.reflect.Field;
import java.util.Map;

/**
 * Dirty hack of a AbstractWizard to support steps deletion. 
 *
 * @author Alexander Eliseyev
 */
public abstract class AbstractDynamicWizard<T extends Step> extends AbstractWizard<T> {

  protected AbstractDynamicWizard(String title, Project project) {
    super(title, project);
  }

  protected void deleteStep(T step) {
    mySteps.remove(step);
    getComponentToIdMap().remove(step.getComponent());
    getContentPanel().remove(step.getComponent());
  }

  private JPanel getContentPanel() {
    try {
      Field privateField = AbstractWizard.class.getDeclaredField("myContentPanel");
      privateField.setAccessible(true);
      JPanel panel = (JPanel) privateField.get(this);
      return panel;
    } catch (Throwable t) {
      throw new RuntimeException(t);
    }
  }

  private Map<JComponent, String> getComponentToIdMap() {
    try {
      Field privateField = AbstractWizard.class.getDeclaredField("myComponentToIdMap");
      privateField.setAccessible(true);
      Map fieldValue = (Map) privateField.get(this);
      return fieldValue;
    } catch (Throwable t) {
      throw new RuntimeException(t);
    }
  }

}
