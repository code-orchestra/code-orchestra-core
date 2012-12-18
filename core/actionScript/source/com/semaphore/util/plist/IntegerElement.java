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
 * Time: 12:13:00 PM
 */
public class IntegerElement extends NumberElement<Long> {
    private long value;

    public IntegerElement(String value) {
        if (value == null)
            value = "0";
        this.value = value.toLowerCase().startsWith("0x") ? Long.parseLong(value.substring(2), 16) : Long.parseLong(value);
    }

    public IntegerElement(long value) {
        this.value = value;
    }

    public IntegerElement(int value) {
        this.value = value;
    }

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }

    public PElementType getType() {
        return PElementType.INTEGER;
    }

    public String toString() {
        return "integer : " + value;
    }
}
