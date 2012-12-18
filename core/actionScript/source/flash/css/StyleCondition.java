////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2008 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flash.css;

/**
 * Represents a CSS class, id, or pseudo condition.
 *
 * @author Peter Farland
 */
public class StyleCondition
{
    public static final String CLASS_CONDITION = "class";
    public static final String ID_CONDITION = "id";
    public static final String PSEUDO_CONDITION = "pseudo";

    public StyleCondition(String kind, String value)
    {
        this.kind = kind;
        this.value = value;
    }

    public String getKind()
    {
        return kind;
    }

    public void setKind(String kind)
    {
        this.kind = kind;
    }

    public String getValue()
    {
        return value;
    }

    public void setValue(String value)
    {
        this.value = value;
    }

    public String toString()
    {
        if (kind == CLASS_CONDITION)
            return "." + value;
        else if (kind == ID_CONDITION)
            return "#" + value;
        else if (kind == PSEUDO_CONDITION)
            return ":" + value;
        else
            return "";
    }

    private String kind;
    private String value;
}
