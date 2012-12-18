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

/**
 * This class represents an individual rule in a CSS ruleset.
 *
 * @author Paul Reilly
 */
public abstract class Rule
{
  public final static short UNKNOWN_RULE = 0;
  public final static short STYLE_RULE = 1;
  public final static short CHARSET_RULE = 2;
  public final static short IMPORT_RULE = 3;
  public final static short MEDIA_RULE = 4;
  public final static short FONT_FACE_RULE = 5;
  public final static short PAGE_RULE = 6;

  private String cssText;
  private Rule parentRule;
  private short type;
  private StyleSheet parentStyleSheet;
  int uniqueID;
  protected StyleDeclaration declaration;

  protected Rule(short type, String path, int lineNumber)
  {
    this.type = type;
    this.declaration = new StyleDeclaration(path, lineNumber);
  }

  public StyleDeclaration getStyleDeclaration()
  {
    return declaration;
  }

  public String getCssText()
  {
    return cssText;
  }

  public Rule getParentRule()
  {
    return parentRule;
  }

  public StyleSheet getParentStyleSheet()
  {
    return parentStyleSheet;
  }

  public short getType()
  {
    return type;
  }

  public int getUniqueID()
  {
    return uniqueID;
  }

  public void setCssText(String cssText)
  {
    this.cssText = cssText;
  }

  public void setParentRule(Rule parentRule)
  {
    this.parentRule = parentRule;
  }

  public void setParentStyleSheet(StyleSheet parentStyleSheet)
  {
    this.parentStyleSheet = parentStyleSheet;
  }

  public void setUniqueID(int uniqueID)
  {
    this.uniqueID = uniqueID;
  }

  // (Paul) This is busted.
  public String unparse()
  {
    return "";
  }
}
