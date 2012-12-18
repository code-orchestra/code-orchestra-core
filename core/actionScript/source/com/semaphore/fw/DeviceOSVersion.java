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

package com.semaphore.fw;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 12, 2010
 * Time: 8:08:35 AM
 */
@SuppressWarnings("unused")
public enum DeviceOSVersion {
    iPAD_3_2(DeviceHardware.iPad, "3.2", "7B367", "ipad-3.2"),
    iPAD_3_2_1(DeviceHardware.iPad, "3.2.1", "7B405", "ipad-3.2.1"),
    iPAD3G_3_2(DeviceHardware.iPad3G, "3.2", "7B367", "ipad-3.2"),
    iPAD3G_3_2_1(DeviceHardware.iPad3G, "3.2.1", "7B405", "ipad-3.2.1"),
    iPhone_1_0(DeviceHardware.iPhone, "1.0", "1A543A"),
    iPhone_1_0_1(DeviceHardware.iPhone, "1.0.1", "1C25"),
    iPhone_1_0_2(DeviceHardware.iPhone, "1.0.2", "1C28"),
    iPhone_1_1_1(DeviceHardware.iPhone, "1.1.1", "3A109A"),
    iPhone_1_1_2(DeviceHardware.iPhone, "1.1.2", "3B48B"),
    iPhone_1_1_3(DeviceHardware.iPhone, "1.1.3", "4A93"),
    iPhone_1_1_4(DeviceHardware.iPhone, "1.1.4", "4A102"),
    iPhone_2_0(DeviceHardware.iPhone, "2.0", "5A347"),
    iPhone_2_0_1(DeviceHardware.iPhone, "2.0.1", "5B108"),
    iPhone_2_0_2(DeviceHardware.iPhone, "2.0.2", "5C1"),
    iPhone_2_1(DeviceHardware.iPhone, "2.1", "5F136"),
    iPhone_2_2(DeviceHardware.iPhone, "2.2", "5G77"),
    iPhone_2_2_1(DeviceHardware.iPhone, "2.2.1", "5H11"),
    iPhone_3_0(DeviceHardware.iPhone, "3.0", "7A341"),
    iPhone_3_0_1(DeviceHardware.iPhone, "3.0.1", "7A400"),
    iPhone_3_1(DeviceHardware.iPhone, "3.1", "7C144"),
    iPhone_3_1_2(DeviceHardware.iPhone, "3.1.2", "7D11"),
    iPhone_3_1_3(DeviceHardware.iPhone, "3.1.3", "7E18"),
    iPhone3G_2_0_0(DeviceHardware.iPhone3G, "2.0", "5A347"),
    iPhone3G_2_0_1(DeviceHardware.iPhone3G, "2.0.1", "5B108"),
    iPhone3G_2_0_2(DeviceHardware.iPhone3G, "2.0.2", "5C1"),
    iPhone3G_2_1(DeviceHardware.iPhone3G, "2.1", "5F136"),
    iPhone3G_2_2(DeviceHardware.iPhone3G, "2.2", "5G77"),
    iPhone3G_2_2_1(DeviceHardware.iPhone3G, "2.2.1", "5H11"),
    iPhone3G_3_0(DeviceHardware.iPhone3G, "3.0", "7A341"),
    iPhone3G_3_0_1(DeviceHardware.iPhone3G, "3.0.1", "7A400"),
    iPhone3G_3_1(DeviceHardware.iPhone3G, "3.1", "7C144"),
    iPhone3G_3_1_2(DeviceHardware.iPhone3G, "3.1.2", "7D11"),
    iPhone3G_3_1_3(DeviceHardware.iPhone3G, "3.1.3", "7E18"),
    iPhone3GS_3_0(DeviceHardware.iPhone3GS, "3.0", "7A341", "iphone-3.0"),
    iPhone3GS_3_0_1(DeviceHardware.iPhone3GS, "3.0.1", "7A400", "iphone-3.0.1"),
    iPhone3GS_3_1(DeviceHardware.iPhone3GS, "3.1", "7C144", "iphone-3.1"),
    iPhone3GS_3_1_2(DeviceHardware.iPhone3GS, "3.1.2", "7D11", "iphone-3.1.2"),
    iPhone3GS_3_1_3(DeviceHardware.iPhone3GS, "3.1.3", "7E18", "iphone-3.1.3"),
    iPhone3GS_4_0(DeviceHardware.iPhone3GS, "4.0", "8A293", "iphone-4.0"),
    iPhone3GS_4_0_1(DeviceHardware.iPhone3GS, "4.0.1", "8A306", "iphone-4.0.1"),
    iPhone4_4_0(DeviceHardware.iPhone4, "4.0", "8A293", "iphone4-4.0"),
    iPhone4_4_0_1(DeviceHardware.iPhone4, "4.0.1", "8A306", "iphone4-4.0.1"),
    iPod_1_1(DeviceHardware.iPod, "1.1", "3A101a"),
    iPod_1_1_1(DeviceHardware.iPod, "1.1.1", "3A110a"),
    iPod_1_1_2(DeviceHardware.iPod, "1.1.2", "3B48b"),
    iPod_1_1_3(DeviceHardware.iPod, "1.1.3", "4A93"),
    iPod_1_1_4(DeviceHardware.iPod, "1.1.4", "4A102"),
    iPod_1_1_5(DeviceHardware.iPod, "1.1.5", "4B1"),
    iPod_2_0(DeviceHardware.iPod, "2.0", "5A347"),
    iPod_2_0_1(DeviceHardware.iPod, "2.0.1", "5B108"),
    iPod_2_0_2(DeviceHardware.iPod, "2.0.2", "5C1"),
    iPod_2_1(DeviceHardware.iPod, "2.1", "5F137"),
    iPod_2_2(DeviceHardware.iPod, "2.2", "5G77"),
    iPod_2_2_1(DeviceHardware.iPod, "2.2.1", "5H11"),
    iPod_3_0(DeviceHardware.iPod, "3.0", "7A341"),
    iPod_3_1_2(DeviceHardware.iPod, "3.1.2", "7D11"),
    iPod_3_1_3(DeviceHardware.iPod, "3.1.3", "7E18"),
    iPod2G_2_1_1(DeviceHardware.iPod2G, "2.1.1", "5F138"),
    iPod2G_2_2(DeviceHardware.iPod2G, "2.2", "5G77A"),
    iPod2G_2_2_1(DeviceHardware.iPod2G, "2.2.1", "5H11a"),
    iPod2G_3_0(DeviceHardware.iPod2G, "3.0", "7A341"),
    iPod2G_3_1_1(DeviceHardware.iPod2G, "3.1.1", "7C145", "ipt-2g-3.1.1"),
    iPod2G_3_1_2(DeviceHardware.iPod2G, "3.1.2", "7D11", "ipt-2g-3.1.2"),
    iPod2G_3_1_3(DeviceHardware.iPod2G, "3.1.3", "7E18", "ipt-2g-3.1.3"),
    iPod2G_4_0(DeviceHardware.iPod2G, "4.0", "8A293", "ipt-2g-4.0"),
    iPod3G_3_1_1(DeviceHardware.iPod3G, "3.1.1", "7C145", "ipt-3g-3.1.1"),
    iPod3G_3_1_2(DeviceHardware.iPod3G, "3.1.2", "7D11", "ipt-3g-3.1.2"),
    iPod3G_3_1_3(DeviceHardware.iPod3G, "3.1.3", "7E18", "ipt-3g-3.1.3"),
    iPod3G_4_0(DeviceHardware.iPod3G, "4.0", "8A293", "ipt-3g-4.0"),
    UNKNOWN(DeviceHardware.INVALID, "X.X.X", "XXXX");

    private DeviceHardware hardware;
    private String versionString;
    private String buildId;
    private boolean requiresSHSH = false;
    private String manifestFile;

    private DeviceOSVersion(DeviceHardware hw, String verStr, String buildId, String manifestFile) {
        this.hardware = hw;
        this.versionString = verStr;
        this.buildId = buildId;
        this.manifestFile = manifestFile;
        this.requiresSHSH = manifestFile != null;
    }

    private DeviceOSVersion(DeviceHardware hw, String verStr, String buildId) {
        this(hw, verStr, buildId, null);
    }

    public static DeviceOSVersion get(DeviceHardware hw, String buildId) {
        for (DeviceOSVersion ver : values())
            if (ver.hardware == hw && ver.buildId.equals(buildId))
                return ver;
        return UNKNOWN;
    }

    public static DeviceOSVersion getByManifest(String manifestFile) {
        for (DeviceOSVersion ver : values()) {
            if (ver.manifestFile == null)
                continue;
            if (ver.manifestFile.equalsIgnoreCase(manifestFile))
                return ver;
        }
        return UNKNOWN;
    }

    public DeviceHardware getHardware() {
        return hardware;
    }

    public boolean requiresSHSH() {
        return requiresSHSH;
    }

    public String getManifestFile() {
        return manifestFile;
    }

    public boolean is40Version() {
        return versionString.startsWith("4.");
    }

    @Override
    public String toString() {
        return hardware.name() + " " + versionString + " (" + buildId + ")";
    }
}
