package codeOrchestra.generator.report;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.util.FileUtils;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.FileUtil;

import java.io.*;
import java.util.List;
import java.util.zip.GZIPOutputStream;

/**
 * @author Alexander Eliseyev
 */
public class GeneratedFileSizeReporter {

  private CodeOrchestraGenerationContext context;

  public GeneratedFileSizeReporter(CodeOrchestraGenerationContext context) {
    this.context = context;
  }

  public GeneratedFileSize report() {
    try {
      OutputType rootOutputType = context.getRootOutputType();
      if (rootOutputType == OutputType.HTML5_APPLICATION || rootOutputType == OutputType.HTML5_LIBRARY) {
        ModuleReference rootModule = context.getRootModule();

        Solution solution = MPSModuleRepository.getInstance().getSolution(rootModule);
        String generatorOutputPath = solution.getGeneratorOutputPath();

        return reportInternal(generatorOutputPath);
      }
    } catch (Throwable t) {
      // I don't want any trouble, officer
    }
    return null;
  }

  private GeneratedFileSize reportInternal(String generatorOutputPath) {
    File generatorOutputDir = new File(generatorOutputPath);
    List<File> files = FileUtils.listFileRecursively(generatorOutputDir, new FileFilter() {
      @Override
      public boolean accept(File file) {
        String filename = file.getName();
        return filename.endsWith(".js") || filename.endsWith(".htm") || filename.endsWith(".html") || filename.endsWith(".css");
      }
    });

    // Uncompressed
    long uncompressedSize = 0;
    for (File file : files) {
      uncompressedSize += file.length();
    }

    double uncompressedSizeKb = uncompressedSize / 1000.0;
    double compressedSizeKb = getGZIPpedSize(files) / 1000.0;

    return new GeneratedFileSize(compressedSizeKb, uncompressedSizeKb);
  }

  private long getGZIPpedSize(List<File> files) {
    try {
      // Create the GZIP output stream
      File tmpFile = FileUtil.createTmpFile();
      GZIPOutputStream out = new GZIPOutputStream(new FileOutputStream(tmpFile));

      for (File file : files) {
        // Open the input file
        FileInputStream in = new FileInputStream(file);

        // Transfer bytes from the input file to the GZIP output stream
        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) > 0) {
          out.write(buf, 0, len);
        }

        in.close();
      }

      // Complete the GZIP file
      out.finish();
      out.close();

      return tmpFile.length();
    } catch (IOException e) {
    }

    throw new RuntimeException("Can't GZIP");
  }

}
