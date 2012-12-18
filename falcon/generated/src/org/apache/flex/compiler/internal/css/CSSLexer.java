// $ANTLR 3.3 Nov 30, 2010 12:50:56 C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g 2012-10-02 17:55:21

package org.apache.flex.compiler.internal.css;

import org.apache.flex.compiler.problems.CSSParserProblem;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("unused")
public class CSSLexer extends Lexer {
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


    /**
     * Lexer problems.
     */
    protected List<CSSParserProblem> problems = new ArrayList<CSSParserProblem>();

    /**
     * Collect lexer problems.
     */
    @Override
    public void displayRecognitionError(String[] tokenNames, RecognitionException e)
    {
        problems.add(CSSParserProblem.create(this, tokenNames, e));
    }


    // delegates
    // delegators

    public CSSLexer() {;} 
    public CSSLexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public CSSLexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g"; }

    // $ANTLR start "T__42"
    public final void mT__42() throws RecognitionException {
        try {
            int _type = T__42;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:29:7: ( 'and' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:29:9: 'and'
            {
            match("and"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__42"

    // $ANTLR start "BLOCK_OPEN"
    public final void mBLOCK_OPEN() throws RecognitionException {
        try {
            int _type = BLOCK_OPEN;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:412:12: ( '{' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:412:14: '{'
            {
            match('{'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "BLOCK_OPEN"

    // $ANTLR start "BLOCK_END"
    public final void mBLOCK_END() throws RecognitionException {
        try {
            int _type = BLOCK_END;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:413:11: ( '}' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:413:14: '}'
            {
            match('}'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "BLOCK_END"

    // $ANTLR start "COMMA"
    public final void mCOMMA() throws RecognitionException {
        try {
            int _type = COMMA;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:414:7: ( ',' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:414:9: ','
            {
            match(','); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COMMA"

    // $ANTLR start "PERCENT"
    public final void mPERCENT() throws RecognitionException {
        try {
            int _type = PERCENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:415:9: ( '%' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:415:11: '%'
            {
            match('%'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "PERCENT"

    // $ANTLR start "PIPE"
    public final void mPIPE() throws RecognitionException {
        try {
            int _type = PIPE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:416:6: ( '|' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:416:8: '|'
            {
            match('|'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "PIPE"

    // $ANTLR start "STAR"
    public final void mSTAR() throws RecognitionException {
        try {
            int _type = STAR;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:417:6: ( '*' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:417:8: '*'
            {
            match('*'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "STAR"

    // $ANTLR start "DOT"
    public final void mDOT() throws RecognitionException {
        try {
            int _type = DOT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:418:5: ( '.' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:418:7: '.'
            {
            match('.'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "DOT"

    // $ANTLR start "EQUALS"
    public final void mEQUALS() throws RecognitionException {
        try {
            int _type = EQUALS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:419:7: ( '=' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:419:9: '='
            {
            match('='); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "EQUALS"

    // $ANTLR start "AT_NAMESPACE"
    public final void mAT_NAMESPACE() throws RecognitionException {
        try {
            int _type = AT_NAMESPACE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:420:14: ( '@namespace' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:420:16: '@namespace'
            {
            match("@namespace"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "AT_NAMESPACE"

    // $ANTLR start "AT_MEDIA"
    public final void mAT_MEDIA() throws RecognitionException {
        try {
            int _type = AT_MEDIA;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:421:10: ( '@media' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:421:12: '@media'
            {
            match("@media"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "AT_MEDIA"

    // $ANTLR start "COLON"
    public final void mCOLON() throws RecognitionException {
        try {
            int _type = COLON;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:422:7: ( ':' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:422:9: ':'
            {
            match(':'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COLON"

    // $ANTLR start "AT_FONT_FACE"
    public final void mAT_FONT_FACE() throws RecognitionException {
        try {
            int _type = AT_FONT_FACE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:423:14: ( '@font-face' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:423:16: '@font-face'
            {
            match("@font-face"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "AT_FONT_FACE"

    // $ANTLR start "CLASS_REFERENCE"
    public final void mCLASS_REFERENCE() throws RecognitionException {
        try {
            int _type = CLASS_REFERENCE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:424:17: ( 'ClassReference' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:424:19: 'ClassReference'
            {
            match("ClassReference"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "CLASS_REFERENCE"

    // $ANTLR start "PROPERTY_REFERENCE"
    public final void mPROPERTY_REFERENCE() throws RecognitionException {
        try {
            int _type = PROPERTY_REFERENCE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:425:20: ( 'PropertyReference' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:425:22: 'PropertyReference'
            {
            match("PropertyReference"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "PROPERTY_REFERENCE"

    // $ANTLR start "EMBED"
    public final void mEMBED() throws RecognitionException {
        try {
            int _type = EMBED;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:426:7: ( 'Embed' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:426:9: 'Embed'
            {
            match("Embed"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "EMBED"

    // $ANTLR start "URL"
    public final void mURL() throws RecognitionException {
        try {
            int _type = URL;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:427:5: ( 'url' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:427:7: 'url'
            {
            match("url"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "URL"

    // $ANTLR start "LOCAL"
    public final void mLOCAL() throws RecognitionException {
        try {
            int _type = LOCAL;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:428:7: ( 'local' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:428:9: 'local'
            {
            match("local"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "LOCAL"

    // $ANTLR start "NULL"
    public final void mNULL() throws RecognitionException {
        try {
            int _type = NULL;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:429:6: ( 'null' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:429:8: 'null'
            {
            match("null"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "NULL"

    // $ANTLR start "ARGUMENTS"
    public final void mARGUMENTS() throws RecognitionException {
        try {
            int _type = ARGUMENTS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:433:5: ( '(' ( options {greedy=false; } : . )* ')' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:433:9: '(' ( options {greedy=false; } : . )* ')'
            {
            match('('); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:433:13: ( options {greedy=false; } : . )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( (LA1_0==')') ) {
                    alt1=2;
                }
                else if ( ((LA1_0>='\u0000' && LA1_0<='(')||(LA1_0>='*' && LA1_0<='\uFFFF')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:433:40: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);

            match(')'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "ARGUMENTS"

    // $ANTLR start "SEMI_COLONS"
    public final void mSEMI_COLONS() throws RecognitionException {
        try {
            int _type = SEMI_COLONS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:439:13: ( ( ';' )+ )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:439:15: ( ';' )+
            {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:439:15: ( ';' )+
            int cnt2=0;
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);

                if ( (LA2_0==';') ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:439:15: ';'
            	    {
            	    match(';'); 

            	    }
            	    break;

            	default :
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "SEMI_COLONS"

    // $ANTLR start "HASH_WORD"
    public final void mHASH_WORD() throws RecognitionException {
        try {
            int _type = HASH_WORD;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:446:5: ( '#' ( LETTER | DIGIT | '-' | '_' )+ )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:446:9: '#' ( LETTER | DIGIT | '-' | '_' )+
            {
            match('#'); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:446:13: ( LETTER | DIGIT | '-' | '_' )+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( (LA3_0=='-'||(LA3_0>='0' && LA3_0<='9')||(LA3_0>='A' && LA3_0<='Z')||LA3_0=='_'||(LA3_0>='a' && LA3_0<='z')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:
            	    {
            	    if ( input.LA(1)=='-'||(input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    if ( cnt3 >= 1 ) break loop3;
                        EarlyExitException eee =
                            new EarlyExitException(3, input);
                        throw eee;
                }
                cnt3++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "HASH_WORD"

    // $ANTLR start "ID"
    public final void mID() throws RecognitionException {
        try {
            int _type = ID;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:449:5: ( ( '-' | '_' )? LETTER ( LETTER | DIGIT | '-' | '_' )* )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:449:9: ( '-' | '_' )? LETTER ( LETTER | DIGIT | '-' | '_' )*
            {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:449:9: ( '-' | '_' )?
            int alt4=2;
            int LA4_0 = input.LA(1);

            if ( (LA4_0=='-'||LA4_0=='_') ) {
                alt4=1;
            }
            switch (alt4) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:
                    {
                    if ( input.LA(1)=='-'||input.LA(1)=='_' ) {
                        input.consume();

                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        recover(mse);
                        throw mse;}


                    }
                    break;

            }

            mLETTER(); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:449:32: ( LETTER | DIGIT | '-' | '_' )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);

                if ( (LA5_0=='-'||(LA5_0>='0' && LA5_0<='9')||(LA5_0>='A' && LA5_0<='Z')||LA5_0=='_'||(LA5_0>='a' && LA5_0<='z')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:
            	    {
            	    if ( input.LA(1)=='-'||(input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop5;
                }
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "ID"

    // $ANTLR start "LETTER"
    public final void mLETTER() throws RecognitionException {
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:454:5: ( 'a' .. 'z' | 'A' .. 'Z' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:
            {
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}


            }

        }
        finally {
        }
    }
    // $ANTLR end "LETTER"

    // $ANTLR start "NUMBER"
    public final void mNUMBER() throws RecognitionException {
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:463:2: ( ( '+' | '-' )? ( ( DIGIT )+ ( DOT ( DIGIT )+ )? | DOT ( DIGIT )+ ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:463:6: ( '+' | '-' )? ( ( DIGIT )+ ( DOT ( DIGIT )+ )? | DOT ( DIGIT )+ )
            {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:463:6: ( '+' | '-' )?
            int alt6=2;
            int LA6_0 = input.LA(1);

            if ( (LA6_0=='+'||LA6_0=='-') ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:
                    {
                    if ( input.LA(1)=='+'||input.LA(1)=='-' ) {
                        input.consume();

                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        recover(mse);
                        throw mse;}


                    }
                    break;

            }

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:3: ( ( DIGIT )+ ( DOT ( DIGIT )+ )? | DOT ( DIGIT )+ )
            int alt11=2;
            int LA11_0 = input.LA(1);

            if ( ((LA11_0>='0' && LA11_0<='9')) ) {
                alt11=1;
            }
            else if ( (LA11_0=='.') ) {
                alt11=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 11, 0, input);

                throw nvae;
            }
            switch (alt11) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:5: ( DIGIT )+ ( DOT ( DIGIT )+ )?
                    {
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:5: ( DIGIT )+
                    int cnt7=0;
                    loop7:
                    do {
                        int alt7=2;
                        int LA7_0 = input.LA(1);

                        if ( ((LA7_0>='0' && LA7_0<='9')) ) {
                            alt7=1;
                        }


                        switch (alt7) {
                    	case 1 :
                    	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:5: DIGIT
                    	    {
                    	    mDIGIT(); 

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

                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:12: ( DOT ( DIGIT )+ )?
                    int alt9=2;
                    int LA9_0 = input.LA(1);

                    if ( (LA9_0=='.') ) {
                        alt9=1;
                    }
                    switch (alt9) {
                        case 1 :
                            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:13: DOT ( DIGIT )+
                            {
                            mDOT(); 
                            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:17: ( DIGIT )+
                            int cnt8=0;
                            loop8:
                            do {
                                int alt8=2;
                                int LA8_0 = input.LA(1);

                                if ( ((LA8_0>='0' && LA8_0<='9')) ) {
                                    alt8=1;
                                }


                                switch (alt8) {
                            	case 1 :
                            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:464:17: DIGIT
                            	    {
                            	    mDIGIT(); 

                            	    }
                            	    break;

                            	default :
                            	    if ( cnt8 >= 1 ) break loop8;
                                        EarlyExitException eee =
                                            new EarlyExitException(8, input);
                                        throw eee;
                                }
                                cnt8++;
                            } while (true);


                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:465:7: DOT ( DIGIT )+
                    {
                    mDOT(); 
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:465:11: ( DIGIT )+
                    int cnt10=0;
                    loop10:
                    do {
                        int alt10=2;
                        int LA10_0 = input.LA(1);

                        if ( ((LA10_0>='0' && LA10_0<='9')) ) {
                            alt10=1;
                        }


                        switch (alt10) {
                    	case 1 :
                    	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:465:11: DIGIT
                    	    {
                    	    mDIGIT(); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt10 >= 1 ) break loop10;
                                EarlyExitException eee =
                                    new EarlyExitException(10, input);
                                throw eee;
                        }
                        cnt10++;
                    } while (true);


                    }
                    break;

            }


            }

        }
        finally {
        }
    }
    // $ANTLR end "NUMBER"

    // $ANTLR start "NUMBER_WITH_UNIT"
    public final void mNUMBER_WITH_UNIT() throws RecognitionException {
        try {
            int _type = NUMBER_WITH_UNIT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:483:2: ( NUMBER ( ID | PERCENT )? )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:483:4: NUMBER ( ID | PERCENT )?
            {
            mNUMBER(); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:483:11: ( ID | PERCENT )?
            int alt12=3;
            int LA12_0 = input.LA(1);

            if ( (LA12_0=='-'||(LA12_0>='A' && LA12_0<='Z')||LA12_0=='_'||(LA12_0>='a' && LA12_0<='z')) ) {
                alt12=1;
            }
            else if ( (LA12_0=='%') ) {
                alt12=2;
            }
            switch (alt12) {
                case 1 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:483:12: ID
                    {
                    mID(); 

                    }
                    break;
                case 2 :
                    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:483:15: PERCENT
                    {
                    mPERCENT(); 

                    }
                    break;

            }


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "NUMBER_WITH_UNIT"

    // $ANTLR start "DIGIT"
    public final void mDIGIT() throws RecognitionException {
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:488:5: ( '0' .. '9' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:488:9: '0' .. '9'
            {
            matchRange('0','9'); 

            }

        }
        finally {
        }
    }
    // $ANTLR end "DIGIT"

    // $ANTLR start "COMMENT"
    public final void mCOMMENT() throws RecognitionException {
        try {
            int _type = COMMENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:492:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:492:9: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:492:14: ( options {greedy=false; } : . )*
            loop13:
            do {
                int alt13=2;
                int LA13_0 = input.LA(1);

                if ( (LA13_0=='*') ) {
                    int LA13_1 = input.LA(2);

                    if ( (LA13_1=='/') ) {
                        alt13=2;
                    }
                    else if ( ((LA13_1>='\u0000' && LA13_1<='.')||(LA13_1>='0' && LA13_1<='\uFFFF')) ) {
                        alt13=1;
                    }


                }
                else if ( ((LA13_0>='\u0000' && LA13_0<=')')||(LA13_0>='+' && LA13_0<='\uFFFF')) ) {
                    alt13=1;
                }


                switch (alt13) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:492:41: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop13;
                }
            } while (true);

            match("*/"); 

             _channel = HIDDEN; 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COMMENT"

    // $ANTLR start "WS"
    public final void mWS() throws RecognitionException {
        try {
            int _type = WS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:496:5: ( ( ' ' | '\\t' | '\\r' | '\\n' ) )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:496:9: ( ' ' | '\\t' | '\\r' | '\\n' )
            {
            if ( (input.LA(1)>='\t' && input.LA(1)<='\n')||input.LA(1)=='\r'||input.LA(1)==' ' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

             _channel = HIDDEN; 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "WS"

    // $ANTLR start "STRING"
    public final void mSTRING() throws RecognitionException {
        try {
            int _type = STRING;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:500:5: ( STRING_QUOTE (~ ( '\\\\' | STRING_QUOTE ) )* STRING_QUOTE )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:500:9: STRING_QUOTE (~ ( '\\\\' | STRING_QUOTE ) )* STRING_QUOTE
            {
            mSTRING_QUOTE(); 
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:501:9: (~ ( '\\\\' | STRING_QUOTE ) )*
            loop14:
            do {
                int alt14=2;
                int LA14_0 = input.LA(1);

                if ( ((LA14_0>='\u0000' && LA14_0<='!')||(LA14_0>='#' && LA14_0<='&')||(LA14_0>='(' && LA14_0<='[')||(LA14_0>=']' && LA14_0<='\uFFFF')) ) {
                    alt14=1;
                }


                switch (alt14) {
            	case 1 :
            	    // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:501:11: ~ ( '\\\\' | STRING_QUOTE )
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='!')||(input.LA(1)>='#' && input.LA(1)<='&')||(input.LA(1)>='(' && input.LA(1)<='[')||(input.LA(1)>=']' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop14;
                }
            } while (true);

            mSTRING_QUOTE(); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "STRING"

    // $ANTLR start "STRING_QUOTE"
    public final void mSTRING_QUOTE() throws RecognitionException {
        try {
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:507:5: ( '\"' | '\\'' )
            // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:
            {
            if ( input.LA(1)=='\"'||input.LA(1)=='\'' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}


            }

        }
        finally {
        }
    }
    // $ANTLR end "STRING_QUOTE"

    public void mTokens() throws RecognitionException {
        // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:8: ( T__42 | BLOCK_OPEN | BLOCK_END | COMMA | PERCENT | PIPE | STAR | DOT | EQUALS | AT_NAMESPACE | AT_MEDIA | COLON | AT_FONT_FACE | CLASS_REFERENCE | PROPERTY_REFERENCE | EMBED | URL | LOCAL | NULL | ARGUMENTS | SEMI_COLONS | HASH_WORD | ID | NUMBER_WITH_UNIT | COMMENT | WS | STRING )
        int alt15=27;
        alt15 = dfa15.predict(input);
        switch (alt15) {
            case 1 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:10: T__42
                {
                mT__42(); 

                }
                break;
            case 2 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:16: BLOCK_OPEN
                {
                mBLOCK_OPEN(); 

                }
                break;
            case 3 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:27: BLOCK_END
                {
                mBLOCK_END(); 

                }
                break;
            case 4 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:37: COMMA
                {
                mCOMMA(); 

                }
                break;
            case 5 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:43: PERCENT
                {
                mPERCENT(); 

                }
                break;
            case 6 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:51: PIPE
                {
                mPIPE(); 

                }
                break;
            case 7 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:56: STAR
                {
                mSTAR(); 

                }
                break;
            case 8 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:61: DOT
                {
                mDOT(); 

                }
                break;
            case 9 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:65: EQUALS
                {
                mEQUALS(); 

                }
                break;
            case 10 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:72: AT_NAMESPACE
                {
                mAT_NAMESPACE(); 

                }
                break;
            case 11 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:85: AT_MEDIA
                {
                mAT_MEDIA(); 

                }
                break;
            case 12 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:94: COLON
                {
                mCOLON(); 

                }
                break;
            case 13 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:100: AT_FONT_FACE
                {
                mAT_FONT_FACE(); 

                }
                break;
            case 14 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:113: CLASS_REFERENCE
                {
                mCLASS_REFERENCE(); 

                }
                break;
            case 15 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:129: PROPERTY_REFERENCE
                {
                mPROPERTY_REFERENCE(); 

                }
                break;
            case 16 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:148: EMBED
                {
                mEMBED(); 

                }
                break;
            case 17 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:154: URL
                {
                mURL(); 

                }
                break;
            case 18 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:158: LOCAL
                {
                mLOCAL(); 

                }
                break;
            case 19 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:164: NULL
                {
                mNULL(); 

                }
                break;
            case 20 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:169: ARGUMENTS
                {
                mARGUMENTS(); 

                }
                break;
            case 21 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:179: SEMI_COLONS
                {
                mSEMI_COLONS(); 

                }
                break;
            case 22 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:191: HASH_WORD
                {
                mHASH_WORD(); 

                }
                break;
            case 23 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:201: ID
                {
                mID(); 

                }
                break;
            case 24 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:204: NUMBER_WITH_UNIT
                {
                mNUMBER_WITH_UNIT(); 

                }
                break;
            case 25 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:221: COMMENT
                {
                mCOMMENT(); 

                }
                break;
            case 26 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:229: WS
                {
                mWS(); 

                }
                break;
            case 27 :
                // C:/CodeOrchestra/falcon_compiler/compiler/src/org/apache/flex/compiler/internal/css/CSS.g:1:232: STRING
                {
                mSTRING(); 

                }
                break;

        }

    }


    protected DFA15 dfa15 = new DFA15(this);
    static final String DFA15_eotS =
        "\1\uffff\1\26\6\uffff\1\34\3\uffff\6\26\11\uffff\1\26\4\uffff\6"+
        "\26\1\55\3\26\1\61\2\26\1\uffff\3\26\1\uffff\1\26\1\70\2\26\1\73"+
        "\1\74\1\uffff\2\26\2\uffff\16\26\1\115\1\26\1\uffff\2\26\1\121\1"+
        "\uffff";
    static final String DFA15_eofS =
        "\122\uffff";
    static final String DFA15_minS =
        "\1\11\1\156\6\uffff\1\60\1\uffff\1\146\1\uffff\1\154\1\162\1\155"+
        "\1\162\1\157\1\165\3\uffff\1\56\5\uffff\1\144\4\uffff\1\141\1\157"+
        "\1\142\1\154\1\143\1\154\1\55\1\163\1\160\1\145\1\55\1\141\1\154"+
        "\1\uffff\1\163\1\145\1\144\1\uffff\1\154\1\55\1\122\1\162\2\55\1"+
        "\uffff\1\145\1\164\2\uffff\1\146\1\171\1\145\1\122\1\162\2\145\1"+
        "\146\1\156\1\145\1\143\1\162\2\145\1\55\1\156\1\uffff\1\143\1\145"+
        "\1\55\1\uffff";
    static final String DFA15_maxS =
        "\1\175\1\156\6\uffff\1\71\1\uffff\1\156\1\uffff\1\154\1\162\1\155"+
        "\1\162\1\157\1\165\3\uffff\1\172\5\uffff\1\144\4\uffff\1\141\1\157"+
        "\1\142\1\154\1\143\1\154\1\172\1\163\1\160\1\145\1\172\1\141\1\154"+
        "\1\uffff\1\163\1\145\1\144\1\uffff\1\154\1\172\1\122\1\162\2\172"+
        "\1\uffff\1\145\1\164\2\uffff\1\146\1\171\1\145\1\122\1\162\2\145"+
        "\1\146\1\156\1\145\1\143\1\162\2\145\1\172\1\156\1\uffff\1\143\1"+
        "\145\1\172\1\uffff";
    static final String DFA15_acceptS =
        "\2\uffff\1\2\1\3\1\4\1\5\1\6\1\7\1\uffff\1\11\1\uffff\1\14\6\uffff"+
        "\1\24\1\25\1\26\1\uffff\1\27\1\30\1\31\1\32\1\33\1\uffff\1\10\1"+
        "\12\1\13\1\15\15\uffff\1\1\3\uffff\1\21\6\uffff\1\23\2\uffff\1\20"+
        "\1\22\20\uffff\1\16\3\uffff\1\17";
    static final String DFA15_specialS =
        "\122\uffff}>";
    static final String[] DFA15_transitionS = {
            "\2\31\2\uffff\1\31\22\uffff\1\31\1\uffff\1\32\1\24\1\uffff"+
            "\1\5\1\uffff\1\32\1\22\1\uffff\1\7\1\27\1\4\1\25\1\10\1\30\12"+
            "\27\1\13\1\23\1\uffff\1\11\2\uffff\1\12\2\26\1\14\1\26\1\16"+
            "\12\26\1\15\12\26\4\uffff\1\26\1\uffff\1\1\12\26\1\20\1\26\1"+
            "\21\6\26\1\17\5\26\1\2\1\6\1\3",
            "\1\33",
            "",
            "",
            "",
            "",
            "",
            "",
            "\12\27",
            "",
            "\1\37\6\uffff\1\36\1\35",
            "",
            "\1\40",
            "\1\41",
            "\1\42",
            "\1\43",
            "\1\44",
            "\1\45",
            "",
            "",
            "",
            "\1\27\1\uffff\12\27\7\uffff\32\26\6\uffff\32\26",
            "",
            "",
            "",
            "",
            "",
            "\1\46",
            "",
            "",
            "",
            "",
            "\1\47",
            "\1\50",
            "\1\51",
            "\1\52",
            "\1\53",
            "\1\54",
            "\1\26\2\uffff\12\26\7\uffff\32\26\4\uffff\1\26\1\uffff\32"+
            "\26",
            "\1\56",
            "\1\57",
            "\1\60",
            "\1\26\2\uffff\12\26\7\uffff\32\26\4\uffff\1\26\1\uffff\32"+
            "\26",
            "\1\62",
            "\1\63",
            "",
            "\1\64",
            "\1\65",
            "\1\66",
            "",
            "\1\67",
            "\1\26\2\uffff\12\26\7\uffff\32\26\4\uffff\1\26\1\uffff\32"+
            "\26",
            "\1\71",
            "\1\72",
            "\1\26\2\uffff\12\26\7\uffff\32\26\4\uffff\1\26\1\uffff\32"+
            "\26",
            "\1\26\2\uffff\12\26\7\uffff\32\26\4\uffff\1\26\1\uffff\32"+
            "\26",
            "",
            "\1\75",
            "\1\76",
            "",
            "",
            "\1\77",
            "\1\100",
            "\1\101",
            "\1\102",
            "\1\103",
            "\1\104",
            "\1\105",
            "\1\106",
            "\1\107",
            "\1\110",
            "\1\111",
            "\1\112",
            "\1\113",
            "\1\114",
            "\1\26\2\uffff\12\26\7\uffff\32\26\4\uffff\1\26\1\uffff\32"+
            "\26",
            "\1\116",
            "",
            "\1\117",
            "\1\120",
            "\1\26\2\uffff\12\26\7\uffff\32\26\4\uffff\1\26\1\uffff\32"+
            "\26",
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
            return "1:1: Tokens : ( T__42 | BLOCK_OPEN | BLOCK_END | COMMA | PERCENT | PIPE | STAR | DOT | EQUALS | AT_NAMESPACE | AT_MEDIA | COLON | AT_FONT_FACE | CLASS_REFERENCE | PROPERTY_REFERENCE | EMBED | URL | LOCAL | NULL | ARGUMENTS | SEMI_COLONS | HASH_WORD | ID | NUMBER_WITH_UNIT | COMMENT | WS | STRING );";
        }
    }
 

}
