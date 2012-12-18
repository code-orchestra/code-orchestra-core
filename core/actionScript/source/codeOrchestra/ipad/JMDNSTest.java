package codeOrchestra.ipad;

import javax.jmdns.JmDNS;
import javax.jmdns.ServiceInfo;
import java.net.InetAddress;

/**
 * @author Alexander Eliseyev
 */
public class JMDNSTest {

  public static void main(String[] args) throws Exception {
    javax.jmdns.JmDNS mdnsServer = JmDNS.create(InetAddress.getLocalHost());

    // Register a test service.
    ServiceInfo testService = ServiceInfo.create("codeOrchestra-ipad-app-server", "CodeOrchestra", 6666, "CodeOrchestra CodeOrchestra service");
    mdnsServer.registerService(testService);
  }

}
