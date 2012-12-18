/*
 * TinyUmbrella - making iDevice restores possible...
 * Copyright (C) 2009-2010 semaphore
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.semaphore.util.plist;

import com.semaphore.fw.DeviceHardware;
import com.semaphore.fw.DeviceOSVersion;
import com.semaphore.fw.SHSHKeys;
import com.sun.jna.Platform;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.*;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 3:35:05 PM
 */
@SuppressWarnings("unchecked")
public class PListUtil {

    private static Map<String, Set<DeviceOSVersion>> digestVersionMapping = new HashMap<String, Set<DeviceOSVersion>>();

    static {
        for (DeviceOSVersion ver : DeviceOSVersion.values()) {
            if (ver.getManifestFile() == null)
                continue;
            PList manifest = JPlistBuilder.buildPList(PListUtil.class.getResourceAsStream("/com/semaphore/data/BuildManifest-" + ver.getManifestFile() + ".plist"));
            for (SHSHKeys key : SHSHKeys.values()) {
                if (manifest.get("BuildIdentities").get(0).get("Manifest").asDict().containsKey(key.name())) {
                    for (String digest : key.digests()) {
                        if (manifest.get("BuildIdentities").get(0).get("Manifest").get(key.name()).asDict().containsKey(digest)) {
                            String pdigest = manifest.get("BuildIdentities").get(0).get("Manifest").get(key.name()).get(digest).asData();
                            pdigest = pdigest.replaceAll("\\s", "");
                            Set<DeviceOSVersion> oses = digestVersionMapping.containsKey(pdigest) ? digestVersionMapping.get(pdigest) : new HashSet<DeviceOSVersion>();
                            boolean add = true;
                            for (DeviceOSVersion os : oses) {
                                if (os.getManifestFile().equals(ver.getManifestFile())) {
                                    add = false;
                                    break;
                                }
                            }
                            if (add)
                                oses.add(ver);
                            digestVersionMapping.put(pdigest, oses);
                        }
                    }
                }
            }
        }
//        System.out.println("");
    }

    public static void main(String[] args) {
        /*
        ByteBuffer buf0 = getDataMd5("/com/semaphore/data/BuildManifest-ipad-3.2.plist");
        ByteBuffer buf1 = getDataMd5("/com/semaphore/data/BuildManifest-iphone-3.0.1.plist");
        ByteBuffer buf2 = getDataMd5("/com/semaphore/data/BuildManifest-iphone-3.0.plist");
        ByteBuffer buf3 = getDataMd5("/com/semaphore/data/BuildManifest-iphone-3.1.2.plist");
        ByteBuffer buf4 = getDataMd5("/com/semaphore/data/BuildManifest-iphone-3.1.3.plist");
        ByteBuffer buf5 = getDataMd5("/com/semaphore/data/BuildManifest-iphone-3.1.plist");
        ByteBuffer buf6 = getDataMd5("/com/semaphore/data/BuildManifest-ipt-2g-3.1.1.plist");
        ByteBuffer buf7 = getDataMd5("/com/semaphore/data/BuildManifest-ipt-2g-3.1.2.plist");
        ByteBuffer buf8 = getDataMd5("/com/semaphore/data/BuildManifest-ipt-2g-3.1.3.plist");
        ByteBuffer buf9 = getDataMd5("/com/semaphore/data/BuildManifest-ipt-3g-3.1.1.plist");
        ByteBuffer bufa = getDataMd5("/com/semaphore/data/BuildManifest-ipt-3g-3.1.2.plist");
        ByteBuffer bufb = getDataMd5("/com/semaphore/data/BuildManifest-ipt-3g-3.1.3.plist");

        System.out.println("\"" + new BigInteger(buf0.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf1.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf2.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf3.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf4.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf5.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf6.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf7.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf8.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(buf9.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(bufa.array()).toString(16) + "\"");
        System.out.println("\"" + new BigInteger(bufb.array()).toString(16) + "\"");
        */

        PList plist = JPlistBuilder.buildPList(new File("/Users/semaphore/.shsh/2142217631220-ipad-3.2.shsh"));
        DeviceOSVersion version = getVersion(plist);
        System.out.println(version);

        System.out.println(validateSHSH(plist, DeviceOSVersion.iPAD_3_2));

    }

    private static long decodeEcid(String shsh) {
        BASE64Decoder dec = new BASE64Decoder();
        try {
            byte[] data = dec.decodeBuffer(shsh.replaceAll("\\s", ""));
            ByteBuffer buffer = ByteBuffer.wrap(data);
            buffer = buffer.order(ByteOrder.LITTLE_ENDIAN);
            buffer.position(12);
            return buffer.getLong();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


    private static String decodeFirstTag(String shsh) {
        BASE64Decoder dec = new BASE64Decoder();
        try {
            byte[] data = dec.decodeBuffer(shsh.replaceAll("\\s", ""));
            ByteBuffer buffer = ByteBuffer.wrap(data);
            byte[] tag = new byte[4];
            buffer.get(tag, 0, 4);
            return new String(tag).trim();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public static String getECID(PList plist) {
        try {
            for (SHSHKeys value : SHSHKeys.values()) {
                if (plist.getValue().containsKey(value.name())) {
                    String blob = plist.getValue().get(value.name()).get("Blob").asData();
                    return String.valueOf(decodeEcid(blob));
                }
            }
        } catch (Exception ignored) {
        }
        return "";
    }

    public static PList createSHSHRequest(DeviceOSVersion version, String ecid) {
        PList request = new PList();
        DictionaryElement dict = request.getValue();
        PList requestVersion = JPlistBuilder.buildPList(PListUtil.class.getResourceAsStream("/com/semaphore/data/BuildManifest-" + version.getManifestFile() + ".plist"));
        addHeaders(version, dict, ecid, requestVersion);
        addBlobs(dict, requestVersion);
        return request;
    }

    public static PList create4SHSHRequest(DeviceOSVersion version, String ecid, int goldCertId, String bbSerial) {
        PList request = new PList();
        DictionaryElement dict = request.getValue();
        PList requestVersion = JPlistBuilder.buildPList(PListUtil.class.getResourceAsStream("/com/semaphore/data/BuildManifest-" + version.getManifestFile() + ".plist"));
        addHeaders(version, dict, ecid, requestVersion);
        addBlobs(dict, requestVersion);
        addBBHeaders(version, dict, ecid, goldCertId, bbSerial, requestVersion);
        return request;
    }

    /*
    	<key>BbChipID</key>
		<integer>80</integer>
		<key>BbGoldCertId</key>
		<integer>257</integer>
		!!!<key>BbNonce</key>
		!!!<data> UU23D4j/CQROKlLfeOxDIYry6+E=</data>
		<key>BbSNUM</key>
		<data> aeoFZgAQBKJJareN</data>
		<key>BbSkeyId</key>
		<data> l6s0rAaT9bA7+3JtTiwlTxTicKE=</data>
		<key>UniqueBuildID</key>
		<data> vhy+KI27W6LdKd4vLgeTnA98EXg=</data>
     */

    private static void addBBHeaders(DeviceOSVersion version, DictionaryElement dict, String ecid, int goldCertId, String bbSerial, PList manifest) {
        dict.put("BbChipID", new IntegerElement(getBbChipId(manifest)));
        dict.put("BbGoldCertId", new IntegerElement(goldCertId));
        dict.put("BbSNUM", new DataElement(bbSerial));
        dict.put("BbSkeyId", getBbSkeyId(manifest));
        String uniqueBuildId = getUniqueBuildID(manifest);
        if (uniqueBuildId.length() > 0)
            dict.put("UniqueBuildID", new DataElement(uniqueBuildId));
    }

    private static void addBlobs(DictionaryElement dict, PList manifest) {
        for (SHSHKeys key : SHSHKeys.values()) {
            if (getBuildIdentities(manifest).get(0).get("Manifest").asDict().containsKey(key.name())) {
                DictionaryElement value = (DictionaryElement) getBuildIdentities(manifest).get(0).get("Manifest").get(key.name());
                value.remove("Info");
                dict.put(key.name(), value);
            }
        }
    }

    /*
    <key>@HostIpAddress</key>
    <string>192.168.0.1</string>
    <key>@HostPlatformInfo</key>
    <string>darwin</string>
    <key>@Locality</key>
    <string>en_US</string>
    <key>@VersionInfo</key>
    <string>3.8</string>
    <key>ApBoardID</key>
    <integer>0</integer>
    <key>ApChipID</key>
    <integer>35104</integer>
    <key>ApECID</key>
    <string>12341234123</string>
    <key>ApProductionMode</key>
    <true />
    <key>ApSecurityDomain</key>
    <integer>1</integer>
    <key>UniqueBuildID</key>
    <data>RyeFRn073acrMRXsARFG6xobvRg=</data>
     */

    private static void addHeaders(DeviceOSVersion version, DictionaryElement dict, String ecid, PList manifest) {
        if (version.is40Version()) {
            dict.put("@APTicket", new BooleanElement(true));
            dict.put("@BBTicket", new BooleanElement(true));
        }
        dict.put("@HostIpAddress", new StringElement("192.168.0.1"));
        dict.put("@HostPlatformInfo", new StringElement(getPlatform()));
        if (version.getHardware() != DeviceHardware.iPhone4)
            dict.put("@Locality", new StringElement(Locale.getDefault() == null ? "en_US" : Locale.getDefault().toString()));
        dict.put("@VersionInfo", version.is40Version() ? new StringElement("libauthinstall-34") : new StringElement("3.8"));
        dict.put("ApBoardID", new IntegerElement(getBoardId(manifest)));
        dict.put("ApChipID", new IntegerElement(getChipID(manifest)));
        dict.put("ApECID", new StringElement(ecid));
        dict.put("ApProductionMode", new BooleanElement(true));
        dict.put("ApSecurityDomain", new IntegerElement(1));
        String uniqueBuildId = getUniqueBuildID(manifest);
        if (version.getHardware() != DeviceHardware.iPhone4 && uniqueBuildId.length() > 0)
            dict.put("UniqueBuildID", new DataElement(uniqueBuildId));
    }

    private static PElement getBbSkeyId(PList manifest) {
        return getBuildIdentities(manifest).get(0).get("BbSkeyId");
    }

    private static String getBbChipId(PList manifest) {
        return getBuildIdentities(manifest).get(0).get("BbChipID").asString();
    }

    private static PElement getBbSkeyID(PList manifest) {
        return getBuildIdentities(manifest).get(0).get("BbSkeyId");
    }

    private static PElement getBbChipID(PList manifest) {
        return getBuildIdentities(manifest).get(0).get("BbChipID");
    }

    private static List<PElement> getBuildIdentities(PList manifest) {
        return manifest.get("BuildIdentities").asArray();
    }

    private static String getUniqueBuildID(PList manifest) {
        Map<String, PElement> dict = getBuildIdentities(manifest).get(0).asDict();
        return dict.containsKey("UniqueBuildID") ? dict.get("UniqueBuildID").asData() : "";
    }

    private static String getChipID(PList manifest) {
        return getBuildIdentities(manifest).get(0).get("ApChipID").asString();
    }

    private static String getBoardId(PList manifest) {
        return getBuildIdentities(manifest).get(0).get("ApBoardID").asString();
    }

    public static String getPlatform() {
        if (Platform.isMac())
            return "darwin";
        return "windows";
    }

    public static boolean validateSHSH(PList shsh, DeviceOSVersion version) {
        DeviceOSVersion ver = getVersion(shsh);
        return ver == version || ver.getManifestFile().equals(version.getManifestFile());
    }

    public static DeviceOSVersion getVersion(PList shsh) {
        for (SHSHKeys key : SHSHKeys.values()) {
            if (shsh.getValue().containsKey(key.name())) {
                for (String digest : key.digests()) {
                    if (shsh.getValue().get(key.name()).asDict().containsKey(digest)) {
                        String pdigest = shsh.getValue().get(key.name()).get(digest).asData();
                        pdigest = pdigest.replaceAll("\\s", "");
                        if (digestVersionMapping.containsKey(pdigest)) {
                            Set<DeviceOSVersion> oses = digestVersionMapping.get(pdigest);
                            if (oses.size() == 1)
                                return oses.iterator().next();
                        }
                    }
                }
            }
        }
        return DeviceOSVersion.UNKNOWN;
    }
}
