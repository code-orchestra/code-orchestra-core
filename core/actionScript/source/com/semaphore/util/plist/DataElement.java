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
 * Time: 12:11:17 PM
 */
public class DataElement extends PElementAdapter<String> {
    private String value;

    public DataElement(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public PElementType getType() {
        return PElementType.DATA;
    }

    public String toString() {
        return "data : " + (value == null ? "{null}" : value.substring(0, Math.min(36, value.length())) + "...");
    }
}
