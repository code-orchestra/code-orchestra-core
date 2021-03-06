package jetbrains.mps.build.distrib.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.build.packaging.structure.IPath;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class WindowsConfig extends SystemSpecificConfig {
  public static final String concept = "jetbrains.mps.build.distrib.structure.WindowsConfig";
  public static final String LICENSE = "license";
  public static final String PATH_TO_NSIS_ZIP_FILE = "pathToNsisZipFile";
  public static final String APPLICATION_ICON = "applicationIcon";
  public static final String HOMEPAGE_ICON = "homepageIcon";
  public static final String INSTALLER_ICON = "installerIcon";
  public static final String UNINSTALLER_ICON = "uninstallerIcon";
  public static final String EMBEDDED_JRE_PATH = "embeddedJrePath";
  public static final String SIGNATURE_CONFIGURATION = "signatureConfiguration";

  public WindowsConfig(SNode node) {
    super(node);
  }

  public IPath getLicense() {
    return (IPath) this.getChild(IPath.class, WindowsConfig.LICENSE);
  }

  public void setLicense(IPath node) {
    super.setChild(WindowsConfig.LICENSE, node);
  }

  public IPath getPathToNsisZipFile() {
    return (IPath) this.getChild(IPath.class, WindowsConfig.PATH_TO_NSIS_ZIP_FILE);
  }

  public void setPathToNsisZipFile(IPath node) {
    super.setChild(WindowsConfig.PATH_TO_NSIS_ZIP_FILE, node);
  }

  public IPath getApplicationIcon() {
    return (IPath) this.getChild(IPath.class, WindowsConfig.APPLICATION_ICON);
  }

  public void setApplicationIcon(IPath node) {
    super.setChild(WindowsConfig.APPLICATION_ICON, node);
  }

  public IPath getHomepageIcon() {
    return (IPath) this.getChild(IPath.class, WindowsConfig.HOMEPAGE_ICON);
  }

  public void setHomepageIcon(IPath node) {
    super.setChild(WindowsConfig.HOMEPAGE_ICON, node);
  }

  public IPath getInstallerIcon() {
    return (IPath) this.getChild(IPath.class, WindowsConfig.INSTALLER_ICON);
  }

  public void setInstallerIcon(IPath node) {
    super.setChild(WindowsConfig.INSTALLER_ICON, node);
  }

  public IPath getUninstallerIcon() {
    return (IPath) this.getChild(IPath.class, WindowsConfig.UNINSTALLER_ICON);
  }

  public void setUninstallerIcon(IPath node) {
    super.setChild(WindowsConfig.UNINSTALLER_ICON, node);
  }

  public IPath getEmbeddedJrePath() {
    return (IPath) this.getChild(IPath.class, WindowsConfig.EMBEDDED_JRE_PATH);
  }

  public void setEmbeddedJrePath(IPath node) {
    super.setChild(WindowsConfig.EMBEDDED_JRE_PATH, node);
  }

  public DigitalSignatureWindowsConfiguration getSignatureConfiguration() {
    return (DigitalSignatureWindowsConfiguration) this.getChild(DigitalSignatureWindowsConfiguration.class, WindowsConfig.SIGNATURE_CONFIGURATION);
  }

  public void setSignatureConfiguration(DigitalSignatureWindowsConfiguration node) {
    super.setChild(WindowsConfig.SIGNATURE_CONFIGURATION, node);
  }

  public static WindowsConfig newInstance(SModel sm, boolean init) {
    return (WindowsConfig) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.build.distrib.structure.WindowsConfig", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static WindowsConfig newInstance(SModel sm) {
    return WindowsConfig.newInstance(sm, false);
  }
}
