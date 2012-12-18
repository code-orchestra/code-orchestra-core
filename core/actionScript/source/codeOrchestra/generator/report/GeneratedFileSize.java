package codeOrchestra.generator.report;

/**
 * @author Alexander Eliseyev
 */
public class GeneratedFileSize {

  private double compressedSize;
  private double uncompressedSize;

  public GeneratedFileSize(double compressedSize, double uncompressedSize) {
    this.compressedSize = compressedSize;
    this.uncompressedSize = uncompressedSize;
  }

  public double getCompressedSizeKB() {
    return compressedSize;
  }

  public double getUncompressedSizeKB() {
    return uncompressedSize;
  }
}
