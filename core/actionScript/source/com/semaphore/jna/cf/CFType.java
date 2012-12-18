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
import com.sun.jna.PointerType;

import java.util.logging.Logger;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 1:07:46 AM
 */
public class CFType extends PointerType {
    private Logger log = Logger.getLogger("TinyUmbrella");

    public CFType(Pointer address) {
        super(address);
    }

    public CFType() {
        super();
    }

    public int getType() {
        return CFLibrary.INSTANCE.CFGetTypeID(this).intValue();
    }

    public String getDescription() {
        return CFLibrary.INSTANCE.CFCopyDescription(this).getString();
    }

    public String getTypeDescription() {
        return CFLibrary.INSTANCE.CFCopyTypeIDDescription(CFLibrary.INSTANCE.CFGetTypeID(this)).getString();
    }

    public boolean isString() {
        return getType() == 7;
    }

    public boolean isData() {
        return getType() == 19;
    }

    public CFDictionary asDict() {
        return new CFDictionary(getPointer());
    }

    public CFString asString() {
        return new CFString(getPointer());
    }

    public CFData asData() {
        return new CFData(getPointer());
    }

    public CFBoolean asBoolean() {
        return new CFBoolean(getPointer());
    }

    public CFArray asArray() {
        return new CFArray(getPointer());
    }

    public CFDate asDate() {
        return new CFDate(getPointer());
    }

    public CFNumber asNumber() {
        return new CFNumber(getPointer());
    }
}
