package codeOrchestra.ios.jna.core;

import com.sun.jna.Memory;
import com.sun.jna.ptr.PointerByReference;

public class CFStringRef extends PointerByReference {

    public CFStringRef() {
    }

    public static CFStringRef CFSTR(String str) {
        final char[] chars = str.toCharArray();
        return CoreFoundation.INSTANCE.CFStringCreateWithCharacters(null, chars, chars.length);
    }

    public String toString() {
        CFStringRef p = this;

        int len = CoreFoundation.INSTANCE.CFStringGetLength(p);
        Memory m = new Memory(len * 2);

        CFRange.ByValue range = new CFRange.ByValue();
        range.len = len;
        range.loc = 0;

        CoreFoundation.INSTANCE.CFStringGetCharacters(p, range, m);

        // return m.getString(0, true);
        return hack(m);
    }

    // https://github.com/twall/jna/issues/53
    public String hack(Memory m) {
        String str = "";

        for (int i = 0; i < m.size(); i += 2) {
            byte b1 = m.getByte(i + 0);
            byte b2 = m.getByte(i + 1);

            String s = new String(new byte[] { b1, b2 });
            str += s;
        }

        return str;
    }

    public static void main(String[] arg) {
        CFStringRef a = CFStringRef.CFSTR("abc");
        String s = a.toString();
        System.out.println(s);
    }
}