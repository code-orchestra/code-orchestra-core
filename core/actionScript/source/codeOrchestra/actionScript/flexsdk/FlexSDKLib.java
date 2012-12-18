package codeOrchestra.actionScript.flexsdk;

/**
 * @author Alexander Eliseyev
 */
public enum FlexSDKLib {

  PLAYERGLOBAL_SWC("playerglobal.swc"),
  FRAMEWORK_SWC("framework.swc"),
  RPC_SWC("rpc.swc"),
  SPARK_SWC("spark.swc"),
  OSMF_SWC("osmf.swc"),
  MX_SWC("mx/mx.swc");

  private String libPath;

  private FlexSDKLib(String libPath) {
    this.libPath = libPath;
  }

  public String getLibPath() {
    return libPath;
  }

  public String getNamespace() {
    return name().toLowerCase();
  }

  public boolean isPlayerGlobal() {
    return PLAYERGLOBAL_SWC == this;
  }

  public static FlexSDKLib get(String namespace) {
    for (FlexSDKLib flexSDKLib : values()) {
      if (flexSDKLib.getNamespace().equals(namespace)) {
        return flexSDKLib;
      }
    }
    return null;
  }

}
