package codeOrchestra.ios;

import com.semaphore.jna.cf.CFDictionary;
import com.semaphore.jna.cf.CFType;
import com.semaphore.jna.md.MDLibrary;
import com.semaphore.jna.md.MDLibrary.am_device;
import com.semaphore.util.plist.PList;

/**
 * @author: Alexander Eliseyev
 */
public class iOSDevice {

  private am_device dev;

  public iOSDevice(am_device dev) {
    this.dev = dev;
  }

  public am_device getDeviceStructure() {
    return dev;
  }

  public boolean enterRecovery() {
    return dev.enterRecovery();
  }

  public PList getDeviceInfo() {
    CFType ddata = dev.getValue(null);
    CFDictionary dict = new CFDictionary(ddata.getPointer());
    return dict.toPlist();
  }

  public void releaseDevice() {
    MDLibrary.INSTANCE.AMDeviceRelease(dev);
  }

  @Override
  public int hashCode() {
    return dev.hashCode();
  }

}
