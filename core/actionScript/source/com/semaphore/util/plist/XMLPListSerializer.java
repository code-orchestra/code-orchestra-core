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

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 17, 2010
 * Time: 5:15:02 PM
 */
public class XMLPListSerializer implements PListSerializer {
    private static final XMLPListSerializer _INSTANCE = new XMLPListSerializer();

    public static void main(String[] args) {
        PList plist = JPlistBuilder.buildPList(new File("0.shsh"));
        XMLPListSerializer serializer = new XMLPListSerializer();
        String out = serializer.serialize(plist, "\t");
        System.out.println(out);
    }

    public static XMLPListSerializer get() {
        return _INSTANCE;
    }

    public String serialize(PList plist) {
        return serialize(plist, "\t");
    }

    public String serialize(PList plist, String indentString) {
        StringBuilder sb = new StringBuilder(getHeader());
        sb.append(_serialize(plist, 0, indentString));
        return sb.toString();
    }

    private String getHeader() {
        StringBuffer sb = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                "<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n");
        return sb.toString();
    }

    private String _serialize(PElement pElement, int indentLevel, String indentString) {
        PElementType vType = pElement.getType();
        StringBuffer sb = new StringBuffer();
        sb.append(doIndent(indentLevel, indentString));
        switch (vType) {
            case PLIST:
                sb.append("<plist version=\"1.0\">");
                sb.append(_serialize(((PList) pElement).getValue(), indentLevel, indentString));
                sb.append(doIndent(indentLevel, indentString));
                sb.append("</plist>");
                break;
            case ARRAY:
                sb.append("<array>");
                List<PElement> children = ((ArrayElement) pElement).getValue();
                for (PElement child : children)
                    sb.append(_serialize(child, indentLevel + 1, indentString));
                sb.append(doIndent(indentLevel, indentString));
                sb.append("</array>");
                break;
            case BOOLEAN:
                sb.append(((BooleanElement) pElement).getValue() ? "<true />" : "<false />");
                break;
            case KEY:
                sb.append("<key>");
                sb.append(((StringElement) pElement).getValue());
                sb.append("</key>");
                break;
            case STRING:
                sb.append("<string>");
                sb.append(((StringElement) pElement).getValue());
                sb.append("</string>");
                break;
            case INTEGER:
                sb.append("<integer>");
                sb.append(((IntegerElement) pElement).getValue());
                sb.append("</integer>");
                break;
            case DATA:
                String dValue = chop(((DataElement) pElement).getValue().replaceAll("\\s", ""), 60, indentLevel + 1, indentString);
                sb.append("<data>");
                sb.append(dValue);
                if (dValue.indexOf('\n') > -1) {
                    sb.append(doIndent(indentLevel, indentString));
                }
                sb.append("</data>");
                break;
            case DICTIONARY:
                sb.append("<dict>");
                Map<String, PElement> dict = ((DictionaryElement) pElement).getValue();
                for (Map.Entry<String, PElement> entry : dict.entrySet()) {
                    sb.append(_serialize(new KeyElement(entry.getKey()), indentLevel + 1, indentString));
                    sb.append(_serialize(entry.getValue(), indentLevel + 1, indentString));
                }
                sb.append(doIndent(indentLevel, indentString));
                sb.append("</dict>");
                break;
            case REAL:
                sb.append("<real>");
                sb.append(((RealElement) pElement).getValue());
                sb.append("</real>");
                break;
            case DATE:
                sb.append("<date>");
                sb.append(((DateElement) pElement).getValue());
                sb.append("</date>");
                break;
            default:
                throw new IllegalArgumentException("Unknown Value:" + pElement);
        }
        return sb.toString();
    }

    private String chop(String value, int limit, int level, String indentString) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < value.length(); i += limit) {
            if (i + limit < value.length() || value.length() > limit)
                sb.append(doIndent(level, indentString));
            if (i + limit > value.length())
                sb.append(value.substring(i));
            else
                sb.append(value.substring(i, i + limit));
        }
        return sb.toString();
    }

    private String doIndent(int level, String indentString) {
        StringBuilder sb = new StringBuilder(level * indentString.length() * level);
        sb.append("\n");
        while (level-- > 0)
            sb.append(indentString);
        return sb.toString();
    }
}
