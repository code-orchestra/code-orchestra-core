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

import org.apache.batik.css.parser.AbstractSelector;
import org.apache.batik.css.parser.CSSLexicalUnit;
import org.apache.batik.css.parser.DefaultConditionalSelector;
import org.apache.batik.css.parser.DefaultDescendantSelector;
import org.apache.batik.css.parser.DefaultElementSelector;
import org.w3c.css.sac.*;

/**
 * An implementation of DocumentHandler, which creates rules, hands
 * them off to the StyleParser, and populates them with descriptors.
 *
 * @author Paul Reilly
 */
public class StyleDocumentHandler implements DocumentHandler
{
    private StyleParser styleParser;
    private Rule currentRule;

    public StyleDocumentHandler(StyleParser styleParser)
    {
        this.styleParser = styleParser;
    }

    public void comment(String text)
    {
    }

    public void endDocument(InputSource source)
    {
    }

    public void endFontFace()
    {
		if ( currentRule != null )
        {
			if (currentRule instanceof FontFaceRule)
			{
				//Verify and collate information; prepare font for import
        		//((FontFaceRule)currentRule).initialize(styleParser);
			}

			currentRule = currentRule.getParentRule();
        }
    }

    public void endMedia(SACMediaList media)
    {
    }

    public void endPage(String name, String pseudo_page)
    {
    }

    public void endSelector(SelectorList selectors)
    {
        if ( currentRule != null )
        {
            currentRule = currentRule.getParentRule();
        }
    }

    public void ignorableAtRule(String atRule)
    {
    }

    public void importStyle(String uri, SACMediaList media, String defaultNamespaceURI)
    {
      System.out.println(uri);
    }



    public void namespaceDeclaration(String prefix, String uri)
    {
      styleParser.addNamespaceDeclaration(new NamespaceDeclaration(prefix, uri));
    }

    /** one css rule declaration property, consisting of a name and a value. */
    public void property(String name, LexicalUnit value, boolean important)
    {
        currentRule.getStyleDeclaration().setDescriptor(name, value, important ? "important" : null);
        
        if ("flashType".equals(name) || "flash-type".equals(name))
        {
        	int lineNumber = (value instanceof CSSLexicalUnit) ? ((CSSLexicalUnit) value).getLineNumber() : styleParser.getLineNumber();
        	styleParser.warnDeprecation(name, "flashType".equals(name) ? "advancedAntiAliasing" : "advanced-anti-aliasing", lineNumber);
        }
    }

    public void startDocument(InputSource source)
    {
    }

    public void startFontFace()
    {
        // preilly: org.apache.batik.css.parser.Parser does not call nextIgnoreSpaces()
        // before calling startFontFace(), so the line number below should be ok.
		FontFaceRule rule = new FontFaceRule(styleParser.getPath(), styleParser.getLineNumber());

		if (currentRule == null)
		{
			currentRule = rule;
		}
		else
		{
			rule.setParentRule(currentRule);
			currentRule = rule;
		}

		styleParser.addRule(currentRule);
    }

    public void startMedia(SACMediaList media)
    {
      System.out.println(media);
    }

    public void startPage(String name, String pseudo_page)
    {
    }

    public void startSelector(SelectorList selectors)
    {
        // preilly: By the time we get here, org.apache.batik.css.parser.Parser has called
        // nextIgnoreSpaces(), so the following line number could be off.  If the first
        // selector is an instance of DefaultElementSelector, grab the line number out of
        // it.  We have modified Parser to store the line number in
        // DefaultElementSelector's before calling nextIgnoreSpaces(), so it should be
        // dead nuts on.
        int lineNumber = styleParser.getLineNumber();
        Selector selector = selectors.item(0);

        if (selector instanceof DefaultConditionalSelector)
        {
            lineNumber = ((DefaultConditionalSelector)selector).getLineNumber();
        }
        else if (selector instanceof DefaultElementSelector)
        {
            lineNumber = ((DefaultElementSelector)selector).getLineNumber();
        }
        else if (selector instanceof DefaultDescendantSelector)
        {
            lineNumber = ((DefaultDescendantSelector)selector).getLineNumber();
        }

        StyleRule rule = new StyleRule(selectors, styleParser.getPath(), lineNumber);
        if ( currentRule == null )
        {
            currentRule = rule;
        }
        else
        {
            rule.setParentRule(currentRule);
            currentRule = rule;
        }

        styleParser.addRule(currentRule);
    }
}
