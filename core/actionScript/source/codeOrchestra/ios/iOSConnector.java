package codeOrchestra.ios;

import codeOrchestra.ios.jna.core.CFStringRef;
import codeOrchestra.ios.jna.mobileDevice.FileOpenMode;
import codeOrchestra.ios.jna.mobileDevice.afc_connection;
import codeOrchestra.ios.jna.mobileDevice.afc_connection.ByReference;
import codeOrchestra.ios.jna.mobileDevice.afc_directory;
import codeOrchestra.ios.wrapper.DirectoryWrapper;
import codeOrchestra.ios.wrapper.FileWrapper;
import com.semaphore.jna.cf.CFLibrary;
import com.semaphore.jna.md.MDLibrary;
import com.semaphore.jna.md.MDLibrary.*;
import com.sun.jna.Pointer;
import com.sun.jna.ptr.IntByReference;
import com.sun.jna.ptr.LongByReference;
import jetbrains.mps.util.ReadUtil;

import static com.semaphore.jna.md.MDLibrary.*;

import java.io.*;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class iOSConnector implements am_device_notification_callback {

  private iOSLogger logger;
  private String bundleId;
  private String applicationName;

  private iOSDevice device;
  private afc_connection.ByReference appleFileConnection;

  public iOSConnector(iOSLogger logger, String bundleId, String applicationName) {
    this.logger = logger;
    this.bundleId = bundleId;
    this.applicationName = applicationName;
  }

  public void startListening() throws iOSException {
    am_device_notification.ByReference[] notif = new am_device_notification.ByReference[1];
    int retval = MDLibrary.INSTANCE.AMDeviceNotificationSubscribe(this, 0, 0, 0, notif);
    if (retval != 0) {
      throw new iOSException("Unable to subscribe to iOS device notifications", retval);
    }

    CFLibrary.INSTANCE.CFRunLoopRun();
  }

  public boolean isConnected() {
    return device != null;
  }

  // native callback
  public void invoke(am_device_notification_callback_info info, Pointer arg) {
    if (info.msg == ADNCI_MSG_CONNECTED) {
      if (handleConnect(info.dev)) {
        this.device = new iOSDevice(info.dev);
        onDeviceConnected(device);
      }
    } else if (info.msg == ADNCI_MSG_DISCONNECTED || info.msg == ADNCI_MSG_UNKNOWN) {
      iOSDevice device = new iOSDevice(info.dev);
      this.device = null;
      onDeviceDisconnected(device);
    }
  }

  public void onDeviceDisconnected(iOSDevice device) {
  }

  public void onDeviceConnected(iOSDevice device) {
  }

  protected boolean handleConnect(am_device.ByReference dev) {
    int retval = 0;

    if ((retval = MDLibrary.INSTANCE.AMDeviceConnect(dev)) != 0) {
      logSevere("Unable to connect to device [" + dev.device_id + "]" + ", retval = " + retval);
      return false;
    } else {
      logInfo("AMDeviceConnect OK");
    }

    if ((retval = MDLibrary.INSTANCE.AMDeviceIsPaired(dev)) != 1) {
      logSevere("Unable to pair with device [" + dev.device_id + "]" + ", retval = " + retval);
      return false;
    } else {
      logInfo("AMDeviceIsPaired OK");
    }

    if ((retval = MDLibrary.INSTANCE.AMDeviceValidatePairing(dev)) != 0) {
      logSevere("Unable to validate the pairing with device [" + dev.device_id + "]" + ", retval = " + retval);
      return false;
    } else {
      logInfo("AMDeviceValidatePairing OK");
    }

    if ((retval = MDLibrary.INSTANCE.AMDeviceStartSession(dev)) != 0) {
      logSevere("Unable to start session on device [" + dev.device_id + "]" + ", retval = " + retval);
      return false;
    } else {
      logInfo("AMDeviceStartSession OK");
    }

    IntByReference houseArrestHandle = new IntByReference();
    int r = MDLibrary.INSTANCE.AMDeviceStartHouseArrestService(dev, CFStringRef.CFSTR(bundleId), Pointer.NULL, houseArrestHandle, new IntByReference());

    IntByReference socketFileDescriptor = new IntByReference();
    if ((retval = MDLibrary.INSTANCE.AMDeviceStartService(dev, CFStringRef.CFSTR("com.apple.afc"), socketFileDescriptor)) != 0) {
      logSevere("Unable to start session on the device [" + dev.device_id + "]" + ", retval = " + retval);
      return false;
    } else {
      logInfo("AMDeviceStartService OK");
    }

    afc_connection.ByReference[] connection = new afc_connection.ByReference[1];
    if ((retval = MDLibrary.INSTANCE.AFCConnectionOpen(houseArrestHandle.getValue(), 0, connection)) != 0) {
      logSevere("Unable to open Apple File Connection on the device [" + dev.device_id + "]" + ", retval = " + retval);
      return false;
    } else {
      logInfo("AFCConnectionOpen OK");
    }

    this.appleFileConnection = connection[0];

    return true;
  }

  public void copyFileToApplicationRoot(String localFilePath) throws IOException, iOSException {
    File localFile = new File(localFilePath);
    writeFile(device.getDeviceStructure(), appleFileConnection, "/" + applicationName + "/" + localFile.getName(), localFilePath);
  }

  private static void writeFile(am_device dev, afc_connection.ByReference connection, String remotePath, String localPath) throws iOSException, IOException {
    FileWrapper deviceFile = openFile(dev, connection, remotePath, FileOpenMode.WRITE);

    File localFile = new File(localPath);
    byte[] bytes = new byte[(int) localFile.length()];
    FileInputStream is = new FileInputStream(localFile);
    ReadUtil.read(bytes, is);
    Buffer buffer = ByteBuffer.wrap(bytes);

    int writeRetVal = MDLibrary.INSTANCE.AFCFileRefWrite(connection, deviceFile.getFileReference().getValue(), buffer, bytes.length);
    if (writeRetVal != 0) {
      throw new iOSException("Unable to write the file " + localPath + " to the device under path " + remotePath, dev.device_id, writeRetVal);
    }

    int closeRetVal = MDLibrary.INSTANCE.AFCFileRefClose(connection, deviceFile.getFileReference().getValue());
    if (closeRetVal != 0) {
      throw new iOSException("Unable to close the file " + localPath + " to the device under path " + remotePath, dev.device_id, writeRetVal);
    }
  }

  private static FileWrapper openFile(am_device dev, afc_connection.ByReference connection, String path, FileOpenMode mode) throws iOSException {
    int retval;
    LongByReference fileReference = new LongByReference();

    if ((retval = MDLibrary.INSTANCE.AFCFileRefOpen(connection, path, mode.getNativeValue(), fileReference)) != 0) {
      throw new iOSException("Unable to open file " + path + " for operation " + mode.name() + " on device", dev.device_id, retval);
    }

    return new FileWrapper(fileReference, path);
  }

  private static DirectoryWrapper getDir(am_device dev, afc_connection.ByReference connection, String path) throws iOSException {
    int retval;
    afc_directory.ByReference[] rootDir = new afc_directory.ByReference[1];
    if ((retval = MDLibrary.INSTANCE.AFCDirectoryOpen(connection, path, rootDir)) != 0) {
      throw new iOSException("Unable to open root dir on device", dev.device_id, retval);
    }

    return new DirectoryWrapper(rootDir[0], path);
  }

  private static DirectoryWrapper getAppDirInHouseArrest(am_device dev, afc_connection.ByReference connection) throws iOSException {
    DirectoryWrapper rootDirWrapper = getDir(dev, connection, "/");

    int retval = 0;
    while (retval == 0) {
      String[] dirEntryArray = new String[1];
      retval = MDLibrary.INSTANCE.AFCDirectoryRead(connection, rootDirWrapper.getDir(), dirEntryArray);

      String childName = dirEntryArray[0];
      if (childName == null) {
        return null;
      } else {
        if (childName.endsWith(".app")) {
          return getDir(dev, connection, "/" + childName + "/");
        }
      }
    }

    throw new iOSException("Couldn't read the .app dir", dev.device_id, retval);
  }

  private List<String> getChildrenNames(am_device dev, afc_connection.ByReference connection, DirectoryWrapper directoryWrapper) throws iOSException{
    List<String> result = new ArrayList<String>();

    int retval = 0;
    while (retval == 0) {
      String[] dirEntryArray = new String[1];
      retval = MDLibrary.INSTANCE.AFCDirectoryRead(connection, directoryWrapper.getDir(), dirEntryArray);

      String childName = dirEntryArray[0];
      if (childName == null) {
        return result;
      } else if (".".equals(childName) || "..".equals(childName)) {
        continue;
      } else {
        result.add(childName);
      }
    }

    throw new iOSException("Couldn't read the dir " + directoryWrapper.getPath() + " on a device", dev.device_id, retval);
  }

  public void dispose() {
    // TODO: implement
  }

  private void logInfo(String s) {
    logger.logInfo(s);
  }

  private void logSevere(String s) {
    logger.logSevere(s);
  }

}
