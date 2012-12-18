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
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 12:11:10 PM
 */
public class DictionaryElement extends PElementAdapter<Map<String, PElement>> {
    private Map<String, PElement> value = new LinkedHashMap<String, PElement>();

    public Map<String, PElement> getValue() {
        return Collections.unmodifiableMap(value);
    }

    public void setValue(Map<String, PElement> value) {
        this.value.clear();
        this.value.putAll(value);
    }

    public PElement put(String key, PElement element) {
        if (element == this)
            throw new IllegalArgumentException("Dictionary cannot contain itself!");
        return value.put(key, element);
    }

    public PElement get(String key) {
        return value.get(key);
    }

    public Set<String> keySet() {
        return value.keySet();
    }

    public PElement remove(String key) {
        return value.remove(key);
    }

    public boolean containsKey(String key) {
        return value.containsKey(key);
    }

    public PElementType getType() {
        return PElementType.DICTIONARY;
    }

    public String toString() {
        return "dict : " + value;
    }
}
