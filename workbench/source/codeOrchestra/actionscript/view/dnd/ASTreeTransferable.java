package codeOrchestra.actionscript.view.dnd;

import com.intellij.util.ArrayUtil;

import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASTreeTransferable implements Transferable {

  private Object myObject;

  public ASTreeTransferable(Object o) {
    myObject = o;
  }

  public DataFlavor[] getTransferDataFlavors() {
    Class aClass = getClass();
    DataFlavor dataFlavor = null;
    try {
      dataFlavor = new DataFlavor(DataFlavor.javaJVMLocalObjectMimeType + ";class=" + aClass.getName(),
        getSupportedFlavor(), aClass.getClassLoader());
    } catch (ClassNotFoundException ignored) {
    }
    return new DataFlavor[]{dataFlavor};
  }

  protected abstract String getSupportedFlavor();

  public boolean isDataFlavorSupported(DataFlavor flavor) {
    DataFlavor[] flavors = getTransferDataFlavors();
    return ArrayUtil.find(flavors, flavor) != -1;
  }

  public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException, IOException {
    return myObject;
  }

}
