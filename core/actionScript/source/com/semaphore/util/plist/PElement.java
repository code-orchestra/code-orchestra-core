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

import java.util.List;
import java.util.Map;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 12:14:46 PM
 */
public interface PElement<T> {
    public T getValue();

    public void setValue(T value);

    public PElementType getType();

    public PElement get(String key);

    public PElement put(String key, PElement value);

    public PElement get(int index);

    public boolean asBoolean();

    public String asString();

    public String asData();

    public String asDate();

    public Map<String, PElement> asDict();

    public long asLong();

    public List<PElement> asArray();

}
