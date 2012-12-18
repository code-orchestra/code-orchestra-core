package codeOrchestra.ios.jna.core;

import com.sun.jna.Library;
import com.sun.jna.Native;
import com.sun.jna.Pointer;

public interface CoreFoundation extends Library {

    CoreFoundation INSTANCE = (CoreFoundation) Native.loadLibrary("CoreFoundation", CoreFoundation.class);

    //
    // https://developer.apple.com/library/mac/#documentation/CoreFoundation/Reference/CFStringRef/Reference/reference.html
    //

    public CFStringRef CFStringCreateWithCharacters(Void alloc, char[] chars, int numChars);

    public void CFStringGetCharacters(CFStringRef theString, CFRange.ByValue range, Pointer buffer);

    public Pointer CFStringGetCharactersPtr(CFStringRef theString);

    public int CFStringGetLength(CFStringRef theString);

    //
    // https://developer.apple.com/library/mac/#documentation/CoreFOundation/Reference/CFBundleRef/Reference/reference.html#//apple_ref/c/func/CFBundleGetMainBundle
    //

    public Pointer CFBundleGetMainBundle();

    public CFStringRef CFBundleGetIdentifier(Pointer bundle);

}