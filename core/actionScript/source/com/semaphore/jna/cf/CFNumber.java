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

import com.sun.jna.Pointer;
import com.sun.jna.ptr.IntByReference;
import com.sun.jna.ptr.LongByReference;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 1:07:16 AM
 */
public class CFNumber extends CFType {
    public CFNumber(Pointer address) {
        super(address);
    }

    public CFNumber() {
        super();
    }

    public int getInt() {
        IntByReference ibr = new IntByReference();
        if (CFLibrary.INSTANCE.CFNumberGetValue(this, CFLibrary.CFNumberType.kCFNumberSInt64Type, ibr))
            return ibr.getValue();
        return -1;
    }

    public long getLong() {
        LongByReference lbr = new LongByReference();
        if (CFLibrary.INSTANCE.CFNumberGetValue(this, CFLibrary.CFNumberType.kCFNumberSInt64Type, lbr))
            return lbr.getValue();
        return -1;
    }
}
