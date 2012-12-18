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

import com.semaphore.util.plist.*;
import com.sun.jna.Pointer;
import sun.misc.BASE64Encoder;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 1:08:16 AM
 */
public class CFDictionary extends CFType {
    private BASE64Encoder enc = new BASE64Encoder();

    public CFDictionary(Pointer address) {
        super(address);
    }

    public CFDictionary() {
        super();
    }

    public int keyCount(String key) {
        return CFLibrary.INSTANCE.CFDictionaryGetCountOfKey(this, CFString.buildString(key)).intValue();
    }

    public int valueCount(CFType value) {
        return CFLibrary.INSTANCE.CFDictionaryGetCountOfValue(this, value).intValue();
    }

    public int size() {
        return CFLibrary.INSTANCE.CFDictionaryGetCount(this).intValue();
    }

    public CFType getValue(String key) {
        return CFLibrary.INSTANCE.CFDictionaryGetValue(this, CFString.buildString(key));
    }

    public CFString getString(String key) {
        return new CFString(getValue(key).getPointer());
    }

    public CFNumber getNumber(String key) {
        return new CFNumber(getValue(key).getPointer());
    }

    public CFData getData(String key) {
        return new CFData(getValue(key).getPointer());
    }

    public CFDictionary getDict(String key) {
        return new CFDictionary(getValue(key).getPointer());
    }

    public CFBoolean getBoolean(String key) {
        return new CFBoolean(getValue(key).getPointer());
    }

    public CFArray getArray(String key) {
        return new CFArray(getValue(key).getPointer());
    }

    public CFDate getDate(String key) {
        return new CFDate(getValue(key).getPointer());
    }

    public DictionaryElement toDictionaryElement() {
        int size = size();
        CFString[] keys = new CFString[size];
        CFType[] values = new CFType[size];
        CFLibrary.INSTANCE.CFDictionaryGetKeysAndValues(this, keys, values);
        DictionaryElement dict = new DictionaryElement();
        for (int i = 0; i < size; i++) {
            dict.put(keys[i].getString(), parseValue(values[i]));
        }
        return dict;
    }

    public PList toPlist() {
        int size = size();
        CFString[] keys = new CFString[size];
        CFType[] values = new CFType[size];
        CFLibrary.INSTANCE.CFDictionaryGetKeysAndValues(this, keys, values);
        PList plist = new PList();
        DictionaryElement dict = plist.getValue();
        for (int i = 0; i < size; i++) {
            dict.put(keys[i].getString(), parseValue(values[i]));
        }
        return plist;
    }

    private PElement parseValue(CFType type) {
        if (type == null)
            return null;
        String desc = type.getTypeDescription();
        PElement value;
        if (desc.equalsIgnoreCase("CFArray")) {
            value = parseArray(type);
        } else if (desc.equalsIgnoreCase("CFBoolean")) {
            value = new BooleanElement(type.asBoolean().getValue());
        } else if (desc.equalsIgnoreCase("CFString")) {
            value = new StringElement(type.asString().getString());
        } else if (desc.equalsIgnoreCase("CFNumber")) {
            value = new IntegerElement(type.asNumber().getLong());
        } else if (desc.equalsIgnoreCase("CFData")) {
            value = new DataElement(enc.encode(type.asData().getBuffer().array()));
        } else if (desc.equalsIgnoreCase("CFDictionary")) {
            value = parseDictionary(type);
        } else if (desc.equalsIgnoreCase("CFDate")) {
            value = new DateElement("");
        } else
            throw new IllegalArgumentException("Unknown Value:" + desc + ":" + type);
        return value;
    }

    private DictionaryElement parseDictionary(CFType type) {
        CFDictionary dict = type.asDict();
        return dict.toDictionaryElement();
    }

    private ArrayElement parseArray(CFType type) {
        CFArray array = type.asArray();
        ArrayElement arr = new ArrayElement();
        int size = array.size();
        for (int i = 0; i < size; i++) {
            arr.add(parseValue(array.getValue(i)));
        }
        return arr;
    }
}
