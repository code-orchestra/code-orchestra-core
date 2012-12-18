package codeOrchestra.rgs.state;

/**
 * @author Alexander Eliseyev
 */
public abstract class RGSConnectedState implements RGSState {

  private static final int MEGABYTE = 1024 * 1024;

  private long myTotalMemory = 10;
  private long myUsedMemeory = 10;

  public long getTotalMemory() {
    return myTotalMemory;
  }

  public long getUsedMemory() {
    return myUsedMemeory;
  }

  public void updateMemoryInfo() {
    Runtime runtime = Runtime.getRuntime();
    myTotalMemory = runtime.totalMemory() / MEGABYTE;
    myUsedMemeory = myTotalMemory - runtime.freeMemory() / MEGABYTE;
  }

}
