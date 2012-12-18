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
 * Represents a URL font location.
 *
 * @author Peter Farland
 */
public class URLSource
{
    private String value;

    public URLSource(String value)
    {
        this.value = value;
    }

    public String getValue()
    {
        return value;
    }
}
