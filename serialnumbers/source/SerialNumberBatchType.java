/**
 * @author Alexander Eliseyev
 */
public enum SerialNumberBatchType {

  REGULAR("Regular", 100 * 1000),
  EDUCATIONAL("Educational", 2 * 1000),
  FREE("Free", 2 * 1000);

  private int licensesCount;
  private String name;

  private SerialNumberBatchType(String name, int count) {
    this.name = name;
    this.licensesCount = count;
  }

  public String getOutputFileName() {
    return name + "_serialNumbers_" + licensesCount +".txt";
  }

  public int getLicensesCount() {
    return licensesCount;
  }

  public String getName() {
    return name;
  }

  public static int getTotalLicensesCount() {
    int sum = 0;
    for (SerialNumberBatchType batchType : values()) {
      sum += batchType.getLicensesCount();
    }
    return sum;
  }

}
