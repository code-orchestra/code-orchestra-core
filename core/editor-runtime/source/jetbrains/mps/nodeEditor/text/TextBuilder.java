/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.nodeEditor.text;

import jetbrains.mps.logging.Logger;

import java.util.List;
import java.util.ArrayList;

public class TextBuilder {
  private static final Logger LOG = Logger.getLogger(TextBuilder.class);

  private int myX = 0;
  private int myY = 0;
  private int myWidth = 0;
  private StringBuffer myFirstLine;
  private List<StringBuffer> myLines = new ArrayList<StringBuffer>();

  private static final TextBuilder ourEmptyTextBuilder = TextBuilder.fromString("");

  private TextBuilder() {

  }


  public int getHeight() {
    return myLines.size() + 1;
  }

  public int getWidth() {
    return myWidth;
  }

  public String getText() {
    StringBuffer buffer = new StringBuffer(myFirstLine);
    for (StringBuffer line : myLines) {
      buffer.append('\n');
      buffer.append(line);
    }
    return buffer.toString();
  }

  public TextBuilder appendToTheRight(TextBuilder builder) {
    return appendToTheRight(builder, true);
  }

  public TextBuilder appendToTheRight(TextBuilder builder, boolean insertSpace) {
    if (builder == ourEmptyTextBuilder) return this;
    if (this == ourEmptyTextBuilder) return builder;
    TextBuilder result = new TextBuilder();
    String delim = insertSpace ? " " : "";
    int delimWidth = delim.length();
    result.myX = this.myX;
    result.myY = this.myY;
    result.myWidth = this.myWidth + builder.myWidth + delimWidth;
    result.myFirstLine = new StringBuffer(this.myFirstLine + delim + builder.myFirstLine);
    int height = Math.max(this.getHeight(), builder.getHeight());
    for (int i = 0; i < height - 1; i++) {
      if (i >= this.myLines.size()) {
        result.myLines.add(makeWhitespaceStringBuffer(this.myWidth + delimWidth));
      } else {
        result.myLines.add(new StringBuffer(this.myLines.get(i)));
      }
      if (i < builder.myLines.size()) {
        result.myLines.get(i).append(builder.myLines.get(i));
      }
    }
    result.normalizeWidth();
    return result;
  }

  public TextBuilder appendToTheBottom(TextBuilder builder) {
    if (builder == ourEmptyTextBuilder) return this;
    if (this == ourEmptyTextBuilder) return builder;
    int indent = builder.myX - this.myX;
    TextBuilder result = new TextBuilder();
    result.myY = this.myY;
    TextBuilder leftmost;
    TextBuilder rightmost;
    if (indent >= 0) {
      leftmost = this;
      rightmost = builder;
    } else {
      rightmost = this;
      leftmost = builder;
    }
    result.myX = leftmost.myX;
    int width1 = leftmost.myWidth;
    int width2 = rightmost.myWidth + indent;
    result.myWidth = Math.max(width1, width2);
    result.myFirstLine = new StringBuffer(this.myFirstLine);
    for (StringBuffer sb : this.myLines) {
      result.myLines.add(new StringBuffer(sb));
    }
    result.myLines.add(builder.myFirstLine);
    for (StringBuffer sb : builder.myLines) {
      result.myLines.add(new StringBuffer(sb));
    }

    StringBuffer wsIndent = makeWhitespaceStringBuffer(indent);
    if (rightmost == this) {
      result.myFirstLine.insert(0, wsIndent);
      for (int i = 1; i < this.getHeight() - 1; i++) {
        result.myLines.get(i).insert(0, wsIndent);
      }
    } else {
      for (int i = this.getHeight() - 1; i < result.myLines.size(); i++) {
        result.myLines.get(i).insert(0, wsIndent);
      }
    }

    result.normalizeWidth();
    return result;
  }

  private void normalizeWidth() {
    while (myFirstLine.length() < myWidth) myFirstLine.append(' ');
    for (StringBuffer s : myLines) {
      while (s.length() < myWidth) s.append(' ');
    }
  }

  private static StringBuffer makeWhitespaceStringBuffer(int size) {
    StringBuffer result = new StringBuffer();
    for (int i = 1; i <= size; i++) {
      result.append(' ');
    }
    return result;
  }

  public static TextBuilder fromString(String s) {
    TextBuilder result = new TextBuilder();
    result.myFirstLine = new StringBuffer(s);
    result.myWidth = s.length();
    return result;
  }

  public static TextBuilder getEmptyTextBuilder() {
    return ourEmptyTextBuilder;
  }

  public static void main(String[] args) {
    TextBuilder textBuilder1 = fromString("was").appendToTheRight(fromString("it"))
      .appendToTheRight(fromString("a"))
      .appendToTheRight(fromString("cat"))
      .appendToTheRight(fromString("?"));
    String testString1 = textBuilder1.getText();
    System.err.println(testString1);

    TextBuilder textBuilder2 = fromString("mouse");
    textBuilder2.myX = 3;
    TextBuilder textBuilder3 = textBuilder1.appendToTheBottom(textBuilder2);
    String testString2 = textBuilder3.getText();
    System.err.println(testString2);

  }
}
