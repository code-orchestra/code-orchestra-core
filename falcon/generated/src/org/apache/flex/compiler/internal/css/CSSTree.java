// $ANTLR 3.3 Nov 30, 2010 12:50:56 C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g 2012-10-02 17:55:22

/*
 *
 *  Licensed to the Apache Software Foundation (ASF) under one or more
 *  contributor license agreements.  See the NOTICE file distributed with
 *  this work for additional information regarding copyright ownership.
 *  The ASF licenses this file to You under the Apache License, Version 2.0
 *  (the "License"); you may not use this file except in compliance with
 *  the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
	
package org.apache.flex.compiler.internal.css;

import java.util.Map;
import java.util.HashMap;
import org.apache.flex.compiler.css.*;
import org.apache.flex.compiler.problems.CSSParserProblem;



import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

/**
 * This is a tree grammar for advanced CSS in Flex. It walks the AST generated 
 * by the CSS parser and builds CSS DOM objects.
 */
@SuppressWarnings({"rawtypes", "unchecked", "unused"})
public class CSSTree extends TreeParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "I_RULES", "I_MEDIUM_CONDITIONS", "I_DECL", "I_RULE", "I_SELECTOR_GROUP", "I_SELECTOR", "I_SIMPLE_SELECTOR", "I_ARRAY", "AT_NAMESPACE", "ID", "STRING", "SEMI_COLONS", "AT_MEDIA", "BLOCK_OPEN", "BLOCK_END", "ARGUMENTS", "AT_FONT_FACE", "COMMA", "DOT", "HASH_WORD", "COLON", "PIPE", "STAR", "NUMBER_WITH_UNIT", "CLASS_REFERENCE", "PROPERTY_REFERENCE", "EMBED", "URL", "LOCAL", "PERCENT", "EQUALS", "NULL", "LETTER", "DIGIT", "NUMBER", "COMMENT", "WS", "STRING_QUOTE", "'and'"
    };
    public static final int EOF=-1;
    public static final int T__42=42;
    public static final int I_RULES=4;
    public static final int I_MEDIUM_CONDITIONS=5;
    public static final int I_DECL=6;
    public static final int I_RULE=7;
    public static final int I_SELECTOR_GROUP=8;
    public static final int I_SELECTOR=9;
    public static final int I_SIMPLE_SELECTOR=10;
    public static final int I_ARRAY=11;
    public static final int AT_NAMESPACE=12;
    public static final int ID=13;
    public static final int STRING=14;
    public static final int SEMI_COLONS=15;
    public static final int AT_MEDIA=16;
    public static final int BLOCK_OPEN=17;
    public static final int BLOCK_END=18;
    public static final int ARGUMENTS=19;
    public static final int AT_FONT_FACE=20;
    public static final int COMMA=21;
    public static final int DOT=22;
    public static final int HASH_WORD=23;
    public static final int COLON=24;
    public static final int PIPE=25;
    public static final int STAR=26;
    public static final int NUMBER_WITH_UNIT=27;
    public static final int CLASS_REFERENCE=28;
    public static final int PROPERTY_REFERENCE=29;
    public static final int EMBED=30;
    public static final int URL=31;
    public static final int LOCAL=32;
    public static final int PERCENT=33;
    public static final int EQUALS=34;
    public static final int NULL=35;
    public static final int LETTER=36;
    public static final int DIGIT=37;
    public static final int NUMBER=38;
    public static final int COMMENT=39;
    public static final int WS=40;
    public static final int STRING_QUOTE=41;

    // delegates
    // delegators


        public CSSTree(TreeNodeStream input) {
            this(input, new RecognizerSharedState());
        }
        public CSSTree(TreeNodeStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return CSSTree.tokenNames; }
    public String getGrammarFileName() { return "C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g"; }



    /**
     * CSS DOM object.
     */
    protected CSSDocument model;

    /**
     * Every definition object needs the token stream to compute source location.
     */
    private final TokenStream tokenStream = getTreeNodeStream().getTokenStream();

    /**
     * Tree walker problems.
     */
    protected List<CSSParserProblem> problems = new ArrayList<CSSParserProblem>();

    /**
     * Collect problems.
     */
    @Override
    public void displayRecognitionError(String[] tokenNames, RecognitionException e)
    {
        problems.add(CSSParserProblem.create(this, tokenNames, e));
    }


    protected static class stylesheet_scope {
        // namespace declarations are buffered in this map
            List<CSSNamespaceDefinition> namespaces;
        // ruleset definitions are buffered in this list
            List<CSSRule> rules;
        // font-face declarations are buffered in this list
            List<CSSFontFace> fontFaces;
    }
    protected Stack stylesheet_stack = new Stack();

    public static class stylesheet_return extends TreeRuleReturnScope {
    };

    // $ANTLR start "stylesheet"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:91:1: stylesheet : ( namespaceStatement | fontFace | mediaQuery | ruleset )* ;
    public final CSSTree.stylesheet_return stylesheet() throws RecognitionException {
        stylesheet_stack.push(new stylesheet_scope());
        CSSTree.stylesheet_return retval = new CSSTree.stylesheet_return();
        retval.start = input.LT(1);


            ((stylesheet_scope)stylesheet_stack.peek()).rules = new ArrayList<CSSRule>();
            ((stylesheet_scope)stylesheet_stack.peek()).namespaces = new ArrayList<CSSNamespaceDefinition>();
            ((stylesheet_scope)stylesheet_stack.peek()).fontFaces = new ArrayList<CSSFontFace>();

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:115:5: ( ( namespaceStatement | fontFace | mediaQuery | ruleset )* )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:115:9: ( namespaceStatement | fontFace | mediaQuery | ruleset )*
            {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:115:9: ( namespaceStatement | fontFace | mediaQuery | ruleset )*
            loop1:
            do {
                int alt1=5;
                switch ( input.LA(1) ) {
                case AT_NAMESPACE:
                    {
                    alt1=1;
                    }
                    break;
                case AT_FONT_FACE:
                    {
                    alt1=2;
                    }
                    break;
                case AT_MEDIA:
                    {
                    alt1=3;
                    }
                    break;
                case I_RULE:
                    {
                    alt1=4;
                    }
                    break;

                }

                switch (alt1) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:115:11: namespaceStatement
            	    {
            	    pushFollow(FOLLOW_namespaceStatement_in_stylesheet94);
            	    namespaceStatement();

            	    state._fsp--;


            	    }
            	    break;
            	case 2 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:115:32: fontFace
            	    {
            	    pushFollow(FOLLOW_fontFace_in_stylesheet98);
            	    fontFace();

            	    state._fsp--;


            	    }
            	    break;
            	case 3 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:115:43: mediaQuery
            	    {
            	    pushFollow(FOLLOW_mediaQuery_in_stylesheet102);
            	    mediaQuery();

            	    state._fsp--;


            	    }
            	    break;
            	case 4 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:115:56: ruleset
            	    {
            	    pushFollow(FOLLOW_ruleset_in_stylesheet106);
            	    ruleset();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);


            }


                model = new CSSDocument(((stylesheet_scope)stylesheet_stack.peek()).rules, 
                                        ((stylesheet_scope)stylesheet_stack.peek()).namespaces, 
                                        ((stylesheet_scope)stylesheet_stack.peek()).fontFaces,
                                        ((CommonTree)retval.start),
                                        tokenStream);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            stylesheet_stack.pop();
        }
        return retval;
    }
    // $ANTLR end "stylesheet"

    public static class namespaceStatement_return extends TreeRuleReturnScope {
    };

    // $ANTLR start "namespaceStatement"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:118:1: namespaceStatement : ^( AT_NAMESPACE (id= ID )? uri= STRING ) ;
    public final CSSTree.namespaceStatement_return namespaceStatement() throws RecognitionException {
        CSSTree.namespaceStatement_return retval = new CSSTree.namespaceStatement_return();
        retval.start = input.LT(1);

        CommonTree id=null;
        CommonTree uri=null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:125:5: ( ^( AT_NAMESPACE (id= ID )? uri= STRING ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:125:9: ^( AT_NAMESPACE (id= ID )? uri= STRING )
            {
            match(input,AT_NAMESPACE,FOLLOW_AT_NAMESPACE_in_namespaceStatement142); 

            match(input, Token.DOWN, null); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:125:26: (id= ID )?
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==ID) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:125:26: id= ID
                    {
                    id=(CommonTree)match(input,ID,FOLLOW_ID_in_namespaceStatement146); 

                    }
                    break;

            }

            uri=(CommonTree)match(input,STRING,FOLLOW_STRING_in_namespaceStatement151); 

            match(input, Token.UP, null); 

            }

             
                final CSSNamespaceDefinition ns = new CSSNamespaceDefinition(
                        (id!=null?id.getText():null), (uri!=null?uri.getText():null), ((CommonTree)retval.start), tokenStream);
                ((stylesheet_scope)stylesheet_stack.peek()).namespaces.add(ns); 

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "namespaceStatement"

    protected static class mediaQuery_scope {
        // media query condition clauses are buffered in this list
            List<CSSMediaQueryCondition> conditions;
    }
    protected Stack mediaQuery_stack = new Stack();


    // $ANTLR start "mediaQuery"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:128:1: mediaQuery : ^( AT_MEDIA medium ( ruleset )* ) ;
    public final void mediaQuery() throws RecognitionException {
        mediaQuery_stack.push(new mediaQuery_scope());
         
            ((mediaQuery_scope)mediaQuery_stack.peek()).conditions = new ArrayList<CSSMediaQueryCondition>(); 

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:138:5: ( ^( AT_MEDIA medium ( ruleset )* ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:138:9: ^( AT_MEDIA medium ( ruleset )* )
            {
            match(input,AT_MEDIA,FOLLOW_AT_MEDIA_in_mediaQuery185); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_medium_in_mediaQuery187);
            medium();

            state._fsp--;

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:138:27: ( ruleset )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( (LA3_0==I_RULE) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:138:27: ruleset
            	    {
            	    pushFollow(FOLLOW_ruleset_in_mediaQuery189);
            	    ruleset();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop3;
                }
            } while (true);


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            mediaQuery_stack.pop();
        }
        return ;
    }
    // $ANTLR end "mediaQuery"


    // $ANTLR start "medium"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:141:1: medium : ^( I_MEDIUM_CONDITIONS ( mediumCondition )* ) ;
    public final void medium() throws RecognitionException {
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:142:5: ( ^( I_MEDIUM_CONDITIONS ( mediumCondition )* ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:142:9: ^( I_MEDIUM_CONDITIONS ( mediumCondition )* )
            {
            match(input,I_MEDIUM_CONDITIONS,FOLLOW_I_MEDIUM_CONDITIONS_in_medium214); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:142:31: ( mediumCondition )*
                loop4:
                do {
                    int alt4=2;
                    int LA4_0 = input.LA(1);

                    if ( (LA4_0==ID||LA4_0==ARGUMENTS) ) {
                        alt4=1;
                    }


                    switch (alt4) {
                	case 1 :
                	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:142:31: mediumCondition
                	    {
                	    pushFollow(FOLLOW_mediumCondition_in_medium216);
                	    mediumCondition();

                	    state._fsp--;


                	    }
                	    break;

                	default :
                	    break loop4;
                    }
                } while (true);


                match(input, Token.UP, null); 
            }

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "medium"

    public static class mediumCondition_return extends TreeRuleReturnScope {
    };

    // $ANTLR start "mediumCondition"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:145:1: mediumCondition : ( ID | ARGUMENTS );
    public final CSSTree.mediumCondition_return mediumCondition() throws RecognitionException {
        CSSTree.mediumCondition_return retval = new CSSTree.mediumCondition_return();
        retval.start = input.LT(1);

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:150:5: ( ID | ARGUMENTS )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:
            {
            if ( input.LA(1)==ID||input.LA(1)==ARGUMENTS ) {
                input.consume();
                state.errorRecovery=false;
            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                throw mse;
            }


            }

             
                ((mediaQuery_scope)mediaQuery_stack.peek()).conditions.add(new CSSMediaQueryCondition(((CommonTree)retval.start), tokenStream)); 

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "mediumCondition"

    public static class fontFace_return extends TreeRuleReturnScope {
    };

    // $ANTLR start "fontFace"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:153:1: fontFace : ^( AT_FONT_FACE d= declarationsBlock ) ;
    public final CSSTree.fontFace_return fontFace() throws RecognitionException {
        CSSTree.fontFace_return retval = new CSSTree.fontFace_return();
        retval.start = input.LT(1);

        List<CSSProperty> d = null;


        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:159:5: ( ^( AT_FONT_FACE d= declarationsBlock ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:159:9: ^( AT_FONT_FACE d= declarationsBlock )
            {
            match(input,AT_FONT_FACE,FOLLOW_AT_FONT_FACE_in_fontFace279); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_declarationsBlock_in_fontFace283);
            d=declarationsBlock();

            state._fsp--;


            match(input, Token.UP, null); 

            }


                final CSSFontFace fontFace = new CSSFontFace(d, ((CommonTree)retval.start), tokenStream);
                ((stylesheet_scope)stylesheet_stack.peek()).fontFaces.add(fontFace);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "fontFace"

    protected static class ruleset_scope {
        // list of subject selectors
            List<CSSSelector> subjects;
    }
    protected Stack ruleset_stack = new Stack();

    public static class ruleset_return extends TreeRuleReturnScope {
    };

    // $ANTLR start "ruleset"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:162:1: ruleset : ^( I_RULE selectorGroup d= declarationsBlock ) ;
    public final CSSTree.ruleset_return ruleset() throws RecognitionException {
        ruleset_stack.push(new ruleset_scope());
        CSSTree.ruleset_return retval = new CSSTree.ruleset_return();
        retval.start = input.LT(1);

        List<CSSProperty> d = null;



            ((ruleset_scope)ruleset_stack.peek()).subjects = new ArrayList<CSSSelector>();

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:188:5: ( ^( I_RULE selectorGroup d= declarationsBlock ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:188:9: ^( I_RULE selectorGroup d= declarationsBlock )
            {
            match(input,I_RULE,FOLLOW_I_RULE_in_ruleset323); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_selectorGroup_in_ruleset325);
            selectorGroup();

            state._fsp--;

            pushFollow(FOLLOW_declarationsBlock_in_ruleset329);
            d=declarationsBlock();

            state._fsp--;


            match(input, Token.UP, null); 

            }


                final List<CSSMediaQueryCondition> mediaQueryConditions;
                if (mediaQuery_stack.isEmpty())
                    mediaQueryConditions = null;
                else
                    mediaQueryConditions = ((mediaQuery_scope)mediaQuery_stack.peek()).conditions;
                
                final CSSRule cssRule = new CSSRule(
                        mediaQueryConditions,
                        ((ruleset_scope)ruleset_stack.peek()).subjects,
                        d, 
                        ((CommonTree)retval.start), 
                        tokenStream);
                ((stylesheet_scope)stylesheet_stack.peek()).rules.add(cssRule);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            ruleset_stack.pop();
        }
        return retval;
    }
    // $ANTLR end "ruleset"


    // $ANTLR start "selectorGroup"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:191:1: selectorGroup : ^( I_SELECTOR_GROUP ( compoundSelector )+ ) ;
    public final void selectorGroup() throws RecognitionException {
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:192:5: ( ^( I_SELECTOR_GROUP ( compoundSelector )+ ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:192:8: ^( I_SELECTOR_GROUP ( compoundSelector )+ )
            {
            match(input,I_SELECTOR_GROUP,FOLLOW_I_SELECTOR_GROUP_in_selectorGroup349); 

            match(input, Token.DOWN, null); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:192:27: ( compoundSelector )+
            int cnt5=0;
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);

                if ( (LA5_0==I_SELECTOR) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:192:27: compoundSelector
            	    {
            	    pushFollow(FOLLOW_compoundSelector_in_selectorGroup351);
            	    compoundSelector();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    if ( cnt5 >= 1 ) break loop5;
                        EarlyExitException eee =
                            new EarlyExitException(5, input);
                        throw eee;
                }
                cnt5++;
            } while (true);


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "selectorGroup"


    // $ANTLR start "compoundSelector"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:195:1: compoundSelector : ^( I_SELECTOR ( simpleSelector[simpleSelectorStack] )+ ) ;
    public final void compoundSelector() throws RecognitionException {

            final Stack<CSSSelector> simpleSelectorStack = new Stack<CSSSelector>();

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:204:5: ( ^( I_SELECTOR ( simpleSelector[simpleSelectorStack] )+ ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:204:9: ^( I_SELECTOR ( simpleSelector[simpleSelectorStack] )+ )
            {
            match(input,I_SELECTOR,FOLLOW_I_SELECTOR_in_compoundSelector387); 

            match(input, Token.DOWN, null); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:204:22: ( simpleSelector[simpleSelectorStack] )+
            int cnt6=0;
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);

                if ( (LA6_0==I_SIMPLE_SELECTOR) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:204:22: simpleSelector[simpleSelectorStack]
            	    {
            	    pushFollow(FOLLOW_simpleSelector_in_compoundSelector389);
            	    simpleSelector(simpleSelectorStack);

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    if ( cnt6 >= 1 ) break loop6;
                        EarlyExitException eee =
                            new EarlyExitException(6, input);
                        throw eee;
                }
                cnt6++;
            } while (true);


            match(input, Token.UP, null); 

            }


                ((ruleset_scope)ruleset_stack.peek()).subjects.add(simpleSelectorStack.peek());

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "compoundSelector"

    protected static class simpleSelector_scope {
        String namespace;
        String element;
        List<CSSSelectorCondition> conditions;
    }
    protected Stack simpleSelector_stack = new Stack();

    public static class simpleSelector_return extends TreeRuleReturnScope {
    };

    // $ANTLR start "simpleSelector"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:207:1: simpleSelector[Stack<CSSSelector> simpleSelectorStack] : ^( I_SIMPLE_SELECTOR ( simpleSelectorFraction )+ ) ;
    public final CSSTree.simpleSelector_return simpleSelector(Stack<CSSSelector> simpleSelectorStack) throws RecognitionException {
        simpleSelector_stack.push(new simpleSelector_scope());
        CSSTree.simpleSelector_return retval = new CSSTree.simpleSelector_return();
        retval.start = input.LT(1);


            ((simpleSelector_scope)simpleSelector_stack.peek()).conditions = new ArrayList<CSSSelectorCondition>();
            final CSSCombinator combinator ;
            if (simpleSelectorStack.isEmpty())
                combinator = null;
            else                    
                combinator = new CSSCombinator(simpleSelectorStack.peek(), CombinatorType.DESCENDANT);

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:234:5: ( ^( I_SIMPLE_SELECTOR ( simpleSelectorFraction )+ ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:234:9: ^( I_SIMPLE_SELECTOR ( simpleSelectorFraction )+ )
            {
            match(input,I_SIMPLE_SELECTOR,FOLLOW_I_SIMPLE_SELECTOR_in_simpleSelector435); 

            match(input, Token.DOWN, null); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:234:29: ( simpleSelectorFraction )+
            int cnt7=0;
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);

                if ( (LA7_0==ID||(LA7_0>=DOT && LA7_0<=STAR)) ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:234:29: simpleSelectorFraction
            	    {
            	    pushFollow(FOLLOW_simpleSelectorFraction_in_simpleSelector437);
            	    simpleSelectorFraction();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    if ( cnt7 >= 1 ) break loop7;
                        EarlyExitException eee =
                            new EarlyExitException(7, input);
                        throw eee;
                }
                cnt7++;
            } while (true);


            match(input, Token.UP, null); 

            }


                final CSSSelector simpleSelector = new CSSSelector(
                    combinator,
                    ((simpleSelector_scope)simpleSelector_stack.peek()).element,
                    ((simpleSelector_scope)simpleSelector_stack.peek()).namespace,
                    ((simpleSelector_scope)simpleSelector_stack.peek()).conditions, 
                    ((CommonTree)retval.start), 
                    tokenStream);
                simpleSelectorStack.push(simpleSelector);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            simpleSelector_stack.pop();
        }
        return retval;
    }
    // $ANTLR end "simpleSelector"


    // $ANTLR start "simpleSelectorFraction"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:237:1: simpleSelectorFraction : ( elementSelector | conditionSelector );
    public final void simpleSelectorFraction() throws RecognitionException {
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:238:5: ( elementSelector | conditionSelector )
            int alt8=2;
            int LA8_0 = input.LA(1);

            if ( (LA8_0==ID||(LA8_0>=PIPE && LA8_0<=STAR)) ) {
                alt8=1;
            }
            else if ( ((LA8_0>=DOT && LA8_0<=COLON)) ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:238:9: elementSelector
                    {
                    pushFollow(FOLLOW_elementSelector_in_simpleSelectorFraction466);
                    elementSelector();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:239:9: conditionSelector
                    {
                    pushFollow(FOLLOW_conditionSelector_in_simpleSelectorFraction476);
                    conditionSelector();

                    state._fsp--;


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "simpleSelectorFraction"

    public static class conditionSelector_return extends TreeRuleReturnScope {
    };

    // $ANTLR start "conditionSelector"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:242:1: conditionSelector : ( ^( DOT c= ID ) | HASH_WORD | ^( COLON s= ID ) );
    public final CSSTree.conditionSelector_return conditionSelector() throws RecognitionException {
        CSSTree.conditionSelector_return retval = new CSSTree.conditionSelector_return();
        retval.start = input.LT(1);

        CommonTree c=null;
        CommonTree s=null;
        CommonTree HASH_WORD1=null;


            ConditionType type = null;
            String name = null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:253:5: ( ^( DOT c= ID ) | HASH_WORD | ^( COLON s= ID ) )
            int alt9=3;
            switch ( input.LA(1) ) {
            case DOT:
                {
                alt9=1;
                }
                break;
            case HASH_WORD:
                {
                alt9=2;
                }
                break;
            case COLON:
                {
                alt9=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 9, 0, input);

                throw nvae;
            }

            switch (alt9) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:253:9: ^( DOT c= ID )
                    {
                    match(input,DOT,FOLLOW_DOT_in_conditionSelector510); 

                    match(input, Token.DOWN, null); 
                    c=(CommonTree)match(input,ID,FOLLOW_ID_in_conditionSelector514); 

                    match(input, Token.UP, null); 
                     type = ConditionType.CLASS; name = (c!=null?c.getText():null); 

                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:254:9: HASH_WORD
                    {
                    HASH_WORD1=(CommonTree)match(input,HASH_WORD,FOLLOW_HASH_WORD_in_conditionSelector531); 
                     type = ConditionType.ID; name = (HASH_WORD1!=null?HASH_WORD1.getText():null).substring(1); 

                    }
                    break;
                case 3 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:255:9: ^( COLON s= ID )
                    {
                    match(input,COLON,FOLLOW_COLON_in_conditionSelector546); 

                    match(input, Token.DOWN, null); 
                    s=(CommonTree)match(input,ID,FOLLOW_ID_in_conditionSelector550); 

                    match(input, Token.UP, null); 
                     type = ConditionType.PSEUDO; name = (s!=null?s.getText():null); 

                    }
                    break;

            }

                ((simpleSelector_scope)simpleSelector_stack.peek()).conditions.add(
                    new CSSSelectorCondition(name, type, ((CommonTree)retval.start), tokenStream));

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "conditionSelector"


    // $ANTLR start "elementSelector"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:258:1: elementSelector : ( ^( PIPE ns= ID e1= ID ) | e2= ID | STAR );
    public final void elementSelector() throws RecognitionException {
        CommonTree ns=null;
        CommonTree e1=null;
        CommonTree e2=null;
        CommonTree STAR2=null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:259:5: ( ^( PIPE ns= ID e1= ID ) | e2= ID | STAR )
            int alt10=3;
            switch ( input.LA(1) ) {
            case PIPE:
                {
                alt10=1;
                }
                break;
            case ID:
                {
                alt10=2;
                }
                break;
            case STAR:
                {
                alt10=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 10, 0, input);

                throw nvae;
            }

            switch (alt10) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:259:9: ^( PIPE ns= ID e1= ID )
                    {
                    match(input,PIPE,FOLLOW_PIPE_in_elementSelector576); 

                    match(input, Token.DOWN, null); 
                    ns=(CommonTree)match(input,ID,FOLLOW_ID_in_elementSelector580); 
                    e1=(CommonTree)match(input,ID,FOLLOW_ID_in_elementSelector584); 

                    match(input, Token.UP, null); 
                     ((simpleSelector_scope)simpleSelector_stack.peek()).element = (e1!=null?e1.getText():null); 
                              ((simpleSelector_scope)simpleSelector_stack.peek()).namespace = (ns!=null?ns.getText():null); 

                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:262:9: e2= ID
                    {
                    e2=(CommonTree)match(input,ID,FOLLOW_ID_in_elementSelector609); 
                     ((simpleSelector_scope)simpleSelector_stack.peek()).element = (e2!=null?e2.getText():null); 

                    }
                    break;
                case 3 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:264:9: STAR
                    {
                    STAR2=(CommonTree)match(input,STAR,FOLLOW_STAR_in_elementSelector642); 
                     ((simpleSelector_scope)simpleSelector_stack.peek()).element = (STAR2!=null?STAR2.getText():null); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "elementSelector"


    // $ANTLR start "declarationsBlock"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:268:1: declarationsBlock returns [List<CSSProperty> properties] : ^( I_DECL ( declaration )* ) ;
    public final List<CSSProperty> declarationsBlock() throws RecognitionException {
        List<CSSProperty> properties = null;

        CSSTree.declaration_return declaration3 = null;



            properties = new ArrayList<CSSProperty>();

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:273:5: ( ^( I_DECL ( declaration )* ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:273:9: ^( I_DECL ( declaration )* )
            {
            match(input,I_DECL,FOLLOW_I_DECL_in_declarationsBlock697); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:273:18: ( declaration )*
                loop11:
                do {
                    int alt11=2;
                    int LA11_0 = input.LA(1);

                    if ( (LA11_0==COLON) ) {
                        alt11=1;
                    }


                    switch (alt11) {
                	case 1 :
                	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:273:19: declaration
                	    {
                	    pushFollow(FOLLOW_declaration_in_declarationsBlock700);
                	    declaration3=declaration();

                	    state._fsp--;

                	     
                	                 if ((declaration3!=null?declaration3.property:null) != null)
                	                     properties.add((declaration3!=null?declaration3.property:null)); 
                	             

                	    }
                	    break;

                	default :
                	    break loop11;
                    }
                } while (true);


                match(input, Token.UP, null); 
            }

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return properties;
    }
    // $ANTLR end "declarationsBlock"

    public static class declaration_return extends TreeRuleReturnScope {
        public CSSProperty property;
    };

    // $ANTLR start "declaration"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:281:1: declaration returns [CSSProperty property] : ^( COLON id= ID v= value ) ;
    public final CSSTree.declaration_return declaration() throws RecognitionException {
        CSSTree.declaration_return retval = new CSSTree.declaration_return();
        retval.start = input.LT(1);

        CommonTree id=null;
        CSSTree.value_return v = null;


        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:287:5: ( ^( COLON id= ID v= value ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:287:9: ^( COLON id= ID v= value )
            {
            match(input,COLON,FOLLOW_COLON_in_declaration754); 

            match(input, Token.DOWN, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_declaration758); 
            pushFollow(FOLLOW_value_in_declaration762);
            v=value();

            state._fsp--;


            match(input, Token.UP, null); 

            }


                if ((id!=null?id.getText():null) != null && (v!=null?v.propertyValue:null) != null)
                    retval.property = new CSSProperty((id!=null?id.getText():null), (v!=null?v.propertyValue:null), ((CommonTree)retval.start), tokenStream);  

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "declaration"

    public static class value_return extends TreeRuleReturnScope {
        public CSSPropertyValue propertyValue;
    };

    // $ANTLR start "value"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:290:1: value returns [CSSPropertyValue propertyValue] : ( ^( I_ARRAY (s1= singleValue )+ ) | s2= singleValue );
    public final CSSTree.value_return value() throws RecognitionException {
        CSSTree.value_return retval = new CSSTree.value_return();
        retval.start = input.LT(1);

        CSSTree.singleValue_return s1 = null;

        CSSTree.singleValue_return s2 = null;


        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:291:5: ( ^( I_ARRAY (s1= singleValue )+ ) | s2= singleValue )
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0==I_ARRAY) ) {
                alt13=1;
            }
            else if ( ((LA13_0>=ID && LA13_0<=STRING)||LA13_0==HASH_WORD||(LA13_0>=NUMBER_WITH_UNIT && LA13_0<=LOCAL)) ) {
                alt13=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 13, 0, input);

                throw nvae;
            }
            switch (alt13) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:291:9: ^( I_ARRAY (s1= singleValue )+ )
                    {
                    match(input,I_ARRAY,FOLLOW_I_ARRAY_in_value792); 

                     final List<CSSPropertyValue> array = new ArrayList<CSSPropertyValue>(); 

                    match(input, Token.DOWN, null); 
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:293:12: (s1= singleValue )+
                    int cnt12=0;
                    loop12:
                    do {
                        int alt12=2;
                        int LA12_0 = input.LA(1);

                        if ( ((LA12_0>=ID && LA12_0<=STRING)||LA12_0==HASH_WORD||(LA12_0>=NUMBER_WITH_UNIT && LA12_0<=LOCAL)) ) {
                            alt12=1;
                        }


                        switch (alt12) {
                    	case 1 :
                    	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:293:14: s1= singleValue
                    	    {
                    	    pushFollow(FOLLOW_singleValue_in_value842);
                    	    s1=singleValue();

                    	    state._fsp--;

                    	     array.add((s1!=null?s1.propertyValue:null)); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt12 >= 1 ) break loop12;
                                EarlyExitException eee =
                                    new EarlyExitException(12, input);
                                throw eee;
                        }
                        cnt12++;
                    } while (true);


                    match(input, Token.UP, null); 
                     retval.propertyValue = new CSSArrayPropertyValue(array, ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:295:9: s2= singleValue
                    {
                    pushFollow(FOLLOW_singleValue_in_value893);
                    s2=singleValue();

                    state._fsp--;

                     retval.propertyValue = (s2!=null?s2.propertyValue:null); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "value"

    public static class singleValue_return extends TreeRuleReturnScope {
        public CSSPropertyValue propertyValue;
    };

    // $ANTLR start "singleValue"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:298:1: singleValue returns [CSSPropertyValue propertyValue] : ( NUMBER_WITH_UNIT | HASH_WORD | ^( CLASS_REFERENCE cr= ARGUMENTS ) | ^( PROPERTY_REFERENCE pr= ARGUMENTS ) | ^( EMBED es= ARGUMENTS ) | ^( URL url= ARGUMENTS ) | ^( LOCAL l= ARGUMENTS ) | s= STRING | ID );
    public final CSSTree.singleValue_return singleValue() throws RecognitionException {
        CSSTree.singleValue_return retval = new CSSTree.singleValue_return();
        retval.start = input.LT(1);

        CommonTree cr=null;
        CommonTree pr=null;
        CommonTree es=null;
        CommonTree url=null;
        CommonTree l=null;
        CommonTree s=null;
        CommonTree NUMBER_WITH_UNIT4=null;
        CommonTree CLASS_REFERENCE5=null;
        CommonTree PROPERTY_REFERENCE6=null;
        CommonTree EMBED7=null;
        CommonTree URL8=null;
        CommonTree LOCAL9=null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:299:5: ( NUMBER_WITH_UNIT | HASH_WORD | ^( CLASS_REFERENCE cr= ARGUMENTS ) | ^( PROPERTY_REFERENCE pr= ARGUMENTS ) | ^( EMBED es= ARGUMENTS ) | ^( URL url= ARGUMENTS ) | ^( LOCAL l= ARGUMENTS ) | s= STRING | ID )
            int alt14=9;
            switch ( input.LA(1) ) {
            case NUMBER_WITH_UNIT:
                {
                alt14=1;
                }
                break;
            case HASH_WORD:
                {
                alt14=2;
                }
                break;
            case CLASS_REFERENCE:
                {
                alt14=3;
                }
                break;
            case PROPERTY_REFERENCE:
                {
                alt14=4;
                }
                break;
            case EMBED:
                {
                alt14=5;
                }
                break;
            case URL:
                {
                alt14=6;
                }
                break;
            case LOCAL:
                {
                alt14=7;
                }
                break;
            case STRING:
                {
                alt14=8;
                }
                break;
            case ID:
                {
                alt14=9;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 14, 0, input);

                throw nvae;
            }

            switch (alt14) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:299:9: NUMBER_WITH_UNIT
                    {
                    NUMBER_WITH_UNIT4=(CommonTree)match(input,NUMBER_WITH_UNIT,FOLLOW_NUMBER_WITH_UNIT_in_singleValue931); 
                     retval.propertyValue = new CSSNumberPropertyValue((NUMBER_WITH_UNIT4!=null?NUMBER_WITH_UNIT4.getText():null), ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:301:9: HASH_WORD
                    {
                    match(input,HASH_WORD,FOLLOW_HASH_WORD_in_singleValue954); 
                     retval.propertyValue = new CSSColorPropertyValue(((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 3 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:303:9: ^( CLASS_REFERENCE cr= ARGUMENTS )
                    {
                    CLASS_REFERENCE5=(CommonTree)match(input,CLASS_REFERENCE,FOLLOW_CLASS_REFERENCE_in_singleValue984); 

                    match(input, Token.DOWN, null); 
                    cr=(CommonTree)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue988); 

                    match(input, Token.UP, null); 
                     retval.propertyValue = new CSSFunctionCallPropertyValue((CLASS_REFERENCE5!=null?CLASS_REFERENCE5.getText():null), (cr!=null?cr.getText():null), ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 4 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:305:9: ^( PROPERTY_REFERENCE pr= ARGUMENTS )
                    {
                    PROPERTY_REFERENCE6=(CommonTree)match(input,PROPERTY_REFERENCE,FOLLOW_PROPERTY_REFERENCE_in_singleValue1010); 

                    match(input, Token.DOWN, null); 
                    pr=(CommonTree)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1014); 

                    match(input, Token.UP, null); 
                     retval.propertyValue = new CSSFunctionCallPropertyValue((PROPERTY_REFERENCE6!=null?PROPERTY_REFERENCE6.getText():null), (pr!=null?pr.getText():null), ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 5 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:307:9: ^( EMBED es= ARGUMENTS )
                    {
                    EMBED7=(CommonTree)match(input,EMBED,FOLLOW_EMBED_in_singleValue1036); 

                    match(input, Token.DOWN, null); 
                    es=(CommonTree)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1040); 

                    match(input, Token.UP, null); 
                     retval.propertyValue = new CSSFunctionCallPropertyValue((EMBED7!=null?EMBED7.getText():null), (es!=null?es.getText():null), ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 6 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:309:9: ^( URL url= ARGUMENTS )
                    {
                    URL8=(CommonTree)match(input,URL,FOLLOW_URL_in_singleValue1062); 

                    match(input, Token.DOWN, null); 
                    url=(CommonTree)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1066); 

                    match(input, Token.UP, null); 
                     retval.propertyValue = new CSSFunctionCallPropertyValue((URL8!=null?URL8.getText():null), (url!=null?url.getText():null), ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 7 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:311:9: ^( LOCAL l= ARGUMENTS )
                    {
                    LOCAL9=(CommonTree)match(input,LOCAL,FOLLOW_LOCAL_in_singleValue1088); 

                    match(input, Token.DOWN, null); 
                    l=(CommonTree)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1092); 

                    match(input, Token.UP, null); 
                     retval.propertyValue = new CSSFunctionCallPropertyValue((LOCAL9!=null?LOCAL9.getText():null), (l!=null?l.getText():null), ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 8 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:313:9: s= STRING
                    {
                    s=(CommonTree)match(input,STRING,FOLLOW_STRING_in_singleValue1115); 
                     retval.propertyValue = new CSSStringPropertyValue((s!=null?s.getText():null), ((CommonTree)retval.start), tokenStream); 

                    }
                    break;
                case 9 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:315:9: ID
                    {
                    match(input,ID,FOLLOW_ID_in_singleValue1157); 
                     retval.propertyValue = CSSKeywordPropertyValue.create(((CommonTree)retval.start), tokenStream); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "singleValue"

    public static class argumentList_return extends TreeRuleReturnScope {
        public List<String> labels;
        public List<String> values;
    };

    // $ANTLR start "argumentList"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:319:1: argumentList returns [List<String> labels, List<String> values] : ( argument[$labels, $values] )+ ;
    public final CSSTree.argumentList_return argumentList() throws RecognitionException {
        CSSTree.argumentList_return retval = new CSSTree.argumentList_return();
        retval.start = input.LT(1);


            retval.labels = new ArrayList<String>(3);
            retval.values = new ArrayList<String>(3);

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:325:5: ( ( argument[$labels, $values] )+ )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:325:9: ( argument[$labels, $values] )+
            {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:325:9: ( argument[$labels, $values] )+
            int cnt15=0;
            loop15:
            do {
                int alt15=2;
                int LA15_0 = input.LA(1);

                if ( (LA15_0==EQUALS) ) {
                    alt15=1;
                }


                switch (alt15) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:325:9: argument[$labels, $values]
            	    {
            	    pushFollow(FOLLOW_argument_in_argumentList1201);
            	    argument(retval.labels, retval.values);

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    if ( cnt15 >= 1 ) break loop15;
                        EarlyExitException eee =
                            new EarlyExitException(15, input);
                        throw eee;
                }
                cnt15++;
            } while (true);


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "argumentList"


    // $ANTLR start "argument"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:328:1: argument[List<String> labels, List<String> values] : ^( EQUALS (l= ID )? v= STRING ) ;
    public final void argument(List<String> labels, List<String> values) throws RecognitionException {
        CommonTree l=null;
        CommonTree v=null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:335:5: ( ^( EQUALS (l= ID )? v= STRING ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:335:9: ^( EQUALS (l= ID )? v= STRING )
            {
            match(input,EQUALS,FOLLOW_EQUALS_in_argument1234); 

            match(input, Token.DOWN, null); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:335:19: (l= ID )?
            int alt16=2;
            int LA16_0 = input.LA(1);

            if ( (LA16_0==ID) ) {
                alt16=1;
            }
            switch (alt16) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSSTree.g:335:19: l= ID
                    {
                    l=(CommonTree)match(input,ID,FOLLOW_ID_in_argument1238); 

                    }
                    break;

            }

            v=(CommonTree)match(input,STRING,FOLLOW_STRING_in_argument1243); 

            match(input, Token.UP, null); 

            }


                // Use null for argument without label.
                labels.add((l!=null?l.getText():null));
                values.add((v!=null?v.getText():null)); 

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "argument"

    // Delegated rules


 

    public static final BitSet FOLLOW_namespaceStatement_in_stylesheet94 = new BitSet(new long[]{0x0000000000111082L});
    public static final BitSet FOLLOW_fontFace_in_stylesheet98 = new BitSet(new long[]{0x0000000000111082L});
    public static final BitSet FOLLOW_mediaQuery_in_stylesheet102 = new BitSet(new long[]{0x0000000000111082L});
    public static final BitSet FOLLOW_ruleset_in_stylesheet106 = new BitSet(new long[]{0x0000000000111082L});
    public static final BitSet FOLLOW_AT_NAMESPACE_in_namespaceStatement142 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_namespaceStatement146 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_STRING_in_namespaceStatement151 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_AT_MEDIA_in_mediaQuery185 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_medium_in_mediaQuery187 = new BitSet(new long[]{0x0000000000111088L});
    public static final BitSet FOLLOW_ruleset_in_mediaQuery189 = new BitSet(new long[]{0x0000000000111088L});
    public static final BitSet FOLLOW_I_MEDIUM_CONDITIONS_in_medium214 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_mediumCondition_in_medium216 = new BitSet(new long[]{0x0000000000082008L});
    public static final BitSet FOLLOW_set_in_mediumCondition0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_AT_FONT_FACE_in_fontFace279 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_declarationsBlock_in_fontFace283 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_I_RULE_in_ruleset323 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_selectorGroup_in_ruleset325 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_declarationsBlock_in_ruleset329 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_I_SELECTOR_GROUP_in_selectorGroup349 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_compoundSelector_in_selectorGroup351 = new BitSet(new long[]{0x0000000000000208L});
    public static final BitSet FOLLOW_I_SELECTOR_in_compoundSelector387 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_simpleSelector_in_compoundSelector389 = new BitSet(new long[]{0x0000000000000408L});
    public static final BitSet FOLLOW_I_SIMPLE_SELECTOR_in_simpleSelector435 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_simpleSelectorFraction_in_simpleSelector437 = new BitSet(new long[]{0x0000000007C02008L});
    public static final BitSet FOLLOW_elementSelector_in_simpleSelectorFraction466 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_conditionSelector_in_simpleSelectorFraction476 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DOT_in_conditionSelector510 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_conditionSelector514 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_HASH_WORD_in_conditionSelector531 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_COLON_in_conditionSelector546 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_conditionSelector550 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PIPE_in_elementSelector576 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_elementSelector580 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_ID_in_elementSelector584 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_elementSelector609 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STAR_in_elementSelector642 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_I_DECL_in_declarationsBlock697 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_declaration_in_declarationsBlock700 = new BitSet(new long[]{0x0000000001000008L});
    public static final BitSet FOLLOW_COLON_in_declaration754 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_declaration758 = new BitSet(new long[]{0x00000001F8806800L});
    public static final BitSet FOLLOW_value_in_declaration762 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_I_ARRAY_in_value792 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_singleValue_in_value842 = new BitSet(new long[]{0x00000001F8806808L});
    public static final BitSet FOLLOW_singleValue_in_value893 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_WITH_UNIT_in_singleValue931 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_HASH_WORD_in_singleValue954 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CLASS_REFERENCE_in_singleValue984 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue988 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PROPERTY_REFERENCE_in_singleValue1010 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1014 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_EMBED_in_singleValue1036 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1040 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_URL_in_singleValue1062 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1066 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_LOCAL_in_singleValue1088 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1092 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_STRING_in_singleValue1115 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_singleValue1157 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_argument_in_argumentList1201 = new BitSet(new long[]{0x0000000400000002L});
    public static final BitSet FOLLOW_EQUALS_in_argument1234 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_argument1238 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_STRING_in_argument1243 = new BitSet(new long[]{0x0000000000000008L});

}
