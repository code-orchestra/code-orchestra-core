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

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 2:50:54 PM
 */
public class DateElement extends PElementAdapter<String> {
    private static SimpleDateFormat iso_8601 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
    private Date value;

    public DateElement(String date) {
        try {
            this.value = iso_8601.parse(date);
        } catch (Exception ignored) {
            throw new IllegalArgumentException("Bad Date Format: must be \"yyyy-MM-dd'T'HH:mm:ss\"");
        }
    }

    public String getValue() {
        if (value == null)
            return "";
        return iso_8601.format(value);
    }

    public void setValue(String value) {
        try {
            this.value = iso_8601.parse(value);
        } catch (Exception ignored) {
            throw new IllegalArgumentException("Bad Date Format: must be \"yyyy-MM-dd'T'HH:mm:ss\"");
        }
    }

    public PElementType getType() {
        return PElementType.DATE;
    }

    public String toString() {
        return "date : " + value;
    }
}
