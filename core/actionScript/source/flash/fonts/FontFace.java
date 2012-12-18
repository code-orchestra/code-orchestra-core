////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2003-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flash.fonts;

import java.util.HashMap;

/**
 * A face represents one style of a font from a single family. For
 * now, the font size is not considered in the face as a FontBuilder
 * does not depend on size to generate a DefineFont or DefineFont2
 * tag.
 *
 * @author Peter Farland
 */
public abstract class FontFace
{
	public static final int PLAIN	= 0;
	public static final int BOLD	= 1;
	public static final int ITALIC	= 2;

	public static final int SWF_EM_SQUARE = 1024;
	public static final int TTF_EM_SQUARE = 2048;


	public abstract int getMissingGlyphCode();
	public abstract double getPointSize();
	public abstract String getFamily();
	public abstract int getAscent();
	public abstract int getDescent();
	public abstract int getLineGap();
	public abstract int getFirstChar();
	public abstract int getNumGlyphs();
	public abstract boolean canDisplay(char c);
	public abstract int getAdvance(char c);
	public abstract boolean isBold();
	public abstract boolean isItalic();
	public abstract double getEmScale();
	public abstract String getCopyright();
	public abstract void setCopyright(String c);
	public abstract String getTrademark();
	public abstract void setTrademark(String t);
	public abstract String getPostscriptName();

    public void setProperty(String name, Object value)
    {
        properties.put(name, value);
    }

    public Object getProperty(String name)
    {
        return properties.get(name);
    }

    protected HashMap<String, Object> properties = new HashMap<String, Object>();
}