package com.intellij.backport12.ide.presentation;

import com.intellij.backport12.openapi.vfs.VirtualFile;
import com.intellij.backport12.util.PlatformIcons;
import com.intellij.ide.TypePresentationService;

import javax.swing.*;

/**
 * @author yole
 */
public class VirtualFilePresentation {
  public static Icon getIcon(VirtualFile vFile) {
    Icon icon = TypePresentationService.getService().getTypeIcon(vFile.getClass());
    if (icon != null) {
      return icon;
    }
    if (vFile.isDirectory() && vFile.isInLocalFileSystem()) {
      return PlatformIcons.FOLDER_ICON;
    }
    return vFile.getFileType().getIcon();
  }
}
