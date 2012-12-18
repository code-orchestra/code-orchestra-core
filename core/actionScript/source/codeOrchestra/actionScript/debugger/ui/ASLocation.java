package codeOrchestra.actionScript.debugger.ui;

import codeOrchestra.actionScript.debugger.fdbex.FileInfoCacheEx;
import codeOrchestra.debugger.breakpoint.ICodeOrchestraDebugLocation;
import codeOrchestra.debugger.ui.AbstractCodeOrchestraDebugLocation;
import flash.tools.debugger.Frame;
import flash.tools.debugger.Location;
import flash.tools.debugger.SourceFile;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class ASLocation extends AbstractCodeOrchestraDebugLocation implements ICodeOrchestraDebugLocation {

  private Frame fdbFrame;

  public ASLocation(Frame fdbFrame) {
    this.fdbFrame = fdbFrame;
  }

  public String getFileName() {
    if (fdbFrame == null) {
      return "(unknown frame)";
    }

    Location location = fdbFrame.getLocation();
    if (location == null) {
      return "(unknown location)";
    }

    SourceFile file = location.getFile();
    if (file == null) {
      return "(unknown file)";
    }

    return file.getName();
  }

  public File getFile() {
    if (fdbFrame == null) {
      return null;
    }

    Location location = fdbFrame.getLocation();
    if (location == null) {
      return null;
    }

    SourceFile file = location.getFile();
    if (file == null) {
      return null;
    }

    return new File(file.getFullPath());
  }

  @Override
  public String getUnitName() {
    if (fdbFrame == null) {
      return "(unknown unit)";
    }

    Location location = fdbFrame.getLocation();
    if (location == null) {
      return "(unknown unit)";
    }

    SourceFile sourceFile = location.getFile();
    if (sourceFile == null) {
      return "(unknown unit)";
    }

    return FileInfoCacheEx.getFQName(sourceFile);
  }

  @Override
  public String getRoutineName() {
    if (fdbFrame == null) {
      return "(unknown routine)";
    }
    return fdbFrame.getCallSignature();
  }

  @Override
  public int getLineNumber() {
    if (fdbFrame == null) {
      return -1;
    }

    Location location = fdbFrame.getLocation();
    if (location == null) {
      return -1;
    }

    return location.getLine();
  }

}
