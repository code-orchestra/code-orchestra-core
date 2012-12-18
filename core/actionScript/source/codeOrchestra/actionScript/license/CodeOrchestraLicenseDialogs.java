package codeOrchestra.actionScript.license;

import codeOrchestra.actionScript.license.CodeOrchestraLicenseManager;
import codeOrchestra.actionScript.serial.SerialValidator;
import codeOrchestra.license.ExpirationHelper;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraLicenseDialogs {

  public static void showTrialInProgressDialog() {
    String expireMessage = String.format("You have %d days of %d evaluation period days left. You may continue evaluation or enter a serial number",
      ExpirationHelper.getDaysLeft(),
      ExpirationHelper.getExpirationPeriod());

    JFrame dummyFrame = new JFrame("Evaluation License");

    int result = JOptionPane.showOptionDialog(dummyFrame, expireMessage, "Evaluation License", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, new Object[]{"Continue Evaluation" , "Enter Serial Number"}, "---");

    if (result == 1) {
      showSerialNumberDialog();
    }
  }

  public static boolean showSerialNumberDialog() {
    String serialNumber = JOptionPane.showInputDialog(null, "Please type the serial number purchased", "Serial number", JOptionPane.QUESTION_MESSAGE);

    if (serialNumber != null) {
      if (SerialValidator.getInstance().isValidSerialNumber(serialNumber)) {
        JOptionPane.showMessageDialog(null, "Thank you for choosing the CodeOrchestra ActionScript Editor!", "Serial number", JOptionPane.INFORMATION_MESSAGE);
        CodeOrchestraLicenseManager.registerProduct(serialNumber);
        return true;
      } else {
        JOptionPane.showMessageDialog(null, "The serial number entered is not valid", "Serial number", JOptionPane.ERROR_MESSAGE);
        return showSerialNumberDialog();
      }
    }

    return false;
  }

}
