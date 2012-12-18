package codeOrchestra.actionscript.flex.settings;

import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public final class DefaultFlexURIs {

  private static Map<String, String> URIs = new HashMap<String, String>();

  static {
    final String flexSDKPath = FlexSDKSettings.getInstance().getFlexSDKPath();
    URIs.put("http://ns.adobe.com/mxml/2009", flexSDKPath + File.separator + "frameworks/mxml-2009-manifest.xml");
    URIs.put("library://ns.adobe.com/flex/mx", flexSDKPath + File.separator + "frameworks/mx-manifest.xml");
    URIs.put("library://ns.adobe.com/flex/spark", flexSDKPath + File.separator + "frameworks/spark-manifest.xml");
    URIs.put("http://www.adobe.com/2006/mxml", flexSDKPath + File.separator + "frameworks/mxml-manifest.xml");
  }

  public static Map<String, String> get() {
    return URIs;
  }

  private DefaultFlexURIs() {

  }

}
