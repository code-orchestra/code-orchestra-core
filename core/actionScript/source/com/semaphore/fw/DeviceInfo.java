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

import com.semaphore.util.plist.PElementType;
import com.semaphore.util.plist.PList;

/**
 * Brought to you by:
 * User: semaphore
 * Date: Jul 9, 2010
 * Time: 3:23:06 PM
 */
@SuppressWarnings("unused")
public class DeviceInfo {
    private PList dinfo;
    private boolean isValid = false;

    public DeviceInfo(PList plist) {
        this.dinfo = plist;
        isValid = getUUID().length() > 0;
    }

    public boolean isValid() {
        return isValid;
    }

    public String getDeviceName() {
        return dinfo.containsKey("DeviceName") ? dinfo.get("DeviceName").asString() : "";
    }

    public DeviceHardware getDeviceHardware() {
        String hw = dinfo.containsKey("HardwareModel") ? dinfo.get("HardwareModel").asString() : "";
        return DeviceHardware.get(hw, dinfo.containsKey("BasebandVersion"));
    }

    public DeviceOSVersion getDeviceOSVersion() {
        String hardware = dinfo.containsKey("HardwareModel") ? dinfo.get("HardwareModel").asString() : "";
        String buildVersion = dinfo.containsKey("BuildVersion") ? dinfo.get("BuildVersion").asString() : "";
        String basebandVersion = dinfo.containsKey("BasebandVersion") ? dinfo.get("BasebandVersion").asString() : "N/A";
        return DeviceOSVersion.get(DeviceHardware.get(hardware, !basebandVersion.equalsIgnoreCase("N/A")), buildVersion);
    }

    public String getECID(int base) {
        long ecid = dinfo.get("UniqueChipID").asLong();
        return Long.toString(ecid, base);
    }

    public String getBasebandSerialNumber() {
        return dinfo.containsKey("BasebandSerialNumber") ? dinfo.get("BasebandSerialNumber").getType() == PElementType.DATA ? dinfo.get("BasebandSerialNumber").asData() : dinfo.get("BasebandSerialNumber").asString() : "";
    }

    public String getBasebandBootloader() {
        return dinfo.containsKey("BasebandBootloaderVersion") ? dinfo.get("BasebandBootloaderVersion").asString() : "";
    }

    public int getBasebandGoldCertId() {
        return dinfo.containsKey("BasebandGoldCertId") ? (int) dinfo.get("BasebandGoldCertId").asLong() : 257;
    }

    public String getBasebandVersion() {
        return dinfo.containsKey("BasebandVersion") ? dinfo.get("BasebandVersion").asString() : "N/A";
    }

    public String getModelNumber() {
        String modelNumber = dinfo.containsKey("ModelNumber") ? dinfo.get("ModelNumber").asString() : "";
        String regionInfo = dinfo.containsKey("RegionInfo") ? dinfo.get("RegionInfo").asString() : "";
        if (regionInfo.length() > 0)
            modelNumber += regionInfo;
        return modelNumber;
    }

    public String getSerialNumber() {
        return dinfo.containsKey("SerialNumber") ? dinfo.get("SerialNumber").asString() : "";
    }

    public String getUUID() {
        return dinfo.containsKey("UniqueDeviceID") ? dinfo.get("UniqueDeviceID").asString() : "";
    }
}
