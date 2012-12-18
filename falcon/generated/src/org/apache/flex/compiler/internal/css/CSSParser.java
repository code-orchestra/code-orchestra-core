// $ANTLR 3.3 Nov 30, 2010 12:50:56 C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g 2012-10-02 17:55:21

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
import org.apache.flex.compiler.problems.CSSParserProblem;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

/**
 * This is a grammar for advanced CSS in Flex. It parses the CSS document and
 * generate DOM objects.
 */
@SuppressWarnings("unused")
public class CSSParser extends Parser {
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


        public CSSParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public CSSParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        
    protected TreeAdaptor adaptor = new CommonTreeAdaptor();

    public void setTreeAdaptor(TreeAdaptor adaptor) {
        this.adaptor = adaptor;
    }
    public TreeAdaptor getTreeAdaptor() {
        return adaptor;
    }

    public String[] getTokenNames() { return CSSParser.tokenNames; }
    public String getGrammarFileName() { return "C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g"; }



    /**
     * Parser problems.
     */
    protected List<CSSParserProblem> problems = new ArrayList<CSSParserProblem>();

    /**
     * Collect parser problems.
     */
    @Override
    public void displayRecognitionError(String[] tokenNames, RecognitionException e)
    {
        problems.add(CSSParserProblem.create(this, tokenNames, e));
    }

    /**
     * Check if the cursor is at the end of a simple selector.
     */
    private final boolean endOfSimpleSelector()
    {
        final CommonToken nextToken = (CommonToken) getTokenStream().LT(1);
        if (nextToken == null)
            return true;
        
        // Check if there's white space between the previous token and the next token.
        final CommonToken lastToken = (CommonToken) getTokenStream().LT(-1);
        if (lastToken != null && nextToken != null)
        {
            final int lastStop = lastToken.getStopIndex();
            final int nextStart = nextToken.getStartIndex();
            if (lastStop + 1 < nextStart)
            {
                return true;
            }
        }
        
        // If the next token is "{" or ",", it's also end of a selector.
        final int nextType = nextToken.getType();
        if (nextType == BLOCK_OPEN || nextType == COMMA)
        {
            return true;
        }
        
        return false;
    }



    public static class stylesheet_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "stylesheet"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:142:1: stylesheet : ( namespaceStatement | fontFace | mediaQuery | ruleset )* ;
    public final CSSParser.stylesheet_return stylesheet() throws RecognitionException {
        CSSParser.stylesheet_return retval = new CSSParser.stylesheet_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        CSSParser.namespaceStatement_return namespaceStatement1 = null;

        CSSParser.fontFace_return fontFace2 = null;

        CSSParser.mediaQuery_return mediaQuery3 = null;

        CSSParser.ruleset_return ruleset4 = null;



        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:146:5: ( ( namespaceStatement | fontFace | mediaQuery | ruleset )* )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:146:9: ( namespaceStatement | fontFace | mediaQuery | ruleset )*
            {
            root_0 = (Object)adaptor.nil();

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:146:9: ( namespaceStatement | fontFace | mediaQuery | ruleset )*
            loop1:
            do {
                int alt1=5;
                alt1 = dfa1.predict(input);
                switch (alt1) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:146:11: namespaceStatement
            	    {
            	    pushFollow(FOLLOW_namespaceStatement_in_stylesheet137);
            	    namespaceStatement1=namespaceStatement();

            	    state._fsp--;

            	    adaptor.addChild(root_0, namespaceStatement1.getTree());

            	    }
            	    break;
            	case 2 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:146:32: fontFace
            	    {
            	    pushFollow(FOLLOW_fontFace_in_stylesheet141);
            	    fontFace2=fontFace();

            	    state._fsp--;

            	    adaptor.addChild(root_0, fontFace2.getTree());

            	    }
            	    break;
            	case 3 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:146:43: mediaQuery
            	    {
            	    pushFollow(FOLLOW_mediaQuery_in_stylesheet145);
            	    mediaQuery3=mediaQuery();

            	    state._fsp--;

            	    adaptor.addChild(root_0, mediaQuery3.getTree());

            	    }
            	    break;
            	case 4 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:146:56: ruleset
            	    {
            	    pushFollow(FOLLOW_ruleset_in_stylesheet149);
            	    ruleset4=ruleset();

            	    state._fsp--;

            	    adaptor.addChild(root_0, ruleset4.getTree());

            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);


            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "stylesheet"

    public static class namespaceStatement_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "namespaceStatement"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:149:1: namespaceStatement : AT_NAMESPACE ( ID )? STRING SEMI_COLONS -> ^( AT_NAMESPACE ( ID )? STRING ) ;
    public final CSSParser.namespaceStatement_return namespaceStatement() throws RecognitionException {
        CSSParser.namespaceStatement_return retval = new CSSParser.namespaceStatement_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token AT_NAMESPACE5=null;
        Token ID6=null;
        Token STRING7=null;
        Token SEMI_COLONS8=null;

        Object AT_NAMESPACE5_tree=null;
        Object ID6_tree=null;
        Object STRING7_tree=null;
        Object SEMI_COLONS8_tree=null;
        RewriteRuleTokenStream stream_ID=new RewriteRuleTokenStream(adaptor,"token ID");
        RewriteRuleTokenStream stream_AT_NAMESPACE=new RewriteRuleTokenStream(adaptor,"token AT_NAMESPACE");
        RewriteRuleTokenStream stream_SEMI_COLONS=new RewriteRuleTokenStream(adaptor,"token SEMI_COLONS");
        RewriteRuleTokenStream stream_STRING=new RewriteRuleTokenStream(adaptor,"token STRING");

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:159:5: ( AT_NAMESPACE ( ID )? STRING SEMI_COLONS -> ^( AT_NAMESPACE ( ID )? STRING ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:159:9: AT_NAMESPACE ( ID )? STRING SEMI_COLONS
            {
            AT_NAMESPACE5=(Token)match(input,AT_NAMESPACE,FOLLOW_AT_NAMESPACE_in_namespaceStatement173);  
            stream_AT_NAMESPACE.add(AT_NAMESPACE5);

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:159:22: ( ID )?
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==ID) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:159:22: ID
                    {
                    ID6=(Token)match(input,ID,FOLLOW_ID_in_namespaceStatement175);  
                    stream_ID.add(ID6);


                    }
                    break;

            }

            STRING7=(Token)match(input,STRING,FOLLOW_STRING_in_namespaceStatement178);  
            stream_STRING.add(STRING7);

            SEMI_COLONS8=(Token)match(input,SEMI_COLONS,FOLLOW_SEMI_COLONS_in_namespaceStatement180);  
            stream_SEMI_COLONS.add(SEMI_COLONS8);



            // AST REWRITE
            // elements: STRING, ID, AT_NAMESPACE
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 160:6: -> ^( AT_NAMESPACE ( ID )? STRING )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:160:9: ^( AT_NAMESPACE ( ID )? STRING )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot(stream_AT_NAMESPACE.nextNode(), root_1);

                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:160:24: ( ID )?
                if ( stream_ID.hasNext() ) {
                    adaptor.addChild(root_1, stream_ID.nextNode());

                }
                stream_ID.reset();
                adaptor.addChild(root_1, stream_STRING.nextNode());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "namespaceStatement"

    public static class mediaQuery_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "mediaQuery"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:163:1: mediaQuery : AT_MEDIA medium BLOCK_OPEN ( ruleset )* BLOCK_END -> ^( AT_MEDIA medium ( ruleset )* ) ;
    public final CSSParser.mediaQuery_return mediaQuery() throws RecognitionException {
        CSSParser.mediaQuery_return retval = new CSSParser.mediaQuery_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token AT_MEDIA9=null;
        Token BLOCK_OPEN11=null;
        Token BLOCK_END13=null;
        CSSParser.medium_return medium10 = null;

        CSSParser.ruleset_return ruleset12 = null;


        Object AT_MEDIA9_tree=null;
        Object BLOCK_OPEN11_tree=null;
        Object BLOCK_END13_tree=null;
        RewriteRuleTokenStream stream_BLOCK_OPEN=new RewriteRuleTokenStream(adaptor,"token BLOCK_OPEN");
        RewriteRuleTokenStream stream_AT_MEDIA=new RewriteRuleTokenStream(adaptor,"token AT_MEDIA");
        RewriteRuleTokenStream stream_BLOCK_END=new RewriteRuleTokenStream(adaptor,"token BLOCK_END");
        RewriteRuleSubtreeStream stream_ruleset=new RewriteRuleSubtreeStream(adaptor,"rule ruleset");
        RewriteRuleSubtreeStream stream_medium=new RewriteRuleSubtreeStream(adaptor,"rule medium");
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:172:5: ( AT_MEDIA medium BLOCK_OPEN ( ruleset )* BLOCK_END -> ^( AT_MEDIA medium ( ruleset )* ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:172:9: AT_MEDIA medium BLOCK_OPEN ( ruleset )* BLOCK_END
            {
            AT_MEDIA9=(Token)match(input,AT_MEDIA,FOLLOW_AT_MEDIA_in_mediaQuery223);  
            stream_AT_MEDIA.add(AT_MEDIA9);

            pushFollow(FOLLOW_medium_in_mediaQuery225);
            medium10=medium();

            state._fsp--;

            stream_medium.add(medium10.getTree());
            BLOCK_OPEN11=(Token)match(input,BLOCK_OPEN,FOLLOW_BLOCK_OPEN_in_mediaQuery227);  
            stream_BLOCK_OPEN.add(BLOCK_OPEN11);

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:172:36: ( ruleset )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( (LA3_0==ID||(LA3_0>=DOT && LA3_0<=COLON)||LA3_0==STAR) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:172:36: ruleset
            	    {
            	    pushFollow(FOLLOW_ruleset_in_mediaQuery229);
            	    ruleset12=ruleset();

            	    state._fsp--;

            	    stream_ruleset.add(ruleset12.getTree());

            	    }
            	    break;

            	default :
            	    break loop3;
                }
            } while (true);

            BLOCK_END13=(Token)match(input,BLOCK_END,FOLLOW_BLOCK_END_in_mediaQuery232);  
            stream_BLOCK_END.add(BLOCK_END13);



            // AST REWRITE
            // elements: AT_MEDIA, medium, ruleset
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 173:6: -> ^( AT_MEDIA medium ( ruleset )* )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:173:9: ^( AT_MEDIA medium ( ruleset )* )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot(stream_AT_MEDIA.nextNode(), root_1);

                adaptor.addChild(root_1, stream_medium.nextTree());
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:173:27: ( ruleset )*
                while ( stream_ruleset.hasNext() ) {
                    adaptor.addChild(root_1, stream_ruleset.nextTree());

                }
                stream_ruleset.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "mediaQuery"

    public static class medium_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "medium"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:176:1: medium : mediumCondition ( 'and' mediumCondition )* -> ^( I_MEDIUM_CONDITIONS ( mediumCondition )* ) ;
    public final CSSParser.medium_return medium() throws RecognitionException {
        CSSParser.medium_return retval = new CSSParser.medium_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token string_literal15=null;
        CSSParser.mediumCondition_return mediumCondition14 = null;

        CSSParser.mediumCondition_return mediumCondition16 = null;


        Object string_literal15_tree=null;
        RewriteRuleTokenStream stream_42=new RewriteRuleTokenStream(adaptor,"token 42");
        RewriteRuleSubtreeStream stream_mediumCondition=new RewriteRuleSubtreeStream(adaptor,"rule mediumCondition");
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:181:5: ( mediumCondition ( 'and' mediumCondition )* -> ^( I_MEDIUM_CONDITIONS ( mediumCondition )* ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:181:9: mediumCondition ( 'and' mediumCondition )*
            {
            pushFollow(FOLLOW_mediumCondition_in_medium272);
            mediumCondition14=mediumCondition();

            state._fsp--;

            stream_mediumCondition.add(mediumCondition14.getTree());
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:182:9: ( 'and' mediumCondition )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);

                if ( (LA4_0==42) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:184:13: 'and' mediumCondition
            	    {
            	    string_literal15=(Token)match(input,42,FOLLOW_42_in_medium315);  
            	    stream_42.add(string_literal15);

            	    pushFollow(FOLLOW_mediumCondition_in_medium330);
            	    mediumCondition16=mediumCondition();

            	    state._fsp--;

            	    stream_mediumCondition.add(mediumCondition16.getTree());

            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);



            // AST REWRITE
            // elements: mediumCondition
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 187:9: -> ^( I_MEDIUM_CONDITIONS ( mediumCondition )* )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:187:12: ^( I_MEDIUM_CONDITIONS ( mediumCondition )* )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(I_MEDIUM_CONDITIONS, "I_MEDIUM_CONDITIONS"), root_1);

                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:187:34: ( mediumCondition )*
                while ( stream_mediumCondition.hasNext() ) {
                    adaptor.addChild(root_1, stream_mediumCondition.nextTree());

                }
                stream_mediumCondition.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "medium"

    public static class mediumCondition_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "mediumCondition"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:190:1: mediumCondition : ( ID | ARGUMENTS );
    public final CSSParser.mediumCondition_return mediumCondition() throws RecognitionException {
        CSSParser.mediumCondition_return retval = new CSSParser.mediumCondition_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token set17=null;

        Object set17_tree=null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:195:5: ( ID | ARGUMENTS )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:
            {
            root_0 = (Object)adaptor.nil();

            set17=(Token)input.LT(1);
            if ( input.LA(1)==ID||input.LA(1)==ARGUMENTS ) {
                input.consume();
                adaptor.addChild(root_0, (Object)adaptor.create(set17));
                state.errorRecovery=false;
            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                throw mse;
            }


            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "mediumCondition"

    public static class fontFace_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "fontFace"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:199:1: fontFace : AT_FONT_FACE declarationsBlock -> ^( AT_FONT_FACE declarationsBlock ) ;
    public final CSSParser.fontFace_return fontFace() throws RecognitionException {
        CSSParser.fontFace_return retval = new CSSParser.fontFace_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token AT_FONT_FACE18=null;
        CSSParser.declarationsBlock_return declarationsBlock19 = null;


        Object AT_FONT_FACE18_tree=null;
        RewriteRuleTokenStream stream_AT_FONT_FACE=new RewriteRuleTokenStream(adaptor,"token AT_FONT_FACE");
        RewriteRuleSubtreeStream stream_declarationsBlock=new RewriteRuleSubtreeStream(adaptor,"rule declarationsBlock");
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:211:5: ( AT_FONT_FACE declarationsBlock -> ^( AT_FONT_FACE declarationsBlock ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:211:9: AT_FONT_FACE declarationsBlock
            {
            AT_FONT_FACE18=(Token)match(input,AT_FONT_FACE,FOLLOW_AT_FONT_FACE_in_fontFace425);  
            stream_AT_FONT_FACE.add(AT_FONT_FACE18);

            pushFollow(FOLLOW_declarationsBlock_in_fontFace427);
            declarationsBlock19=declarationsBlock();

            state._fsp--;

            stream_declarationsBlock.add(declarationsBlock19.getTree());


            // AST REWRITE
            // elements: declarationsBlock, AT_FONT_FACE
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 211:40: -> ^( AT_FONT_FACE declarationsBlock )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:211:43: ^( AT_FONT_FACE declarationsBlock )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot(stream_AT_FONT_FACE.nextNode(), root_1);

                adaptor.addChild(root_1, stream_declarationsBlock.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "fontFace"

    public static class ruleset_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "ruleset"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:214:1: ruleset : selectorGroup declarationsBlock -> ^( I_RULE selectorGroup declarationsBlock ) ;
    public final CSSParser.ruleset_return ruleset() throws RecognitionException {
        CSSParser.ruleset_return retval = new CSSParser.ruleset_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        CSSParser.selectorGroup_return selectorGroup20 = null;

        CSSParser.declarationsBlock_return declarationsBlock21 = null;


        RewriteRuleSubtreeStream stream_declarationsBlock=new RewriteRuleSubtreeStream(adaptor,"rule declarationsBlock");
        RewriteRuleSubtreeStream stream_selectorGroup=new RewriteRuleSubtreeStream(adaptor,"rule selectorGroup");
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:218:5: ( selectorGroup declarationsBlock -> ^( I_RULE selectorGroup declarationsBlock ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:218:9: selectorGroup declarationsBlock
            {
            pushFollow(FOLLOW_selectorGroup_in_ruleset458);
            selectorGroup20=selectorGroup();

            state._fsp--;

            stream_selectorGroup.add(selectorGroup20.getTree());
            pushFollow(FOLLOW_declarationsBlock_in_ruleset460);
            declarationsBlock21=declarationsBlock();

            state._fsp--;

            stream_declarationsBlock.add(declarationsBlock21.getTree());


            // AST REWRITE
            // elements: declarationsBlock, selectorGroup
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 219:9: -> ^( I_RULE selectorGroup declarationsBlock )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:219:12: ^( I_RULE selectorGroup declarationsBlock )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(I_RULE, "I_RULE"), root_1);

                adaptor.addChild(root_1, stream_selectorGroup.nextTree());
                adaptor.addChild(root_1, stream_declarationsBlock.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "ruleset"

    public static class selectorGroup_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "selectorGroup"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:222:1: selectorGroup : compoundSelector ( COMMA compoundSelector )* -> ^( I_SELECTOR_GROUP ( compoundSelector )+ ) ;
    public final CSSParser.selectorGroup_return selectorGroup() throws RecognitionException {
        CSSParser.selectorGroup_return retval = new CSSParser.selectorGroup_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token COMMA23=null;
        CSSParser.compoundSelector_return compoundSelector22 = null;

        CSSParser.compoundSelector_return compoundSelector24 = null;


        Object COMMA23_tree=null;
        RewriteRuleTokenStream stream_COMMA=new RewriteRuleTokenStream(adaptor,"token COMMA");
        RewriteRuleSubtreeStream stream_compoundSelector=new RewriteRuleSubtreeStream(adaptor,"rule compoundSelector");
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:226:2: ( compoundSelector ( COMMA compoundSelector )* -> ^( I_SELECTOR_GROUP ( compoundSelector )+ ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:226:4: compoundSelector ( COMMA compoundSelector )*
            {
            pushFollow(FOLLOW_compoundSelector_in_selectorGroup494);
            compoundSelector22=compoundSelector();

            state._fsp--;

            stream_compoundSelector.add(compoundSelector22.getTree());
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:226:21: ( COMMA compoundSelector )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);

                if ( (LA5_0==COMMA) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:226:23: COMMA compoundSelector
            	    {
            	    COMMA23=(Token)match(input,COMMA,FOLLOW_COMMA_in_selectorGroup498);  
            	    stream_COMMA.add(COMMA23);

            	    pushFollow(FOLLOW_compoundSelector_in_selectorGroup500);
            	    compoundSelector24=compoundSelector();

            	    state._fsp--;

            	    stream_compoundSelector.add(compoundSelector24.getTree());

            	    }
            	    break;

            	default :
            	    break loop5;
                }
            } while (true);



            // AST REWRITE
            // elements: compoundSelector
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 227:9: -> ^( I_SELECTOR_GROUP ( compoundSelector )+ )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:227:12: ^( I_SELECTOR_GROUP ( compoundSelector )+ )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(I_SELECTOR_GROUP, "I_SELECTOR_GROUP"), root_1);

                if ( !(stream_compoundSelector.hasNext()) ) {
                    throw new RewriteEarlyExitException();
                }
                while ( stream_compoundSelector.hasNext() ) {
                    adaptor.addChild(root_1, stream_compoundSelector.nextTree());

                }
                stream_compoundSelector.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "selectorGroup"

    public static class compoundSelector_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "compoundSelector"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:230:1: compoundSelector : (l= simpleSelectorFraction )+ -> ^( I_SELECTOR ) ;
    public final CSSParser.compoundSelector_return compoundSelector() throws RecognitionException {
        CSSParser.compoundSelector_return retval = new CSSParser.compoundSelector_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        CSSParser.simpleSelectorFraction_return l = null;


        RewriteRuleSubtreeStream stream_simpleSelectorFraction=new RewriteRuleSubtreeStream(adaptor,"rule simpleSelectorFraction");

        	final List<Object> simpleSelectorNodeList = new ArrayList<Object>();
        	Object currentSimpleSelectorNode = adaptor.create(I_SIMPLE_SELECTOR, "I_SIMPLE_SELECTOR");
        	Token simpleSelectorStartToken = null;
            Token simpleSelectorStopToken = null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:254:5: ( (l= simpleSelectorFraction )+ -> ^( I_SELECTOR ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:254:9: (l= simpleSelectorFraction )+
            {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:254:9: (l= simpleSelectorFraction )+
            int cnt6=0;
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);

                if ( (LA6_0==ID||(LA6_0>=DOT && LA6_0<=COLON)||LA6_0==STAR) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:254:13: l= simpleSelectorFraction
            	    {
            	    pushFollow(FOLLOW_simpleSelectorFraction_in_compoundSelector565);
            	    l=simpleSelectorFraction();

            	    state._fsp--;

            	    stream_simpleSelectorFraction.add(l.getTree());
            	     
            	    			    // expand token range of the current simple selector
            	    				if (simpleSelectorStartToken == null)
            	    				    simpleSelectorStartToken = (l!=null?((Token)l.start):null);
            	    				simpleSelectorStopToken = (l!=null?((Token)l.stop):null);
            	    				
            	    				adaptor.addChild(currentSimpleSelectorNode, (l!=null?((Object)l.tree):null));
            	    				
            	    			    if (endOfSimpleSelector()) 
            	    			    {
            	    			        adaptor.setTokenBoundaries(
            	                            currentSimpleSelectorNode,
            	                            simpleSelectorStartToken,
            	                            simpleSelectorStopToken);
            	    			    	simpleSelectorNodeList.add(currentSimpleSelectorNode);
            	                            
            	                        simpleSelectorStartToken = null;
            	                        simpleSelectorStopToken = null;
            	                        
            	    			    	currentSimpleSelectorNode = adaptor.create(I_SIMPLE_SELECTOR, "I_SIMPLE_SELECTOR");			   
            	    			    }
            	    			

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



            // AST REWRITE
            // elements: 
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 278:9: -> ^( I_SELECTOR )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:278:12: ^( I_SELECTOR )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(I_SELECTOR, "I_SELECTOR"), root_1);

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);


            	for(final Object simpleSelectorNode : simpleSelectorNodeList)
            		adaptor.addChild(((Object)retval.tree), simpleSelectorNode);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "compoundSelector"

    public static class simpleSelectorFraction_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "simpleSelectorFraction"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:282:1: simpleSelectorFraction : ( element | condition );
    public final CSSParser.simpleSelectorFraction_return simpleSelectorFraction() throws RecognitionException {
        CSSParser.simpleSelectorFraction_return retval = new CSSParser.simpleSelectorFraction_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        CSSParser.element_return element25 = null;

        CSSParser.condition_return condition26 = null;



        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:306:5: ( element | condition )
            int alt7=2;
            int LA7_0 = input.LA(1);

            if ( (LA7_0==ID||LA7_0==STAR) ) {
                alt7=1;
            }
            else if ( ((LA7_0>=DOT && LA7_0<=COLON)) ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:306:9: element
                    {
                    root_0 = (Object)adaptor.nil();

                    pushFollow(FOLLOW_element_in_simpleSelectorFraction635);
                    element25=element();

                    state._fsp--;

                    adaptor.addChild(root_0, element25.getTree());

                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:307:9: condition
                    {
                    root_0 = (Object)adaptor.nil();

                    pushFollow(FOLLOW_condition_in_simpleSelectorFraction645);
                    condition26=condition();

                    state._fsp--;

                    adaptor.addChild(root_0, condition26.getTree());

                    }
                    break;

            }
            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "simpleSelectorFraction"

    public static class condition_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "condition"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:310:1: condition : ( DOT ID | HASH_WORD | COLON ID ) ;
    public final CSSParser.condition_return condition() throws RecognitionException {
        CSSParser.condition_return retval = new CSSParser.condition_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token DOT27=null;
        Token ID28=null;
        Token HASH_WORD29=null;
        Token COLON30=null;
        Token ID31=null;

        Object DOT27_tree=null;
        Object ID28_tree=null;
        Object HASH_WORD29_tree=null;
        Object COLON30_tree=null;
        Object ID31_tree=null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:315:5: ( ( DOT ID | HASH_WORD | COLON ID ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:315:9: ( DOT ID | HASH_WORD | COLON ID )
            {
            root_0 = (Object)adaptor.nil();

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:315:9: ( DOT ID | HASH_WORD | COLON ID )
            int alt8=3;
            switch ( input.LA(1) ) {
            case DOT:
                {
                alt8=1;
                }
                break;
            case HASH_WORD:
                {
                alt8=2;
                }
                break;
            case COLON:
                {
                alt8=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 8, 0, input);

                throw nvae;
            }

            switch (alt8) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:315:11: DOT ID
                    {
                    DOT27=(Token)match(input,DOT,FOLLOW_DOT_in_condition672); 
                    DOT27_tree = (Object)adaptor.create(DOT27);
                    root_0 = (Object)adaptor.becomeRoot(DOT27_tree, root_0);

                    ID28=(Token)match(input,ID,FOLLOW_ID_in_condition675); 
                    ID28_tree = (Object)adaptor.create(ID28);
                    adaptor.addChild(root_0, ID28_tree);


                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:316:11: HASH_WORD
                    {
                    HASH_WORD29=(Token)match(input,HASH_WORD,FOLLOW_HASH_WORD_in_condition687); 
                    HASH_WORD29_tree = (Object)adaptor.create(HASH_WORD29);
                    adaptor.addChild(root_0, HASH_WORD29_tree);


                    }
                    break;
                case 3 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:317:11: COLON ID
                    {
                    COLON30=(Token)match(input,COLON,FOLLOW_COLON_in_condition700); 
                    COLON30_tree = (Object)adaptor.create(COLON30);
                    root_0 = (Object)adaptor.becomeRoot(COLON30_tree, root_0);

                    ID31=(Token)match(input,ID,FOLLOW_ID_in_condition703); 
                    ID31_tree = (Object)adaptor.create(ID31);
                    adaptor.addChild(root_0, ID31_tree);


                    }
                    break;

            }


            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "condition"

    public static class element_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "element"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:321:1: element : ( ID PIPE ID | ID | STAR );
    public final CSSParser.element_return element() throws RecognitionException {
        CSSParser.element_return retval = new CSSParser.element_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token ID32=null;
        Token PIPE33=null;
        Token ID34=null;
        Token ID35=null;
        Token STAR36=null;

        Object ID32_tree=null;
        Object PIPE33_tree=null;
        Object ID34_tree=null;
        Object ID35_tree=null;
        Object STAR36_tree=null;

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:327:5: ( ID PIPE ID | ID | STAR )
            int alt9=3;
            alt9 = dfa9.predict(input);
            switch (alt9) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:327:9: ID PIPE ID
                    {
                    root_0 = (Object)adaptor.nil();

                    ID32=(Token)match(input,ID,FOLLOW_ID_in_element738); 
                    ID32_tree = (Object)adaptor.create(ID32);
                    adaptor.addChild(root_0, ID32_tree);

                    PIPE33=(Token)match(input,PIPE,FOLLOW_PIPE_in_element740); 
                    PIPE33_tree = (Object)adaptor.create(PIPE33);
                    root_0 = (Object)adaptor.becomeRoot(PIPE33_tree, root_0);

                    ID34=(Token)match(input,ID,FOLLOW_ID_in_element743); 
                    ID34_tree = (Object)adaptor.create(ID34);
                    adaptor.addChild(root_0, ID34_tree);


                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:328:9: ID
                    {
                    root_0 = (Object)adaptor.nil();

                    ID35=(Token)match(input,ID,FOLLOW_ID_in_element753); 
                    ID35_tree = (Object)adaptor.create(ID35);
                    adaptor.addChild(root_0, ID35_tree);


                    }
                    break;
                case 3 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:329:9: STAR
                    {
                    root_0 = (Object)adaptor.nil();

                    STAR36=(Token)match(input,STAR,FOLLOW_STAR_in_element773); 
                    STAR36_tree = (Object)adaptor.create(STAR36);
                    adaptor.addChild(root_0, STAR36_tree);


                    }
                    break;

            }
            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "element"

    public static class declarationsBlock_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "declarationsBlock"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:332:1: declarationsBlock : BLOCK_OPEN ( ( SEMI_COLONS )? declaration ( SEMI_COLONS declaration )* ( SEMI_COLONS )? )? BLOCK_END -> ^( I_DECL ( declaration )* ) ;
    public final CSSParser.declarationsBlock_return declarationsBlock() throws RecognitionException {
        CSSParser.declarationsBlock_return retval = new CSSParser.declarationsBlock_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token BLOCK_OPEN37=null;
        Token SEMI_COLONS38=null;
        Token SEMI_COLONS40=null;
        Token SEMI_COLONS42=null;
        Token BLOCK_END43=null;
        CSSParser.declaration_return declaration39 = null;

        CSSParser.declaration_return declaration41 = null;


        Object BLOCK_OPEN37_tree=null;
        Object SEMI_COLONS38_tree=null;
        Object SEMI_COLONS40_tree=null;
        Object SEMI_COLONS42_tree=null;
        Object BLOCK_END43_tree=null;
        RewriteRuleTokenStream stream_BLOCK_OPEN=new RewriteRuleTokenStream(adaptor,"token BLOCK_OPEN");
        RewriteRuleTokenStream stream_SEMI_COLONS=new RewriteRuleTokenStream(adaptor,"token SEMI_COLONS");
        RewriteRuleTokenStream stream_BLOCK_END=new RewriteRuleTokenStream(adaptor,"token BLOCK_END");
        RewriteRuleSubtreeStream stream_declaration=new RewriteRuleSubtreeStream(adaptor,"rule declaration");
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:338:5: ( BLOCK_OPEN ( ( SEMI_COLONS )? declaration ( SEMI_COLONS declaration )* ( SEMI_COLONS )? )? BLOCK_END -> ^( I_DECL ( declaration )* ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:338:9: BLOCK_OPEN ( ( SEMI_COLONS )? declaration ( SEMI_COLONS declaration )* ( SEMI_COLONS )? )? BLOCK_END
            {
            BLOCK_OPEN37=(Token)match(input,BLOCK_OPEN,FOLLOW_BLOCK_OPEN_in_declarationsBlock814);  
            stream_BLOCK_OPEN.add(BLOCK_OPEN37);

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:339:9: ( ( SEMI_COLONS )? declaration ( SEMI_COLONS declaration )* ( SEMI_COLONS )? )?
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0==ID||LA13_0==SEMI_COLONS) ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:340:13: ( SEMI_COLONS )? declaration ( SEMI_COLONS declaration )* ( SEMI_COLONS )?
                    {
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:340:13: ( SEMI_COLONS )?
                    int alt10=2;
                    int LA10_0 = input.LA(1);

                    if ( (LA10_0==SEMI_COLONS) ) {
                        alt10=1;
                    }
                    switch (alt10) {
                        case 1 :
                            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:340:13: SEMI_COLONS
                            {
                            SEMI_COLONS38=(Token)match(input,SEMI_COLONS,FOLLOW_SEMI_COLONS_in_declarationsBlock842);  
                            stream_SEMI_COLONS.add(SEMI_COLONS38);


                            }
                            break;

                    }

                    pushFollow(FOLLOW_declaration_in_declarationsBlock860);
                    declaration39=declaration();

                    state._fsp--;

                    stream_declaration.add(declaration39.getTree());
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:342:13: ( SEMI_COLONS declaration )*
                    loop11:
                    do {
                        int alt11=2;
                        int LA11_0 = input.LA(1);

                        if ( (LA11_0==SEMI_COLONS) ) {
                            int LA11_1 = input.LA(2);

                            if ( (LA11_1==ID) ) {
                                alt11=1;
                            }


                        }


                        switch (alt11) {
                    	case 1 :
                    	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:343:17: SEMI_COLONS declaration
                    	    {
                    	    SEMI_COLONS40=(Token)match(input,SEMI_COLONS,FOLLOW_SEMI_COLONS_in_declarationsBlock894);  
                    	    stream_SEMI_COLONS.add(SEMI_COLONS40);

                    	    pushFollow(FOLLOW_declaration_in_declarationsBlock913);
                    	    declaration41=declaration();

                    	    state._fsp--;

                    	    stream_declaration.add(declaration41.getTree());

                    	    }
                    	    break;

                    	default :
                    	    break loop11;
                        }
                    } while (true);

                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:346:13: ( SEMI_COLONS )?
                    int alt12=2;
                    int LA12_0 = input.LA(1);

                    if ( (LA12_0==SEMI_COLONS) ) {
                        alt12=1;
                    }
                    switch (alt12) {
                        case 1 :
                            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:346:13: SEMI_COLONS
                            {
                            SEMI_COLONS42=(Token)match(input,SEMI_COLONS,FOLLOW_SEMI_COLONS_in_declarationsBlock943);  
                            stream_SEMI_COLONS.add(SEMI_COLONS42);


                            }
                            break;

                    }


                    }
                    break;

            }

            BLOCK_END43=(Token)match(input,BLOCK_END,FOLLOW_BLOCK_END_in_declarationsBlock966);  
            stream_BLOCK_END.add(BLOCK_END43);



            // AST REWRITE
            // elements: declaration
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 349:9: -> ^( I_DECL ( declaration )* )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:349:12: ^( I_DECL ( declaration )* )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(I_DECL, "I_DECL"), root_1);

                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:349:21: ( declaration )*
                while ( stream_declaration.hasNext() ) {
                    adaptor.addChild(root_1, stream_declaration.nextTree());

                }
                stream_declaration.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "declarationsBlock"

    public static class declaration_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "declaration"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:352:1: declaration : ID COLON value -> ^( COLON ID value ) ;
    public final CSSParser.declaration_return declaration() throws RecognitionException {
        CSSParser.declaration_return retval = new CSSParser.declaration_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token ID44=null;
        Token COLON45=null;
        CSSParser.value_return value46 = null;


        Object ID44_tree=null;
        Object COLON45_tree=null;
        RewriteRuleTokenStream stream_COLON=new RewriteRuleTokenStream(adaptor,"token COLON");
        RewriteRuleTokenStream stream_ID=new RewriteRuleTokenStream(adaptor,"token ID");
        RewriteRuleSubtreeStream stream_value=new RewriteRuleSubtreeStream(adaptor,"rule value");
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:358:5: ( ID COLON value -> ^( COLON ID value ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:358:9: ID COLON value
            {
            ID44=(Token)match(input,ID,FOLLOW_ID_in_declaration1006);  
            stream_ID.add(ID44);

            COLON45=(Token)match(input,COLON,FOLLOW_COLON_in_declaration1008);  
            stream_COLON.add(COLON45);

            pushFollow(FOLLOW_value_in_declaration1010);
            value46=value();

            state._fsp--;

            stream_value.add(value46.getTree());


            // AST REWRITE
            // elements: COLON, ID, value
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 358:24: -> ^( COLON ID value )
            {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:358:27: ^( COLON ID value )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot(stream_COLON.nextNode(), root_1);

                adaptor.addChild(root_1, stream_ID.nextNode());
                adaptor.addChild(root_1, stream_value.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "declaration"

    public static class value_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "value"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:361:1: value : singleValue ( ( COMMA )? singleValue )* -> {count > 1}? ^( I_ARRAY ( singleValue )+ ) -> singleValue ;
    public final CSSParser.value_return value() throws RecognitionException {
        CSSParser.value_return retval = new CSSParser.value_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token COMMA48=null;
        CSSParser.singleValue_return singleValue47 = null;

        CSSParser.singleValue_return singleValue49 = null;


        Object COMMA48_tree=null;
        RewriteRuleTokenStream stream_COMMA=new RewriteRuleTokenStream(adaptor,"token COMMA");
        RewriteRuleSubtreeStream stream_singleValue=new RewriteRuleSubtreeStream(adaptor,"rule singleValue");
         int count = 1; 
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:376:5: ( singleValue ( ( COMMA )? singleValue )* -> {count > 1}? ^( I_ARRAY ( singleValue )+ ) -> singleValue )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:376:9: singleValue ( ( COMMA )? singleValue )*
            {
            pushFollow(FOLLOW_singleValue_in_value1056);
            singleValue47=singleValue();

            state._fsp--;

            stream_singleValue.add(singleValue47.getTree());
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:376:21: ( ( COMMA )? singleValue )*
            loop15:
            do {
                int alt15=2;
                alt15 = dfa15.predict(input);
                switch (alt15) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:376:23: ( COMMA )? singleValue
            	    {
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:376:23: ( COMMA )?
            	    int alt14=2;
            	    alt14 = dfa14.predict(input);
            	    switch (alt14) {
            	        case 1 :
            	            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:376:23: COMMA
            	            {
            	            COMMA48=(Token)match(input,COMMA,FOLLOW_COMMA_in_value1060);  
            	            stream_COMMA.add(COMMA48);


            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_singleValue_in_value1063);
            	    singleValue49=singleValue();

            	    state._fsp--;

            	    stream_singleValue.add(singleValue49.getTree());
            	     count++; 

            	    }
            	    break;

            	default :
            	    break loop15;
                }
            } while (true);



            // AST REWRITE
            // elements: singleValue, singleValue
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 377:9: -> {count > 1}? ^( I_ARRAY ( singleValue )+ )
            if (count > 1) {
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:377:25: ^( I_ARRAY ( singleValue )+ )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(I_ARRAY, "I_ARRAY"), root_1);

                if ( !(stream_singleValue.hasNext()) ) {
                    throw new RewriteEarlyExitException();
                }
                while ( stream_singleValue.hasNext() ) {
                    adaptor.addChild(root_1, stream_singleValue.nextTree());

                }
                stream_singleValue.reset();

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 378:9: -> singleValue
            {
                adaptor.addChild(root_0, stream_singleValue.nextTree());

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "value"

    public static class singleValue_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "singleValue"
    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:381:1: singleValue : ( NUMBER_WITH_UNIT | HASH_WORD | CLASS_REFERENCE ARGUMENTS -> ^( CLASS_REFERENCE ARGUMENTS ) | PROPERTY_REFERENCE ARGUMENTS -> ^( PROPERTY_REFERENCE ARGUMENTS ) | EMBED ARGUMENTS -> ^( EMBED ARGUMENTS ) | URL ARGUMENTS -> ^( URL ARGUMENTS ) | LOCAL ARGUMENTS -> ^( LOCAL ARGUMENTS ) | STRING | ID );
    public final CSSParser.singleValue_return singleValue() throws RecognitionException {
        CSSParser.singleValue_return retval = new CSSParser.singleValue_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token NUMBER_WITH_UNIT50=null;
        Token HASH_WORD51=null;
        Token CLASS_REFERENCE52=null;
        Token ARGUMENTS53=null;
        Token PROPERTY_REFERENCE54=null;
        Token ARGUMENTS55=null;
        Token EMBED56=null;
        Token ARGUMENTS57=null;
        Token URL58=null;
        Token ARGUMENTS59=null;
        Token LOCAL60=null;
        Token ARGUMENTS61=null;
        Token STRING62=null;
        Token ID63=null;

        Object NUMBER_WITH_UNIT50_tree=null;
        Object HASH_WORD51_tree=null;
        Object CLASS_REFERENCE52_tree=null;
        Object ARGUMENTS53_tree=null;
        Object PROPERTY_REFERENCE54_tree=null;
        Object ARGUMENTS55_tree=null;
        Object EMBED56_tree=null;
        Object ARGUMENTS57_tree=null;
        Object URL58_tree=null;
        Object ARGUMENTS59_tree=null;
        Object LOCAL60_tree=null;
        Object ARGUMENTS61_tree=null;
        Object STRING62_tree=null;
        Object ID63_tree=null;
        RewriteRuleTokenStream stream_ARGUMENTS=new RewriteRuleTokenStream(adaptor,"token ARGUMENTS");
        RewriteRuleTokenStream stream_LOCAL=new RewriteRuleTokenStream(adaptor,"token LOCAL");
        RewriteRuleTokenStream stream_EMBED=new RewriteRuleTokenStream(adaptor,"token EMBED");
        RewriteRuleTokenStream stream_CLASS_REFERENCE=new RewriteRuleTokenStream(adaptor,"token CLASS_REFERENCE");
        RewriteRuleTokenStream stream_URL=new RewriteRuleTokenStream(adaptor,"token URL");
        RewriteRuleTokenStream stream_PROPERTY_REFERENCE=new RewriteRuleTokenStream(adaptor,"token PROPERTY_REFERENCE");

        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:396:5: ( NUMBER_WITH_UNIT | HASH_WORD | CLASS_REFERENCE ARGUMENTS -> ^( CLASS_REFERENCE ARGUMENTS ) | PROPERTY_REFERENCE ARGUMENTS -> ^( PROPERTY_REFERENCE ARGUMENTS ) | EMBED ARGUMENTS -> ^( EMBED ARGUMENTS ) | URL ARGUMENTS -> ^( URL ARGUMENTS ) | LOCAL ARGUMENTS -> ^( LOCAL ARGUMENTS ) | STRING | ID )
            int alt16=9;
            alt16 = dfa16.predict(input);
            switch (alt16) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:396:9: NUMBER_WITH_UNIT
                    {
                    root_0 = (Object)adaptor.nil();

                    NUMBER_WITH_UNIT50=(Token)match(input,NUMBER_WITH_UNIT,FOLLOW_NUMBER_WITH_UNIT_in_singleValue1137); 
                    NUMBER_WITH_UNIT50_tree = (Object)adaptor.create(NUMBER_WITH_UNIT50);
                    adaptor.addChild(root_0, NUMBER_WITH_UNIT50_tree);


                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:397:9: HASH_WORD
                    {
                    root_0 = (Object)adaptor.nil();

                    HASH_WORD51=(Token)match(input,HASH_WORD,FOLLOW_HASH_WORD_in_singleValue1147); 
                    HASH_WORD51_tree = (Object)adaptor.create(HASH_WORD51);
                    adaptor.addChild(root_0, HASH_WORD51_tree);


                    }
                    break;
                case 3 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:398:9: CLASS_REFERENCE ARGUMENTS
                    {
                    CLASS_REFERENCE52=(Token)match(input,CLASS_REFERENCE,FOLLOW_CLASS_REFERENCE_in_singleValue1157);  
                    stream_CLASS_REFERENCE.add(CLASS_REFERENCE52);

                    ARGUMENTS53=(Token)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1159);  
                    stream_ARGUMENTS.add(ARGUMENTS53);



                    // AST REWRITE
                    // elements: CLASS_REFERENCE, ARGUMENTS
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 399:13: -> ^( CLASS_REFERENCE ARGUMENTS )
                    {
                        // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:399:16: ^( CLASS_REFERENCE ARGUMENTS )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot(stream_CLASS_REFERENCE.nextNode(), root_1);

                        adaptor.addChild(root_1, stream_ARGUMENTS.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 4 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:400:9: PROPERTY_REFERENCE ARGUMENTS
                    {
                    PROPERTY_REFERENCE54=(Token)match(input,PROPERTY_REFERENCE,FOLLOW_PROPERTY_REFERENCE_in_singleValue1189);  
                    stream_PROPERTY_REFERENCE.add(PROPERTY_REFERENCE54);

                    ARGUMENTS55=(Token)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1191);  
                    stream_ARGUMENTS.add(ARGUMENTS55);



                    // AST REWRITE
                    // elements: ARGUMENTS, PROPERTY_REFERENCE
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 401:13: -> ^( PROPERTY_REFERENCE ARGUMENTS )
                    {
                        // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:401:16: ^( PROPERTY_REFERENCE ARGUMENTS )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot(stream_PROPERTY_REFERENCE.nextNode(), root_1);

                        adaptor.addChild(root_1, stream_ARGUMENTS.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 5 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:402:9: EMBED ARGUMENTS
                    {
                    EMBED56=(Token)match(input,EMBED,FOLLOW_EMBED_in_singleValue1221);  
                    stream_EMBED.add(EMBED56);

                    ARGUMENTS57=(Token)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1223);  
                    stream_ARGUMENTS.add(ARGUMENTS57);



                    // AST REWRITE
                    // elements: ARGUMENTS, EMBED
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 403:13: -> ^( EMBED ARGUMENTS )
                    {
                        // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:403:16: ^( EMBED ARGUMENTS )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot(stream_EMBED.nextNode(), root_1);

                        adaptor.addChild(root_1, stream_ARGUMENTS.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 6 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:404:9: URL ARGUMENTS
                    {
                    URL58=(Token)match(input,URL,FOLLOW_URL_in_singleValue1253);  
                    stream_URL.add(URL58);

                    ARGUMENTS59=(Token)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1255);  
                    stream_ARGUMENTS.add(ARGUMENTS59);



                    // AST REWRITE
                    // elements: ARGUMENTS, URL
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 404:29: -> ^( URL ARGUMENTS )
                    {
                        // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:404:32: ^( URL ARGUMENTS )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot(stream_URL.nextNode(), root_1);

                        adaptor.addChild(root_1, stream_ARGUMENTS.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 7 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:405:9: LOCAL ARGUMENTS
                    {
                    LOCAL60=(Token)match(input,LOCAL,FOLLOW_LOCAL_in_singleValue1279);  
                    stream_LOCAL.add(LOCAL60);

                    ARGUMENTS61=(Token)match(input,ARGUMENTS,FOLLOW_ARGUMENTS_in_singleValue1281);  
                    stream_ARGUMENTS.add(ARGUMENTS61);



                    // AST REWRITE
                    // elements: LOCAL, ARGUMENTS
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 405:34: -> ^( LOCAL ARGUMENTS )
                    {
                        // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:405:37: ^( LOCAL ARGUMENTS )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot(stream_LOCAL.nextNode(), root_1);

                        adaptor.addChild(root_1, stream_ARGUMENTS.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 8 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:406:9: STRING
                    {
                    root_0 = (Object)adaptor.nil();

                    STRING62=(Token)match(input,STRING,FOLLOW_STRING_in_singleValue1308); 
                    STRING62_tree = (Object)adaptor.create(STRING62);
                    adaptor.addChild(root_0, STRING62_tree);


                    }
                    break;
                case 9 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:407:9: ID
                    {
                    root_0 = (Object)adaptor.nil();

                    ID63=(Token)match(input,ID,FOLLOW_ID_in_singleValue1324); 
                    ID63_tree = (Object)adaptor.create(ID63);
                    adaptor.addChild(root_0, ID63_tree);


                    }
                    break;

            }
            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "singleValue"

    // Delegated rules


    protected DFA1 dfa1 = new DFA1(this);
    protected DFA9 dfa9 = new DFA9(this);
    protected DFA15 dfa15 = new DFA15(this);
    protected DFA14 dfa14 = new DFA14(this);
    protected DFA16 dfa16 = new DFA16(this);
    static final String DFA1_eotS =
        "\12\uffff";
    static final String DFA1_eofS =
        "\1\1\11\uffff";
    static final String DFA1_minS =
        "\1\14\11\uffff";
    static final String DFA1_maxS =
        "\1\32\11\uffff";
    static final String DFA1_acceptS =
        "\1\uffff\1\5\1\1\1\2\1\3\1\4\4\uffff";
    static final String DFA1_specialS =
        "\12\uffff}>";
    static final String[] DFA1_transitionS = {
            "\1\2\1\5\2\uffff\1\4\3\uffff\1\3\1\uffff\3\5\1\uffff\1\5",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA1_eot = DFA.unpackEncodedString(DFA1_eotS);
    static final short[] DFA1_eof = DFA.unpackEncodedString(DFA1_eofS);
    static final char[] DFA1_min = DFA.unpackEncodedStringToUnsignedChars(DFA1_minS);
    static final char[] DFA1_max = DFA.unpackEncodedStringToUnsignedChars(DFA1_maxS);
    static final short[] DFA1_accept = DFA.unpackEncodedString(DFA1_acceptS);
    static final short[] DFA1_special = DFA.unpackEncodedString(DFA1_specialS);
    static final short[][] DFA1_transition;

    static {
        int numStates = DFA1_transitionS.length;
        DFA1_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA1_transition[i] = DFA.unpackEncodedString(DFA1_transitionS[i]);
        }
    }

    class DFA1 extends DFA {

        public DFA1(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 1;
            this.eot = DFA1_eot;
            this.eof = DFA1_eof;
            this.min = DFA1_min;
            this.max = DFA1_max;
            this.accept = DFA1_accept;
            this.special = DFA1_special;
            this.transition = DFA1_transition;
        }
        public String getDescription() {
            return "()* loopback of 146:9: ( namespaceStatement | fontFace | mediaQuery | ruleset )*";
        }
    }
    static final String DFA9_eotS =
        "\13\uffff";
    static final String DFA9_eofS =
        "\13\uffff";
    static final String DFA9_minS =
        "\2\15\11\uffff";
    static final String DFA9_maxS =
        "\2\32\11\uffff";
    static final String DFA9_acceptS =
        "\2\uffff\1\3\1\1\1\2\6\uffff";
    static final String DFA9_specialS =
        "\13\uffff}>";
    static final String[] DFA9_transitionS = {
            "\1\1\14\uffff\1\2",
            "\1\4\3\uffff\1\4\3\uffff\4\4\1\3\1\4",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA9_eot = DFA.unpackEncodedString(DFA9_eotS);
    static final short[] DFA9_eof = DFA.unpackEncodedString(DFA9_eofS);
    static final char[] DFA9_min = DFA.unpackEncodedStringToUnsignedChars(DFA9_minS);
    static final char[] DFA9_max = DFA.unpackEncodedStringToUnsignedChars(DFA9_maxS);
    static final short[] DFA9_accept = DFA.unpackEncodedString(DFA9_acceptS);
    static final short[] DFA9_special = DFA.unpackEncodedString(DFA9_specialS);
    static final short[][] DFA9_transition;

    static {
        int numStates = DFA9_transitionS.length;
        DFA9_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA9_transition[i] = DFA.unpackEncodedString(DFA9_transitionS[i]);
        }
    }

    class DFA9 extends DFA {

        public DFA9(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 9;
            this.eot = DFA9_eot;
            this.eof = DFA9_eof;
            this.min = DFA9_min;
            this.max = DFA9_max;
            this.accept = DFA9_accept;
            this.special = DFA9_special;
            this.transition = DFA9_transition;
        }
        public String getDescription() {
            return "321:1: element : ( ID PIPE ID | ID | STAR );";
        }
    }
    static final String DFA15_eotS =
        "\15\uffff";
    static final String DFA15_eofS =
        "\15\uffff";
    static final String DFA15_minS =
        "\1\15\14\uffff";
    static final String DFA15_maxS =
        "\1\40\14\uffff";
    static final String DFA15_acceptS =
        "\1\uffff\1\2\1\uffff\1\1\11\uffff";
    static final String DFA15_specialS =
        "\15\uffff}>";
    static final String[] DFA15_transitionS = {
            "\2\3\1\1\2\uffff\1\1\2\uffff\1\3\1\uffff\1\3\3\uffff\6\3",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA15_eot = DFA.unpackEncodedString(DFA15_eotS);
    static final short[] DFA15_eof = DFA.unpackEncodedString(DFA15_eofS);
    static final char[] DFA15_min = DFA.unpackEncodedStringToUnsignedChars(DFA15_minS);
    static final char[] DFA15_max = DFA.unpackEncodedStringToUnsignedChars(DFA15_maxS);
    static final short[] DFA15_accept = DFA.unpackEncodedString(DFA15_acceptS);
    static final short[] DFA15_special = DFA.unpackEncodedString(DFA15_specialS);
    static final short[][] DFA15_transition;

    static {
        int numStates = DFA15_transitionS.length;
        DFA15_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA15_transition[i] = DFA.unpackEncodedString(DFA15_transitionS[i]);
        }
    }

    class DFA15 extends DFA {

        public DFA15(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 15;
            this.eot = DFA15_eot;
            this.eof = DFA15_eof;
            this.min = DFA15_min;
            this.max = DFA15_max;
            this.accept = DFA15_accept;
            this.special = DFA15_special;
            this.transition = DFA15_transition;
        }
        public String getDescription() {
            return "()* loopback of 376:21: ( ( COMMA )? singleValue )*";
        }
    }
    static final String DFA14_eotS =
        "\13\uffff";
    static final String DFA14_eofS =
        "\13\uffff";
    static final String DFA14_minS =
        "\1\15\12\uffff";
    static final String DFA14_maxS =
        "\1\40\12\uffff";
    static final String DFA14_acceptS =
        "\1\uffff\1\1\1\2\10\uffff";
    static final String DFA14_specialS =
        "\13\uffff}>";
    static final String[] DFA14_transitionS = {
            "\2\2\6\uffff\1\1\1\uffff\1\2\3\uffff\6\2",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA14_eot = DFA.unpackEncodedString(DFA14_eotS);
    static final short[] DFA14_eof = DFA.unpackEncodedString(DFA14_eofS);
    static final char[] DFA14_min = DFA.unpackEncodedStringToUnsignedChars(DFA14_minS);
    static final char[] DFA14_max = DFA.unpackEncodedStringToUnsignedChars(DFA14_maxS);
    static final short[] DFA14_accept = DFA.unpackEncodedString(DFA14_acceptS);
    static final short[] DFA14_special = DFA.unpackEncodedString(DFA14_specialS);
    static final short[][] DFA14_transition;

    static {
        int numStates = DFA14_transitionS.length;
        DFA14_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA14_transition[i] = DFA.unpackEncodedString(DFA14_transitionS[i]);
        }
    }

    class DFA14 extends DFA {

        public DFA14(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 14;
            this.eot = DFA14_eot;
            this.eof = DFA14_eof;
            this.min = DFA14_min;
            this.max = DFA14_max;
            this.accept = DFA14_accept;
            this.special = DFA14_special;
            this.transition = DFA14_transition;
        }
        public String getDescription() {
            return "376:23: ( COMMA )?";
        }
    }
    static final String DFA16_eotS =
        "\12\uffff";
    static final String DFA16_eofS =
        "\12\uffff";
    static final String DFA16_minS =
        "\1\15\11\uffff";
    static final String DFA16_maxS =
        "\1\40\11\uffff";
    static final String DFA16_acceptS =
        "\1\uffff\1\1\1\2\1\3\1\4\1\5\1\6\1\7\1\10\1\11";
    static final String DFA16_specialS =
        "\12\uffff}>";
    static final String[] DFA16_transitionS = {
            "\1\11\1\10\10\uffff\1\2\3\uffff\1\1\1\3\1\4\1\5\1\6\1\7",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA16_eot = DFA.unpackEncodedString(DFA16_eotS);
    static final short[] DFA16_eof = DFA.unpackEncodedString(DFA16_eofS);
    static final char[] DFA16_min = DFA.unpackEncodedStringToUnsignedChars(DFA16_minS);
    static final char[] DFA16_max = DFA.unpackEncodedStringToUnsignedChars(DFA16_maxS);
    static final short[] DFA16_accept = DFA.unpackEncodedString(DFA16_acceptS);
    static final short[] DFA16_special = DFA.unpackEncodedString(DFA16_specialS);
    static final short[][] DFA16_transition;

    static {
        int numStates = DFA16_transitionS.length;
        DFA16_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA16_transition[i] = DFA.unpackEncodedString(DFA16_transitionS[i]);
        }
    }

    class DFA16 extends DFA {

        public DFA16(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 16;
            this.eot = DFA16_eot;
            this.eof = DFA16_eof;
            this.min = DFA16_min;
            this.max = DFA16_max;
            this.accept = DFA16_accept;
            this.special = DFA16_special;
            this.transition = DFA16_transition;
        }
        public String getDescription() {
            return "381:1: singleValue : ( NUMBER_WITH_UNIT | HASH_WORD | CLASS_REFERENCE ARGUMENTS -> ^( CLASS_REFERENCE ARGUMENTS ) | PROPERTY_REFERENCE ARGUMENTS -> ^( PROPERTY_REFERENCE ARGUMENTS ) | EMBED ARGUMENTS -> ^( EMBED ARGUMENTS ) | URL ARGUMENTS -> ^( URL ARGUMENTS ) | LOCAL ARGUMENTS -> ^( LOCAL ARGUMENTS ) | STRING | ID );";
        }
    }
 

    public static final BitSet FOLLOW_namespaceStatement_in_stylesheet137 = new BitSet(new long[]{0x0000000005D13002L});
    public static final BitSet FOLLOW_fontFace_in_stylesheet141 = new BitSet(new long[]{0x0000000005D13002L});
    public static final BitSet FOLLOW_mediaQuery_in_stylesheet145 = new BitSet(new long[]{0x0000000005D13002L});
    public static final BitSet FOLLOW_ruleset_in_stylesheet149 = new BitSet(new long[]{0x0000000005D13002L});
    public static final BitSet FOLLOW_AT_NAMESPACE_in_namespaceStatement173 = new BitSet(new long[]{0x0000000000006000L});
    public static final BitSet FOLLOW_ID_in_namespaceStatement175 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_STRING_in_namespaceStatement178 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_SEMI_COLONS_in_namespaceStatement180 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_AT_MEDIA_in_mediaQuery223 = new BitSet(new long[]{0x0000000000082000L});
    public static final BitSet FOLLOW_medium_in_mediaQuery225 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_BLOCK_OPEN_in_mediaQuery227 = new BitSet(new long[]{0x0000000005D53000L});
    public static final BitSet FOLLOW_ruleset_in_mediaQuery229 = new BitSet(new long[]{0x0000000005D53000L});
    public static final BitSet FOLLOW_BLOCK_END_in_mediaQuery232 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_mediumCondition_in_medium272 = new BitSet(new long[]{0x0000040000000002L});
    public static final BitSet FOLLOW_42_in_medium315 = new BitSet(new long[]{0x0000000000082000L});
    public static final BitSet FOLLOW_mediumCondition_in_medium330 = new BitSet(new long[]{0x0000040000000002L});
    public static final BitSet FOLLOW_set_in_mediumCondition0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_AT_FONT_FACE_in_fontFace425 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_declarationsBlock_in_fontFace427 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_selectorGroup_in_ruleset458 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_declarationsBlock_in_ruleset460 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_compoundSelector_in_selectorGroup494 = new BitSet(new long[]{0x0000000000200002L});
    public static final BitSet FOLLOW_COMMA_in_selectorGroup498 = new BitSet(new long[]{0x0000000005F13000L});
    public static final BitSet FOLLOW_compoundSelector_in_selectorGroup500 = new BitSet(new long[]{0x0000000000200002L});
    public static final BitSet FOLLOW_simpleSelectorFraction_in_compoundSelector565 = new BitSet(new long[]{0x0000000005D13002L});
    public static final BitSet FOLLOW_element_in_simpleSelectorFraction635 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_condition_in_simpleSelectorFraction645 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DOT_in_condition672 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_ID_in_condition675 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_HASH_WORD_in_condition687 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_COLON_in_condition700 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_ID_in_condition703 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_element738 = new BitSet(new long[]{0x0000000002000000L});
    public static final BitSet FOLLOW_PIPE_in_element740 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_ID_in_element743 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_element753 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STAR_in_element773 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BLOCK_OPEN_in_declarationsBlock814 = new BitSet(new long[]{0x000000000004A000L});
    public static final BitSet FOLLOW_SEMI_COLONS_in_declarationsBlock842 = new BitSet(new long[]{0x000000000000A000L});
    public static final BitSet FOLLOW_declaration_in_declarationsBlock860 = new BitSet(new long[]{0x0000000000048000L});
    public static final BitSet FOLLOW_SEMI_COLONS_in_declarationsBlock894 = new BitSet(new long[]{0x000000000000A000L});
    public static final BitSet FOLLOW_declaration_in_declarationsBlock913 = new BitSet(new long[]{0x0000000000048000L});
    public static final BitSet FOLLOW_SEMI_COLONS_in_declarationsBlock943 = new BitSet(new long[]{0x0000000000040000L});
    public static final BitSet FOLLOW_BLOCK_END_in_declarationsBlock966 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_declaration1006 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_COLON_in_declaration1008 = new BitSet(new long[]{0x00000001F8806000L});
    public static final BitSet FOLLOW_value_in_declaration1010 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_singleValue_in_value1056 = new BitSet(new long[]{0x00000001F8A06002L});
    public static final BitSet FOLLOW_COMMA_in_value1060 = new BitSet(new long[]{0x00000001F8806000L});
    public static final BitSet FOLLOW_singleValue_in_value1063 = new BitSet(new long[]{0x00000001F8A06002L});
    public static final BitSet FOLLOW_NUMBER_WITH_UNIT_in_singleValue1137 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_HASH_WORD_in_singleValue1147 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CLASS_REFERENCE_in_singleValue1157 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1159 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_PROPERTY_REFERENCE_in_singleValue1189 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1191 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_EMBED_in_singleValue1221 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1223 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_URL_in_singleValue1253 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1255 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LOCAL_in_singleValue1279 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ARGUMENTS_in_singleValue1281 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_singleValue1308 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_singleValue1324 = new BitSet(new long[]{0x0000000000000002L});

}
