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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * Selectors are used to match style declarations to components.
 * Supported selectors include simple type selectors, conditional
 * (based on the identity, styleName (class) or state (pseudo-element)
 * of a component), or descendant (based on the position in the
 * display list).
 *
 * @author Pete Farland
 */
public class StyleSelector
{
    public StyleSelector getAncestor()
    {
        return ancestor;
    }

    public void setAncestor(StyleSelector ancestor)
    {
        this.ancestor = ancestor;
    }

    public List<StyleCondition> getConditions()
    {
        return conditions;
    }

    public void addCondition(StyleCondition condition)
    {
        if (conditions == null)
            conditions = new ArrayList<StyleCondition>(2);

        conditions.add(condition);
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
        StringBuilder sb = new StringBuilder();

        if (ancestor != null)
            sb.append(ancestor.toString()).append(' ');

        if (value != null)
            sb.append(value);

        if (conditions != null)
        {
            Iterator<StyleCondition> iterator = conditions.iterator();
            while (iterator.hasNext())
            {
                sb.append(iterator.next().toString());
            }
        }

        return sb.toString(); 
    }

    private StyleSelector ancestor;
    private List<StyleCondition> conditions;
    private String value;

}
