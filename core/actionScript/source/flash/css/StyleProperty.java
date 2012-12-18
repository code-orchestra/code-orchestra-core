////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2006 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flash.css;

/**
 * A more simple version of <code>Descriptor</code>, which doesn't
 * have any W3C SAC dependencies.
 *
 * @author Pete Farland
 */
public class StyleProperty
{
    private String name;
    private Object value;
    private String path;
    private int lineNumber;

    public StyleProperty(String name, Object value, String path, int lineNumber)
    {
        this.name = name;
        this.value = value;
        assert path != null;
        this.path = path;
        this.lineNumber = lineNumber;
    }

    public String getPath()
    {
        return path;
    }

    public int getLineNumber()
    {
        return lineNumber;
    }

    public String getName()
    {
        return name;
    }

    /**
     * Can be a String, a flex2.compiler.mxml.rep.AtEmbed, or a
     * flex2.compiler.css.Reference.
     */
    public Object getValue()
    {
        return value;
    }

    public String toString()
    {
        return name + ":" + value + ";";
    }
}
