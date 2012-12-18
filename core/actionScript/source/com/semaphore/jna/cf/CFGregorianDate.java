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

package com.semaphore.jna.cf;

import codeOrchestra.ios.jna.util.FieldUtil;
import com.sun.jna.Structure;

import java.util.List;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 1:45:16 PM
 */
public class CFGregorianDate extends Structure {
    public int year;
    public byte month;
    public byte day;
    public byte hour;
    public byte minute;
    public double second;

    public CFGregorianDate() {
        super();
    }

    public CFGregorianDate(int year, byte month, byte day, byte hour, byte minute, double second) {
        super();
        this.year = year;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }

    protected ByReference newByReference() {
        ByReference s = new ByReference();
        s.useMemory(getPointer());
        write();
        s.read();
        return s;
    }

    protected ByValue newByValue() {
        ByValue s = new ByValue();
        s.useMemory(getPointer());
        write();
        s.read();
        return s;
    }

    protected CFGregorianDate newInstance() {
        CFGregorianDate s = new CFGregorianDate();
        s.useMemory(getPointer());
        write();
        s.read();
        return s;
    }

    public static class ByReference extends CFGregorianDate implements Structure.ByReference {

    }

    public static class ByValue extends CFGregorianDate implements Structure.ByValue {

    }

  @Override
  protected List getFieldOrder() {
    return FieldUtil.getFieldsOrderForClass(getClass());
  }
}