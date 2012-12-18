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

package com.semaphore.util;

import com.sun.jna.Library;
import com.sun.jna.Native;

/**
 * Brought to you by:
 * User: semaphore
 * Date: Jul 2, 2010
 * Time: 9:12:11 PM
 */
public class Environment {

    public interface WinLibC extends Library {
        public int _putenv(String name);
    }

    public interface LinuxLibC extends Library {
        public int setenv(String name, String value, int overwrite);

        public int unsetenv(String name);
    }

    static public class POSIX {
        static Object libc;

        static {
            if (System.getProperty("os.name").equals("Linux")) {
                libc = Native.loadLibrary("c", LinuxLibC.class);
            } else {
                libc = Native.loadLibrary("msvcrt", WinLibC.class);
            }
        }

        public int setenv(String name, String value, int overwrite) {
            if (libc instanceof LinuxLibC) {
                return ((LinuxLibC) libc).setenv(name, value, overwrite);
            } else {
                return ((WinLibC) libc)._putenv(name + "=" + value);
            }
        }

        public int unsetenv(String name) {
            if (libc instanceof LinuxLibC) {
                return ((LinuxLibC) libc).unsetenv(name);
            } else {
                return ((WinLibC) libc)._putenv(name + "=");
            }
        }
    }

    static POSIX libc = new POSIX();

    public static int setEnv(String key, String value) {
        return libc.setenv(key, value, 1);
    }
}
