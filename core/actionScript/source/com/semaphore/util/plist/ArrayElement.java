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

import java.util.ArrayList;
import java.util.List;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 12:11:57 PM
 */
public class ArrayElement extends PElementAdapter<List<PElement>> {
    private List<PElement> value = new ArrayList<PElement>();

    public List<PElement> getValue() {
        return value;
    }

    public void setValue(List<PElement> value) {
        this.value.clear();
        this.value.addAll(value);
    }

    public PElement get(int index) {
        return value.get(index);
    }

    public void add(PElement child) {
        value.add(child);
    }

    public PElementType getType() {
        return PElementType.ARRAY;
    }

    public String toString() {
        return "array : " + value;
    }
}
