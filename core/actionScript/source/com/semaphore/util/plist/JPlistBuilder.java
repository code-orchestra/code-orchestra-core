/*
 * TinyUmbrella - making iDevice restores possible...
 * Copyright (C) 2009-2010 semaphore
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.semaphore.util.plist;

import com.semaphore.util.StringUtil;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringReader;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 9:36:56 AM
 */
@SuppressWarnings({"unchecked", "unused"})
public class JPlistBuilder {
    private static Logger log = Logger.getLogger("JPlistBuilder");
    private static SAXBuilder builder = new SAXBuilder();

    static {
        builder.setValidation(false);
        builder.setIgnoringElementContentWhitespace(true);
        builder.setIgnoringBoundaryWhitespace(true);
        builder.setFeature("http://xml.org/sax/features/validation", false);
        builder.setFeature("http://apache.org/xml/features/validation/schema", false);
        builder.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
    }

    public static void main(String[] args) throws Exception {

        PList pl = buildPList(new FileInputStream("src/com/semaphore/data/BuildManifest-iphone-3.1.plist"));
        Document doc = builder.build(new FileInputStream("src/com/semaphore/data/BuildManifest-iphone-3.1.plist"));
        doc.removeContent(doc.getDocType());
        PList plist = buildPList(doc);
        System.out.println(PListUtil.getECID(plist));
    }

    public static PList buildPList(String content) {
        try {
            return buildPList(builder.build(new StringReader(content)));
        } catch (Exception e) {
            log.severe(StringUtil.getStackTrace(e));
        }
        return new PList();
    }

    public static PList buildPList(InputStream is) {
        try {
            return buildPList(builder.build(is));
        } catch (Exception e) {
            log.severe(StringUtil.getStackTrace(e));
        }
        return new PList();
    }

    public static PList buildPList(File file) {
        try {
            return buildPList(new FileInputStream(file));
        } catch (Exception e) {
            log.severe(StringUtil.getStackTrace(e));
        }
        return new PList();
    }

    public static PList buildPList(Document doc) {
        if (doc.getDocType() != null)
            doc.removeContent(doc.getDocType());
        List<Element> eplist = (List<Element>) doc.getContent();
        if (eplist == null || eplist.size() > 1)
            throw new IllegalArgumentException("plist can only have one <plist/> root!");
        Element edict = eplist.get(0).getChild("dict");
        if (!edict.getName().equals("dict"))
            throw new IllegalArgumentException("plist must have <dict> as its first element!");
        DictionaryElement dict = parseDictionary(edict);
        return new PList(dict);
    }

    private static PElement parseGeneric(Element pelement) {
        PElementType vType = PElementType.getType(pelement.getName());
        PElement value;
        switch (vType) {
            case ARRAY:
                value = parseArray(pelement);
                break;
            case BOOLEAN:
                value = new BooleanElement(pelement.getName().equalsIgnoreCase("true"));
                break;
            case STRING:
                value = new StringElement(pelement.getValue());
                break;
            case INTEGER:
                value = new IntegerElement(pelement.getValue());
                break;
            case DATA:
                value = new DataElement(pelement.getValue());
                break;
            case DICTIONARY:
                value = parseDictionary(pelement);
                break;
            case REAL:
                value = new RealElement(Double.parseDouble(pelement.getValue()));
                break;
            case DATE:
                value = new DateElement(pelement.getValue());
                break;
            default:
                throw new IllegalArgumentException("Unknown Value:" + pelement);
        }
        return value;
    }

    private static DictionaryElement parseDictionary(Element edict) {
        List<Element> children = edict.getChildren();
        DictionaryElement dict = new DictionaryElement();
        for (Iterator iter = children.iterator(); iter.hasNext();) {
            Element keyElement = (Element) iter.next();
            PElementType keyType = PElementType.getType(keyElement.getName());
            if (keyType != PElementType.KEY)
                throw new IllegalArgumentException("Missing KEY!");
            String key = keyElement.getValue();
            Element pelement = (Element) iter.next();
            PElement value = parseGeneric(pelement);
            dict.put(key, value);
        }
        return dict;
    }

    private static ArrayElement parseArray(Element parray) {
        List<Element> children = parray.getChildren();
        ArrayElement array = new ArrayElement();
        for (Element child : children) {
            PElement pechild = parseGeneric(child);
            array.add(pechild);
        }
        return array;
    }
}
