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
import com.sun.jna.NativeLong;
import com.sun.jna.Structure;

import java.util.List;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 8:24:59 AM
 */
public class CFRange extends Structure {
    public NativeLong location;
    public NativeLong length;

    public CFRange() {
        super();
    }


  public CFRange(NativeLong location, NativeLong length) {
        super();
        this.location = location;
        this.length = length;
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

    protected CFRange newInstance() {
        CFRange s = new CFRange();
        s.useMemory(getPointer());
        write();
        s.read();
        return s;
    }

    public static class ByReference extends CFRange implements Structure.ByReference {

    }

    public static class ByValue extends CFRange implements Structure.ByValue {

    }

  @Override
  protected List getFieldOrder() {
    return FieldUtil.getFieldsOrderForClass(getClass());
  }
}
