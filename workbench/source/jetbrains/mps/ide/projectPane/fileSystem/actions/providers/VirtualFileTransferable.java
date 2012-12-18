/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.ide.projectPane.fileSystem.actions.providers;

import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;

class VirtualFileTransferable implements Transferable {
  public static final DataFlavor VIRTUAL_FILE_DATA_FLAVOR = new DataFlavor(String[].class, "String Array");
  private final CopyPasteFilesData myData;

  VirtualFileTransferable(CopyPasteFilesData data) {
    myData = data;
  }

  public DataFlavor[] getTransferDataFlavors() {
    return new DataFlavor[]{VIRTUAL_FILE_DATA_FLAVOR};
  }

  public boolean isDataFlavorSupported(DataFlavor flavor) {
    return VIRTUAL_FILE_DATA_FLAVOR.equals(flavor);
  }

  public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException, IOException {
    if (VIRTUAL_FILE_DATA_FLAVOR.equals(flavor)) {
      return myData.getPresentation();
    }
    throw new UnsupportedFlavorException(flavor);
  }
}
