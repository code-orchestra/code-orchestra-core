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

package flash.css;

import java.io.Reader;
import java.io.InputStream;
import java.util.List;

import org.w3c.dom.Node;
import org.w3c.dom.stylesheets.MediaList;

/**
 * Represents a CSS stylesheet.  Consumers will typically call one of
 * the parse() methods and then getCssRules().
 *
 * @author Paul Reilly
 */
public class StyleSheet
{
  private List<Rule> rules;
  private boolean disabled;
  private boolean errorsExist;
  private boolean checkDeprecation;

  public StyleSheet()
  {
  }

  public void checkDeprecation(boolean checkDeprecation)
  {
    this.checkDeprecation = checkDeprecation;
  }

  /**
   * If using an internal stylesheet, and the path to the MXML
   * document is known, then provide it to the parser using this
   * method so that relative paths such as font file locations can
   * be resolved.
   *
   * @param mxmlPath - full path to enclosing MXML document
   * @param mxmlLineNumber
   * @param reader
   * @param handler
   * @return a StyleSheet
   */
  public StyleSheet parse(String mxmlPath, int mxmlLineNumber, Reader reader, Logger handler)
  {
    assert (mxmlPath != null);
    StyleParser styleParser = new StyleParser(mxmlPath, mxmlLineNumber, reader, handler, checkDeprecation);
    rules = styleParser.getRules();

    errorsExist = styleParser.errorsExist();

    if (!errorsExist)
    {
      return this;
    }
    else
    {
      return null;
    }
  }

  /**
   * If using an internal stylesheet, and the path to the CSS
   * document is known, then provide it to the parser using this
   * method so that relative paths such as font file locations can
   * be resolved.
   *
   * @param cssPath - full path to external css file.
   * @param reader
   * @param handler
   * @return a StyleSheet
   */
  public StyleSheet parse(String cssPath, Reader reader, Logger handler)
  {
    assert (cssPath != null);
    StyleParser styleParser = new StyleParser(cssPath, reader, handler, checkDeprecation);
    rules = styleParser.getRules();

    errorsExist = styleParser.errorsExist();

    if (!errorsExist)
    {
      return this;
    }
    else
    {
      return null;
    }
  }

  /**
   * This method is used to parse the global style sheet.
   *
   * @param name - either a remote URL or local relative path to an MXML document
   * @param handler
   */
  public StyleSheet parse(String name, InputStream cssIn, Logger handler)
  {
    assert (name != null);
    StyleParser styleParser = new StyleParser(name, cssIn, handler, checkDeprecation);
    rules = styleParser.getRules();

    errorsExist = styleParser.errorsExist();

    if (!errorsExist)
    {
      return this;
    }
    else
    {
      return null;
    }
  }

  public boolean errorsExist()
  {
    return errorsExist;
  }

  public void deleteRule(int index)
  {
    if (rules != null)
    {
      rules.remove(index);
    }
  }

  public List<Rule> getCssRules()
  {
    return rules;
  }

  public boolean getDisabled()
  {
    return disabled;
  }

  public String getHref()
  {
    return null;
  }

  public MediaList getMedia()
  {
    return null;
  }

  public Node getOwnerNode()
  {
    return null;
  }

  public Rule getOwnerRule()
  {
    return null;
  }

  public org.w3c.dom.stylesheets.StyleSheet getParentStyleSheet()
  {
    return null;
  }

  public String getTitle()
  {
    return null;
  }

  public String getType()
  {
    return null;
  }

  public void setDisabled(boolean disabled)
  {
    this.disabled = disabled;
  }
}
