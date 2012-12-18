/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.baseLanguage.closures.runtime;


/**
 * @author fyodor
 */
public class Wrappers {
    
    public static class _int {
        public int value;
        public _int (int value) {
            this.value = value;
        }
        public _int () {
            this.value = 0;
        }
    }
    
    public static class _short {
        public short value;
        public _short (short value) {
            this.value = value;
        }
        public _short () {
            this.value = 0;
        }
    }

    public static class _long {
        public long value;
        public _long (long value) {
            this.value = value;
        }
        public _long () {
            this.value = 0L;
        }
    }
    
    public static class _float {
        public float value;
        public _float (float value) {
            this.value = value;
        }
        public _float () {
            this.value = 0.f;
        }
    }
    
    public static class _double {
        public double value;
        public _double (double value) {
            this.value = value;
        }
        public _double () {
            this.value = 0.;
        }
    }

    public static class _char {
        public char value;
        public _char (char value) {
            this.value = value;
        }
        public _char () {
            this.value = 0;
        }
    }
    
    public static class _byte {
        public byte value;
        public _byte (byte value) {
            this.value = value;
        }
        public _byte () {
            this.value = 0;
        }
    }

    public static class _boolean {
        public boolean value;
        public _boolean (boolean value) {
            this.value = value;
        }
        public _boolean () {
            this.value = false;
        }
    }

    public static class _T<T>  {
        public T value;
        public _T (T value) {
            this.value = value;
        }
        public _T () {
            this.value = null;
        }
    }
}

