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

package com.semaphore.jna.img3;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27), 2010
 * Time: 8:37:24 PM
 */
public enum Img3Container {
    kNorContainer(0x696D6733), // img3
    kImg3Container(0x496D6733), // Img3
    k8900Container(0x30303938), // 8900
    kImg2Container(0x494D4732), // IMG2
    INVALID(-1);

    private int value;

    private Img3Container(int val) {
        this.value = val;
    }

    public int getValue() {
        return value;
    }

    public static Img3Container getType(int value) {
        for (Img3Container cvalue : values()) {
            if (cvalue.value == value)
                return cvalue;
        }
        return INVALID;
    }
}
