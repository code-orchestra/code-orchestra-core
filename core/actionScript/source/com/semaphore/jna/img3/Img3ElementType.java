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
 * Time: 8:36:09 PM
 */
public enum Img3ElementType {
    kDataElement(0x44415441), // DATA
    kTypeElement(0x54595045), // TYPE
    kKbagElement(0x4B424147), // KBAG
    kShshElement(0x53485348), // SHSH
    kCertElement(0x43455254), // CERT
    kChipElement(0x43484950), // CHIP
    kProdElement(0x50524F44), // PROD
    kSdomElement(0x53444F4D), // SDOM
    kVersElement(0x56455253), // VERS
    kBordElement(0x424F5244), // BORD
    kSepoElement(0x5345504F), // SEPO
    kEcidElement(0x45434944),  // ECID
    INVALID(-1);

    private int value;

    private Img3ElementType(int val) {
        this.value = val;
    }

    public int getValue() {
        return value;
    }

    public static Img3ElementType getType(int value) {
        for (Img3ElementType type : values()) {
            if (type.value == value)
                return type;
        }
        return INVALID;
    }
}
