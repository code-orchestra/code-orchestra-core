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
package jetbrains.mps.ide.java;

import com.intellij.lexer.HtmlHighlightingLexer;
import com.intellij.lexer.LayeredLexer;
import com.intellij.lexer.StringLiteralLexer;
import com.intellij.psi.tree.IElementType;

public class JavaHighlightingLexer extends LayeredLexer {
  public JavaHighlightingLexer() {
    super(new JavaLexer());
    registerSelfStoppingLayer(new StringLiteralLexer('\"', JavaTokenType.STRING_LITERAL),
      new IElementType[]{JavaTokenType.STRING_LITERAL}, IElementType.EMPTY_ARRAY);

    registerSelfStoppingLayer(new StringLiteralLexer('\'', JavaTokenType.STRING_LITERAL),
      new IElementType[]{JavaTokenType.CHARACTER_LITERAL}, IElementType.EMPTY_ARRAY);


    LayeredLexer docLexer = new LayeredLexer(new JavaDocLexer());

    HtmlHighlightingLexer lexer = new HtmlHighlightingLexer();
    lexer.setHasNoEmbeddments(true);
    docLexer.registerLayer(lexer,
      new IElementType[]{JavaDocTokenType.DOC_COMMENT_DATA});

    registerSelfStoppingLayer(docLexer,
      new IElementType[]{JavaTokenType.DOC_COMMENT},
      new IElementType[]{JavaDocTokenType.DOC_COMMENT_END});
  }
}
