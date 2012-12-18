////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2003-2008 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flash.css;

import org.w3c.css.sac.LexicalUnit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Map;

/**
 * This class functions as a context for each rule's style declaration, 
 * describing the subject, selector and descriptor or "style" properties.
 * 
 * TODO: For now, StyleDef converts the Descriptors which are heavily tied to
 * the SAC based CSS parser, into simpler StyleProperty instances for
 * ActionScript code gen. It would be nice if this was encapsulated and not a
 * concern of StyleDef.
 *
 * @author Peter Farland
 */
public class StyleDeclaration
{
    public StyleDeclaration(String path, int lineNumber)
    {
        //this.parentRule = parentRule;
        this.path = path;
        this.lineNumber = lineNumber;
    }

    public String getPath()
    {
        return path;
    }

    /**
     * The line number in the source on which this style declaration started.  
     * (Useful for error reporting).
     */
    public int getLineNumber()
    {
        return lineNumber;
    }

    public void setLineNumber(int lineNumber)
    {
        this.lineNumber = lineNumber;
    }

    //--------------------------------------------------------------------------
    //
    // Methods used for ActionScript styles code generation
    //
    //--------------------------------------------------------------------------

    /**
     * The subject of rule that made this style declaration.
     */
    public String getSubject()
    {
        return subject;
    }

    public void setSubject(String subject)
    {
        this.subject = subject;
    }

    /**
     * A selector of the rule that is associated with this style declaration. 
     */
    public StyleSelector getSelector()
    {
        return selector;
    }

    public void setSelector(StyleSelector selector)
    {
        this.selector = selector;
    }

    /**
     * The list of property declarations in the style declaration.
     */
    public Map<String, StyleProperty> getProperties()
    {
        return properties;
    }

    public void setProperties(Map<String, StyleProperty> properties)
    {
        this.properties = properties;
    }

    /**
     * We track effects properties as a special case for the runtime. 
     */
    public List<String> getEffectStyles()
    {
        return effectStyles;
    }

    public void addEffectStyle(String propertyName)
    {
        effectStyles.add(propertyName);
    }

    //--------------------------------------------------------------------------
    //
    // Methods that keep track of the Descriptors found from SAC based CSS
    // parsing... these will be converted into simpler StyleProperties.
    //
    //--------------------------------------------------------------------------

    public Descriptor getDescriptorValue(String name)
    {
        return (Descriptor)descriptors.get(name);
    }

    public void setDescriptor(String propertyName, LexicalUnit value, String priority)
    {
        //priorities.put(propertyName, priority);
        descriptors.put(propertyName, new Descriptor(propertyName, value, path));
    }

    public Descriptor removeDescriptor(String name)
    {
        //priorities.remove(name);
        return (Descriptor)descriptors.remove(name);
    }

    public Iterator<Entry<String, Descriptor>> iterator()
    {
        return descriptors.entrySet().iterator();
    }

    /**
     * Shallow copy of StyleDeclaration to allow for a list of multiple
     * selectors to share the same set of descriptors.
     */
    public StyleDeclaration shallowCopy()
    {
        StyleDeclaration decl = new StyleDeclaration(path, lineNumber);
        decl.subject = this.subject;
        decl.selector = this.selector;
        decl.effectStyles = this.effectStyles;
        decl.descriptors = this.descriptors;
        decl.properties = this.properties;
        return decl;
    }

    private int lineNumber;
    private String path;
    private List<String> effectStyles = new ArrayList<String>();
    private LinkedHashMap<String, Descriptor> descriptors = new LinkedHashMap<String, Descriptor>();
    private String subject;
    private StyleSelector selector;
    private Map<String, StyleProperty> properties = new HashMap<String, StyleProperty>();
}
