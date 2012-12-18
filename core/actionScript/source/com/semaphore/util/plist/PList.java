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

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 1:38:02 PM
 */
public class PList extends PElementAdapter<DictionaryElement> {
    private DictionaryElement dict;

    public PList() {
        this.dict = new DictionaryElement();
    }

    public PList(DictionaryElement dict) {
        this.dict = dict;
    }

    public PElement get(String key) {
        return dict.get(key);
    }

    public PElement put(String key, PElement value) {
        return dict.put(key, value);
    }

    public boolean containsKey(String key) {
        return dict.containsKey(key);
    }

    public DictionaryElement getValue() {
        return dict;
    }

    public void setValue(DictionaryElement value) {
        this.dict = value;
    }

    public PElementType getType() {
        return PElementType.PLIST;
    }

    public String toString() {
        return "plist : " + dict;
    }
}
