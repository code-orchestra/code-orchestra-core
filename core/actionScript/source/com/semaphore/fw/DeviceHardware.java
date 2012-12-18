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
 * Date: May 27, 2010
 * Time: 4:33:13 PM
 */
@SuppressWarnings("unused")
public enum DeviceHardware {
    iPhone4("N90AP", "8A306", true),
    iPhone3GS("N88AP", "8A306", true),
    iPhone3G("N82AP", null, true),
    iPhone("M68AP", null, true),
    iPod3G("N18AP", "8A293"),
    iPod2G("N72AP", "8A293"),
    iPod("N45AP", null),
    iPad("K48AP", "7B405"),
    iPad3G("K48AP", "7B405", true),
    INVALID("", null);

    private String value;
    private String latestBuild;
    private boolean hasBaseband;

    DeviceHardware(String value, String latestBuild, boolean hasBaseband) {
        this.value = value;
        this.latestBuild = latestBuild;
        this.hasBaseband = hasBaseband;
    }

    DeviceHardware(String value, String latestBuild) {
        this(value, latestBuild, false);
    }

    public String getLatestVersion() {
        return latestBuild;
    }

    public boolean hasBaseband() {
        return hasBaseband;
    }

    public static DeviceHardware get(String value, boolean hasBaseband) {
        for (DeviceHardware hw : values()) {
            if (hw.value.equalsIgnoreCase(value) && hw.hasBaseband == hasBaseband)
                return hw;
        }
        return INVALID;
    }

    public static DeviceHardware get(String value) {
        return get(value, false);
    }
}
