package codeOrchestra.utils;

import java.net.*;
import java.util.Enumeration;

/**
 * @author Alexander Eliseyev
 */
public final class NetworkUtils {

  private NetworkUtils() {
  }

  public static String getLocalHost() throws SocketException, UnknownHostException {
    Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
    while (interfaces.hasMoreElements()){
      NetworkInterface current = interfaces.nextElement();
      if (!current.isUp() || current.isLoopback() || current.isVirtual()) continue;

      Enumeration<InetAddress> addresses = current.getInetAddresses();
      while (addresses.hasMoreElements()){
        InetAddress currentAddress = addresses.nextElement();
        if (currentAddress.isLoopbackAddress()) continue;

        if (currentAddress instanceof Inet4Address) {
          return currentAddress.getHostAddress();
        }
      }
    }

    return InetAddress.getLocalHost().getHostAddress();
  }

}
