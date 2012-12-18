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

import com.sun.jna.NativeLong;
import com.sun.jna.Pointer;

import java.nio.ByteBuffer;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 1:08:23 AM
 */
public class CFData extends CFType {
    private static NativeLong ZERO = new NativeLong(0);

    public CFData(Pointer address) {
        super(address);
    }

    public CFData() {
        super();
    }

    public int getLength() {
        NativeLong nl = CFLibrary.INSTANCE.CFDataGetLength(this);
        return nl.intValue();
    }

    private NativeLong _getLength() {
        return CFLibrary.INSTANCE.CFDataGetLength(this);
    }

    public ByteBuffer getBuffer() {
        NativeLong length = _getLength();
        if (length.intValue() <= 0)
            return ByteBuffer.allocate(0);
        CFRange.ByValue range = new CFRange.ByValue();
        range.length = length;
        range.location = ZERO;
        ByteBuffer buffer = ByteBuffer.allocate(length.intValue());
        CFLibrary.INSTANCE.CFDataGetBytes(this, range, buffer);
        return buffer;
    }
}
