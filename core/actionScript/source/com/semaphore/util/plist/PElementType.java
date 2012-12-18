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

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 1:24:32 PM
 */
public enum PElementType {
    PLIST("plist"),
    KEY("key"),
    STRING("string"),
    REAL("real"),
    INTEGER("integer"),
    DATE("date"),
    BOOLEAN("(?:true|false)"),
    DATA("data"),
    ARRAY("array"),
    DICTIONARY("dict");

    private String keyName;

    private PElementType(String keyName) {
        this.keyName = keyName;
    }

    public static PElementType getType(String key) {
        if (key == null)
            key = "string";
        key = key.toLowerCase();
        for (PElementType type : values()) {
            if (key.matches(type.keyName))
                return type;
        }
        return STRING;
    }
}
