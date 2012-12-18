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

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 19, 2010
 * Time: 7:49:19 AM
 */
public abstract class PElementAdapter<T> implements PElement<T> {

    public PElement get(String key) {
        return this;
    }

    public PElement put(String key, PElement value) {
        return this;
    }

    public PElement get(int index) {
        return this;
    }

    public boolean asBoolean() {
        return ((BooleanElement) this).getValue();
    }

    public String asString() {
        return ((StringElement) this).getValue();
    }

    public String asData() {
        return ((DataElement) this).getValue();
    }

    public String asDate() {
        return ((DateElement) this).getValue();
    }

    public Map<String, PElement> asDict() {
        if (this instanceof DictionaryElement)
            return ((DictionaryElement) this).getValue();
        return Collections.emptyMap();
    }

    public long asLong() {
        return ((IntegerElement) this).getValue();
    }

    public List<PElement> asArray() {
        if (this instanceof ArrayElement)
            return ((ArrayElement) this).getValue();
        return Collections.emptyList();
    }
}
