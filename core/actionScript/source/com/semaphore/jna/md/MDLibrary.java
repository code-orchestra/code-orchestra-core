package com.semaphore.jna.md;

import codeOrchestra.ios.jna.core.CFStringRef;
import codeOrchestra.ios.jna.mobileDevice.afc_connection;
import codeOrchestra.ios.jna.mobileDevice.afc_directory;
import codeOrchestra.ios.jna.util.FieldUtil;
import com.semaphore.jna.cf.CFString;
import com.semaphore.jna.cf.CFType;
import com.sun.jna.*;
import com.sun.jna.ptr.IntByReference;
import com.sun.jna.ptr.LongByReference;

import java.nio.Buffer;
import java.util.List;

/**
 * @author semaphore
 * @author Alexander Eliseyev
 */
@SuppressWarnings("unused")
public interface MDLibrary extends Library {

  final String MOBILE_DEVICE_LIB = "/System/Library/PrivateFrameworks/MobileDevice.framework/MobileDevice";

  public static final MDLibrary INSTANCE = (MDLibrary) Native.loadLibrary(MOBILE_DEVICE_LIB, MDLibrary.class);

  // CodeOrchestra patch BEGIN

  int AMDeviceStartService(am_device device, CFStringRef service_name, IntByReference socket_fd);

  int AFCConnectionOpen(int socket_fd, int io_timeout, afc_connection.ByReference conn[]);

  int AFCDirectoryOpen(afc_connection conn, String path, afc_directory.ByReference dir[]);

  int AFCDirectoryRead(afc_connection conn, afc_directory dir, String[] dirent);

  int AMDeviceStartHouseArrestService(am_device device, CFStringRef identifier, Pointer unknown, IntByReference handle, IntByReference what);

  int AFCFileRefOpen(afc_connection conn, String path, long mode, LongByReference ref);

  int AFCFileRefWrite(afc_connection conn, long ref, Buffer buf, int len);

  int AFCFileRefClose(afc_connection conn, long ref);

  // CodeOrchestra patch END

  public static final int ADNCI_MSG_CONNECTED = 1;
  public static final int ADNCI_MSG_DISCONNECTED = 2;
  public static final int ADNCI_MSG_UNKNOWN = 3;

  int AMDeviceNotificationSubscribe(am_device_notification_callback callback, int unused0, int unused1, int unused2, am_device_notification.ByReference notification[]);

  int AMRestoreRegisterForDeviceNotifications(am_restore_device_notification_callback dfu_connect_callback,
                                              am_restore_device_notification_callback recovery_connect_callback,
                                              am_restore_device_notification_callback dfu_disconnect_callback,
                                              am_restore_device_notification_callback recovery_disconnect_callback,
                                              int unknown,
                                              Pointer userInfo);

  int AMDeviceConnect(am_device device);

  int AMDeviceIsPaired(am_device device);

  int AMDeviceValidatePairing(am_device device);

  int AMDeviceStartSession(am_device device);

  int AMDeviceRelease(am_device device);

  CFType AMDeviceCopyValue(am_device device, CFString domain, CFString cfstring);

  int AMDeviceEnterRecovery(am_device device);

  int AMRecoveryModeDeviceSetAutoBoot(am_recovery_device rdev, byte autoBoot);

  CFString AMRecoveryModeDeviceCopySerialNumber(am_recovery_device rdev);

  int AMRecoveryModeDeviceReboot(am_recovery_device rdev);

  /// <i>native declaration : mobiledevice.h</i>

  public static class am_device_notification extends Structure {
    /// 0
    public int unknown0;
    /// 4
    public int unknown1;
    /// 8
    public int unknown2;
    /**
     * 12<br>
     * C type : am_device_notification_callback
     */
    public am_device_notification_callback callback;
    /// 16
    public int unknown3;

    public am_device_notification() {
      super();
    }

    /**
     * @param unknown0 0<br>
     * @param unknown1 4<br>
     * @param unknown2 8<br>
     * @param callback 12<br>
     *                 C type : am_device_notification_callback<br>
     * @param unknown3 16
     */
    public am_device_notification(int unknown0, int unknown1, int unknown2, am_device_notification_callback callback, int unknown3) {
      super();
      this.unknown0 = unknown0;
      this.unknown1 = unknown1;
      this.unknown2 = unknown2;
      this.callback = callback;
      this.unknown3 = unknown3;
    }

    protected ByReference newByReference() {
      return new ByReference();
    }

    protected ByValue newByValue() {
      return new ByValue();
    }

    protected am_device_notification newInstance() {
      return new am_device_notification();
    }

    public static class ByReference extends am_device_notification implements Structure.ByReference {
    }

    public static class ByValue extends am_device_notification implements Structure.ByValue {
    }

    @Override
    protected List getFieldOrder() {
      return FieldUtil.getFieldsOrderForClass(getClass());
    }
  }

  public interface am_device_notification_callback extends Callback {
    void invoke(am_device_notification_callback_info info, Pointer arg);
  }

  public interface am_restore_device_notification_callback extends Callback {
    void invoke(am_recovery_device rdev);
  }

  public static class am_device_notification_callback_info extends Structure {
    /**
     * 0    device<br>
     * C type : am_device*
     */
    public am_device.ByReference dev;
    /// 4    one of ADNCI_MSG_*
    public int msg;

    public am_device_notification_callback_info() {
      super();
    }

    /**
     * @param dev 0    device<br>
     *            C type : am_device*<br>
     * @param msg 4    one of ADNCI_MSG_*
     */
    public am_device_notification_callback_info(am_device.ByReference dev, int msg) {
      super();
      this.dev = dev;
      this.msg = msg;
    }

    protected ByReference newByReference() {
      return new ByReference();
    }

    protected ByValue newByValue() {
      return new ByValue();
    }

    protected am_device_notification_callback_info newInstance() {
      return new am_device_notification_callback_info();
    }

    public static class ByReference extends am_device_notification_callback_info implements Structure.ByReference {

    }

    public static class ByValue extends am_device_notification_callback_info implements Structure.ByValue {

    }

    @Override
    protected List getFieldOrder() {
      return FieldUtil.getFieldsOrderForClass(getClass());
    }
  }
  /// <i>native declaration : mob

  public static class am_device extends Structure {
    public byte[] unknown0 = new byte[(16)];
    public int device_id;
    public int product_id;
    public Pointer serial;
    public int unknown1;
    public byte[] unknown2 = new byte[(4)];
    public int lockdown_conn;
    public byte[] unknown3 = new byte[(8)];

    public am_device() {
      super();
    }

    protected ByReference newByReference() {
      return new ByReference();
    }

    protected ByValue newByValue() {
      return new ByValue();
    }

    protected am_device newInstance() {
      return new am_device();
    }

    public static class ByReference extends am_device implements Structure.ByReference {

    }

    public static class ByValue extends am_device implements Structure.ByValue {

    }

    @Override
    protected List getFieldOrder() {
      return FieldUtil.getFieldsOrderForClass(getClass());
    }

    public CFType getValue(String key) {
      if (key == null)
        return INSTANCE.AMDeviceCopyValue(this, null, null);
      return INSTANCE.AMDeviceCopyValue(this, null, CFString.buildString(key));
    }

    public boolean enterRecovery() {
      return INSTANCE.AMDeviceEnterRecovery(this) == 0;
    }
  }

  public static class am_recovery_device extends Structure {
    public byte[] unknown0 = new byte[(8)]; /// 0
    public am_restore_device_notification_callback callback; /// 8
    public Pointer user_info; /// 12
    public byte[] unknown1 = new byte[(12)]; /// 16
    public int readwrite_pipe; /// 28
    public byte read_pipe; /// 32
    public byte write_ctrl_pipe; /// 33
    public byte read_unknown_pipe; /// 34
    public byte write_file_pipe; /// 35
    public byte write_input_pipe; /// 36

    public am_recovery_device() {
      super();
    }

    protected ByReference newByReference() {
      ByReference s = new ByReference();
      s.useMemory(getPointer());
      write();
      s.read();
      return s;
    }

    protected ByValue newByValue() {
      ByValue s = new ByValue();
      s.useMemory(getPointer());
      write();
      s.read();
      return s;
    }

    protected am_recovery_device newInstance() {
      am_recovery_device s = new am_recovery_device();
      s.useMemory(getPointer());
      write();
      s.read();
      return s;
    }

    public static class ByReference extends am_recovery_device implements Structure.ByReference {
    }

    public static class ByValue extends am_recovery_device implements Structure.ByValue {
    }

    public int exitRecovery() {
      if (setAutoBoot(true) == 0) {
        reboot();
        return 0;
      }
      return -1;
    }

    public void reboot() {
      INSTANCE.AMRecoveryModeDeviceReboot(this);
    }

    public int setAutoBoot(boolean value) {
      return INSTANCE.AMRecoveryModeDeviceSetAutoBoot(this, value ? (byte) 1 : (byte) 0);
    }

    @Override
    protected List getFieldOrder() {
      return FieldUtil.getFieldsOrderForClass(getClass());
    }
  }
}
