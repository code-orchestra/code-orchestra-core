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
 * Date: Jun 25, 2010
 * Time: 3:50:48 PM
 */
public enum SHSHKeys {
    AppleLogo,
    BasebandFirmware("FlashPSI-PartialDigest", "RamPSI-PartialDigest"),
    BatteryCharging,
    BatteryCharging0,
    BatteryCharging1,
    BatteryFull,
    BatteryLow0,
    BatteryLow1,
    BatteryPlugin,
    DeviceTree,
    KernelCache,
    LLB,
    NeedService,
    RecoveryMode,
    RestoreDeviceTree,
    RestoreKernelCache,
    RestoreLogo,
    RestoreRamDisk,
    iBEC,
    iBSS,
    iBoot;

    private String[] digests;

    private SHSHKeys() {
        this.digests = new String[]{"PartialDigest"};
    }

    private SHSHKeys(String... digests) {
        this.digests = digests;
    }

    public static SHSHKeys get(String key) {
        for (SHSHKeys skey : values())
            if (skey.name().equals(key))
                return skey;
        return null;
    }

    public String[] digests() {
        return digests;
    }
}
