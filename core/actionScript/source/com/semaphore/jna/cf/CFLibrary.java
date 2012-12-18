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

import codeOrchestra.ios.jna.util.FieldUtil;
import com.sun.jna.*;
import com.sun.jna.ptr.ByReference;

import java.nio.ByteBuffer;
import java.util.List;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 11:25:46 AM
 */
@SuppressWarnings("unused")
public interface CFLibrary extends Library {

  public static final CFLibrary INSTANCE = (CFLibrary) Native.loadLibrary("/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation", CFLibrary.class);
    public static final int kCFStringEncodingUTF8 = 0x8000100;
    /* Polymorphic */

    NativeLong CFGetTypeID(CFType cf);

    CFString CFCopyDescription(CFType cf);

    CFString CFCopyTypeIDDescription(NativeLong type_id);

    void CFShow(CFType obj);
    /* End Polymorphic */

    /* CFArray */

    NativeLong CFArrayGetCount(CFArray theArray);

    CFType CFArrayGetValueAtIndex(CFArray theArray, int idx);
    /* End CFArray */

    /* CFString */

    NativeLong CFStringGetLength(CFString theString);

    boolean CFStringGetCString(CFString theString, ByteBuffer buffer, NativeLong bufferSize, int encoding);

    CFString __CFStringMakeConstantString(String str);
    /* End CFString */

    /* CFBoolean */

    boolean CFBooleanGetValue(CFBoolean cfBoolean);
    /* End CFBoolean */

    /* CFNumber */

    boolean CFNumberGetValue(CFNumber number, int theType, ByReference valuePtr);
    /*End CFNumber */

    /* CFData */

    NativeLong CFDataGetTypeID();

    CFData CFDataCreate(CFAllocator allocator, byte bytes[], NativeLong length);

    CFData CFDataCreateWithBytesNoCopy(CFAllocator allocator, byte bytes[], NativeLong length, CFAllocator bytesDeallocator);

    CFData CFDataCreateCopy(CFAllocator allocator, CFData theData);

    CFData CFDataCreateMutable(CFAllocator allocator, NativeLong capacity);

    CFData CFDataCreateMutableCopy(CFAllocator allocator, NativeLong capacity, CFData theData);

    NativeLong CFDataGetLength(CFData theData);

    Pointer CFDataGetBytePtr(CFData theData);

    Pointer CFDataGetMutableBytePtr(CFData theData);

    void CFDataGetBytes(CFData theData, CFRange.ByValue range, ByteBuffer buffer);

    void CFDataSetLength(CFData theData, NativeLong length);

    void CFDataIncreaseLength(CFData theData, NativeLong extraLength);

    void CFDataAppendBytes(CFData theData, byte bytes[], NativeLong length);

    void CFDataReplaceBytes(CFData theData, CFRange.ByValue range, byte newBytes[], NativeLong newLength);

    void CFDataDeleteBytes(CFData theData, CFRange.ByValue range);
    /* End CFData */

    /* CFDictionary */

    public interface CFComparatorFunction extends Callback {
        /**
         * @see CFComparisonResult
         */
        int invoke(Pointer val1, Pointer val2, Pointer context);
    }

    public interface CFAllocatorRetainCallBack extends Callback {
        Pointer invoke(Pointer info);
    }

    public interface CFAllocatorReleaseCallBack extends Callback {
        void invoke(Pointer info);
    }

    public interface CFAllocatorCopyDescriptionCallBack extends Callback {
        CFString invoke(Pointer info);
    }

    public interface CFAllocatorAllocateCallBack extends Callback {
        Pointer invoke(NativeLong allocSize, NativeLong hint, Pointer info);
    }

    public interface CFAllocatorReallocateCallBack extends Callback {
        Pointer invoke(Pointer ptr, NativeLong newsize, NativeLong hint, Pointer info);
    }

    public interface CFAllocatorDeallocateCallBack extends Callback {
        void invoke(Pointer ptr, Pointer info);
    }

    public interface CFAllocatorPreferredSizeCallBack extends Callback {
        NativeLong invoke(NativeLong size, NativeLong hint, Pointer info);
    }

    public interface CFDictionaryRetainCallBack extends Callback {
        Pointer invoke(CFAllocator allocator, CFType value);
    }

    public interface CFDictionaryReleaseCallBack extends Callback {
        void invoke(CFAllocator allocator, CFType value);
    }

    public interface CFDictionaryCopyDescriptionCallBack extends Callback {
        CFString invoke(CFType value);
    }

    public interface CFDictionaryEqualCallBack extends Callback {
        boolean invoke(CFType value1, CFType value2);
    }

    public interface CFDictionaryHashCallBack extends Callback {
        NativeLong invoke(CFType value);
    }

    public interface CFDictionaryApplierFunction extends Callback {
        void invoke(CFString key, CFType value, Pointer context);
    }

    NativeLong CFDictionaryGetTypeID();

    CFDictionary CFDictionaryCreate(CFAllocator allocator, CFString[] keys, CFType[] values, NativeLong numValues, CFDictionaryKeyCallBacks keyCallBacks, CFDictionaryValueCallBacks valueCallBacks);

    CFDictionary CFDictionaryCreateCopy(CFAllocator allocator, CFDictionary theDict);

    CFDictionary CFDictionaryCreateMutable(CFAllocator allocator, NativeLong capacity, CFDictionaryKeyCallBacks keyCallBacks, CFDictionaryValueCallBacks valueCallBacks);

    CFDictionary CFDictionaryCreateMutableCopy(CFAllocator allocator, NativeLong capacity, CFDictionary theDict);

    NativeLong CFDictionaryGetCount(CFDictionary theDict);

    NativeLong CFDictionaryGetCountOfKey(CFDictionary theDict, CFString key);

    NativeLong CFDictionaryGetCountOfValue(CFDictionary theDict, CFType value);

    boolean CFDictionaryContainsKey(CFDictionary theDict, CFString key);

    boolean CFDictionaryContainsValue(CFDictionary theDict, CFType value);

    CFType CFDictionaryGetValue(CFDictionary theDict, CFString key);

    boolean CFDictionaryGetValueIfPresent(CFDictionary theDict, CFString key, CFType[] value);

    void CFDictionaryGetKeysAndValues(CFDictionary theDict, CFString[] keys, CFType[] values);

    void CFDictionaryApplyFunction(CFDictionary theDict, CFDictionaryApplierFunction applier, Pointer context);

    void CFDictionaryAddValue(CFDictionary theDict, CFString key, CFType value);

    void CFDictionarySetValue(CFDictionary theDict, CFString key, CFType value);

    void CFDictionaryReplaceValue(CFDictionary theDict, CFString key, CFType value);

    void CFDictionaryRemoveValue(CFDictionary theDict, CFString key);

    void CFDictionaryRemoveAllValues(CFDictionary theDict);
    /* End CFDictionary */

    /* CFDate */

    NativeLong CFAbsoluteTimeGetCurrent();

    CFDate CFDateCreate(CFAllocator allocator, NativeLong absTime);

    NativeLong CFDateGetAbsoluteTime(CFDate theDate);

    NativeLong CFDateGetTimeIntervalSinceDate(CFDate theDate, CFDate otherDate);
    /* End CFDate */

    /* CFPropertyList */

    CFPropertyList CFPropertyListCreateWithData(CFAllocator allocator, CFData data, NativeLong options, NativeLong format, CFError error);
    /* End CFPropertyList */

    /* CFError */

    CFString CFErrorGetDomain(CFError err);

    CFIndex CFErrorGetCode(CFError err);

    CFString CFErrorCopyDescription(CFError err);

    CFString CFErrorCopyFailureReason(CFError err);
    /* End CFError */

    /* CFLogging */

    public static interface CFLogLevel {
        public static final int kCFLogLevelEmergency = 0;
        public static final int kCFLogLevelAlert = 1;
        public static final int kCFLogLevelCritical = 2;
        public static final int kCFLogLevelError = 3;
        public static final int kCFLogLevelWarning = 4;
        public static final int kCFLogLevelNotice = 5;
        public static final int kCFLogLevelInfo = 6;
        public static final int kCFLogLevelDebug = 7;

    }
    /*
        %@     Object
        %d, %i signed int
        %u     unsigned int
        %f     float/double

        %x, %X hexadecimal int
        %o     octal int
        %zu    size_t
        %p     pointer
        %e     float/double (in scientific notation)
        %g     float/double (as %f or %e, depending on value)
        %s     C string (bytes)
        %S     C string (unichar)
        %.*s   Pascal string (requires two arguments, pass pstr[0] as the first, pstr+1 as the second)
        %c     character
        %C     unichar

        %lld   long long
        %llu   unsigned long long
        %Lf    long double
     */

    void CFLog(int level, CFString msgFormat, Object... varargs);
    /* End CFLogging */


    /* CFRunLoop*/

    void CFRunLoopRun();

    void CFRunLoopStop(CFRunLoop rl);

    CFRunLoop CFRunLoopGetCurrent();
    /* End CFRunLoop */

    public static interface CFNumberType {
        /**
         * Fixed-width types<br>
         * Fixed-width types<br>
         * <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:27</i>
         */
        public static final int kCFNumberSInt8Type = 1;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:28</i>
        public static final int kCFNumberSInt16Type = 2;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:29</i>
        public static final int kCFNumberSInt32Type = 3;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:30</i>
        public static final int kCFNumberSInt64Type = 4;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:31</i>
        public static final int kCFNumberFloat32Type = 5;
        /**
         * 64-bit IEEE 754<br>
         * <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:32</i>
         */
        public static final int kCFNumberFloat64Type = 6;
        /**
         * Basic C types<br>
         * Basic C types<br>
         * <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:34</i>
         */
        public static final int kCFNumberCharType = 7;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:35</i>
        public static final int kCFNumberShortType = 8;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:36</i>
        public static final int kCFNumberIntType = 9;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:37</i>
        public static final int kCFNumberLongType = 10;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:38</i>
        public static final int kCFNumberLongLongType = 11;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:39</i>
        public static final int kCFNumberFloatType = 12;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:40</i>
        public static final int kCFNumberDoubleType = 13;
        /**
         * Other<br>
         * Other<br>
         * <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:42</i>
         */
        public static final int kCFNumberCFIndexType = 14;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:44</i>
        public static final int kCFNumberNSIntegerType = 15;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:45</i>
        public static final int kCFNumberCGFloatType = 16;
        /// <i>native declaration : /System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h:46</i>
        public static final int kCFNumberMaxType = 16;
    }

    public static interface CFComparisonResult {
        public static final int kCFCompareLessThan = -1;
        public static final int kCFCompareEqualTo = 0;
        public static final int kCFCompareGreaterThan = 1;
    }

    public static final int kCFNotFound = -1;

    public static class CFAllocatorContext extends Structure {
        public NativeLong version;
        public Pointer info;
        public CFAllocatorRetainCallBack retain;
        public CFAllocatorReleaseCallBack release;
        public CFAllocatorCopyDescriptionCallBack copyDescription;
        public CFAllocatorAllocateCallBack allocate;
        public CFAllocatorReallocateCallBack reallocate;
        public CFAllocatorDeallocateCallBack deallocate;
        public CFAllocatorPreferredSizeCallBack preferredSize;

        public CFAllocatorContext() {
            super();
        }

        public CFAllocatorContext(NativeLong version, Pointer info, CFAllocatorRetainCallBack retain, CFAllocatorReleaseCallBack release, CFAllocatorCopyDescriptionCallBack copyDescription, CFAllocatorAllocateCallBack allocate, CFAllocatorReallocateCallBack reallocate, CFAllocatorDeallocateCallBack deallocate, CFAllocatorPreferredSizeCallBack preferredSize) {
            super();
            this.version = version;
            this.info = info;
            this.retain = retain;
            this.release = release;
            this.copyDescription = copyDescription;
            this.allocate = allocate;
            this.reallocate = reallocate;
            this.deallocate = deallocate;
            this.preferredSize = preferredSize;
        }

        protected ByReference newByReference() {
            ByReference s = new ByReference();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        protected ByValue newByValue() {
            ByValue s = new ByValue();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        protected CFAllocatorContext newInstance() {
            CFAllocatorContext s = new CFAllocatorContext();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        public static class ByReference extends CFAllocatorContext implements Structure.ByReference {

        }

        public static class ByValue extends CFAllocatorContext implements Structure.ByValue {

        }

      @Override
      protected List getFieldOrder() {
        return FieldUtil.getFieldsOrderForClass(getClass());
      }

    }

    public static class CFDictionaryKeyCallBacks extends Structure {
        public NativeLong version;
        public CFDictionaryRetainCallBack retain;
        public CFDictionaryReleaseCallBack release;
        public CFDictionaryCopyDescriptionCallBack copyDescription;
        public CFDictionaryEqualCallBack equal;
        public CFDictionaryHashCallBack hash;

        public CFDictionaryKeyCallBacks() {
            super();
        }

        public CFDictionaryKeyCallBacks(NativeLong version, CFDictionaryRetainCallBack retain, CFDictionaryReleaseCallBack release, CFDictionaryCopyDescriptionCallBack copyDescription, CFDictionaryEqualCallBack equal, CFDictionaryHashCallBack hash) {
            super();
            this.version = version;
            this.retain = retain;
            this.release = release;
            this.copyDescription = copyDescription;
            this.equal = equal;
            this.hash = hash;
        }

        protected ByReference newByReference() {
            ByReference s = new ByReference();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        protected ByValue newByValue() {
            ByValue s = new ByValue();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        protected CFDictionaryKeyCallBacks newInstance() {
            CFDictionaryKeyCallBacks s = new CFDictionaryKeyCallBacks();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        public static class ByReference extends CFDictionaryKeyCallBacks implements Structure.ByReference {

        }

        public static class ByValue extends CFDictionaryKeyCallBacks implements Structure.ByValue {

        }

      @Override
      protected List getFieldOrder() {
        return FieldUtil.getFieldsOrderForClass(getClass());
      }
    }

    public static class CFDictionaryValueCallBacks extends Structure {
        public NativeLong version;
        public CFDictionaryRetainCallBack retain;
        public CFDictionaryReleaseCallBack release;
        public CFDictionaryCopyDescriptionCallBack copyDescription;
        public CFDictionaryEqualCallBack equal;

        public CFDictionaryValueCallBacks() {
            super();
        }

        public CFDictionaryValueCallBacks(NativeLong version, CFDictionaryRetainCallBack retain, CFDictionaryReleaseCallBack release, CFDictionaryCopyDescriptionCallBack copyDescription, CFDictionaryEqualCallBack equal) {
            super();
            this.version = version;
            this.retain = retain;
            this.release = release;
            this.copyDescription = copyDescription;
            this.equal = equal;
        }

        protected ByReference newByReference() {
            ByReference s = new ByReference();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        protected ByValue newByValue() {
            ByValue s = new ByValue();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        protected CFDictionaryValueCallBacks newInstance() {
            CFDictionaryValueCallBacks s = new CFDictionaryValueCallBacks();
            s.useMemory(getPointer());
            write();
            s.read();
            return s;
        }

        public static class ByReference extends CFDictionaryValueCallBacks implements Structure.ByReference {

        }

        public static class ByValue extends CFDictionaryValueCallBacks implements Structure.ByValue {

        }

      @Override
      protected List getFieldOrder() {
        return FieldUtil.getFieldsOrderForClass(getClass());
      }
    }
}
