package codeOrchestra.generator;

import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class FileOverrideWrapper {

  private String sourceFqName;
  private String targetFqName;
  private String extension;

  public FileOverrideWrapper(@NotNull String sourceFqName, @NotNull String targetFqName, @NotNull String extension) {
    this.sourceFqName = sourceFqName;
    this.targetFqName = targetFqName;
    this.extension = extension;
  }

  public String getSourceFqName() {
    return sourceFqName;
  }

  public String getTargetFqName() {
    return targetFqName;
  }

  public String getExtension() {
    return extension;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    FileOverrideWrapper that = (FileOverrideWrapper) o;

    if (!extension.equals(that.extension)) return false;
    if (!sourceFqName.equals(that.sourceFqName)) return false;
    if (!targetFqName.equals(that.targetFqName)) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = sourceFqName.hashCode();
    result = 31 * result + targetFqName.hashCode();
    result = 31 * result + extension.hashCode();
    return result;
  }
}
