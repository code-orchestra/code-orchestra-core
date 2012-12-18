////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2003-2006 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flash.css;

import org.w3c.css.sac.SelectorList;

/**
 * Represents a CSS style rule.
 *
 * @author Pete Farland
 */
public class StyleRule extends Rule
{
  public StyleRule(SelectorList selectorList, String path, int lineNumber)
  {
    super(STYLE_RULE, path, lineNumber);
    this.selectorList = selectorList;
  }

  public String getSelectorText()
  {
    return selector;
  }

  public void setSelectorText(String s)
  {
    selector = s;
  }

  public SelectorList getSelectorList()
  {
    return selectorList;
  }

  private String selector;
  private SelectorList selectorList;

  public String toString()
  {
    if (selectorList != null)
      return selectorList.toString();
    else
      return getSelectorText();
  }
}
