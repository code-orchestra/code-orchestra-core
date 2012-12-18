package codeOrchestra.actionscript.wizards.newproject;

import com.intellij.ide.wizard.CommitStepException;
import com.intellij.ide.wizard.StepAdapter;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.EtchedBorder;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASNewProjectStep extends StepAdapter {

  protected static final Logger LOG = Logger.getLogger(ASNewProjectStep.class);

  protected JPanel myComponent;

  public ASNewProjectStep() {
    GridBagLayout bagLayout = new GridBagLayout();
    myComponent = new JPanel(bagLayout);

    JComponent controlComponent = createControlComponent();

    JPanel imagePanel = createImagePanel();
    GridBagConstraints cImage = new GridBagConstraints(0, 0, 1, 1, 0, 0, GridBagConstraints.NORTHWEST, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0);
    myComponent.add(imagePanel, cImage);

    GridBagConstraints cContent = new GridBagConstraints(1, 0, 1, 1, 1, 0, GridBagConstraints.NORTHWEST, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0);
    Border outerBorder = BorderFactory.createEtchedBorder(EtchedBorder.LOWERED);
    Border innerBorder = BorderFactory.createEmptyBorder(2, 2, 2, 2);
    Border border = BorderFactory.createCompoundBorder(outerBorder, innerBorder);
    controlComponent.setBorder(border);
    myComponent.add(controlComponent, cContent);

    int w = Math.max(controlComponent.getPreferredSize().width + (imagePanel.getPreferredSize().width), 600);
    int h = Math.max(300, imagePanel.getPreferredSize().height);
    myComponent.setPreferredSize(new Dimension(w, h));
  }

  public abstract JComponent createControlComponent();

  public final JComponent getComponent() {
    return myComponent;
  }

  @Nullable
  public Icon getIcon() {
    return null;
  }

  public abstract boolean finishable();

  public boolean continuable() {
    // This is ok for most steps. Overriding this method can provide functionality to hide unused steps
    return !finishable();
  }

  private JPanel createImagePanel() {
    URL imageUrl = getImageURL();
    String imageText = getImageText();

    GridBagLayout bagLayout = new GridBagLayout();
    JPanel imagePanel = new JPanel(bagLayout);

    if (imageUrl != null) {
      ImageIcon info = new ImageIcon(imageUrl);

      BufferedImage bim = null;
      try {
        bim = ImageIO.read(imageUrl);
      } catch (IOException e) {
        LOG.error("Can't read image: ", e);
      }
      assert bim != null : "Icon was not read. The possible reason is that PNG format was not recognized";
      Graphics graphics = bim.getGraphics();
      graphics.setColor(new Color(0x7e, 0x7c, 0x7c));
      graphics.setFont(new Font("Helvetica", Font.BOLD, 18));
      int textWidth = graphics.getFontMetrics().charsWidth(imageText.toCharArray(), 0, imageText.length());
      int x = (info.getIconWidth() - textWidth) / 2;
      int y = 288;
      graphics.drawChars(imageText.toCharArray(), 0, imageText.length(), x, y);

      GridBagConstraints cImage = new GridBagConstraints(0, 0, 1, 1, 1, 1, GridBagConstraints.NORTHWEST, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0);
      JLabel image = new JLabel(new ImageIcon(bim));
      imagePanel.add(image, cImage);
    }

    return imagePanel;
  }

  @Nullable
  public URL getImageURL() {
    return null;
  }

  @NotNull
  public String getImageText() {
    return "";
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    ASNewProjectStep that = (ASNewProjectStep) o;

    // Equal by class
    if (getClass() != null ? !getClass().equals(that.getClass()) : that.getClass() != null) return false;

    return true;
  }

  protected abstract void _check() throws CommitStepException;

  @Override
  public void _commit(boolean finishChosen) throws CommitStepException {
    if (finishChosen) {
      _check();
    }
    super._commit(finishChosen);
  }

}
