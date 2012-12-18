package codeOrchestra.test;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;

/**
 * @author: Alexander Eliseyev
 */
public class LanguageMigration {

  public static void main(String[] args) throws IOException {
      File languagesDir = new File("/Users/buildserver/Projects/CodeOrchestra-langs/languages");

    for (File file : languagesDir.listFiles()) {
      if (file.isDirectory()) {
        migrate(file);
      }
    }
  }

  private static void migrate(File languageDirectory) throws IOException {
    File classesGen = new File(languageDirectory, "classes_gen");
    File codeOrchestra = new File(classesGen, "codeOrchestra");
    if (codeOrchestra.exists()) {
      return;
    }
    File sourceGen = new File(languageDirectory, "source_gen");
    if (!sourceGen.exists()) {
      return;
    }
    File comRealaxySourceDir = new File(sourceGen, "realaxy");
    if (!comRealaxySourceDir.exists()) {
      return;
    }
    File codeOrchestraSourceDir = new File(sourceGen, "codeOrchestra");
    if (codeOrchestraSourceDir.exists()) {
      return;
    }

    FileUtils.copyDirectory(comRealaxySourceDir, codeOrchestraSourceDir);

    FileUtils.deleteDirectory(comRealaxySourceDir);
    if (comRealaxySourceDir.exists()) {
      comRealaxySourceDir.delete();
    }

    File comClassesGen = new File(classesGen, "realaxy");
    FileUtils.deleteDirectory(comClassesGen);
    if (comClassesGen.exists()) {
      comClassesGen.delete();
    }

    /*
    File comSourceGen = new File(sourceGen, "com");
    FileUtils.deleteDirectory(comSourceGen);
    if (comSourceGen.exists()) {
      comSourceGen.delete();
    }
    */

    System.out.println(languageDirectory.getPath());
  }

  private static void printLanguagesToMigrate(File languageDirectory) {
    File classesGen = new File(languageDirectory, "classes_gen");
    if (new File(classesGen, "codeOrchestra").exists()) {
      return;
    }
  }

}
