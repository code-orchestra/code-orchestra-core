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

import com.sun.jna.Native;
import com.sun.jna.NativeLong;
import com.sun.jna.Pointer;

import java.nio.ByteBuffer;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 11:59:06 AM
 */
public class CFString extends CFType {
    public CFString(Pointer address) {
        super(address);
    }

    public CFString() {
        super();
    }

    public static CFString buildString(String str) {
        return CFLibrary.INSTANCE.__CFStringMakeConstantString(str);
    }

    public String getString() {
        int lengthInChars = CFLibrary.INSTANCE.CFStringGetLength(this).intValue();
        NativeLong potentialLengthInBytes = new NativeLong(3 * lengthInChars + 1); // UTF8 fully escaped 16 bit chars, plus nul

        ByteBuffer buffer = ByteBuffer.allocate(potentialLengthInBytes.intValue());
        boolean ok = CFLibrary.INSTANCE.CFStringGetCString(this, buffer, potentialLengthInBytes, CFLibrary.kCFStringEncodingUTF8);
        if (!ok)
            throw new RuntimeException("Could not convert string");
        return Native.toString(buffer.array());
    }
}
