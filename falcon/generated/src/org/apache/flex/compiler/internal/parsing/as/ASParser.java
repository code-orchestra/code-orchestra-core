// $ANTLR 2.7.7 (20060906): "ASParser.g" -> "ASParser.java"$

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

package org.apache.flex.compiler.internal.parsing.as;

/*
 * This file is generated from ASTreeAssembler.g
 * DO NOT MAKE EDITS DIRECTLY TO THIS FILE.  THEY WILL BE LOST WHEN THE FILE IS GENERATED AGAIN!!!
 */

import java.util.ArrayList;
import java.util.List;

import org.apache.flex.compiler.tree.as.*;
import org.apache.flex.compiler.workspaces.IWorkspace;
import org.apache.flex.compiler.parsing.IASToken;
import org.apache.flex.compiler.parsing.IASToken.ASTokenKind;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.internal.tree.as.metadata.*;
import org.apache.flex.compiler.asdoc.IASParserASDocDelegate;
import org.apache.flex.compiler.constants.IASLanguageConstants;
import org.apache.flex.compiler.problems.ICompilerProblem;
import org.apache.flex.compiler.problems.*;


import antlr.TokenBuffer;
import antlr.TokenStreamException;
import antlr.TokenStreamIOException;
import antlr.ANTLRException;
import antlr.LLkParser;
import antlr.Token;
import antlr.TokenStream;
import antlr.RecognitionException;
import antlr.NoViableAltException;
import antlr.MismatchedTokenException;
import antlr.SemanticException;
import antlr.ParserSharedInputState;
import antlr.collections.impl.BitSet;

/**
 * ActionScript3 parser grammar. It consumes ASTokens and produces IASNode AST.
 * The number of tokens in a single syntactic predicate can not be greater than
 * StreamingTokenBuffer.REWIND_BUFFER_SIZE.
 *
 * @see <a href="https://zerowing.corp.adobe.com/display/FlashPlayer/ActionScript+Language+Specification">ActionScript Language Syntax Specification</a>
 */
@SuppressWarnings("unused")
public class ASParser extends org.apache.flex.compiler.internal.parsing.as.BaseASParser       implements ASTokenTypes
 {


    /**
     * Construct an AS3 parser from a token buffer.
     */
    public ASParser(IWorkspace workspace, IRepairingTokenBuffer buffer) 
    {
    	super(workspace, buffer);
    	tokenNames = _tokenNames;
    }

	/**
     * Construct an AS3 parser for parsing command line config args
     */
	public ASParser(IWorkspace workspace, IRepairingTokenBuffer buffer, boolean parsingProjectConfigVariables) 
    {
    	super(workspace, buffer, parsingProjectConfigVariables);
    	tokenNames = _tokenNames;
    }

protected ASParser(TokenBuffer tokenBuf, int k) {
  super(tokenBuf,k);
  tokenNames = _tokenNames;
}

public ASParser(TokenBuffer tokenBuf) {
  this(tokenBuf,1);
}

protected ASParser(TokenStream lexer, int k) {
  super(lexer,k);
  tokenNames = _tokenNames;
}

public ASParser(TokenStream lexer) {
  this(lexer,1);
}

public ASParser(ParserSharedInputState state) {
  super(state,1);
  tokenNames = _tokenNames;
}

/**
 * Matches multiple directives. This layer is added to handle parsing error in directives.
 */
	public final void fileLevelDirectives(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
		try {      // for error handling
			{
			_loop3:
			do {
				if ((_tokenSet_0.member(LA(1)))) {
					directive(c, NO_END_TOKEN);
				}
				else {
					break _loop3;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException parserError) {
			handleParsingError(parserError);
		}
	}
	
/**
 * Matches a "directive" level input.
 * The first couple of alternatives gated with semantic predicates are used to
 * either disambiguate inputs, or to trap erroneous syntax.
 */
	public final void directive(
		ContainerNode c, int endToken
	) throws RecognitionException, TokenStreamException {
		
		Token  nsT = null;
		Token  fT = null;
		Token  cT = null;
		
		final ASToken lt1 = LT(1);
		final ASToken lt2 = LT(2);
		final int la1 = LA(1);
		final int la2 = LA(2);
		final int la3 = LA(3);
		final int la4 = LA(4);
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_ASDOC_COMMENT:
			{
				asDocComment();
				break;
			}
			case TOKEN_KEYWORD_IMPORT:
			{
				importDirective(c);
				break;
			}
			case TOKEN_KEYWORD_USE:
			{
				useNamespaceDirective(c);
				break;
			}
			case TOKEN_KEYWORD_PACKAGE:
			{
				packageDirective(c);
				break;
			}
			case TOKEN_RESERVED_WORD_CONFIG:
			{
				configNamespace(c);
				break;
			}
			case TOKEN_KEYWORD_INCLUDE:
			{
				includeDirective();
				break;
			}
			case TOKEN_KEYWORD_FINALLY:
			{
				fT = LT(1);
				match(TOKEN_KEYWORD_FINALLY);
				reportUnexpectedTokenProblem((ASToken)fT);
				break;
			}
			case TOKEN_KEYWORD_CATCH:
			{
				cT = LT(1);
				match(TOKEN_KEYWORD_CATCH);
				reportUnexpectedTokenProblem((ASToken)cT);
				break;
			}
			default:
				if (((LA(1)==TOKEN_BLOCK_OPEN))&&( la1 == TOKEN_BLOCK_OPEN )) {
					groupDirective(c, endToken);
				}
				else if (((_tokenSet_1.member(LA(1))))&&( la1 == TOKEN_RESERVED_WORD_NAMESPACE && la2 == TOKEN_PAREN_OPEN )) {
					statement(c, endToken);
				}
				else if (((LA(1)==TOKEN_IDENTIFIER))&&( la1 == TOKEN_IDENTIFIER && la2 == TOKEN_NAMESPACE_ANNOTATION && lt1.getLine() == lt2.getLine() )) {
					nsT = LT(1);
					match(TOKEN_IDENTIFIER);
					attributedDefinition(c);
					trapInvalidNamespaceAttribute((ASToken)nsT);
				}
				else if (((LA(1)==TOKEN_NAMESPACE_NAME))&&( la1 == TOKEN_NAMESPACE_NAME && 
    	  la2 == TOKEN_OPERATOR_NS_QUALIFIER && 
    	  la3 == TOKEN_IDENTIFIER && 
    	  la4 == TOKEN_BLOCK_OPEN)) {
					groupDirectiveWithConfigVariable(c, endToken);
				}
				else if (((_tokenSet_2.member(LA(1))))&&( la1 == TOKEN_NAMESPACE_NAME &&
    	  la2 == TOKEN_OPERATOR_NS_QUALIFIER &&
    	  la3 == TOKEN_NAMESPACE_ANNOTATION )) {
					attributedDefinition(c);
				}
				else if (((_tokenSet_1.member(LA(1))))&&( la1 == TOKEN_NAMESPACE_NAME &&
    	  la2 == TOKEN_OPERATOR_NS_QUALIFIER )) {
					statement(c,endToken);
				}
				else if (((_tokenSet_2.member(LA(1))))&&( !isFunctionClosure() )) {
					attributedDefinition(c);
				}
				else if ((_tokenSet_1.member(LA(1)))) {
					statement(c,endToken);
				}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			
				handleParsingError(ex, endToken);  
				consumeUntilKeywordOrIdentifier(endToken); 
			
		}
	}
	
/**
 * Matches a "group" in a "group directive". 
 * Entering a "Block" leaves the global context, but entering a "Group" doesn't.
 */
	public final void groupDirective(
		ContainerNode c, int endToken
	) throws RecognitionException, TokenStreamException {
		
		Token  openT = null;
		Token  closeT = null;
		
		BlockNode b = new BlockNode(); 
		enterGroup();
		
		
		openT = LT(1);
		match(TOKEN_BLOCK_OPEN);
		b.startAfter(openT);
		{
		_loop14:
		do {
			if ((_tokenSet_0.member(LA(1)))) {
				directive(c, endToken);
			}
			else {
				break _loop14;
			}
			
		} while (true);
		}
		if(b.getChildCount() > 0) c.addItem(b);
		closeT = LT(1);
		match(TOKEN_BLOCK_CLOSE);
		b.endBefore(closeT); leaveGroup();
	}
	
/**
 * Matches a statement.
 *
 * Note that the "SuperStatement" in ASL syntax spec is not explicitly defined.
 * The "super" statements like <code>super(args);</code> are matched as regular
 * "call" expressions.
 */
	public final void statement(
		ContainerNode c, int exitCondition
	) throws RecognitionException, TokenStreamException {
		
		
		final int la1 = LA(1);
		final int la2 = LA(2);
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			{
				breakOrContinueStatement(c);
				break;
			}
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			{
				defaultXMLNamespaceStatement(c);
				break;
			}
			case TOKEN_RESERVED_WORD_GOTO:
			{
				gotoStatement(c);
				break;
			}
			case TOKEN_SEMICOLON:
			{
				emptyStatement();
				break;
			}
			case TOKEN_KEYWORD_FOR:
			{
				forStatement(c);
				break;
			}
			case TOKEN_KEYWORD_IF:
			{
				ifStatement(c);
				break;
			}
			case TOKEN_KEYWORD_RETURN:
			{
				returnStatement(c);
				break;
			}
			case TOKEN_KEYWORD_SWITCH:
			{
				switchStatement(c);
				break;
			}
			case TOKEN_KEYWORD_THROW:
			{
				throwsStatement(c);
				break;
			}
			case TOKEN_KEYWORD_TRY:
			{
				tryStatement(c);
				break;
			}
			case TOKEN_KEYWORD_WHILE:
			{
				whileStatement(c);
				break;
			}
			case TOKEN_KEYWORD_DO:
			{
				doStatement(c);
				break;
			}
			case TOKEN_KEYWORD_WITH:
			{
				withStatement(c);
				break;
			}
			default:
				if (((LA(1)==TOKEN_IDENTIFIER))&&( la1 == TOKEN_IDENTIFIER && la2 == TOKEN_COLON )) {
					labeledStatement(c, exitCondition);
				}
				else if (((_tokenSet_3.member(LA(1))))&&( la1 != TOKEN_SQUARE_OPEN && 
    	  la1 != TOKEN_OPERATOR_LESS_THAN && 
    	  la1 != TOKEN_BLOCK_OPEN )) {
					expressionStatement(c);
				}
				else if ((LA(1)==TOKEN_ATTRIBUTE||LA(1)==TOKEN_SQUARE_OPEN)) {
					meta(c);
				}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			
			handleParsingError(ex);  
			consumeUntilKeywordOrIdentifier(exitCondition); 
			
		}
	}
	
/**
 * Matches an attributed definition. An "attribute" can be a namespace or a 
 * modifier.
 */
	public final void attributedDefinition(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
		List<INamespaceDecorationNode> namespaceAttributes = new ArrayList<INamespaceDecorationNode>();
		List<ModifierNode> modifiers = new ArrayList<ModifierNode>(); 
		INamespaceDecorationNode namespaceAttr = null;
		
		boolean enabled = isDefinitionEnabled(c);
		boolean eval = true;
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_NAMESPACE_NAME:
			{
				eval=configConditionOfDefinition();
				break;
			}
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
				// A configuration condition variable can either be matched by
				// the above rule or be transformed into a LiteralNode of boolean
				// type. If either is evaluated to false, the definition is disabled.
				enabled &= eval;
			if (!enabled)
						    c = new ContainerNode(); 
			
			{
			_loop9:
			do {
				if ((_tokenSet_4.member(LA(1)))) {
					attribute(modifiers, namespaceAttributes);
				}
				else {
					break _loop9;
				}
				
			} while (true);
			}
			
			// Verify that at most one namespace attribute is matched.
			verifyNamespaceAttributes(namespaceAttributes);
			
			if (!namespaceAttributes.isEmpty())
			namespaceAttr = namespaceAttributes.get(0);
			
			definition(c, namespaceAttr, modifiers);
		}
		catch (RecognitionException ex) {
			
					handleParsingError(ex);  
				
		}
	}
	
/**
 * Matches an ASDoc block.
 */
	public final void asDocComment() throws RecognitionException, TokenStreamException {
		
		Token  asdocT = null;
		
		asdocT = LT(1);
		match(TOKEN_ASDOC_COMMENT);
		
					asDocDelegate.setCurrentASDocToken(asdocT);
				
	}
	
/**
 * Matches an import directive.
 *
 *     import flash.display.Sprite;
 *     import flash.events.*;
 */
	public final void importDirective(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  importT = null;
		
			ExpressionNodeBase n = null; 
			ImportNode i = null; 
		
		
		try {      // for error handling
			importT = LT(1);
			match(TOKEN_KEYWORD_IMPORT);
			
					i = new ImportNode((ExpressionNodeBase) null);
					i.startBefore(importT);
					i.endAfter(importT); 
					c.addItem(i);
				
			n=importName();
			
					if(n != null) {
						i.setImportTarget(n);
						i.setEnd(n.getEnd());
						encounteredImport(i);
					} 
					else {
						i.setImportTarget(new IdentifierNode(""));
					}
					matchOptionalSemicolon();
				
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches "use namespace ns" directive.
 */
	public final void useNamespaceDirective(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  useT = null;
		Token  nsT = null;
		
			ExpressionNodeBase n = null;
			UseNamespaceNode u = null;
		
		
		try {      // for error handling
			useT = LT(1);
			match(TOKEN_KEYWORD_USE);
			u = new UseNamespaceNode(n); u.startBefore(useT); c.addItem(u);
			nsT = LT(1);
			match(TOKEN_RESERVED_WORD_NAMESPACE);
			u.endAfter(nsT);
			n=restrictedName();
			
					u.setTargetNamespace(n);
					u.setEnd(n.getEnd());
					matchOptionalSemicolon();
				
		}
		catch (RecognitionException ex) {
			
					if (u != null && u.getTargetNamespace() == null) 
						u.setTargetNamespace(handleMissingIdentifier(ex));
					else 
						handleParsingError(ex);  
				
		}
	}
	
/**
 * Matches a group of directives gated with configuration variable.
 *
 *     CONFIG::debug {
 *         trace("debugging code");
 *     }
 *
 * If the configuration variable evaluates to false, the following block will
 * not be added to the resulting AST.
 */
	public final void groupDirectiveWithConfigVariable(
		ContainerNode c, int endToken
	) throws RecognitionException, TokenStreamException {
		
		
		boolean b;
		ConfigConditionBlockNode block;
		final Token lt = LT(1);
		
		
		b=configCondition();
		
			block = new ConfigConditionBlockNode(b);
			block.startBefore(lt);
			c.addItem(block);
		
		groupDirective(block, endToken);
	}
	
/**
 * Matches a "package" block.
 *
 *     package mx.controls { ... }
 *
 */
	public final void packageDirective(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  packageT = null;
		Token  openT = null;
		
			PackageNode p = null; 
			ExpressionNodeBase name = null; 
			BlockNode b = null; 
		
		
		try {      // for error handling
			packageT = LT(1);
			match(TOKEN_KEYWORD_PACKAGE);
			enterPackage((ASToken)packageT);
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			{
				name=packageName();
				break;
			}
			case TOKEN_BLOCK_OPEN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
				p = new PackageNode(name != null ? name : IdentifierNode.createEmptyIdentifierNodeAfterToken(packageT), (ASToken)packageT);
				p.startBefore(packageT);
				c.addItem(p);
				b = p.getScopedNode();
			
			{
			openT = LT(1);
			match(TOKEN_BLOCK_OPEN);
			b.startAfter(openT);
			packageContents(b);
			}
			leavePackage();
		}
		catch (RecognitionException ex) {
			handleParsingError(ex); leavePackage();
		}
	}
	
/**
 * Matches a "config namespace foo" directive.
 */
	public final void configNamespace(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  configN = null;
		
		try {      // for error handling
			match(TOKEN_RESERVED_WORD_CONFIG);
			match(TOKEN_RESERVED_WORD_NAMESPACE);
			configN = LT(1);
			match(TOKEN_IDENTIFIER);
			
						NamespaceNode cNode = new ConfigNamespaceNode(new IdentifierNode((ASToken)configN));
						addConditionalCompilationNamespace(cNode);
			matchOptionalSemicolon();
					
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Include processing is usually done in the lexer. However, this rule is added
 * in order to support code model partitioner whose tokenizer is set to not
 * "follow includes". In a normal AS3 compilation, the parser would never see
 * the "include" token. 
 */
	public final void includeDirective() throws RecognitionException, TokenStreamException {
		
		
		match(TOKEN_KEYWORD_INCLUDE);
		match(TOKEN_LITERAL_STRING);
	}
	
/**
 * Similar to "configCondition", only that the token type after "::" is 
 * "TOKEN_NAMESPACE_ANNOTATION". This rule only applies to "attributed 
 * definitions".
 */
	public final boolean  configConditionOfDefinition() throws RecognitionException, TokenStreamException {
		boolean result;
		
		Token  ns = null;
		Token  op = null;
		Token  id = null;
		
			result = false;
		
		
		ns = LT(1);
		match(TOKEN_NAMESPACE_NAME);
		op = LT(1);
		match(TOKEN_OPERATOR_NS_QUALIFIER);
		id = LT(1);
		match(TOKEN_NAMESPACE_ANNOTATION);
		
		result = evaluateConfigurationVariable(ns.getText(), (ASToken) op, id.getText());
		
		return result;
	}
	
/**
 * Matches an attribute such as:
 * - Modifiers: dynamic, final, native, override, static, virtual.
 * - Namespace names.
 * - Reserved namespace names: internal, private, public, protected.
 *
 * A definition can have at most one "namespace attribute".
 * The matched attribute is added to the lists passed in as arguments.
 */
	public final void attribute(
		List<ModifierNode> modifiers, List<INamespaceDecorationNode> namespaceAttributes
	) throws RecognitionException, TokenStreamException {
		
		
		ExpressionNodeBase namespaceNode = null; 
		ModifierNode modifierNode = null;
		
		
		switch ( LA(1)) {
		case TOKEN_MODIFIER_FINAL:
		case TOKEN_MODIFIER_DYNAMIC:
		case TOKEN_MODIFIER_OVERRIDE:
		case TOKEN_MODIFIER_STATIC:
		case TOKEN_MODIFIER_NATIVE:
		case TOKEN_MODIFIER_VIRTUAL:
		{
			modifierNode=modifierAttribute();
			
			if (modifierNode != null)
			modifiers.add(modifierNode);
			
			break;
		}
		case TOKEN_NAMESPACE_ANNOTATION:
		{
			namespaceNode=namespaceModifier();
			
			if (namespaceNode instanceof INamespaceDecorationNode)
			namespaceAttributes.add((INamespaceDecorationNode) namespaceNode); 
			
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
	}
	
/**
 * Matches a definition of variable, function, namespace, class or interface.
 */
	public final void definition(
		ContainerNode c, INamespaceDecorationNode ns, List<ModifierNode> modList
	) throws RecognitionException, TokenStreamException {
		
		
		switch ( LA(1)) {
		case TOKEN_KEYWORD_VAR:
		case TOKEN_KEYWORD_CONST:
		{
			variableDefinition(c, ns, modList);
			break;
		}
		case TOKEN_KEYWORD_FUNCTION:
		{
			functionDefinition(c, ns, modList);
			break;
		}
		case TOKEN_RESERVED_WORD_NAMESPACE:
		{
			namespaceDefinition(c, ns, modList);
			break;
		}
		case TOKEN_KEYWORD_CLASS:
		{
			classDefinition(c, ns, modList);
			break;
		}
		case TOKEN_KEYWORD_INTERFACE:
		{
			interfaceDefinition(c, ns, modList);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
	}
	
/**
 * Matches a "modifier attribute" such as "final", "dynamic", "override", 
 * "static" or "native".
 */
	public final ModifierNode  modifierAttribute() throws RecognitionException, TokenStreamException {
		ModifierNode modifierNode;
		
		
		modifierNode = null;
		final ASToken modifierT = LT(1); 
		
		
		{
		switch ( LA(1)) {
		case TOKEN_MODIFIER_FINAL:
		{
			match(TOKEN_MODIFIER_FINAL);
			break;
		}
		case TOKEN_MODIFIER_DYNAMIC:
		{
			match(TOKEN_MODIFIER_DYNAMIC);
			break;
		}
		case TOKEN_MODIFIER_OVERRIDE:
		{
			match(TOKEN_MODIFIER_OVERRIDE);
			break;
		}
		case TOKEN_MODIFIER_STATIC:
		{
			match(TOKEN_MODIFIER_STATIC);
			break;
		}
		case TOKEN_MODIFIER_NATIVE:
		{
			match(TOKEN_MODIFIER_NATIVE);
			break;
		}
		case TOKEN_MODIFIER_VIRTUAL:
		{
			match(TOKEN_MODIFIER_VIRTUAL);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		modifierNode = new ModifierNode((ASToken) modifierT);	
		return modifierNode;
	}
	
/**
 * Matches a namespace modifier on an "attributed definition".
 */
	public final ExpressionNodeBase  namespaceModifier() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  nsPart1T = null;
		Token  dotT = null;
		Token  nsNameT = null;
		
		n = null;
		
		
		nsPart1T = LT(1);
		match(TOKEN_NAMESPACE_ANNOTATION);
		
			// If our text token is a member access, then build a normal 
			// identifier. Otherwise, build a NS specific one.
			
			if (LA(1) == TOKEN_OPERATOR_MEMBER_ACCESS) 
			{
		n = new IdentifierNode((ASToken)nsPart1T) ;
		}
		else
		{
		final NamespaceIdentifierNode nsNode = new NamespaceIdentifierNode((ASToken)nsPart1T); 
				nsNode.setIsConfigNamespace(isConfigNamespace(nsNode));
				n = nsNode;
			}
			
		{
		_loop36:
		do {
			if ((LA(1)==TOKEN_OPERATOR_MEMBER_ACCESS)) {
				dotT = LT(1);
				match(TOKEN_OPERATOR_MEMBER_ACCESS);
				{
				nsNameT = LT(1);
				match(TOKEN_NAMESPACE_ANNOTATION);
				
							IdentifierNode id = new IdentifierNode((ASToken)nsNameT);
							n = new FullNameNode(n, (ASToken) dotT, id);
						
				}
			}
			else {
				break _loop36;
			}
			
		} while (true);
		}
		
		if (n instanceof FullNameNode) 
			   n = new QualifiedNamespaceExpressionNode((FullNameNode)n);
			
		return n;
	}
	
/**
 * Matches a variable/constant definition.
 */
	public final void variableDefinition(
		ContainerNode c, INamespaceDecorationNode namespace, List<ModifierNode> modList
	) throws RecognitionException, TokenStreamException {
		
		
			VariableNode v = null;
			ChainedVariableNode v2 = null;
			ASToken tok = null;
			asDocDelegate.beforeVariable();
		
		
		try {      // for error handling
			tok=varOrConst();
			v=singleVariable((ASToken)tok, namespace);
			
						asDocDelegate.afterVariable();	
						storeVariableDecorations(v, c, namespace, modList);
						if(v instanceof ConfigConstNode) {
							addConfigConstNode((ConfigConstNode)v);
						} else {
							c.addItem(v);
						}
					
			{
			_loop95:
			do {
				if (((LA(1)==TOKEN_COMMA))&&(!(v instanceof ConfigConstNode))) {
					try {      // for error handling
						match(TOKEN_COMMA);
						v2=chainedVariable(c);
						
								 	if(v2 != null)
						{
						v.addChainedVariableNode(v2);
						storeEmbedDecoration(v2, v.getMetaTags());
						}
								
					}
					catch (RecognitionException ex) {
						handleParsingError(ex);
					}
				}
				else {
					break _loop95;
				}
				
			} while (true);
			}
			matchOptionalSemicolon(); setAllowErrorsInContext(true);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex); setAllowErrorsInContext(true);
		}
	}
	
/**
 * Matches a function definition. For example:
 *
 *     private function myFunction(name:String) : void
 *     {
 *         return;
 *     }
 *
 */
	public final void functionDefinition(
		ContainerNode c, INamespaceDecorationNode namespace, List<ModifierNode> modList
	) throws RecognitionException, TokenStreamException {
		
		Token  functionT = null;
		Token  getT = null;
		Token  setT = null;
		Token  lpT = null;
		Token  rpT = null;
		
			IdentifierNode name=null; 
		disableSemicolonInsertion();
		
		
		try {      // for error handling
			{
			try {      // for error handling
				functionT = LT(1);
				match(TOKEN_KEYWORD_FUNCTION);
				{
				if (((LA(1)==TOKEN_RESERVED_WORD_GET))&&( LA(2) != TOKEN_PAREN_OPEN)) {
					getT = LT(1);
					match(TOKEN_RESERVED_WORD_GET);
				}
				else if (((LA(1)==TOKEN_RESERVED_WORD_SET))&&( LA(2) != TOKEN_PAREN_OPEN)) {
					setT = LT(1);
					match(TOKEN_RESERVED_WORD_SET);
				}
				else if ((_tokenSet_5.member(LA(1)))) {
				}
				else {
					throw new NoViableAltException(LT(1), getFilename());
				}
				
				}
				name=identifier();
			}
			catch (RecognitionException ex) {
				name = handleMissingIdentifier(ex);
			}
			}
			
						final FunctionNode n ;
						if (getT != null)
							n = new GetterNode((ASToken)functionT, (ASToken)getT, name);
						else if (setT != null)
							n = new SetterNode((ASToken)functionT, (ASToken)setT, name);
						else
							n = new FunctionNode((ASToken)functionT, name);
			
						storeDecorations(n, c, namespace, modList);
						c.addItem(n);
					
			lpT = LT(1);
			match(TOKEN_PAREN_OPEN);
			
						final ContainerNode parameters = n.getParametersContainerNode();
						parameters.startAfter(lpT);
					
			formalParameters(parameters);
			{
			try {      // for error handling
				rpT = LT(1);
				match(TOKEN_PAREN_CLOSE);
				parameters.endBefore(rpT);
			}
			catch (RecognitionException ex) {
				handleParsingError(ex);
			}
			}
			{
			switch ( LA(1)) {
			case TOKEN_COLON:
			{
				resultType(n);
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			optionalFunctionBody(n);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a namespace definition.
 *
 *     namespace ns1;
 */
	public final void namespaceDefinition(
		ContainerNode c, INamespaceDecorationNode namespace, List<ModifierNode> modList
	) throws RecognitionException, TokenStreamException {
		
		Token  nsT = null;
		
			NamespaceNode n = null; 
			IdentifierNode id = null; 
			ExpressionNodeBase v = null; 
		
		
		try {      // for error handling
			nsT = LT(1);
			match(TOKEN_RESERVED_WORD_NAMESPACE);
			id=identifier();
			
						n = new NamespaceNode(id);
						n.startBefore(nsT);
						storeDecorations(n, c, namespace, modList);
			checkNamespaceDefinition(n);
					
			{
			switch ( LA(1)) {
			case TOKEN_OPERATOR_ASSIGNMENT:
			{
				initializer(n);
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_ELSE:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
						c.addItem(n);
					matchOptionalSemicolon(); 
				
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a class definition. For example:
 *
 *     class Player extends my_ns::GameObject implements IPlayer { ... }
 *
 */
	public final void classDefinition(
		ContainerNode c, INamespaceDecorationNode namespace, List<ModifierNode> modList
	) throws RecognitionException, TokenStreamException {
		
		Token  classT = null;
		Token  extendsT = null;
		Token  impT = null;
		Token  commaT = null;
		Token  openT = null;
			
		IdentifierNode className = null; 
		ExpressionNodeBase superName = null; 
		ExpressionNodeBase interfaceName = null;
		ClassNode classNode = null;
		disableSemicolonInsertion();
		enterClassDefinition(LT(1));
		
		
		try {      // for error handling
			classT = LT(1);
			match(TOKEN_KEYWORD_CLASS);
			className=identifier();
			
			// When class name is empty, it is a synthesized IdentifierNode
			// created by the error recovery logic in "identifier" rule.
			// In such case, we fast-forward the token stream to the next
			// keyword to recover.
			if (className.getName().isEmpty())
			{
			// If the parser recover from "extends", "implements" or "{", 
			// we are could continue parsing the class definition, because
			// these tokens are the "follow set" of a class name token.
			// Otherwise, the next keyword is still a good starting point.
			consumeUntilKeywordOr(TOKEN_BLOCK_OPEN);
			}
			
			insideClass = true;
			classNode = new ClassNode(className);
			classNode.setSourcePath(((IASToken)classT).getSourcePath());
			classNode.setClassKeyword((IASToken)classT);
			storeDecorations(classNode, c, namespace, modList);
			c.addItem(classNode);
			
			{
			switch ( LA(1)) {
			case TOKEN_RESERVED_WORD_EXTENDS:
			{
				try {      // for error handling
					extendsT = LT(1);
					match(TOKEN_RESERVED_WORD_EXTENDS);
					classNode.setExtendsKeyword((ASToken)extendsT);
					superName=type();
					
							classNode.setBaseClass(superName); 
							classNode.setEnd(superName.getEnd()); 
						
				}
				catch (RecognitionException ex) {
					handleParsingError(ex);
				}
				break;
			}
			case TOKEN_BLOCK_OPEN:
			case TOKEN_RESERVED_WORD_IMPLEMENTS:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			{
			switch ( LA(1)) {
			case TOKEN_RESERVED_WORD_IMPLEMENTS:
			{
				try {      // for error handling
					impT = LT(1);
					match(TOKEN_RESERVED_WORD_IMPLEMENTS);
					classNode.setImplementsKeyword((ASToken)impT);
					{
					try {      // for error handling
						interfaceName=restrictedName();
						
						classNode.addInterface(interfaceName);
						classNode.setEnd(interfaceName.getEnd());
						
						{
						_loop61:
						do {
							if ((LA(1)==TOKEN_COMMA)) {
								commaT = LT(1);
								match(TOKEN_COMMA);
								classNode.endAfter(commaT);
								interfaceName=restrictedName();
								
								classNode.addInterface(interfaceName); 
								classNode.setEnd(interfaceName.getEnd()); 
								
							}
							else {
								break _loop61;
							}
							
						} while (true);
						}
					}
					catch (RecognitionException ex) {
						handleParsingError(ex);
					}
					}
				}
				catch (RecognitionException ex) {
					handleParsingError(ex);
				}
				break;
			}
			case TOKEN_BLOCK_OPEN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			openT = LT(1);
			match(TOKEN_BLOCK_OPEN);
			classNode.getScopedNode().startAfter(openT);
			classOrInterfaceBlock(classNode.getScopedNode());
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches an interface definition.
 *
 *     interface IFoo extends IBar {...}
 */
	public final void interfaceDefinition(
		ContainerNode c,  INamespaceDecorationNode namespace, List<ModifierNode> modList
	) throws RecognitionException, TokenStreamException {
		
		Token  intT = null;
		Token  extendsT = null;
		Token  commaT = null;
		Token  openT = null;
			
			InterfaceNode interfaceNode = null; 
			IdentifierNode intName = null; 
			ExpressionNodeBase baseInterfaceName = null; 
			BlockNode b = null; 
		enterInterfaceDefinition(LT(1));
		
		
		try {      // for error handling
			intT = LT(1);
			match(TOKEN_KEYWORD_INTERFACE);
			intName=identifier();
			
						interfaceNode = new InterfaceNode(intName);
						interfaceNode.setInterfaceKeyword((IASToken)intT);
						storeDecorations(interfaceNode, c, namespace, modList);
						c.addItem(interfaceNode);
						
						// Recover from invalid interface name.
						final int la1 = LA(1);
						if (la1 != TOKEN_RESERVED_WORD_EXTENDS && la1 != TOKEN_BLOCK_OPEN)
						{
						    addProblem(new SyntaxProblem(LT(1)));
						    consumeUntilKeywordOr(TOKEN_BLOCK_OPEN);
						}
					
			{
			switch ( LA(1)) {
			case TOKEN_RESERVED_WORD_EXTENDS:
			{
				extendsT = LT(1);
				match(TOKEN_RESERVED_WORD_EXTENDS);
				interfaceNode.setExtendsKeyword((ASToken)extendsT);
				{
				baseInterfaceName=restrictedName();
				
									interfaceNode.addBaseInterface(baseInterfaceName);  
									interfaceNode.setEnd(baseInterfaceName.getEnd()); 
								
				{
				_loop55:
				do {
					if ((LA(1)==TOKEN_COMMA)) {
						commaT = LT(1);
						match(TOKEN_COMMA);
						interfaceNode.endAfter(commaT);
						{
						baseInterfaceName=restrictedName();
						
													interfaceNode.addBaseInterface(baseInterfaceName); 
													interfaceNode.setEnd(baseInterfaceName.getEnd()); 
												
						}
					}
					else {
						break _loop55;
					}
					
				} while (true);
				}
				}
				break;
			}
			case TOKEN_BLOCK_OPEN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
					  	b = interfaceNode.getScopedNode();
					
			openT = LT(1);
			match(TOKEN_BLOCK_OPEN);
			b.startAfter(openT);
			classOrInterfaceBlock(b);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a config condition such as "CONFIG::debug". This rule only applies 
 * to blocks gated with configuration variable.
 *
 * @return Evaluated result of the configuration variable.
 */
	public final boolean  configCondition() throws RecognitionException, TokenStreamException {
		boolean result;
		
		Token  ns = null;
		Token  op = null;
		Token  id = null;
		
			result = false;
		
		
		ns = LT(1);
		match(TOKEN_NAMESPACE_NAME);
		op = LT(1);
		match(TOKEN_OPERATOR_NS_QUALIFIER);
		id = LT(1);
		match(TOKEN_IDENTIFIER);
		
		result = evaluateConfigurationVariable(ns.getText(), (ASToken) op, id.getText());
		
		return result;
	}
	
/**
 * Matches a "break statement" or a "continue statement". For example:
 *
 *    break;
 *    break innerLoop;
 *    continue;
 *    continue outerLoop;
 *
 */
	public final void breakOrContinueStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
		IdentifierNode id = null; 
		IterationFlowNode n = null; 
		final ASToken t = LT(1);
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_KEYWORD_CONTINUE:
			{
				match(TOKEN_KEYWORD_CONTINUE);
				break;
			}
			case TOKEN_KEYWORD_BREAK:
			{
				match(TOKEN_KEYWORD_BREAK);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
					n = new IterationFlowNode(t); 
					c.addItem(n); 
					afterRestrictedToken(t);
				
			{
			if ((_tokenSet_5.member(LA(1)))) {
				id=identifier();
				n.setLabel(id);
			}
			else if ((_tokenSet_6.member(LA(1)))) {
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
			matchOptionalSemicolon();
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a default XML namespace statement. For example:
 * 
 *    default xml namespace = "domain";
 *
 */
	public final void defaultXMLNamespaceStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  defT = null;
		ExpressionNodeBase e = null;
		
		defT = LT(1);
		match(TOKEN_DIRECTIVE_DEFAULT_XML);
		match(TOKEN_OPERATOR_ASSIGNMENT);
		e=assignmentExpression();
		
					DefaultXMLNamespaceNode n = new DefaultXMLNamespaceNode(new KeywordNode((IASToken)defT));
					c.addItem(n);
					n.setExpressionNode(e); 
					matchOptionalSemicolon();
				
	}
	
/**
 * Matches a "goto" statement.
 */
	public final void gotoStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
			IdentifierNode id = null; 
			IterationFlowNode n = null; 
			final ASToken t = LT(1);
		
		
		try {      // for error handling
			match(TOKEN_RESERVED_WORD_GOTO);
			id=identifier();
			
					n = new IterationFlowNode(t); 
					c.addItem(n);
					n.setLabel(id);
					matchOptionalSemicolon();
			
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches an empty statement which is an explicit semicolon.
 */
	public final void emptyStatement() throws RecognitionException, TokenStreamException {
		
		
		match(TOKEN_SEMICOLON);
	}
	
/**
 * Matches a "labeled statement". For example:
 *
 *     innerLoop: x++;
 *
 */
	public final void labeledStatement(
		ContainerNode c, int exitCondition
	) throws RecognitionException, TokenStreamException {
		
		Token  labelT = null;
		
			LabeledStatementNode statementNode = null;
			ASToken offendingNSToken = null;
		
		
		labelT = LT(1);
		match(TOKEN_IDENTIFIER);
		match(TOKEN_COLON);
		
		final NonResolvingIdentifierNode labelNode = 
			new NonResolvingIdentifierNode(
		labelT != null ? labelT.getText() : "",
		labelT);	
		statementNode = new LabeledStatementNode(labelNode);
		c.addItem(statementNode);
		
		{
		if (((LA(1)==TOKEN_RESERVED_WORD_NAMESPACE))&&( LA(1) == TOKEN_RESERVED_WORD_NAMESPACE && LA(2) == TOKEN_IDENTIFIER )) {
			offendingNSToken = LT(1);
			namespaceDefinition(c, null, null);
			trapInvalidSubstatement(offendingNSToken);
		}
		else if ((_tokenSet_7.member(LA(1)))) {
			substatement(statementNode.getLabeledStatement());
		}
		else {
			throw new NoViableAltException(LT(1), getFilename());
		}
		
		}
	}
	
/**
 * Matches an "expression statement". The ASL syntax specification says the 
 * lookahead can not be "[", "{" or "function". Legacy code requires that "<"
 * be excluded as well.
 */
	public final void expressionStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
		ExpressionNodeBase e = null; 
		
		if (LA(1) == TOKEN_KEYWORD_FUNCTION)
		{
		// Recover: continue parsing function as an anonymous function.
		logSyntaxError(LT(1));
		}
		
		
		e=expression();
		
		c.addItem(e);
		if (!matchOptionalSemicolon())
		{
		recoverFromExpressionStatementMissingSemicolon(e);
		}
		
	}
	
/**
 * Matches a "for loop" statement.
 */
	public final void forStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  forKeyword = null;
		Token  lparenT = null;
		Token  in = null;
		Token  rparenT = null;
		
		ForLoopNode node = null; 
		ContainerNode forContainer = null; 
		BlockNode b = null; 
		NodeBase fi = null; 
		ExpressionNodeBase e = null; 
		BinaryOperatorNodeBase inNode = null;
		
		
		try {      // for error handling
			forKeyword = LT(1);
			match(TOKEN_KEYWORD_FOR);
			lparenT = LT(1);
			match(TOKEN_PAREN_OPEN);
			
			node = new ForLoopNode((ASToken)forKeyword); 
			c.addItem(node);
			forContainer = node.getConditionalsContainerNode();
			b = node.getContentsNode();
			forContainer.startAfter(lparenT); 
			
			
			expressionMode = ExpressionMode.noIn;
			
			fi=forInitializer();
			
			expressionMode = ExpressionMode.normal;
			
			{
			switch ( LA(1)) {
			case TOKEN_SEMICOLON:
			{
				match(TOKEN_SEMICOLON);
				forContainer.addItem(fi);
				forCondition(forContainer);
				match(TOKEN_SEMICOLON);
				forStep(forContainer);
				break;
			}
			case TOKEN_KEYWORD_IN:
			{
				in = LT(1);
				match(TOKEN_KEYWORD_IN);
				
				final ExpressionNodeBase leftOfIn;
				if (fi instanceof ExpressionNodeBase)
				{
				leftOfIn = (ExpressionNodeBase) fi;
				}
				else
				{
				// for...in doesn't allow multiple variable definition in the initializer clause
				addProblem(new InvalidForInInitializerProblem(node));
				if (fi instanceof ContainerNode &&
				fi.getChildCount() > 0 &&
				((ContainerNode)fi).getChild(0) instanceof ExpressionNodeBase)
				{
				// Recover by taking the first variable initializer and
				// drop the rest.
				leftOfIn = (ExpressionNodeBase)((ContainerNode)fi).getChild(0);
				}
				else
				{
				// No valid variable initializer found: recover by adding
				// an empty identifier node.
				leftOfIn = IdentifierNode.createEmptyIdentifierNodeAfterToken((ASToken)lparenT);
				}
				}
				inNode = BinaryOperatorNodeBase.create((ASToken)in, leftOfIn, null);
				forContainer.addItem(inNode);
				
				e=optExpression();
				inNode.setRightOperandNode(e);
				break;
			}
			case TOKEN_PAREN_CLOSE:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
			if (forContainer.getChildCount() == 0 && fi != null)
			forContainer.addItem(fi);
			
			{
			try {      // for error handling
				rparenT = LT(1);
				match(TOKEN_PAREN_CLOSE);
				
				forContainer.endBefore(rparenT); 
				
			}
			catch (RecognitionException ex) {
				handleParsingError(ex);
			}
			}
			substatement(b);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches an "if" statement.
 */
	public final void ifStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  ifT = null;
		
			IfNode i = null; 
			ExpressionNodeBase cond = null; 
			ContainerNode b = null; 
			boolean hasElse = false; 
		
		
		try {      // for error handling
			ifT = LT(1);
			match(TOKEN_KEYWORD_IF);
			cond=statementParenExpression();
			
						i = new IfNode((ASToken)ifT);
						ConditionalNode cNode = new ConditionalNode((ASToken)ifT);			
						cNode.setConditionalExpression(cond);
						b = cNode.getContentsNode();
						i.addBranch(cNode);
						c.addItem(i);
					
			innerSubstatement(b);
			{
			_loop137:
			do {
				if ((LA(1)==TOKEN_KEYWORD_ELSE)) {
					hasElse=elsePart(i);
					if (hasElse == true) return;
				}
				else {
					break _loop137;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a "metadata statement".
 *
 *     [ExcludeClass()]
 *     [Bindable]
 */
	public final void meta(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  attributeT = null;
		
			ArrayLiteralNode al = new ArrayLiteralNode(); 
			final ASToken lt = LT(1);
		
		
		try {      // for error handling
			if ((LA(1)==TOKEN_ATTRIBUTE)) {
				attributeT = LT(1);
				match(TOKEN_ATTRIBUTE);
				
					// Note that a separate parser is invoked here for metadata.
				parseMetadata(attributeT, errors); 
				preCheckMetadata(attributeT, c);
					
			}
			else if (((LA(1)==TOKEN_SQUARE_OPEN))&&( isIncompleteMetadataTagOnDefinition() )) {
				match(TOKEN_SQUARE_OPEN);
				logSyntaxError(LT(1));
			}
			else if ((LA(1)==TOKEN_SQUARE_OPEN)) {
				arrayInitializer(al);
				
					// Synthesize a MetaTagsNode to hold the metadata offsets.
				currentAttributes = new MetaTagsNode();
				currentAttributes.span(al, al);
				preCheckMetadata(lt, c);
				
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
		}
		catch (RecognitionException ex) {
			
					recoverFromMetadataTag(c, al); 
				
		}
	}
	
/**
 * Matches a "return" statement.
 */
	public final void returnStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  returnT = null;
		
			ExpressionNodeBase n = null; 
			ExpressionNodeBase e = null;
		
		
		try {      // for error handling
			returnT = LT(1);
			match(TOKEN_KEYWORD_RETURN);
			
						n = new ReturnNode((ASToken)returnT);
						c.addItem(n);
						afterRestrictedToken((ASToken)returnT);
					
			e=optExpression();
			
						((ReturnNode)n).setStatementExpression(e);
					
			matchOptionalSemicolon();
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a "switch" statement.
 */
	public final void switchStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  switchT = null;
		
			SwitchNode sw = null; 
			ExpressionNodeBase e = null; 
		
		
		switchT = LT(1);
		match(TOKEN_KEYWORD_SWITCH);
		e=statementParenExpression();
		
					sw = new SwitchNode((ASToken)switchT);			
					c.addItem(sw);
					if(e != null)
						sw.setConditionalExpression(e);
				
		cases(sw);
	}
	
/**
 * Matches a "throw" statement.
 */
	public final void throwsStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  throwT = null;
		
			ExpressionNodeBase n = null; 
			ExpressionNodeBase e = null;
		
		
		throwT = LT(1);
		match(TOKEN_KEYWORD_THROW);
		
					n = new ThrowNode((ASToken)throwT);
					c.addItem(n);
					afterRestrictedToken((ASToken)throwT);
				
		{
		try {      // for error handling
			e=expression();
			
							((ThrowNode)n).setStatementExpression(e); 
						
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		}
		matchOptionalSemicolon();
	}
	
/**
 * Matches a "try...catch...finally" statement.
 */
	public final void tryStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  tryT = null;
		Token  finallyT = null;
		
			TryNode n = null; 
			BlockNode b = null; 
		
		
		tryT = LT(1);
		match(TOKEN_KEYWORD_TRY);
		
					n = new TryNode((ASToken)tryT);
					b = n.getContentsNode();
					c.addItem(n);
				
		block(b);
		{
		_loop129:
		do {
			if ((LA(1)==TOKEN_KEYWORD_CATCH)) {
				catchBlock(n);
			}
			else {
				break _loop129;
			}
			
		} while (true);
		}
		{
		if ((LA(1)==TOKEN_KEYWORD_FINALLY)) {
			finallyT = LT(1);
			match(TOKEN_KEYWORD_FINALLY);
			
				TerminalNode t = new TerminalNode((ASToken)finallyT);
				n.addFinallyBlock(t);
				b = t.getContentsNode();
			
			block(b);
		}
		else if ((_tokenSet_6.member(LA(1)))) {
		}
		else {
			throw new NoViableAltException(LT(1), getFilename());
		}
		
		}
	}
	
/**
 * Matches a "while" loop statement.
 * 
 *     while (x > 1) { x--; }
 */
	public final void whileStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  whileT = null;
		
			WhileLoopNode n = null; 
			ExpressionNodeBase e = null; 
			BlockNode b = null; 
		
		
		try {      // for error handling
			whileT = LT(1);
			match(TOKEN_KEYWORD_WHILE);
			e=statementParenExpression();
			
						n = new WhileLoopNode((ASToken)whileT);
						n.setConditionalExpression(e);
						c.addItem(n); 
						b = n.getContentsNode();
					
			substatement(b);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a "do...while" statement.
 */
	public final void doStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  doT = null;
		
			DoWhileLoopNode n = null; 
		ExpressionNodeBase e = null; 
		BlockNode b = null; 
		
		
		try {      // for error handling
			doT = LT(1);
			match(TOKEN_KEYWORD_DO);
			
						n = new DoWhileLoopNode((ASToken)doT);
						c.addItem(n);
						b = n.getContentsNode();
					
			innerSubstatement(b);
			match(TOKEN_KEYWORD_WHILE);
			e=statementParenExpression();
			
				 		n.setConditionalExpression(e); 	
				        matchOptionalSemicolon(); 
			
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a "with" statement.
 */
	public final void withStatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		Token  withT = null;
		
			WithNode n = null; 
			ExpressionNodeBase e = null; 
			BlockNode b = null; 
		
		
		withT = LT(1);
		match(TOKEN_KEYWORD_WITH);
		e=statementParenExpression();
		
					n = new WithNode((ASToken)withT); 
					n.setConditionalExpression(e);
					c.addItem(n);
					b = n.getContentsNode(); 
				
		substatement(b);
	}
	
/**
 * Matches an expression or a comma-separated expression list.
 */
	public final ExpressionNodeBase  expression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  op = null;
		
		n = null; 
		ExpressionNodeBase e1 = null; 
		
		
		try {      // for error handling
			n=assignmentExpression();
			{
			_loop169:
			do {
				if ((LA(1)==TOKEN_COMMA)) {
					op = LT(1);
					match(TOKEN_COMMA);
					e1=assignmentExpression();
					n = BinaryOperatorNodeBase.create((ASToken)op,n,e1);
				}
				else {
					break _loop169;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * <h1>From ASL syntax spec:</h1>
 * <quote>
 * InnerSubstatement is defined in the grammar for the sole purpose of 
 * specifying side conditions that disambiguate various syntactic ambiguities 
 * in a context-sensitive manner specified in Section 5.
 * </quote>
 *
 * It is only used in "do statement" and "if statement" to loosen the following
 * two cases allowed by AS3 but not by ECMA5.
 *
 * <code>
 * do x++ while (x < 10);     // ES5 would require a ; after x++
 * if (x > 10) x++ else y++;  // ES5 would require a ; after x++
 * <code>
 */
	public final void innerSubstatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
		substatement(c);
		afterInnerSubstatement();
	}
	
/**
 * Matches a sub-statement. 
 */
	public final void substatement(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
		{
		if (((_tokenSet_1.member(LA(1))))&&( LA(1) != TOKEN_BLOCK_OPEN )) {
			statement(c,NO_END_TOKEN);
		}
		else if ((LA(1)==TOKEN_BLOCK_OPEN)) {
			block(c);
		}
		else if ((LA(1)==TOKEN_KEYWORD_VAR||LA(1)==TOKEN_KEYWORD_CONST)) {
			variableDefinition(c, null, null);
		}
		else {
			throw new NoViableAltException(LT(1), getFilename());
		}
		
		}
		
			if (c.getContainerType() == ContainerType.SYNTHESIZED)
			c.setContainerType(ContainerType.IMPLICIT);
		
	}
	
/**
 * Matches a block.
 */
	public final void block(
		ContainerNode b
	) throws RecognitionException, TokenStreamException {
		
		Token  openT = null;
		Token  closeT = null;
		
		try {      // for error handling
			openT = LT(1);
			match(TOKEN_BLOCK_OPEN);
			
				b.startAfter(openT); 
			b.setContainerType(ContainerType.BRACES);
			
			{
			_loop27:
			do {
				if ((_tokenSet_0.member(LA(1)))) {
					directive(b, TOKEN_BLOCK_CLOSE);
				}
				else {
					break _loop27;
				}
				
			} while (true);
			}
			closeT = LT(1);
			match(TOKEN_BLOCK_CLOSE);
			b.endBefore(closeT);
		}
		catch (RecognitionException ex) {
			
			handleParsingError(ex);   
			consumeUntilKeywordOrIdentifier(TOKEN_BLOCK_CLOSE); 
			endContainerAtError(ex, b);
			
		}
	}
	
/**
 * Matches an "import-able" name.
 *
 *     flash.display.Sprite;
 *     flash.events.*;
 */
	public final ExpressionNodeBase  importName() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  dot = null;
		
			n=null; 
			ExpressionNodeBase e = null;
		
		
		try {      // for error handling
			n=packageName();
			{
			switch ( LA(1)) {
			case TOKEN_OPERATOR_MEMBER_ACCESS:
			{
				dot = LT(1);
				match(TOKEN_OPERATOR_MEMBER_ACCESS);
				
								n = new FullNameNode(n, (ASToken) dot, null); 
							
				e=starLiteral();
				
								((FullNameNode)n).setRightOperandNode(e);
							
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			return handleMissingIdentifier(ex, n);
		}
		return n;
	}
	
/**
 * Matches a restricted name. For example:
 *
 *     my.package.name.Clock;
 *     private::myPrivateVar;
 *     UnqualifiedTypeClock;
 *
 */
	public final ExpressionNodeBase  restrictedName() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase nameExpression;
		
		
		nameExpression = null;
			IdentifierNode placeHolderRightNode = null;
		ASToken opToken = null;
		ExpressionNodeBase part = null;
		
		
		try {      // for error handling
			nameExpression=restrictedNamePart();
			{
			_loop158:
			do {
				if (((LA(1)==TOKEN_OPERATOR_NS_QUALIFIER||LA(1)==TOKEN_OPERATOR_MEMBER_ACCESS))&&( LA(2) != TOKEN_PAREN_OPEN )) {
					
					opToken = LT(1); 
					
					// The place-holder node is a safe-net in case parsing the 
					// "right" node fails, so that we will still have a balanced
					// FullNameNode.
					placeHolderRightNode = IdentifierNode.createEmptyIdentifierNodeAfterToken(opToken);
					
					final ExpressionNodeBase nameLeft = nameExpression;
					
					{
					switch ( LA(1)) {
					case TOKEN_OPERATOR_MEMBER_ACCESS:
					{
						match(TOKEN_OPERATOR_MEMBER_ACCESS);
						nameExpression = new FullNameNode(nameLeft, opToken, placeHolderRightNode);
						break;
					}
					case TOKEN_OPERATOR_NS_QUALIFIER:
					{
						match(TOKEN_OPERATOR_NS_QUALIFIER);
						nameExpression = new NamespaceAccessExpressionNode(nameLeft, opToken, placeHolderRightNode);
						break;
					}
					default:
					{
						throw new NoViableAltException(LT(1), getFilename());
					}
					}
					}
					{
					if (((LA(1)==TOKEN_SQUARE_OPEN))&&( opToken.getType() == TOKEN_OPERATOR_NS_QUALIFIER && LA(1) == TOKEN_SQUARE_OPEN )) {
						nameExpression=bracketExpression(nameLeft);
					}
					else if ((_tokenSet_8.member(LA(1)))) {
						part=restrictedNamePart();
						
							            	((BinaryOperatorNodeBase)nameExpression).setRightOperandNode(part);
							            	checkForChainedNamespaceQualifierProblem(opToken, part);
							        	
					}
					else {
						throw new NoViableAltException(LT(1), getFilename());
					}
					
					}
				}
				else {
					break _loop158;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			
				   if (nameExpression == null)
				       nameExpression = handleMissingIdentifier(ex); 
			else
			consumeParsingError(ex);
			
		}
		return nameExpression;
	}
	
/**
 * Matches array literal. For example:
 *
 *    []
 *    ["hello", 3.14, foo]
 *    [ , x, y]
 *    [ , ,]
 *
 * "Holes" (empty array elements) are allowed. See "arrayElements" rule for details.
 */
	public final void arrayInitializer(
		ArrayLiteralNode node
	) throws RecognitionException, TokenStreamException {
		
		Token  open = null;
		Token  close = null;
		
		final ContainerNode contents = node.getContentsNode(); 
		
		
		try {      // for error handling
			open = LT(1);
			match(TOKEN_SQUARE_OPEN);
			contents.startAfter(open);
			arrayElements(contents);
			close = LT(1);
			match(TOKEN_SQUARE_CLOSE);
			contents.endBefore(close);
		}
		catch (RecognitionException ex) {
			
				// Do not convert keywords to identifiers.
				// This is for recovering from:
				// [
				// var x:int;
				handleParsingError(ex); 
				// Notify the caller that the array literal failed.
				throw ex; 
			
		}
	}
	
/**
 * Matches a package name such as:
 *     org.apache.flex
 *
 * A Whitespace or LineTerminator is allowed around a . in a PackageName. 
 * For example, the following is a syntactically valid
 * <pre>
 * package a .
 *         b
 * { }
 * </pre>
 * The resulting PackageName value is equivalent to a PackageName without any intervening Whitespace and LineTerminators.
 */
	public final ExpressionNodeBase  packageName() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  dotT = null;
		
			n = null; 
			ExpressionNodeBase e = null; 
		
		
		try {      // for error handling
			n=identifier();
			{
			_loop44:
			do {
				if (((LA(1)==TOKEN_OPERATOR_MEMBER_ACCESS))&&( LA(2) != TOKEN_OPERATOR_STAR )) {
					dotT = LT(1);
					match(TOKEN_OPERATOR_MEMBER_ACCESS);
					
									n = new FullNameNode(n, (ASToken) dotT, null); 
								
					e=identifier();
					
									((FullNameNode)n).setRightOperandNode(e); 
								
				}
				else {
					break _loop44;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			return handleMissingIdentifier(ex, n);
		}
		return n;
	}
	
/**
 * Matches contents in a package block.
 */
	public final void packageContents(
		ContainerNode b
	) throws RecognitionException, TokenStreamException {
		
		Token  closeT = null;
		
		try {      // for error handling
			{
			_loop47:
			do {
				if ((_tokenSet_0.member(LA(1)))) {
					directive(b, TOKEN_BLOCK_CLOSE);
				}
				else {
					break _loop47;
				}
				
			} while (true);
			}
			closeT = LT(1);
			match(TOKEN_BLOCK_CLOSE);
			b.endBefore(closeT);
		}
		catch (RecognitionException ex) {
			
			if(handleParsingError(ex)) 
			{
				//attempt to recover from the error so we can keep parsing within the block
			packageContents(b); 
			} 
			else 
			{
			endContainerAtError(ex, b); 
			} 
			
		}
	}
	
/**
 * Matches an identifier token. An identifier can come from different token
 * types such as: 
 *
 *   - IDENTIFIER
 *   - namespace
 *   - get 
 *   - set
 *
 * This is because in AS3, these elements are not reserved keyword. However they
 * have special meaning in some syntactic contexts.
 * See "AS3 syntax spec - 3.5 Keywords and Punctuators" for details.
 */
	public final IdentifierNode  identifier() throws RecognitionException, TokenStreamException {
		IdentifierNode n;
		
		
		n = null;  
		final ASToken token = LT(1);
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			{
				match(TOKEN_IDENTIFIER);
				break;
			}
			case TOKEN_RESERVED_WORD_NAMESPACE:
			{
				match(TOKEN_RESERVED_WORD_NAMESPACE);
				break;
			}
			case TOKEN_RESERVED_WORD_GET:
			{
				match(TOKEN_RESERVED_WORD_GET);
				break;
			}
			case TOKEN_RESERVED_WORD_SET:
			{
				match(TOKEN_RESERVED_WORD_SET);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			n = new IdentifierNode(token);
		}
		catch (NoViableAltException e1) {
			n = expectingIdentifier(e1);
		}
		catch (RecognitionException e2) {
			n = handleMissingIdentifier(e2);
		}
		return n;
	}
	
/**
 * Matches an initializer in a variable/constant definition.
 */
	public final void initializer(
		IInitializableDefinitionNode v
	) throws RecognitionException, TokenStreamException {
		
		Token  assignT = null;
		
			ExpressionNodeBase e = null; 
		
		
		try {      // for error handling
			assignT = LT(1);
			match(TOKEN_OPERATOR_ASSIGNMENT);
			e=assignmentRightValue();
			v.setAssignedValue((IASToken) assignT, e);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches the content block of a class definition or an interface definition.
 */
	public final void classOrInterfaceBlock(
		BlockNode b
	) throws RecognitionException, TokenStreamException {
		
		Token  closeT = null;
		enableSemicolonInsertion();
		
		try {      // for error handling
			{
			_loop64:
			do {
				if ((_tokenSet_0.member(LA(1)))) {
					directive(b, TOKEN_BLOCK_CLOSE);
				}
				else {
					break _loop64;
				}
				
			} while (true);
			}
			closeT = LT(1);
			match(TOKEN_BLOCK_CLOSE);
			b.endBefore(closeT);
		}
		catch (RecognitionException ex) {
			
					if(handleParsingError(ex))  {
						classOrInterfaceBlock(b); //attempt to retry
					} else {
						endContainerAtError(ex, b); 
					}
				
		}
	}
	
/**
 * Matches a type reference.
 *
 *     String
 *     int
 *     *
 *     Vector.<Clock>
 *     foo.bar.Vector.<T>
 *
 */
	public final ExpressionNodeBase  type() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null; 
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_OPERATOR_STAR:
			{
				n=starLiteral();
				break;
			}
			case TOKEN_IDENTIFIER:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			{
				n=restrictedName();
				{
				switch ( LA(1)) {
				case TOKEN_TYPED_COLLECTION_OPEN:
				{
					n=typeApplication(n);
					break;
				}
				case EOF:
				case TOKEN_RESERVED_WORD_CONFIG:
				case TOKEN_KEYWORD_INCLUDE:
				case TOKEN_RESERVED_WORD_GOTO:
				case TOKEN_IDENTIFIER:
				case TOKEN_KEYWORD_FINALLY:
				case TOKEN_KEYWORD_CATCH:
				case TOKEN_LITERAL_STRING:
				case TOKEN_BLOCK_OPEN:
				case TOKEN_BLOCK_CLOSE:
				case TOKEN_NAMESPACE_NAME:
				case TOKEN_NAMESPACE_ANNOTATION:
				case TOKEN_KEYWORD_IMPORT:
				case TOKEN_KEYWORD_USE:
				case TOKEN_RESERVED_WORD_NAMESPACE:
				case TOKEN_ASDOC_COMMENT:
				case TOKEN_MODIFIER_FINAL:
				case TOKEN_MODIFIER_DYNAMIC:
				case TOKEN_MODIFIER_OVERRIDE:
				case TOKEN_MODIFIER_STATIC:
				case TOKEN_MODIFIER_NATIVE:
				case TOKEN_MODIFIER_VIRTUAL:
				case TOKEN_ATTRIBUTE:
				case TOKEN_SQUARE_OPEN:
				case TOKEN_KEYWORD_PACKAGE:
				case TOKEN_KEYWORD_INTERFACE:
				case TOKEN_COMMA:
				case TOKEN_KEYWORD_CLASS:
				case TOKEN_RESERVED_WORD_IMPLEMENTS:
				case TOKEN_KEYWORD_FUNCTION:
				case TOKEN_PAREN_OPEN:
				case TOKEN_PAREN_CLOSE:
				case TOKEN_RESERVED_WORD_GET:
				case TOKEN_RESERVED_WORD_SET:
				case TOKEN_KEYWORD_VAR:
				case TOKEN_KEYWORD_CONST:
				case TOKEN_OPERATOR_ASSIGNMENT:
				case TOKEN_DIRECTIVE_DEFAULT_XML:
				case TOKEN_SEMICOLON:
				case TOKEN_KEYWORD_RETURN:
				case TOKEN_KEYWORD_THROW:
				case TOKEN_KEYWORD_FOR:
				case TOKEN_KEYWORD_IN:
				case TOKEN_KEYWORD_DO:
				case TOKEN_KEYWORD_WHILE:
				case TOKEN_KEYWORD_CONTINUE:
				case TOKEN_KEYWORD_BREAK:
				case TOKEN_KEYWORD_WITH:
				case TOKEN_KEYWORD_TRY:
				case TOKEN_KEYWORD_IF:
				case TOKEN_KEYWORD_ELSE:
				case TOKEN_KEYWORD_SWITCH:
				case TOKEN_KEYWORD_CASE:
				case TOKEN_KEYWORD_DEFAULT:
				case TOKEN_KEYWORD_SUPER:
				case TOKEN_TYPED_COLLECTION_CLOSE:
				case TOKEN_OPERATOR_GREATER_THAN:
				case TOKEN_OPERATOR_MINUS:
				case TOKEN_OPERATOR_PLUS:
				case TOKEN_OPERATOR_STAR:
				case TOKEN_KEYWORD_DELETE:
				case TOKEN_OPERATOR_INCREMENT:
				case TOKEN_OPERATOR_DECREMENT:
				case TOKEN_KEYWORD_VOID:
				case TOKEN_KEYWORD_TYPEOF:
				case TOKEN_OPERATOR_BITWISE_NOT:
				case TOKEN_OPERATOR_LOGICAL_NOT:
				case TOKEN_KEYWORD_NULL:
				case TOKEN_KEYWORD_TRUE:
				case TOKEN_KEYWORD_FALSE:
				case TOKEN_KEYWORD_THIS:
				case TOKEN_VOID_0:
				case TOKEN_LITERAL_REGEXP:
				case TOKEN_LITERAL_NUMBER:
				case TOKEN_LITERAL_HEX_NUMBER:
				case TOKEN_TYPED_LITERAL_CLOSE:
				case TOKEN_E4X_WHITESPACE:
				case TOKEN_E4X_COMMENT:
				case TOKEN_E4X_CDATA:
				case TOKEN_E4X_PROCESSING_INSTRUCTION:
				case TOKEN_E4X_ENTITY:
				case TOKEN_E4X_DECIMAL_ENTITY:
				case TOKEN_E4X_HEX_ENTITY:
				case TOKEN_E4X_TEXT:
				case TOKEN_E4X_STRING:
				case TOKEN_E4X_OPEN_TAG_START:
				case TOKEN_E4X_CLOSE_TAG_START:
				case HIDDEN_TOKEN_E4X:
				case TOKEN_LITERAL_XMLLIST:
				case TOKEN_E4X_BINDING_OPEN:
				case TOKEN_KEYWORD_NEW:
				case TOKEN_OPERATOR_ATSIGN:
				{
					break;
				}
				default:
				{
					throw new NoViableAltException(LT(1), getFilename());
				}
				}
				}
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			n = handleMissingIdentifier(ex);
		}
		return n;
	}
	
/**
 * Matches an anonymous function (function closure).
 */
	public final FunctionObjectNode  functionExpression() throws RecognitionException, TokenStreamException {
		FunctionObjectNode n;
		
		Token  functionT = null;
		Token  lpT = null;
		Token  rpT = null;
		Token  lbT = null;
		
			n = null; 
			BlockNode b = null; 
			FunctionNode f = null; 
			IdentifierNode name=null; 
			ContainerNode p = null;
		
		
		try {      // for error handling
			functionT = LT(1);
			match(TOKEN_KEYWORD_FUNCTION);
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			{
				name=identifier();
				break;
			}
			case TOKEN_PAREN_OPEN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
						if(name == null) 
							name = IdentifierNode.createEmptyIdentifierNodeAfterToken(functionT);
						f = new FunctionNode((ASToken)functionT, name);
						n = new FunctionObjectNode(f);
						f.startBefore(functionT);
						n.startBefore(functionT);
						b = f.getScopedNode();
						disableSemicolonInsertion();
					
			lpT = LT(1);
			match(TOKEN_PAREN_OPEN);
			
						p = f.getParametersContainerNode();
						p.startAfter(lpT);
					
			formalParameters(p);
			rpT = LT(1);
			match(TOKEN_PAREN_CLOSE);
			p.endBefore(rpT);
			{
			switch ( LA(1)) {
			case TOKEN_COLON:
			{
				resultType(f);
				break;
			}
			case TOKEN_BLOCK_OPEN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			enableSemicolonInsertion();
			lbT = LT(1);
			match(TOKEN_BLOCK_OPEN);
			b.startAfter(lbT);
			functionBlock(f, (ASToken)lbT);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches the parameters of a function definition signature (excluding the parenthesis).
 * 
 *     arg1:int, arg2:String
 */
	public final void formalParameters(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_ELLIPSIS:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			{
				formal(c);
				{
				_loop80:
				do {
					if ((LA(1)==TOKEN_COMMA)) {
						match(TOKEN_COMMA);
						formal(c);
					}
					else {
						break _loop80;
					}
					
				} while (true);
				}
				break;
			}
			case TOKEN_PAREN_CLOSE:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a result type: either a "void" keyword or a restricted name.
 *
 *     :void
 *     :String
 *     :int
 *
 */
	public final void resultType(
		BaseTypedDefinitionNode result
	) throws RecognitionException, TokenStreamException {
		
		Token  colon = null;
		
		ExpressionNodeBase t = null; 
		
		
		colon = LT(1);
		match(TOKEN_COLON);
		{
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_KEYWORD_VOID:
			{
				t=voidLiteral();
				break;
			}
			case TOKEN_IDENTIFIER:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_STAR:
			{
				t=type();
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			t = handleMissingIdentifier(ex);
		}
		}
		
		if(t.getStart() == -1) 
		t.startAfter(colon);
			
		if (t.getEnd() == -1) 
		t.endAfter(colon);
			
		result.endAfter(colon);
		result.setType((ASToken) colon, t); 
		
	}
	
/**
 * Matches a function block, excluding the open "{" but including the closing "}".
 */
	public final void functionBlock(
		FunctionNode f, ASToken openT
	) throws RecognitionException, TokenStreamException {
		
		Token  rbT = null;
		
		final BlockNode b = f.getScopedNode();
		b.setContainerType(IContainerNode.ContainerType.BRACES); 
		skipFunctionBody(f, openT);
		
		
		try {      // for error handling
			{
			_loop70:
			do {
				if ((_tokenSet_0.member(LA(1)))) {
					directive(b, TOKEN_BLOCK_CLOSE);
				}
				else {
					break _loop70;
				}
				
			} while (true);
			}
			rbT = LT(1);
			match(TOKEN_BLOCK_CLOSE);
			b.endBefore(rbT);
		}
		catch (RecognitionException ex) {
			
					IASToken prev = buffer.previous();
			if (prev.getType() != ASTokenTypes.EOF)
			b.endAfter(prev);
			else
			b.setEnd(b.getStart());
					if(handleParsingError(ex))  {
						functionBlock(f, openT); //attempt to retry
					} 
				
		}
	}
	
/**
 * Matches an optional function body. It can either be a "block" or a 
 * "semicolon".
 */
	public final void optionalFunctionBody(
		FunctionNode f
	) throws RecognitionException, TokenStreamException {
		
		Token  lbT = null;
		
		BlockNode blockNode = f.getScopedNode();
		enableSemicolonInsertion();
		
		
		try {      // for error handling
			if (((LA(1)==TOKEN_BLOCK_OPEN))&&( LA(1) == TOKEN_BLOCK_OPEN )) {
				lbT = LT(1);
				match(TOKEN_BLOCK_OPEN);
				blockNode.startAfter(lbT);
				functionBlock(f, (ASToken)lbT);
			}
			else if (((_tokenSet_9.member(LA(1))))&&( buffer.matchOptionalSemicolon() )) {
			}
			else if ((_tokenSet_9.member(LA(1)))) {
				
				final Token lt = LT(1);
				blockNode.startBefore(lt);
				blockNode.endBefore(lt);
				
				// Report missing left-curly problem if there's no other syntax
				// problems in the function definition.
				reportFunctionBodyMissingLeftBraceProblem();
				
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a single parameter in a function definition.
 */
	public final void formal(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		ParameterNode p = null;
		
		{
		switch ( LA(1)) {
		case TOKEN_ELLIPSIS:
		{
			p=restParameter();
			break;
		}
		case TOKEN_IDENTIFIER:
		case TOKEN_RESERVED_WORD_NAMESPACE:
		case TOKEN_RESERVED_WORD_GET:
		case TOKEN_RESERVED_WORD_SET:
		case TOKEN_KEYWORD_VAR:
		case TOKEN_KEYWORD_CONST:
		{
			p=parameter();
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		if (p != null) c.addItem(p);
	}
	
/**
 * Matches the "rest parameters" in a function definition.
 *
 *     ...args
 */
	public final ParameterNode  restParameter() throws RecognitionException, TokenStreamException {
		ParameterNode p;
		
		Token  e = null;
		p = null;
		
		e = LT(1);
		match(TOKEN_ELLIPSIS);
		p=parameter();
		
					if (p != null){
						// ??? following is an override on default type-specification
						// ??? and should be pulled soon as that gets resolved.
						if (p.getTypeNode() == null){
							p.span(e);
						}
						p.setIsRestParameter(true);
					}
				
		return p;
	}
	
/**
 * Matches a parameter in a function definition.
 */
	public final ParameterNode  parameter() throws RecognitionException, TokenStreamException {
		ParameterNode p;
		
		
			p = null; 
			ASToken t = null;
			IdentifierNode name = null; 
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			{
				t=varOrConst();
				
							// const allowed here, var is not...log error, keep going
							if (t.getType() == TOKEN_KEYWORD_VAR) 
								handleParsingError(new RecognitionException()); 
						
				break;
			}
			case TOKEN_IDENTIFIER:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			name=identifier();
			
						p = new ParameterNode(name); 
						if (t != null && t.getType() == TOKEN_KEYWORD_CONST)
							p.setKeyword(t);
					
			{
			switch ( LA(1)) {
			case TOKEN_COLON:
			{
				resultType(p);
				break;
			}
			case TOKEN_COMMA:
			case TOKEN_PAREN_CLOSE:
			case TOKEN_OPERATOR_ASSIGNMENT:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			{
			switch ( LA(1)) {
			case TOKEN_OPERATOR_ASSIGNMENT:
			{
				initializer(p);
				break;
			}
			case TOKEN_COMMA:
			case TOKEN_PAREN_CLOSE:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return p;
	}
	
/**
 * Matches keyword "var" or keyword "const".
 */
	public final ASToken  varOrConst() throws RecognitionException, TokenStreamException {
		ASToken token;
		
		
			token = LT(1); 
		
		
		switch ( LA(1)) {
		case TOKEN_KEYWORD_VAR:
		{
			match(TOKEN_KEYWORD_VAR);
			break;
		}
		case TOKEN_KEYWORD_CONST:
		{
			match(TOKEN_KEYWORD_CONST);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		return token;
	}
	
/**
 * Matches a "void" keyword token, and create an IdentifierNode for "void".
 */
	public final IdentifierNode  voidLiteral() throws RecognitionException, TokenStreamException {
		IdentifierNode id;
		
		
		id = LanguageIdentifierNode.buildVoid(LT(1));
		
		
		match(TOKEN_KEYWORD_VOID);
		return id;
	}
	
/**
 * Matches the right-hand side of an assignment expression.
 * "public" namespace is allowed as an R-value for backward compatibility.
 * @see "CMP-335 and ASLSPEC-19"
 */
	public final ExpressionNodeBase  assignmentRightValue() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase rightExpr;
		
		Token  p = null;
		
			rightExpr = null;
		
		
		if (((LA(1)==TOKEN_NAMESPACE_ANNOTATION))&&( isNextTokenPublicNamespace() )) {
			p = LT(1);
			match(TOKEN_NAMESPACE_ANNOTATION);
			rightExpr = new NamespaceIdentifierNode((ASToken)p);
		}
		else if ((_tokenSet_3.member(LA(1)))) {
			rightExpr=assignmentExpression();
		}
		else {
			throw new NoViableAltException(LT(1), getFilename());
		}
		
		return rightExpr;
	}
	
/**
 * Matches a single variable/constant definition.
 */
	public final VariableNode  singleVariable(
		IASToken keyword, INamespaceDecorationNode namespace
	) throws RecognitionException, TokenStreamException {
		VariableNode v;
		
		
			v = null; 
			IdentifierNode name = null; 
		
		
		try {      // for error handling
			name=identifier();
			
						if(namespaceIsConfigNamespace(namespace)) {
							v = new ConfigConstNode(name);
						} else {
							v = new VariableNode(name);
						}
						v.setKeyword(keyword);
						v.setIsConst(keyword.getType() == TOKEN_KEYWORD_CONST);
						if(name.getStart() == -1) {
							name.startAfter(keyword);
							name.endAfter(keyword);
						}
					
			{
			switch ( LA(1)) {
			case TOKEN_COLON:
			{
				resultType(v);
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_COMMA:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_OPERATOR_ASSIGNMENT:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_ELSE:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			{
			switch ( LA(1)) {
			case TOKEN_OPERATOR_ASSIGNMENT:
			{
				initializer(v);
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_COMMA:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_ELSE:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return v;
	}
	
/**
 * Matches a chained variable/constant definition.
 */
	public final ChainedVariableNode  chainedVariable(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		ChainedVariableNode v;
		
		
			 v = null; 
			 IdentifierNode name = null; 
		
		
		try {      // for error handling
			name=identifier();
			v = new ChainedVariableNode(name);
			{
			switch ( LA(1)) {
			case TOKEN_COLON:
			{
				resultType(v);
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_COMMA:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_OPERATOR_ASSIGNMENT:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_ELSE:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			{
			switch ( LA(1)) {
			case TOKEN_OPERATOR_ASSIGNMENT:
			{
				initializer(v);
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_COMMA:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_ELSE:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return v;
	}
	
/**
 * Matches variable definitions in a for loop.
 */
	public final NodeBase  variableDefExpression() throws RecognitionException, TokenStreamException {
		NodeBase v;
		
		
			v = null; 
			ContainerNode c = null; 
			NodeBase v1 = null; 
			ASToken varT = null;
		
		
		try {      // for error handling
			varT=varOrConst();
			v=singleVariableDefExpression(varT, varT.getType() == TOKEN_KEYWORD_CONST);
			{
			_loop104:
			do {
				if ((LA(1)==TOKEN_COMMA)) {
					match(TOKEN_COMMA);
					v1=singleVariableDefExpression(null, varT.getType() == TOKEN_KEYWORD_CONST);
					
									if (c == null) {
										c = new ContainerNode();
										c.setStart(v.getStart());
										c.addItem(v);
										v = c;
									}
									c.addItem(v1);
									c.setEnd(v1.getEnd());
								
				}
				else {
					break _loop104;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return v;
	}
	
/**
 * Matches a single variable definition in a for loop.
 */
	public final ExpressionNodeBase  singleVariableDefExpression(
		ASToken varToken, boolean isConst
	) throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
			n = null;
			VariableNode variable = null;
			IdentifierNode varName = null; 
			ExpressionNodeBase value = null; 
		
		
		varName=identifier();
		
					variable = new VariableNode(varName);
					if(varToken != null)
						variable.setKeyword(varToken);
					variable.setIsConst(isConst);
					n = new VariableExpressionNode(variable);
				
		{
		switch ( LA(1)) {
		case TOKEN_COLON:
		{
			resultType(variable);
			break;
		}
		case TOKEN_COMMA:
		case TOKEN_PAREN_CLOSE:
		case TOKEN_OPERATOR_ASSIGNMENT:
		case TOKEN_SEMICOLON:
		case TOKEN_KEYWORD_IN:
		{
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		{
		switch ( LA(1)) {
		case TOKEN_OPERATOR_ASSIGNMENT:
		{
			initializer(variable);
			break;
		}
		case TOKEN_COMMA:
		case TOKEN_PAREN_CLOSE:
		case TOKEN_SEMICOLON:
		case TOKEN_KEYWORD_IN:
		{
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		return n;
	}
	
/**
 * Matches an "assignment expression".
 *
 * According to ASL sytax spec, the productions for an "assignment expression"
 * is either a "conditional expression" or a "left-hand side expression" followed
 * by an "assignment operator" and an "assignment expression". However, since
 * "assignmentExpression" and "conditionaExpression" is ambiguous at indefinite 
 * look-ahead distance, this LL(1) grammar can't decide which alternative to
 * choose. As a result, the implementation is more lenient in that an AST node
 * for an assignment binary node will be built even the left-hand side expression
 * is not a valid "LeftHandSideExpression", such as a constant.
 * 
 * For example:
 * <code>100 = "hello";</code>
 * This statement will be parsed without syntax error, generating tree like:
 * <pre>
 *        =
 *       / \
 *    100  "hello"
 * </pre>
 *
 * A possible solution to this is to find out the difference between "conditional
 * expression" and "left-hand side expression", then insert a semantic predicate
 * before matching a "assignment operator".
 */
	public final ExpressionNodeBase  assignmentExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
			n = null; 
			ASToken op = null; 
			ExpressionNodeBase r = null;
		
		
		n=condExpr();
		{
		if ((_tokenSet_10.member(LA(1)))) {
			op=assignOp();
			r=assignmentRightValue();
			n = BinaryOperatorNodeBase.create(op,n,r);
		}
		else if ((_tokenSet_11.member(LA(1)))) {
		}
		else {
			throw new NoViableAltException(LT(1), getFilename());
		}
		
		}
		return n;
	}
	
/**
 * Matches an expression in a pair of parenthesis. It's usually used as a
 * condition expression in {@code if (...)}, {@code while (...)}, etc.
 *
 *     (....)
 */
	public final ExpressionNodeBase  statementParenExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase e;
		
		
			e = null; 
		
		
		try {      // for error handling
			match(TOKEN_PAREN_OPEN);
			disableSemicolonInsertion();
			e=expression();
			match(TOKEN_PAREN_CLOSE);
			enableSemicolonInsertion();
		}
		catch (RecognitionException ex) {
			handleParsingError(ex); enableSemicolonInsertion();
		}
		return e;
	}
	
/**
 * Matches an optional expression.
 * @return NilNode or ExpressionNodeBase.
 */
	public final ExpressionNodeBase  optExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase e;
		
		
			e = null; 
		
		
		try {      // for error handling
			{
			if ((_tokenSet_3.member(LA(1)))) {
				e=expression();
			}
			else if ((_tokenSet_12.member(LA(1)))) {
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
			if (e == null) e = new NilNode();
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return e;
	}
	
/**
 * Matches the "initializer" part in a for loop.
 */
	public final NodeBase  forInitializer() throws RecognitionException, TokenStreamException {
		NodeBase n;
		
		
			n = null; 
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			{
				n=variableDefExpression();
				break;
			}
			case TOKEN_IDENTIFIER:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_PAREN_CLOSE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_IN:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				n=optExpression();
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches the "condition" part in a for loop.
 */
	public final void forCondition(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
			ExpressionNodeBase e = null; 
		
		
		try {      // for error handling
			e=optExpression();
			if (e != null) c.addItem(e);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches the "step" part in a for loop.
 */
	public final void forStep(
		ContainerNode c
	) throws RecognitionException, TokenStreamException {
		
		
			ExpressionNodeBase e = null; 
		
		
		try {      // for error handling
			e=optExpression();
			if (e != null) c.addItem(e);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches the "catch" block in a "try" statement.
 */
	public final void catchBlock(
		TryNode tryNode
	) throws RecognitionException, TokenStreamException {
		
		Token  catchT = null;
		Token  rpT = null;
		
			CatchNode n = null; 
			ParameterNode arg = null; 
			BlockNode b = null; 
		
		
		try {      // for error handling
			catchT = LT(1);
			match(TOKEN_KEYWORD_CATCH);
			match(TOKEN_PAREN_OPEN);
			disableSemicolonInsertion();
			arg=catchBlockArgument();
			
						n = new CatchNode(arg); 
						tryNode.addCatchClause(n);
						b = n.getContentsNode();
						n.startBefore(catchT); 
					
			{
			try {      // for error handling
				rpT = LT(1);
				match(TOKEN_PAREN_CLOSE);
				
								enableSemicolonInsertion();
								n.endAfter(rpT);
							
			}
			catch (RecognitionException ex) {
				handleParsingError(ex);  enableSemicolonInsertion();
			}
			}
			block(b);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches the argument in the "try...catch(arg)" statement.
 */
	public final ParameterNode  catchBlockArgument() throws RecognitionException, TokenStreamException {
		ParameterNode p;
		
		Token  colonT = null;
		
			p = null; 
			IdentifierNode name = null; 
			ExpressionNodeBase t = null; 
		
		
		try {      // for error handling
			name=identifier();
			p = new ParameterNode(name);
			{
			switch ( LA(1)) {
			case TOKEN_COLON:
			{
				colonT = LT(1);
				match(TOKEN_COLON);
				p.setType((ASToken)colonT, null);
				t=type();
				p.setType((ASToken)colonT, t);
				break;
			}
			case TOKEN_PAREN_CLOSE:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return p;
	}
	
/**
 * Matches the optional "else" block of an "if" statement.
 *
 * @return true if there is an "else" block.
 */
	public final boolean  elsePart(
		IfNode i
	) throws RecognitionException, TokenStreamException {
		boolean hasElse;
		
		Token  elseT = null;
		
			hasElse = false; 
			ContainerNode b = null; 
			ExpressionNodeBase cond = null; 
			ConditionalNode elseIf = null; 
		
		
		try {      // for error handling
			elseT = LT(1);
			match(TOKEN_KEYWORD_ELSE);
			{
			if ((LA(1)==TOKEN_KEYWORD_IF)) {
				match(TOKEN_KEYWORD_IF);
				cond=statementParenExpression();
				
						    	elseIf = new ConditionalNode((ASToken) elseT);
						    	elseIf.setConditionalExpression(cond);
						    	i.addBranch(elseIf);
								b = elseIf.getContentsNode();
							
			}
			else if ((_tokenSet_7.member(LA(1)))) {
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
			
						if (elseIf == null){
							hasElse = true;
							TerminalNode t = new TerminalNode((ASToken) elseT);
							i.addBranch(t);
							b = t.getContentsNode();
						}
					
			substatement(b);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return hasElse;
	}
	
/**
 * Matches the "case" block in a "switch" statement.
 */
	public final void cases(
		SwitchNode sw
	) throws RecognitionException, TokenStreamException {
		
		
			final ContainerNode b = sw.getContentsNode(); 
		
		
		match(TOKEN_BLOCK_OPEN);
		caseClauses(b);
		match(TOKEN_BLOCK_CLOSE);
	}
	
/**
 * Matches the "case" clauses in a "switch" statement.
 */
	public final void caseClauses(
		ContainerNode swb
	) throws RecognitionException, TokenStreamException {
		
		
		{
		_loop144:
		do {
			if ((LA(1)==TOKEN_KEYWORD_CASE||LA(1)==TOKEN_KEYWORD_DEFAULT)) {
				caseClause(swb);
			}
			else {
				break _loop144;
			}
			
		} while (true);
		}
	}
	
/**
 * Matches a single "case" clause in a "switch" statement.
 */
	public final void caseClause(
		ContainerNode swb
	) throws RecognitionException, TokenStreamException {
		
		Token  caseT = null;
		Token  defaultT = null;
		
			ExpressionNodeBase e = null; 
			ContainerNode b = null; 
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_KEYWORD_CASE:
			{
				caseT = LT(1);
				match(TOKEN_KEYWORD_CASE);
				e=expression();
				colon();
				
							ConditionalNode cond = new ConditionalNode((ASToken) caseT);
							cond.setConditionalExpression(e);
						 	swb.addItem(cond);
						 	b = cond.getContentsNode(); 
						
				caseStatementList(b);
				break;
			}
			case TOKEN_KEYWORD_DEFAULT:
			{
				defaultT = LT(1);
				match(TOKEN_KEYWORD_DEFAULT);
				colon();
				
							TerminalNode t = new TerminalNode((ASToken)defaultT);
							swb.addItem(t);
							b = t.getContentsNode();
						
				caseStatementList(b);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a colon token ":" or recover from a missing colon.
 */
	public final void colon() throws RecognitionException, TokenStreamException {
		
		
		try {      // for error handling
			match(TOKEN_COLON);
		}
		catch (RecognitionException ex) {
			addProblem(unexpectedTokenProblem(LT(1), ASTokenKind.COLON));
		}
	}
	
/**
 * Matches the statements in a "case" clause.
 */
	public final void caseStatementList(
		ContainerNode b
	) throws RecognitionException, TokenStreamException {
		
		
		try {      // for error handling
			{
			_loop149:
			do {
				if ((_tokenSet_0.member(LA(1)))) {
					directive(b, TOKEN_BLOCK_CLOSE);
				}
				else {
					break _loop149;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches a "star" literal token, and create an IdentifierNode for "*".
 */
	public final IdentifierNode  starLiteral() throws RecognitionException, TokenStreamException {
		IdentifierNode id;
		
		
		id = LanguageIdentifierNode.buildAnyType(LT(1));
		
		
		match(TOKEN_OPERATOR_STAR);
		return id;
	}
	
/**
 * Matches the identifier part of a restricted name. For example:
 * 
 *     private
 *     public
 *     foo
 *     MyType
 *
 */
	public final IdentifierNode  restrictedNamePart() throws RecognitionException, TokenStreamException {
		IdentifierNode id;
		
		
		id = null;
		final ASToken lt = LT(1);
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			{
				id=identifier();
				break;
			}
			case TOKEN_NAMESPACE_NAME:
			{
				match(TOKEN_NAMESPACE_NAME);
				id = new IdentifierNode(lt);
				break;
			}
			case TOKEN_KEYWORD_SUPER:
			{
				match(TOKEN_KEYWORD_SUPER);
				id = LanguageIdentifierNode.buildSuper(lt);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (NoViableAltException ex) {
			id = expectingIdentifier(ex);
		}
		return id;
	}
	
/**
 * Matches a bracket expression. For example:
 *
 *     [10]
 *     [idx]
 *
 */
	public final DynamicAccessNode  bracketExpression(
		ExpressionNodeBase root
	) throws RecognitionException, TokenStreamException {
		DynamicAccessNode result;
		
		Token  closeT = null;
		
		result = new DynamicAccessNode(root); 
		ExpressionNodeBase e = null; 
		
		
		try {      // for error handling
			match(TOKEN_SQUARE_OPEN);
			e=expression();
			{
			try {      // for error handling
				closeT = LT(1);
				match(TOKEN_SQUARE_CLOSE);
			}
			catch (RecognitionException ex) {
				handleParsingError(ex);
			}
			}
			
			result.setRightOperandNode(e); 
			result.endAfter(closeT); 
			
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return result;
	}
	
/**
 * Keep legacy rule for Falcon-JS.
 */
	public final ExpressionNodeBase  typedNameOrStar() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n=type();
		return n;
	}
	
/**
 * Matches a "type application" part>
 *
 *     .<String>
 *     .<Clock>
 *     .<uint>
 *
 */
	public final TypedExpressionNode  typeApplication(
		ExpressionNodeBase root
	) throws RecognitionException, TokenStreamException {
		TypedExpressionNode n;
		
		Token  openT = null;
		
		n = null; 
		ExpressionNodeBase t = null; 
		Token closeT = null;
		enterTypeApplication(root);
		
		
		try {      // for error handling
			openT = LT(1);
			match(TOKEN_TYPED_COLLECTION_OPEN);
			t=type();
			
			n = new TypedExpressionNode(root, t, (ASToken)openT);
			closeT = LT(1);
			
			{
			switch ( LA(1)) {
			case TOKEN_TYPED_COLLECTION_CLOSE:
			{
				match(TOKEN_TYPED_COLLECTION_CLOSE);
				break;
			}
			case TOKEN_OPERATOR_GREATER_THAN:
			{
				match(TOKEN_OPERATOR_GREATER_THAN);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			n.endAfter(closeT);
		}
		catch (RecognitionException ex) {
			consumeParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches a ternary expression such as: 
 *
 *     (x > 2) ? "greater" : "smaller"
 */
	public final ExpressionNodeBase  condExpr() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  op = null;
		
		n = null; 
		ExpressionNodeBase trueExpr = null; 
		ExpressionNodeBase falseExpr = null;
		TernaryOperatorNode ternary = null;
		
		
		try {      // for error handling
			n=binaryExpr();
			{
			switch ( LA(1)) {
			case TOKEN_OPERATOR_TERNARY:
			{
				op = LT(1);
				match(TOKEN_OPERATOR_TERNARY);
				
				ternary = new TernaryOperatorNode((ASToken)op,n,null,null);
				n = ternary; 
				
				trueExpr=assignmentExpression();
				ternary.setLeftOperandNode(trueExpr);
				match(TOKEN_COLON);
				falseExpr=assignmentExpression();
				ternary.setRightOperandNode(falseExpr);
				break;
			}
			case EOF:
			case TOKEN_RESERVED_WORD_CONFIG:
			case TOKEN_KEYWORD_INCLUDE:
			case TOKEN_RESERVED_WORD_GOTO:
			case TOKEN_IDENTIFIER:
			case TOKEN_KEYWORD_FINALLY:
			case TOKEN_KEYWORD_CATCH:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_BLOCK_CLOSE:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_NAMESPACE_ANNOTATION:
			case TOKEN_COLON:
			case TOKEN_KEYWORD_IMPORT:
			case TOKEN_KEYWORD_USE:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_ASDOC_COMMENT:
			case TOKEN_MODIFIER_FINAL:
			case TOKEN_MODIFIER_DYNAMIC:
			case TOKEN_MODIFIER_OVERRIDE:
			case TOKEN_MODIFIER_STATIC:
			case TOKEN_MODIFIER_NATIVE:
			case TOKEN_MODIFIER_VIRTUAL:
			case TOKEN_ATTRIBUTE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_PACKAGE:
			case TOKEN_KEYWORD_INTERFACE:
			case TOKEN_COMMA:
			case TOKEN_KEYWORD_CLASS:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_PAREN_CLOSE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_VAR:
			case TOKEN_KEYWORD_CONST:
			case TOKEN_OPERATOR_ASSIGNMENT:
			case TOKEN_DIRECTIVE_DEFAULT_XML:
			case TOKEN_SEMICOLON:
			case TOKEN_KEYWORD_RETURN:
			case TOKEN_KEYWORD_THROW:
			case TOKEN_KEYWORD_FOR:
			case TOKEN_KEYWORD_IN:
			case TOKEN_KEYWORD_DO:
			case TOKEN_KEYWORD_WHILE:
			case TOKEN_KEYWORD_CONTINUE:
			case TOKEN_KEYWORD_BREAK:
			case TOKEN_KEYWORD_WITH:
			case TOKEN_KEYWORD_TRY:
			case TOKEN_KEYWORD_IF:
			case TOKEN_KEYWORD_ELSE:
			case TOKEN_KEYWORD_SWITCH:
			case TOKEN_KEYWORD_CASE:
			case TOKEN_KEYWORD_DEFAULT:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_LOGICAL_AND_ASSIGNMENT:
			case TOKEN_OPERATOR_LOGICAL_OR_ASSIGNMENT:
			case TOKEN_OPERATOR_PLUS_ASSIGNMENT:
			case TOKEN_OPERATOR_MINUS_ASSIGNMENT:
			case TOKEN_OPERATOR_MULTIPLICATION_ASSIGNMENT:
			case TOKEN_OPERATOR_DIVISION_ASSIGNMENT:
			case TOKEN_OPERATOR_MODULO_ASSIGNMENT:
			case TOKEN_OPERATOR_BITWISE_AND_ASSIGNMENT:
			case TOKEN_OPERATOR_BITWISE_OR_ASSIGNMENT:
			case TOKEN_OPERATOR_BITWISE_XOR_ASSIGNMENT:
			case TOKEN_OPERATOR_BITWISE_LEFT_SHIFT_ASSIGNMENT:
			case TOKEN_OPERATOR_BITWISE_RIGHT_SHIFT_ASSIGNMENT:
			case TOKEN_OPERATOR_BITWISE_UNSIGNED_RIGHT_SHIFT_ASSIGNMENT:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_SQUARE_CLOSE:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_E4X_BINDING_CLOSE:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
	public final ASToken  assignOp() throws RecognitionException, TokenStreamException {
		ASToken op;
		
		
			op = LT(1); 
		
		
		switch ( LA(1)) {
		case TOKEN_OPERATOR_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_LOGICAL_AND_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_LOGICAL_AND_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_LOGICAL_OR_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_LOGICAL_OR_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_PLUS_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_PLUS_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_MINUS_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_MINUS_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_MULTIPLICATION_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_MULTIPLICATION_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_DIVISION_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_DIVISION_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_MODULO_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_MODULO_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_AND_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_BITWISE_AND_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_OR_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_BITWISE_OR_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_XOR_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_BITWISE_XOR_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_LEFT_SHIFT_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_BITWISE_LEFT_SHIFT_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_RIGHT_SHIFT_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_BITWISE_RIGHT_SHIFT_ASSIGNMENT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_UNSIGNED_RIGHT_SHIFT_ASSIGNMENT:
		{
			match(TOKEN_OPERATOR_BITWISE_UNSIGNED_RIGHT_SHIFT_ASSIGNMENT);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		return op;
	}
	
/**
 * Binary expression uses operator precedence parser in BaseASParser.
 */
	public final ExpressionNodeBase  binaryExpr() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
			n = precedenceParseExpression(4);
			if (true)	return n;
		
		
		fakeExpr();
		return n;
	}
	
/**
 * fakeExpr simulates the set of allowable follow tokens in an expression context, which allows antlr to function.
 * It is unreachable.
 */
	public final void fakeExpr() throws RecognitionException, TokenStreamException {
		
		
			ExpressionNodeBase n = null; 
		
		
		n=unaryExpr();
		{
		if ((_tokenSet_13.member(LA(1)))) {
			binaryOperators();
			fakeExpr();
		}
		else if ((_tokenSet_14.member(LA(1)))) {
		}
		else {
			throw new NoViableAltException(LT(1), getFilename());
		}
		
		}
	}
	
/**
 * Matches a "unary expression".
 *
 * This rule is called out of the precedence parser in BaseASParser.
 * If you need to change the name of this rule, you'll also need to update 
 * the base class.
 */
	public final ExpressionNodeBase  unaryExpr() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null; 
		ASToken op = null; 
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				n=prefixExpression();
				break;
			}
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			{
				op=unaryOp();
				n=unaryExpr();
				
					if (n == null)
				n = IdentifierNode.createEmptyIdentifierNodeAfterToken(op);
					n = UnaryOperatorNodeBase.createPrefix(op, n); 
					
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			{
			_loop185:
			do {
				if ((_tokenSet_15.member(LA(1)))) {
					n=propertyAccessExpression(n);
				}
				else if ((LA(1)==TOKEN_PAREN_OPEN)) {
					n=arguments(n);
				}
				else {
					break _loop185;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Declares all the binary operators.
 */
	public final void binaryOperators() throws RecognitionException, TokenStreamException {
		
		
		switch ( LA(1)) {
		case TOKEN_OPERATOR_LOGICAL_OR:
		{
			match(TOKEN_OPERATOR_LOGICAL_OR);
			break;
		}
		case TOKEN_OPERATOR_LOGICAL_AND:
		{
			match(TOKEN_OPERATOR_LOGICAL_AND);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_OR:
		{
			match(TOKEN_OPERATOR_BITWISE_OR);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_XOR:
		{
			match(TOKEN_OPERATOR_BITWISE_XOR);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_AND:
		{
			match(TOKEN_OPERATOR_BITWISE_AND);
			break;
		}
		case TOKEN_OPERATOR_EQUAL:
		{
			match(TOKEN_OPERATOR_EQUAL);
			break;
		}
		case TOKEN_OPERATOR_NOT_EQUAL:
		{
			match(TOKEN_OPERATOR_NOT_EQUAL);
			break;
		}
		case TOKEN_OPERATOR_STRICT_EQUAL:
		{
			match(TOKEN_OPERATOR_STRICT_EQUAL);
			break;
		}
		case TOKEN_OPERATOR_STRICT_NOT_EQUAL:
		{
			match(TOKEN_OPERATOR_STRICT_NOT_EQUAL);
			break;
		}
		case TOKEN_OPERATOR_GREATER_THAN:
		{
			match(TOKEN_OPERATOR_GREATER_THAN);
			break;
		}
		case TOKEN_OPERATOR_GREATER_THAN_EQUALS:
		{
			match(TOKEN_OPERATOR_GREATER_THAN_EQUALS);
			break;
		}
		case TOKEN_OPERATOR_LESS_THAN:
		{
			match(TOKEN_OPERATOR_LESS_THAN);
			break;
		}
		case TOKEN_OPERATOR_LESS_THAN_EQUALS:
		{
			match(TOKEN_OPERATOR_LESS_THAN_EQUALS);
			break;
		}
		case TOKEN_KEYWORD_INSTANCEOF:
		{
			match(TOKEN_KEYWORD_INSTANCEOF);
			break;
		}
		case TOKEN_KEYWORD_IS:
		{
			match(TOKEN_KEYWORD_IS);
			break;
		}
		case TOKEN_KEYWORD_AS:
		{
			match(TOKEN_KEYWORD_AS);
			break;
		}
		case TOKEN_KEYWORD_IN:
		{
			match(TOKEN_KEYWORD_IN);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_LEFT_SHIFT:
		{
			match(TOKEN_OPERATOR_BITWISE_LEFT_SHIFT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_RIGHT_SHIFT:
		{
			match(TOKEN_OPERATOR_BITWISE_RIGHT_SHIFT);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_UNSIGNED_RIGHT_SHIFT:
		{
			match(TOKEN_OPERATOR_BITWISE_UNSIGNED_RIGHT_SHIFT);
			break;
		}
		case TOKEN_OPERATOR_MINUS:
		{
			match(TOKEN_OPERATOR_MINUS);
			break;
		}
		case TOKEN_OPERATOR_PLUS:
		{
			match(TOKEN_OPERATOR_PLUS);
			break;
		}
		case TOKEN_OPERATOR_DIVISION:
		{
			match(TOKEN_OPERATOR_DIVISION);
			break;
		}
		case TOKEN_OPERATOR_MODULO:
		{
			match(TOKEN_OPERATOR_MODULO);
			break;
		}
		case TOKEN_OPERATOR_STAR:
		{
			match(TOKEN_OPERATOR_STAR);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
	}
	
/**
 * Matches a "prefix expression".
 *
 *     delete x[i]
 *     ++i
 *     --i
 *
 * The distinction between this rule and "unary expression" makes the parser
 * more strict about what expressions can follow what tokens.
 */
	public final ExpressionNodeBase  prefixExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
			n = null;
			final ASToken op = LT(1);
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				n=postfixExpr();
				break;
			}
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			{
				{
				switch ( LA(1)) {
				case TOKEN_KEYWORD_DELETE:
				{
					match(TOKEN_KEYWORD_DELETE);
					n=postfixExpr();
					break;
				}
				case TOKEN_OPERATOR_INCREMENT:
				{
					match(TOKEN_OPERATOR_INCREMENT);
					n=lhsExpr();
					break;
				}
				case TOKEN_OPERATOR_DECREMENT:
				{
					match(TOKEN_OPERATOR_DECREMENT);
					n=lhsExpr();
					break;
				}
				default:
				{
					throw new NoViableAltException(LT(1), getFilename());
				}
				}
				}
				
					    	if (n == null)
					            n = IdentifierNode.createEmptyIdentifierNodeAfterToken(op);
					    	n = UnaryOperatorNodeBase.createPrefix(op, n); 
					
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches "Postfix Expression" such as: i++, i--
 *
 * Since ECMA semicolon insertion rule requires that if a "++" or "--" is not
 * on the same line as its left-hand side expression, a semicolon is inserted
 * before the "--" or "++" token. The side-effect of the inserted semicolon is
 * to terminate the expression parsing at this point. As a result, we have to
 * return "null" to stop parsing the expression. An upstream production will
 * pickup the "--" or "++" by starting a new expression.
 *
 * A good test case for such situation would be:
 *
 *    var i = 99
 *    ++i
 *
 * A semicolon should be inserted after "99", resulting in two separate ASTs
 * for "var i=99" and "++i". Otherwise, "var i=99++" is a bad recognition.
 */
	public final ExpressionNodeBase  postfixExpr() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null; 
		boolean isSemicolonInserted = false;
		
		
		n=lhsExpr();
		
			      final ASToken nextToken = LT(1); 
			      if (nextToken.getType() == ASTokenTypes.TOKEN_OPERATOR_INCREMENT ||
			          nextToken.getType() == ASTokenTypes.TOKEN_OPERATOR_DECREMENT)
			          isSemicolonInserted = beforeRestrictedToken(nextToken);
		
		{
		if (((_tokenSet_16.member(LA(1))))&&(!isSemicolonInserted)) {
			{
			if ((LA(1)==TOKEN_OPERATOR_INCREMENT||LA(1)==TOKEN_OPERATOR_DECREMENT)) {
				n=postfixOp(n);
			}
			else if ((_tokenSet_16.member(LA(1)))) {
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
		}
		else if ((_tokenSet_16.member(LA(1)))) {
		}
		else {
			throw new NoViableAltException(LT(1), getFilename());
		}
		
		}
		return n;
	}
	
/**
 * Matches a left-hand side (of asssignment) expression.
 */
	public final ExpressionNodeBase  lhsExpr() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
			n = null;
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_KEYWORD_NEW:
			{
				n=newExpression();
				break;
			}
			case TOKEN_PAREN_OPEN:
			{
				n=parenExpression();
				break;
			}
			case TOKEN_IDENTIFIER:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_STAR:
			{
				n=nameExpression();
				break;
			}
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			{
				n=primaryExpression();
				break;
			}
			case TOKEN_OPERATOR_ATSIGN:
			{
				n=xmlAttributeName();
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			{
			_loop246:
			do {
				if ((_tokenSet_15.member(LA(1)))) {
					n=propertyAccessExpression(n);
				}
				else if ((LA(1)==TOKEN_PAREN_OPEN)) {
					n=arguments(n);
				}
				else {
					break _loop246;
				}
				
			} while (true);
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches a unary operator.
 */
	public final ASToken  unaryOp() throws RecognitionException, TokenStreamException {
		ASToken op;
		
		
			op = LT(1); 
		
		
		switch ( LA(1)) {
		case TOKEN_KEYWORD_VOID:
		{
			match(TOKEN_KEYWORD_VOID);
			break;
		}
		case TOKEN_KEYWORD_TYPEOF:
		{
			match(TOKEN_KEYWORD_TYPEOF);
			break;
		}
		case TOKEN_OPERATOR_PLUS:
		{
			match(TOKEN_OPERATOR_PLUS);
			break;
		}
		case TOKEN_OPERATOR_MINUS:
		{
			match(TOKEN_OPERATOR_MINUS);
			break;
		}
		case TOKEN_OPERATOR_BITWISE_NOT:
		{
			match(TOKEN_OPERATOR_BITWISE_NOT);
			break;
		}
		case TOKEN_OPERATOR_LOGICAL_NOT:
		{
			match(TOKEN_OPERATOR_LOGICAL_NOT);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		return op;
	}
	
/**
 * Matches a property access expression:
 * For example: (assuming 'foo' is already matched)
 *     foo.bar
 *     foo..bar
 *     foo::bar
 *     foo[bar]
 *     foo.<bar>
 */
	public final ExpressionNodeBase  propertyAccessExpression(
		ExpressionNodeBase l
	) throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null;  
		ExpressionNodeBase r = null; 
		final ASToken op = LT(1); 
		
		
		switch ( LA(1)) {
		case TOKEN_OPERATOR_MEMBER_ACCESS:
		{
			match(TOKEN_OPERATOR_MEMBER_ACCESS);
			r=accessPart();
			n = new MemberAccessExpressionNode(l, op, r);
			break;
		}
		case TOKEN_OPERATOR_DESCENDANT_ACCESS:
		{
			match(TOKEN_OPERATOR_DESCENDANT_ACCESS);
			r=accessPart();
			n = new MemberAccessExpressionNode(l, op, r);
			break;
		}
		case TOKEN_OPERATOR_NS_QUALIFIER:
		{
			match(TOKEN_OPERATOR_NS_QUALIFIER);
			r=nsAccessPart();
			n = transformToNSAccessExpression(l, op, r);
			break;
		}
		case TOKEN_SQUARE_OPEN:
		{
			n=bracketExpression(l);
			break;
		}
		case TOKEN_TYPED_COLLECTION_OPEN:
		{
			n=typeApplication(l);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		return n;
	}
	
/**
 * Matches the arguments of a function call: allcharacters between (...) 
 * including the parenthesis.
 *
 *    foo(true, 10, "hello");
 *    new MyData(100, "hundred");
 *
 * "newExpression" rule always creates a FunctionCallNode and passes it in as
 * the "root". Since the "newExpression" rule uses "arguments" rule to consume
 * its arguments, we don't need to create a new FunctionCallNode because the
 * "root" parameter is the FunctionCallNode to which the arguments belongs.
 *
 * On the other hand, if the "root" argument is not a FunctionCallNode from a
 * "new" expression, then the "root" can only be the "name expression" of a 
 * function call. As a result, we must create a FunctionCallNode for it. 
 * For example:
 *     myFunc() -- the name expression is identifier "myFunc"
 *     token.getCallBack()() -- the name expression is "token.getCallBack()"
 *                              expecting the return value of "getCallBack" to
 *                              be a function object.
 * 
 * [Shaoting] We could also make newExpression rule not create a 
 *            FunctionCallNode inside the "newExpression" rule, and pass in 
 *            the "new" token so that all FunctionCallNode are constructed in
 *            this rule. However, we want the parser to construct nodes as early
 *            as possible for IDE features. For example: "new T" without "(..)"
 *            would not result in a FunctionCallNode if we don't create it right
 *            after we see "T".
 */
	public final ExpressionNodeBase  arguments(
		ExpressionNodeBase root
	) throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  lpT = null;
		Token  rpT = null;
		
			n = root; 
			ContainerNode args = null; 
		
		
		try {      // for error handling
			lpT = LT(1);
			match(TOKEN_PAREN_OPEN);
			
				    final boolean isNewExpression = 
				            (n instanceof FunctionCallNode) && 
				            ((FunctionCallNode)n).isNewExpression();
				            
					if (n == null || !isNewExpression) 
						n = new FunctionCallNode(n);
					
					args = ((FunctionCallNode)n).getArgumentsNode();
					args.startAfter(lpT);
					args.endAfter(lpT);
					disableSemicolonInsertion();
				
			{
			argumentList(args);
			}
			rpT = LT(1);
			match(TOKEN_PAREN_CLOSE);
			args.endAfter(rpT); enableSemicolonInsertion();
		}
		catch (RecognitionException ex) {
				
				//only consume this error b/c we're looking for a missing ')'  Let the parser handle the next token, maybe it will correct us
				consumeParsingError(ex); 
				if ( args != null ){
					if(ex instanceof NoViableAltException) {
						args.endBefore(((NoViableAltException)ex).token);
					} else if(ex instanceof MismatchedTokenException) {
						args.endBefore(((MismatchedTokenException)ex).token);
					} else {
						endContainerAtError(ex, args);
				}	
				}	
				enableSemicolonInsertion(); 
			
		}
		return n;
	}
	
/**
 * Matches a "postfix" operator such as: ++, --
 * The parameter "n" is the expression the postfix operator acts on.
 * The return value "top" is a UnaryOperatorNode.
 */
	public final UnaryOperatorNodeBase  postfixOp(
		ExpressionNodeBase n
	) throws RecognitionException, TokenStreamException {
		UnaryOperatorNodeBase top;
		
		
		final ASToken op = LT(1); 
		top = null;
		
		
		{
		switch ( LA(1)) {
		case TOKEN_OPERATOR_INCREMENT:
		{
			match(TOKEN_OPERATOR_INCREMENT);
			break;
		}
		case TOKEN_OPERATOR_DECREMENT:
		{
			match(TOKEN_OPERATOR_DECREMENT);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		top = UnaryOperatorNodeBase.createPostfix(op, n);
		return top;
	}
	
/**
 * Matches a primary expression.
 */
	public final ExpressionNodeBase  primaryExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null;  
		ASToken token = LT(1);
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_KEYWORD_NULL:
			{
				match(TOKEN_KEYWORD_NULL);
				n = new LiteralNode(token, LiteralType.NULL);
				break;
			}
			case TOKEN_KEYWORD_TRUE:
			{
				match(TOKEN_KEYWORD_TRUE);
				n = new LiteralNode(token, LiteralType.BOOLEAN);
				break;
			}
			case TOKEN_KEYWORD_FALSE:
			{
				match(TOKEN_KEYWORD_FALSE);
				n = new LiteralNode(token, LiteralType.BOOLEAN);
				break;
			}
			case TOKEN_KEYWORD_THIS:
			{
				match(TOKEN_KEYWORD_THIS);
				n = LanguageIdentifierNode.buildThis(token);
				break;
			}
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			{
				token=numericLiteral();
				n = new NumericLiteralNode(token);
				break;
			}
			case TOKEN_LITERAL_STRING:
			{
				match(TOKEN_LITERAL_STRING);
				n = new LiteralNode(token, LiteralType.STRING);
				break;
			}
			case TOKEN_VOID_0:
			{
				match(TOKEN_VOID_0);
				n = new LiteralNode(token, LiteralType.OBJECT);
				break;
			}
			case TOKEN_LITERAL_REGEXP:
			{
				match(TOKEN_LITERAL_REGEXP);
				n = new RegExpLiteralNode(token, this);
				break;
			}
			case TOKEN_SQUARE_OPEN:
			{
				n = new ArrayLiteralNode();
				arrayInitializer((ArrayLiteralNode)n);
				break;
			}
			case TOKEN_BLOCK_OPEN:
			{
				n=objectLiteralExpression();
				break;
			}
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_E4X_BINDING_OPEN:
			{
				n=xmlInitializer();
				leaveXMLLiteral();
				break;
			}
			case TOKEN_LITERAL_XMLLIST:
			{
				n=xmlListInitializer();
				leaveXMLLiteral();
				break;
			}
			case TOKEN_KEYWORD_FUNCTION:
			{
				n=functionExpression();
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches a numeric literal token.
 */
	public final ASToken  numericLiteral() throws RecognitionException, TokenStreamException {
		ASToken op;
		
		
			op = LT(1); 
		
		
		switch ( LA(1)) {
		case TOKEN_LITERAL_NUMBER:
		{
			match(TOKEN_LITERAL_NUMBER);
			break;
		}
		case TOKEN_LITERAL_HEX_NUMBER:
		{
			match(TOKEN_LITERAL_HEX_NUMBER);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		return op;
	}
	
/**
 * Matches an "object literal".
 */
	public final ExpressionNodeBase  objectLiteralExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  openT = null;
		Token  closeT = null;
		
			ObjectLiteralNode o = new ObjectLiteralNode(); 
			n = o; 
			ContainerNode b = o.getContentsNode(); 
			ExpressionNodeBase vp = null;
		
		
		try {      // for error handling
			openT = LT(1);
			match(TOKEN_BLOCK_OPEN);
			n.startAfter(openT);
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_LITERAL_STRING:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			{
				vp=objectLiteralValuePair();
				b.addItem(vp);
				{
				_loop197:
				do {
					if ((LA(1)==TOKEN_COMMA)) {
						try {      // for error handling
							match(TOKEN_COMMA);
							vp=objectLiteralValuePair();
							if (vp != null) b.addItem(vp);
						}
						catch (RecognitionException ex) {
							handleParsingError(ex);
						}
					}
					else {
						break _loop197;
					}
					
				} while (true);
				}
				break;
			}
			case TOKEN_BLOCK_CLOSE:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			closeT = LT(1);
			match(TOKEN_BLOCK_CLOSE);
			n.endAfter(closeT);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches "XML literal expression".
 */
	public final XMLLiteralNode  xmlInitializer() throws RecognitionException, TokenStreamException {
		XMLLiteralNode n;
		
		
			n = new XMLLiteralNode(); 
			final ASToken lt = LT(1);
			enterXMLLiteral();
		
		
		try {      // for error handling
			if ((((LA(1) >= TOKEN_E4X_COMMENT && LA(1) <= TOKEN_E4X_PROCESSING_INSTRUCTION)))&&( LA(1) == TOKEN_E4X_COMMENT || 
    	  LA(1) == TOKEN_E4X_CDATA || 
    	  LA(1) == TOKEN_E4X_PROCESSING_INSTRUCTION 
    	)) {
				xmlMarkup();
				n.appendLiteralToken(lt);
				xmlWhitespace(n);
			}
			else if ((_tokenSet_17.member(LA(1)))) {
				{
				int _cnt218=0;
				_loop218:
				do {
					if ((_tokenSet_17.member(LA(1)))) {
						xmlElementContent(n);
					}
					else {
						if ( _cnt218>=1 ) { break _loop218; } else {throw new NoViableAltException(LT(1), getFilename());}
					}
					
					_cnt218++;
				} while (true);
				}
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches an E4X XML list expression.
 */
	public final XMLListLiteralNode  xmlListInitializer() throws RecognitionException, TokenStreamException {
		XMLListLiteralNode n;
		
		Token  xmlListT = null;
		Token  closeT = null;
		
			n = new XMLListLiteralNode(); 
			enterXMLLiteral();
		
		
		try {      // for error handling
			xmlListT = LT(1);
			match(TOKEN_LITERAL_XMLLIST);
			n.getContentsNode().addItem(new LiteralNode(LiteralType.XML, xmlListT));
			{
			_loop241:
			do {
				if ((_tokenSet_17.member(LA(1)))) {
					xmlElementContent(n);
				}
				else {
					break _loop241;
				}
				
			} while (true);
			}
			closeT = LT(1);
			match(TOKEN_E4X_XMLLIST_CLOSE);
			n.getContentsNode().addItem(new LiteralNode(LiteralType.XML, closeT));
			xmlWhitespace(null);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches a "field" in an "object literal".
 * The "field" can be gated with a "config condition". If the condition is
 * "false", return "null" value; Otherwise, return the expression node of the
 * key/value pair.
 */
	public final ExpressionNodeBase  objectLiteralValuePair() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  nameT = null;
		Token  stringT = null;
		Token  c = null;
		
			ExpressionNodeBase v = null;  
			n = null;            
			boolean condition = true;   
		ASToken numberT = null;     
		
		
		try {      // for error handling
			{
			if (((LA(1)==TOKEN_NAMESPACE_NAME))&&( isConfigCondition() && LA(4) != TOKEN_COLON && LA(4) != TOKEN_BLOCK_CLOSE )) {
				condition=configCondition();
			}
			else if ((_tokenSet_18.member(LA(1)))) {
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			{
				nameT = LT(1);
				match(TOKEN_IDENTIFIER);
				n = new NonResolvingIdentifierNode(nameT != null ? nameT.getText() : "",nameT);
				break;
			}
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			{
				numberT=numericLiteral();
				n = new NumericLiteralNode(numberT);
				break;
			}
			case TOKEN_LITERAL_STRING:
			{
				stringT = LT(1);
				match(TOKEN_LITERAL_STRING);
				n = new LiteralNode(LiteralType.STRING, stringT);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			c = LT(1);
			match(TOKEN_COLON);
			v=assignmentExpression();
			
					if (condition)
					    n = new ObjectLiteralValuePairNode((ASToken)c,n,v); 
					    else
					        n = null;
				
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches all the elements in an "arrayInitializer". For example:
 *
 *    x,y,z
 *    x,,
 *    (empty)
 *    ,,,,,,
 *
 * "Holes" are compiled as "undefined".
 * Leading "holes" are kept as "undefined" values.
 * "Holes" in the middle are kept as "undefined" values.
 * Trailing "holes" are kept as "undefined" values except that the last "hole"
 * is dropped.
 *
 * For example: x=[,,1,,,2,,,] has 2 leading holes, 2 holes in the middle, and 3
 * holes at the end. All the holes except for the last trailing holes are kept
 * as undefined values:
 *
 * x[0]=undefined
 * x[1]=undefined
 * x[2]=1
 * x[3]=undefined
 * x[4]=undefined
 * x[5]=2
 * x[6]=undefined
 * x[7]=undefined
 * (end)
 *
 */
	public final void arrayElements(
		ContainerNode b
	) throws RecognitionException, TokenStreamException {
		
		
		ExpressionNodeBase e = null;  
		
		
		try {      // for error handling
			{
			_loop204:
			do {
				if ((LA(1)==TOKEN_COMMA)) {
					match(TOKEN_COMMA);
					b.addItem(new NilNode());
				}
				else {
					break _loop204;
				}
				
			} while (true);
			}
			{
			if (((_tokenSet_3.member(LA(1))))&&( LA(1) != TOKEN_SQUARE_CLOSE)) {
				e=arrayElement();
				b.addItem(e); /*1*/
				{
				_loop208:
				do {
					if ((LA(1)==TOKEN_COMMA)) {
						try {      // for error handling
							match(TOKEN_COMMA);
							{
							if (((_tokenSet_3.member(LA(1))))&&( LA(1) != TOKEN_SQUARE_CLOSE && LA(1) != TOKEN_COMMA )) {
								e=arrayElement();
								b.addItem(e); /*2*/
							}
							else if (((LA(1)==TOKEN_COMMA||LA(1)==TOKEN_SQUARE_CLOSE))&&( LA(1) != TOKEN_SQUARE_CLOSE && LA(1) == TOKEN_COMMA )) {
								b.addItem(new NilNode());
							}
							else if ((LA(1)==TOKEN_COMMA||LA(1)==TOKEN_SQUARE_CLOSE)) {
							}
							else {
								throw new NoViableAltException(LT(1), getFilename());
							}
							
							}
						}
						catch (RecognitionException ex) {
							handleParsingError(ex);
						}
					}
					else {
						break _loop208;
					}
					
				} while (true);
				}
			}
			else if ((LA(1)==TOKEN_SQUARE_CLOSE)) {
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches an "array element" in an "array literal". An array element can be 
 * gated with a config variable. If the config variable is false, the element
 * will be matched as a "hole" in the array literal.
 */
	public final ExpressionNodeBase  arrayElement() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase e;
		
		
			e = null; 
			boolean c = true;  // config variable
		
		
		try {      // for error handling
			{
			if (((LA(1)==TOKEN_NAMESPACE_NAME))&&( isConfigCondition() && LA(4) != TOKEN_COMMA && LA(4) != TOKEN_SQUARE_CLOSE )) {
				c=configCondition();
			}
			else if ((_tokenSet_3.member(LA(1)))) {
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
			e=assignmentExpression();
			
				if (!c) 
				{
					final NilNode nilNode = new NilNode(); 
					nilNode.span(e, e);
					e = nilNode;
					}
			
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return e;
	}
	
/**
 * Matches a "vector initializer".
 */
	public final VectorLiteralNode  vectorLiteralExpression() throws RecognitionException, TokenStreamException {
		VectorLiteralNode node;
		
		Token  open = null;
		Token  close = null;
		Token  openT = null;
		Token  closeT = null;
		
			node = new VectorLiteralNode(); 
			ContainerNode b = node.getContentsNode(); 
			ExpressionNodeBase type = null; 
		
		
		try {      // for error handling
			open = LT(1);
			match(TOKEN_TYPED_LITERAL_OPEN);
			node.endAfter(open);
			type=type();
			node.setCollectionTypeNode(type);
			close = LT(1);
			match(TOKEN_TYPED_LITERAL_CLOSE);
			node.endAfter(close);
			openT = LT(1);
			match(TOKEN_SQUARE_OPEN);
			b.startAfter(openT);
			{
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_LITERAL_STRING:
			case TOKEN_BLOCK_OPEN:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_SQUARE_OPEN:
			case TOKEN_KEYWORD_FUNCTION:
			case TOKEN_PAREN_OPEN:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_MINUS:
			case TOKEN_OPERATOR_PLUS:
			case TOKEN_OPERATOR_STAR:
			case TOKEN_KEYWORD_DELETE:
			case TOKEN_OPERATOR_INCREMENT:
			case TOKEN_OPERATOR_DECREMENT:
			case TOKEN_KEYWORD_VOID:
			case TOKEN_KEYWORD_TYPEOF:
			case TOKEN_OPERATOR_BITWISE_NOT:
			case TOKEN_OPERATOR_LOGICAL_NOT:
			case TOKEN_KEYWORD_NULL:
			case TOKEN_KEYWORD_TRUE:
			case TOKEN_KEYWORD_FALSE:
			case TOKEN_KEYWORD_THIS:
			case TOKEN_VOID_0:
			case TOKEN_LITERAL_REGEXP:
			case TOKEN_LITERAL_NUMBER:
			case TOKEN_LITERAL_HEX_NUMBER:
			case TOKEN_E4X_WHITESPACE:
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			case TOKEN_E4X_ENTITY:
			case TOKEN_E4X_DECIMAL_ENTITY:
			case TOKEN_E4X_HEX_ENTITY:
			case TOKEN_E4X_TEXT:
			case TOKEN_E4X_STRING:
			case TOKEN_E4X_OPEN_TAG_START:
			case TOKEN_E4X_CLOSE_TAG_START:
			case HIDDEN_TOKEN_E4X:
			case TOKEN_LITERAL_XMLLIST:
			case TOKEN_E4X_BINDING_OPEN:
			case TOKEN_KEYWORD_NEW:
			case TOKEN_OPERATOR_ATSIGN:
			{
				vectorLiteralContents(b);
				break;
			}
			case TOKEN_SQUARE_CLOSE:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			closeT = LT(1);
			match(TOKEN_SQUARE_CLOSE);
			b.endBefore(closeT);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return node;
	}
	
/**
 * Matches a "vector element" in a vector initializer.
 */
	public final void vectorLiteralContents(
		ContainerNode b
	) throws RecognitionException, TokenStreamException {
		
		
			ExpressionNodeBase e = null;  
		
		
		e=arrayElement();
		b.addItem(e);
		{
		_loop215:
		do {
			if ((LA(1)==TOKEN_COMMA)) {
				try {      // for error handling
					match(TOKEN_COMMA);
					
					//  A trailing comma is allowed, but 
					//  an intermediate comma is not.
					if ( LA(1) != TOKEN_SQUARE_CLOSE ){
					e=arrayElement();
					b.addItem(e); 
					}
						 	
				}
				catch (RecognitionException ex) {
					handleParsingError(ex);
				}
			}
			else {
				break _loop215;
			}
			
		} while (true);
		}
	}
	
/**
 * Matches an XML comment, XML CDATA or XML PI token.
 */
	public final void xmlMarkup() throws RecognitionException, TokenStreamException {
		
		
		switch ( LA(1)) {
		case TOKEN_E4X_COMMENT:
		{
			match(TOKEN_E4X_COMMENT);
			break;
		}
		case TOKEN_E4X_CDATA:
		{
			match(TOKEN_E4X_CDATA);
			break;
		}
		case TOKEN_E4X_PROCESSING_INSTRUCTION:
		{
			match(TOKEN_E4X_PROCESSING_INSTRUCTION);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
	}
	
/**
 * Match XML whitespace tokens. If {@code ContainerNode} is null, drop the
 * whitespace tokens.
 */
	public final void xmlWhitespace(
		BaseLiteralContainerNode n
	) throws RecognitionException, TokenStreamException {
		
		Token  ws = null;
		
		{
		_loop221:
		do {
			if ((LA(1)==TOKEN_E4X_WHITESPACE)) {
				ws = LT(1);
				match(TOKEN_E4X_WHITESPACE);
				
					if (n != null) 
					    n.appendLiteralToken((ASToken)ws); 
					
			}
			else {
				break _loop221;
			}
			
		} while (true);
		}
	}
	
/**
 * Matches an expression block in XML literals.
 *
 *    <foo>{ this.fooValue }</foo>
 */
	public final void xmlElementContent(
		BaseLiteralContainerNode n
	) throws RecognitionException, TokenStreamException {
		
		
		switch ( LA(1)) {
		case TOKEN_E4X_WHITESPACE:
		case TOKEN_E4X_COMMENT:
		case TOKEN_E4X_CDATA:
		case TOKEN_E4X_PROCESSING_INSTRUCTION:
		case TOKEN_E4X_ENTITY:
		case TOKEN_E4X_DECIMAL_ENTITY:
		case TOKEN_E4X_HEX_ENTITY:
		case TOKEN_E4X_TEXT:
		case TOKEN_E4X_STRING:
		{
			xmlToken(n);
			break;
		}
		case TOKEN_E4X_BINDING_OPEN:
		{
			xmlContentBlock(n);
			break;
		}
		case TOKEN_E4X_OPEN_TAG_START:
		case TOKEN_E4X_CLOSE_TAG_START:
		case HIDDEN_TOKEN_E4X:
		{
			xmlTag(n);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
	}
	
/**
 * Matches an E4X token that can be aggregated in "xmlTokenAggregated".
 * Instead of a full recursive descent parser for XML tags, the base class
 * uses a tag name stack to check matching tags. A complete parse tree with
 * XML structure is unnecessary and adds extra overhead to the parser.
 */
	public final void xmlToken(
		BaseLiteralContainerNode n
	) throws RecognitionException, TokenStreamException {
		
		
			final ASToken t = LT(1);
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_E4X_COMMENT:
			case TOKEN_E4X_CDATA:
			case TOKEN_E4X_PROCESSING_INSTRUCTION:
			{
				xmlMarkup();
				break;
			}
			case TOKEN_E4X_WHITESPACE:
			{
				match(TOKEN_E4X_WHITESPACE);
				break;
			}
			case TOKEN_E4X_ENTITY:
			{
				match(TOKEN_E4X_ENTITY);
				break;
			}
			case TOKEN_E4X_DECIMAL_ENTITY:
			{
				match(TOKEN_E4X_DECIMAL_ENTITY);
				break;
			}
			case TOKEN_E4X_HEX_ENTITY:
			{
				match(TOKEN_E4X_HEX_ENTITY);
				break;
			}
			case TOKEN_E4X_TEXT:
			{
				match(TOKEN_E4X_TEXT);
				break;
			}
			case TOKEN_E4X_STRING:
			{
				match(TOKEN_E4X_STRING);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			n.appendLiteralToken(t);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches an XML tag.
 *
 *     <foo>
 *     </foo>
 *     <foo />
 *     <{name}>
 *     <foo name={nameValue}>
 *     <foo {attrs}>
 */
	public final void xmlTag(
		BaseLiteralContainerNode n
	) throws RecognitionException, TokenStreamException {
		
		Token  openT = null;
		Token  closeT = null;
		Token  openNoNameT = null;
		Token  nT = null;
		Token  endT = null;
		Token  emptyEndT = null;
		
		{
		switch ( LA(1)) {
		case TOKEN_E4X_OPEN_TAG_START:
		{
			openT = LT(1);
			match(TOKEN_E4X_OPEN_TAG_START);
			
				xmlTagOpen((ASToken)openT); 
			n.appendLiteralToken((ASToken)openT);
				
			break;
		}
		case TOKEN_E4X_CLOSE_TAG_START:
		{
			closeT = LT(1);
			match(TOKEN_E4X_CLOSE_TAG_START);
			
				xmlTagClose((ASToken)closeT); 
			n.appendLiteralToken((ASToken)closeT);
				
			break;
		}
		case HIDDEN_TOKEN_E4X:
		{
			openNoNameT = LT(1);
			match(HIDDEN_TOKEN_E4X);
			
				xmlTagOpenBinding((ASToken)openNoNameT); 
			n.appendLiteralToken((ASToken)openNoNameT);
				
			{
			switch ( LA(1)) {
			case TOKEN_E4X_BINDING_OPEN:
			{
				xmlContentBlock(n);
				break;
			}
			case TOKEN_E4X_NAME:
			{
				nT = LT(1);
				match(TOKEN_E4X_NAME);
				n.appendLiteralToken((ASToken)nT);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		xmlWhitespace(n);
		{
		_loop230:
		do {
			if ((LA(1)==TOKEN_E4X_NAME||LA(1)==TOKEN_E4X_XMLNS||LA(1)==TOKEN_E4X_BINDING_OPEN)) {
				{
				switch ( LA(1)) {
				case TOKEN_E4X_NAME:
				case TOKEN_E4X_XMLNS:
				{
					xmlAttribute(n);
					break;
				}
				case TOKEN_E4X_BINDING_OPEN:
				{
					xmlContentBlock(n);
					break;
				}
				default:
				{
					throw new NoViableAltException(LT(1), getFilename());
				}
				}
				}
				xmlWhitespace(n);
			}
			else {
				break _loop230;
			}
			
		} while (true);
		}
		{
		switch ( LA(1)) {
		case TOKEN_E4X_TAG_END:
		{
			endT = LT(1);
			match(TOKEN_E4X_TAG_END);
			n.appendLiteralToken((ASToken)endT);
			break;
		}
		case TOKEN_E4X_EMPTY_TAG_END:
		{
			emptyEndT = LT(1);
			match(TOKEN_E4X_EMPTY_TAG_END);
			
				xmlEmptyTagEnd((ASToken)emptyEndT); 
			n.appendLiteralToken((ASToken)emptyEndT);
			
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
	}
	
/**
 * Matches a binding expression in an XML literal.
 */
	public final void xmlContentBlock(
		BaseLiteralContainerNode n
	) throws RecognitionException, TokenStreamException {
		
		
			ExpressionNodeBase e = null; 
		
		
		try {      // for error handling
			match(TOKEN_E4X_BINDING_OPEN);
			e=expression();
			
			if(e != null) 
			n.getContentsNode().addItem(e); 
				
			match(TOKEN_E4X_BINDING_CLOSE);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
	}
	
/**
 * Matches an XML attribute.
 * 
 *     name="value"
 *     name='value'
 *     name={value}
 */
	public final void xmlAttribute(
		BaseLiteralContainerNode n
	) throws RecognitionException, TokenStreamException {
		
		Token  nT = null;
		Token  nsT = null;
		Token  dT = null;
		Token  dnT = null;
		Token  eqT = null;
		Token  strT = null;
		Token  eT = null;
		Token  hexT = null;
		
		{
		switch ( LA(1)) {
		case TOKEN_E4X_NAME:
		{
			nT = LT(1);
			match(TOKEN_E4X_NAME);
			n.appendLiteralToken((ASToken)nT);
			break;
		}
		case TOKEN_E4X_XMLNS:
		{
			nsT = LT(1);
			match(TOKEN_E4X_XMLNS);
			n.appendLiteralToken((ASToken)nsT);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		{
		_loop235:
		do {
			if ((LA(1)==TOKEN_E4X_NAME_DOT)) {
				dT = LT(1);
				match(TOKEN_E4X_NAME_DOT);
				n.appendLiteralToken((ASToken)dT);
				dnT = LT(1);
				match(TOKEN_E4X_DOTTED_NAME_PART);
				n.appendLiteralToken((ASToken)dnT);
			}
			else {
				break _loop235;
			}
			
		} while (true);
		}
		xmlWhitespace(n);
		eqT = LT(1);
		match(TOKEN_E4X_EQUALS);
		n.appendLiteralToken((ASToken)eqT);
		xmlWhitespace(n);
		{
		int _cnt237=0;
		_loop237:
		do {
			switch ( LA(1)) {
			case TOKEN_E4X_STRING:
			{
				strT = LT(1);
				match(TOKEN_E4X_STRING);
				n.appendLiteralToken((ASToken)strT);
				break;
			}
			case TOKEN_E4X_ENTITY:
			{
				eT = LT(1);
				match(TOKEN_E4X_ENTITY);
				n.appendLiteralToken((ASToken)eT);
				break;
			}
			case TOKEN_E4X_HEX_ENTITY:
			{
				hexT = LT(1);
				match(TOKEN_E4X_HEX_ENTITY);
				n.appendLiteralToken((ASToken)hexT);
				break;
			}
			default:
				if ((LA(1)==TOKEN_E4X_BINDING_OPEN)) {
					xmlContentBlock(n);
				}
			else {
				if ( _cnt237>=1 ) { break _loop237; } else {throw new NoViableAltException(LT(1), getFilename());}
			}
			}
			_cnt237++;
		} while (true);
		}
	}
	
/**
 * Matches a new expression. See ASL syntax spec for details.
 */
	public final ExpressionNodeBase  newExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  newT = null;
		
			n = null; 
		
		
		try {      // for error handling
			newT = LT(1);
			match(TOKEN_KEYWORD_NEW);
			{
			if (((_tokenSet_19.member(LA(1))))&&( LA(1) != TOKEN_KEYWORD_FUNCTION )) {
				{
				switch ( LA(1)) {
				case TOKEN_TYPED_LITERAL_OPEN:
				{
					n=vectorLiteralExpression();
					break;
				}
				case TOKEN_IDENTIFIER:
				case TOKEN_LITERAL_STRING:
				case TOKEN_BLOCK_OPEN:
				case TOKEN_NAMESPACE_NAME:
				case TOKEN_RESERVED_WORD_NAMESPACE:
				case TOKEN_SQUARE_OPEN:
				case TOKEN_KEYWORD_FUNCTION:
				case TOKEN_PAREN_OPEN:
				case TOKEN_RESERVED_WORD_GET:
				case TOKEN_RESERVED_WORD_SET:
				case TOKEN_KEYWORD_SUPER:
				case TOKEN_OPERATOR_STAR:
				case TOKEN_KEYWORD_NULL:
				case TOKEN_KEYWORD_TRUE:
				case TOKEN_KEYWORD_FALSE:
				case TOKEN_KEYWORD_THIS:
				case TOKEN_VOID_0:
				case TOKEN_LITERAL_REGEXP:
				case TOKEN_LITERAL_NUMBER:
				case TOKEN_LITERAL_HEX_NUMBER:
				case TOKEN_E4X_WHITESPACE:
				case TOKEN_E4X_COMMENT:
				case TOKEN_E4X_CDATA:
				case TOKEN_E4X_PROCESSING_INSTRUCTION:
				case TOKEN_E4X_ENTITY:
				case TOKEN_E4X_DECIMAL_ENTITY:
				case TOKEN_E4X_HEX_ENTITY:
				case TOKEN_E4X_TEXT:
				case TOKEN_E4X_STRING:
				case TOKEN_E4X_OPEN_TAG_START:
				case TOKEN_E4X_CLOSE_TAG_START:
				case HIDDEN_TOKEN_E4X:
				case TOKEN_LITERAL_XMLLIST:
				case TOKEN_E4X_BINDING_OPEN:
				case TOKEN_KEYWORD_NEW:
				case TOKEN_OPERATOR_ATSIGN:
				{
					n=memberExpression();
					break;
				}
				default:
				{
					throw new NoViableAltException(LT(1), getFilename());
				}
				}
				}
				
				if (n == null) 
					n= handleMissingIdentifier(null); 
					else 
						n = FullNameNode.toMemberAccessExpressionNode(n);
								n = new FunctionCallNode((ASToken)newT, n); 
							
				{
				if ((LA(1)==TOKEN_PAREN_OPEN)) {
					n=arguments(n);
				}
				else if ((_tokenSet_16.member(LA(1)))) {
				}
				else {
					throw new NoViableAltException(LT(1), getFilename());
				}
				
				}
			}
			else if ((LA(1)==TOKEN_KEYWORD_FUNCTION)) {
				n=functionExpression();
				n = new FunctionCallNode((ASToken)newT, n);
			}
			else {
				throw new NoViableAltException(LT(1), getFilename());
			}
			
			}
		}
		catch (RecognitionException ex) {
			
						//if we have the 'new' keyword, but no expression, drop in a dummy identifier
					    if(newT != null && n == null) {
						    IdentifierNode identifier = handleMissingIdentifier(ex);
						    if(identifier != null) {
						        //if we're here, that means identifier fixup is turned on
						        n = new FunctionCallNode((ASToken)newT, identifier);
						    }
						} else {
						    handleParsingError(ex); 
						}
					
		}
		return n;
	}
	
/**
 * Matches an expression with parenthesis.
 *
 *     (id)
 *     (1 + 2)
 *     (name == "hello")
 *
 */
	public final ExpressionNodeBase  parenExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null; 
		
		
		try {      // for error handling
			match(TOKEN_PAREN_OPEN);
			n=expression();
			match(TOKEN_PAREN_CLOSE);
			if(n != null) n.setHasParenthesis(true);
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * This is a non-greedy and non-aggregating version of "restricted name".
 * It is defined in addition to "propertyName" in order to get correct
 * precedence in the name expressions and expected tree shapes.
 */
	public final ExpressionNodeBase  nameExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  superT = null;
		Token  nsT = null;
		n = null;
		
		switch ( LA(1)) {
		case TOKEN_IDENTIFIER:
		case TOKEN_RESERVED_WORD_NAMESPACE:
		case TOKEN_RESERVED_WORD_GET:
		case TOKEN_RESERVED_WORD_SET:
		{
			n=identifier();
			break;
		}
		case TOKEN_OPERATOR_STAR:
		{
			n=starLiteral();
			break;
		}
		case TOKEN_KEYWORD_SUPER:
		{
			superT = LT(1);
			match(TOKEN_KEYWORD_SUPER);
			n = LanguageIdentifierNode.buildSuper((IASToken)superT);
			break;
		}
		case TOKEN_NAMESPACE_NAME:
		{
			nsT = LT(1);
			match(TOKEN_NAMESPACE_NAME);
			
						n = new NamespaceIdentifierNode((ASToken)nsT); 
						((NamespaceIdentifierNode)n).setIsConfigNamespace(isConfigNamespace((NamespaceIdentifierNode)n));	
					
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		return n;
	}
	
/**
 * Matches an E4X attribute name. For example:
 *  
 *     "@*", @data, @[foo="hello"]
 *
 */
	public final ExpressionNodeBase  xmlAttributeName() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase result;
		
		Token  nsT = null;
		
		result = UnaryOperatorNodeBase.createPrefix(LT(1), null);
		ExpressionNodeBase e = null;
		
		
		match(TOKEN_OPERATOR_ATSIGN);
		{
		switch ( LA(1)) {
		case TOKEN_IDENTIFIER:
		case TOKEN_NAMESPACE_NAME:
		case TOKEN_RESERVED_WORD_NAMESPACE:
		case TOKEN_RESERVED_WORD_GET:
		case TOKEN_RESERVED_WORD_SET:
		case TOKEN_OPERATOR_STAR:
		{
			{
			switch ( LA(1)) {
			case TOKEN_OPERATOR_STAR:
			{
				e=starLiteral();
				break;
			}
			case TOKEN_IDENTIFIER:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			{
				e=identifier();
				break;
			}
			case TOKEN_NAMESPACE_NAME:
			{
				nsT = LT(1);
				match(TOKEN_NAMESPACE_NAME);
				e = new NamespaceIdentifierNode((ASToken)nsT);
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			
				        	((UnaryOperatorNodeBase)result).setExpression(e); 
				
			break;
		}
		case TOKEN_SQUARE_OPEN:
		{
			result=bracketExpression(result);
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		return result;
	}
	
/**
 * Matches a member expression. See ASL syntax spec for details.
 */
	public final ExpressionNodeBase  memberExpression() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		{
		switch ( LA(1)) {
		case TOKEN_LITERAL_STRING:
		case TOKEN_BLOCK_OPEN:
		case TOKEN_SQUARE_OPEN:
		case TOKEN_KEYWORD_FUNCTION:
		case TOKEN_KEYWORD_NULL:
		case TOKEN_KEYWORD_TRUE:
		case TOKEN_KEYWORD_FALSE:
		case TOKEN_KEYWORD_THIS:
		case TOKEN_VOID_0:
		case TOKEN_LITERAL_REGEXP:
		case TOKEN_LITERAL_NUMBER:
		case TOKEN_LITERAL_HEX_NUMBER:
		case TOKEN_E4X_WHITESPACE:
		case TOKEN_E4X_COMMENT:
		case TOKEN_E4X_CDATA:
		case TOKEN_E4X_PROCESSING_INSTRUCTION:
		case TOKEN_E4X_ENTITY:
		case TOKEN_E4X_DECIMAL_ENTITY:
		case TOKEN_E4X_HEX_ENTITY:
		case TOKEN_E4X_TEXT:
		case TOKEN_E4X_STRING:
		case TOKEN_E4X_OPEN_TAG_START:
		case TOKEN_E4X_CLOSE_TAG_START:
		case HIDDEN_TOKEN_E4X:
		case TOKEN_LITERAL_XMLLIST:
		case TOKEN_E4X_BINDING_OPEN:
		{
			n=primaryExpression();
			break;
		}
		case TOKEN_PAREN_OPEN:
		{
			n=parenExpression();
			break;
		}
		case TOKEN_IDENTIFIER:
		case TOKEN_NAMESPACE_NAME:
		case TOKEN_RESERVED_WORD_NAMESPACE:
		case TOKEN_RESERVED_WORD_GET:
		case TOKEN_RESERVED_WORD_SET:
		case TOKEN_KEYWORD_SUPER:
		case TOKEN_OPERATOR_STAR:
		case TOKEN_OPERATOR_ATSIGN:
		{
			n=propertyName();
			break;
		}
		case TOKEN_KEYWORD_NEW:
		{
			n=newExpression();
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		{
		_loop250:
		do {
			if ((_tokenSet_15.member(LA(1)))) {
				n=propertyAccessExpression(n);
			}
			else {
				break _loop250;
			}
			
		} while (true);
		}
		return n;
	}
	
/**
 * Matches a property name in a member expression.
 */
	public final ExpressionNodeBase  propertyName() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null;
		
		
		switch ( LA(1)) {
		case TOKEN_OPERATOR_STAR:
		{
			n=starLiteral();
			break;
		}
		case TOKEN_IDENTIFIER:
		case TOKEN_NAMESPACE_NAME:
		case TOKEN_RESERVED_WORD_NAMESPACE:
		case TOKEN_RESERVED_WORD_GET:
		case TOKEN_RESERVED_WORD_SET:
		case TOKEN_KEYWORD_SUPER:
		{
			n=restrictedName();
			break;
		}
		case TOKEN_OPERATOR_ATSIGN:
		{
			n=xmlAttributeName();
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		return n;
	}
	
/**
 * Matches parts after the dot in a property access expression.
 */
	public final ExpressionNodeBase  accessPart() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null; 
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_STAR:
			{
				n=nameExpression();
				break;
			}
			case TOKEN_OPERATOR_ATSIGN:
			{
				n=xmlAttributeName();
				break;
			}
			case TOKEN_PAREN_OPEN:
			{
				n=parenExpression();
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			n = handleMissingIdentifier(ex);
		}
		return n;
	}
	
/**
 * Matches parts after "::" in a property access expression.
 */
	public final ExpressionNodeBase  nsAccessPart() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		
		n = null; 
		
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_IDENTIFIER:
			case TOKEN_NAMESPACE_NAME:
			case TOKEN_RESERVED_WORD_NAMESPACE:
			case TOKEN_RESERVED_WORD_GET:
			case TOKEN_RESERVED_WORD_SET:
			case TOKEN_KEYWORD_SUPER:
			case TOKEN_OPERATOR_STAR:
			{
				n=nameExpression();
				break;
			}
			case TOKEN_OPERATOR_ATSIGN:
			{
				n=xmlAttributeName();
				break;
			}
			case TOKEN_PAREN_OPEN:
			{
				n=parenExpression();
				break;
			}
			case TOKEN_SQUARE_OPEN:
			{
				n=runtimeName();
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			n = handleMissingIdentifier(ex);
		}
		return n;
	}
	
/**
 * Matches a runtime attribute name.
 * 
 *     foo["name"]
 */
	public final ExpressionNodeBase  runtimeName() throws RecognitionException, TokenStreamException {
		ExpressionNodeBase n;
		
		Token  closeT = null;
		
			ExpressionNodeBase e = null; 
			n = null; 
		
		
		try {      // for error handling
			match(TOKEN_SQUARE_OPEN);
			e=expression();
			closeT = LT(1);
			match(TOKEN_SQUARE_CLOSE);
			
					n = new RuntimeNameExpressionNode(e);
					n.endAfter(closeT); 
				
		}
		catch (RecognitionException ex) {
			handleParsingError(ex);
		}
		return n;
	}
	
/**
 * Matches an argument list in a function call arguments.
 *
 * For argument list, we want to support the case where the user might be in the 
 * middle of typing, which could mean a couple of things:
 * 1. The user adds an argument before another.
 * 2. After which could lead to comma where we don't want it.
 */
	public final void argumentList(
		ContainerNode args
	) throws RecognitionException, TokenStreamException {
		
		Token  commaT = null;
		
			ExpressionNodeBase n = null; 
			boolean foundFirstArg = false; 
		
		
		{
		switch ( LA(1)) {
		case TOKEN_IDENTIFIER:
		case TOKEN_LITERAL_STRING:
		case TOKEN_BLOCK_OPEN:
		case TOKEN_NAMESPACE_NAME:
		case TOKEN_RESERVED_WORD_NAMESPACE:
		case TOKEN_SQUARE_OPEN:
		case TOKEN_KEYWORD_FUNCTION:
		case TOKEN_PAREN_OPEN:
		case TOKEN_RESERVED_WORD_GET:
		case TOKEN_RESERVED_WORD_SET:
		case TOKEN_KEYWORD_SUPER:
		case TOKEN_OPERATOR_MINUS:
		case TOKEN_OPERATOR_PLUS:
		case TOKEN_OPERATOR_STAR:
		case TOKEN_KEYWORD_DELETE:
		case TOKEN_OPERATOR_INCREMENT:
		case TOKEN_OPERATOR_DECREMENT:
		case TOKEN_KEYWORD_VOID:
		case TOKEN_KEYWORD_TYPEOF:
		case TOKEN_OPERATOR_BITWISE_NOT:
		case TOKEN_OPERATOR_LOGICAL_NOT:
		case TOKEN_KEYWORD_NULL:
		case TOKEN_KEYWORD_TRUE:
		case TOKEN_KEYWORD_FALSE:
		case TOKEN_KEYWORD_THIS:
		case TOKEN_VOID_0:
		case TOKEN_LITERAL_REGEXP:
		case TOKEN_LITERAL_NUMBER:
		case TOKEN_LITERAL_HEX_NUMBER:
		case TOKEN_E4X_WHITESPACE:
		case TOKEN_E4X_COMMENT:
		case TOKEN_E4X_CDATA:
		case TOKEN_E4X_PROCESSING_INSTRUCTION:
		case TOKEN_E4X_ENTITY:
		case TOKEN_E4X_DECIMAL_ENTITY:
		case TOKEN_E4X_HEX_ENTITY:
		case TOKEN_E4X_TEXT:
		case TOKEN_E4X_STRING:
		case TOKEN_E4X_OPEN_TAG_START:
		case TOKEN_E4X_CLOSE_TAG_START:
		case HIDDEN_TOKEN_E4X:
		case TOKEN_LITERAL_XMLLIST:
		case TOKEN_E4X_BINDING_OPEN:
		case TOKEN_KEYWORD_NEW:
		case TOKEN_OPERATOR_ATSIGN:
		{
			try {      // for error handling
				n=assignmentExpression();
				foundFirstArg = true; if (args != null) args.addItem(n);
			}
			catch (RecognitionException ex) {
				
							n = handleMissingIdentifier(ex); 
							if(n != null) {
								foundFirstArg = true;  //we don't want to add a second error for this case
								if (args != null) args.addItem(n);
							}
						
			}
			break;
		}
		case TOKEN_COMMA:
		case TOKEN_PAREN_CLOSE:
		{
			break;
		}
		default:
		{
			throw new NoViableAltException(LT(1), getFilename());
		}
		}
		}
		{
		_loop272:
		do {
			if ((LA(1)==TOKEN_COMMA)) {
				try {      // for error handling
					commaT = LT(1);
					match(TOKEN_COMMA);
					
								//if we didn't find the first arg, log an error
								if(!foundFirstArg) {
									logSyntaxError((ASToken)commaT);
									foundFirstArg = true;
									n = handleMissingIdentifier(null); 
									if (n!= null && args != null) args.addItem(n);
								}
								if (args != null) args.endAfter(commaT);	
							
					n=assignmentExpression();
					
									if(n == null) 
									    n = handleMissingIdentifier(null); 
								    
								    if (args != null) 
					args.addItem(n); 
					
				}
				catch (RecognitionException ex) {
					
									n = handleMissingIdentifier(ex); 
									if(n != null && args != null) {
										args.addItem(n);
									}
								
				}
			}
			else {
				break _loop272;
			}
			
		} while (true);
		}
	}
	
	
	public static final String[] _tokenNames = {
		"<0>",
		"EOF",
		"<2>",
		"NULL_TREE_LOOKAHEAD",
		"HIDDEN_TOKEN_COMMENT",
		"HIDDEN_TOKEN_SINGLE_LINE_COMMENT",
		"HIDDEN_TOKEN_STAR_ASSIGNMENT",
		"HIDDEN_TOKEN_BUILTIN_NS",
		"HIDDEN_TOKEN_MULTI_LINE_COMMENT",
		"TOKEN_ASDOC_TAG",
		"TOKEN_ASDOC_TEXT",
		"TOKEN_RESERVED_WORD_EACH",
		"TOKEN_RESERVED_WORD_CONFIG",
		"TOKEN_KEYWORD_INCLUDE",
		"TOKEN_RESERVED_WORD_GOTO",
		"TOKEN_IDENTIFIER",
		"TOKEN_KEYWORD_FINALLY",
		"TOKEN_KEYWORD_CATCH",
		"TOKEN_LITERAL_STRING",
		"TOKEN_BLOCK_OPEN",
		"TOKEN_BLOCK_CLOSE",
		"TOKEN_NAMESPACE_NAME",
		"TOKEN_OPERATOR_NS_QUALIFIER",
		"TOKEN_NAMESPACE_ANNOTATION",
		"TOKEN_COLON",
		"TOKEN_KEYWORD_IMPORT",
		"TOKEN_KEYWORD_USE",
		"TOKEN_RESERVED_WORD_NAMESPACE",
		"TOKEN_ASDOC_COMMENT",
		"TOKEN_MODIFIER_FINAL",
		"TOKEN_MODIFIER_DYNAMIC",
		"TOKEN_MODIFIER_OVERRIDE",
		"TOKEN_MODIFIER_STATIC",
		"TOKEN_MODIFIER_NATIVE",
		"TOKEN_MODIFIER_VIRTUAL",
		"TOKEN_OPERATOR_MEMBER_ACCESS",
		"TOKEN_ATTRIBUTE",
		"TOKEN_SQUARE_OPEN",
		"TOKEN_KEYWORD_PACKAGE",
		"TOKEN_KEYWORD_INTERFACE",
		"TOKEN_RESERVED_WORD_EXTENDS",
		"TOKEN_COMMA",
		"TOKEN_KEYWORD_CLASS",
		"TOKEN_RESERVED_WORD_IMPLEMENTS",
		"TOKEN_KEYWORD_FUNCTION",
		"TOKEN_PAREN_OPEN",
		"TOKEN_PAREN_CLOSE",
		"TOKEN_RESERVED_WORD_GET",
		"TOKEN_RESERVED_WORD_SET",
		"TOKEN_ELLIPSIS",
		"TOKEN_KEYWORD_VAR",
		"TOKEN_KEYWORD_CONST",
		"TOKEN_OPERATOR_ASSIGNMENT",
		"TOKEN_DIRECTIVE_DEFAULT_XML",
		"TOKEN_SEMICOLON",
		"TOKEN_KEYWORD_RETURN",
		"TOKEN_KEYWORD_THROW",
		"TOKEN_KEYWORD_FOR",
		"TOKEN_KEYWORD_IN",
		"TOKEN_KEYWORD_DO",
		"TOKEN_KEYWORD_WHILE",
		"TOKEN_KEYWORD_CONTINUE",
		"TOKEN_KEYWORD_BREAK",
		"TOKEN_KEYWORD_WITH",
		"TOKEN_KEYWORD_TRY",
		"TOKEN_KEYWORD_IF",
		"TOKEN_KEYWORD_ELSE",
		"TOKEN_KEYWORD_SWITCH",
		"TOKEN_KEYWORD_CASE",
		"TOKEN_KEYWORD_DEFAULT",
		"TOKEN_KEYWORD_SUPER",
		"TOKEN_TYPED_COLLECTION_OPEN",
		"TOKEN_TYPED_COLLECTION_CLOSE",
		"TOKEN_OPERATOR_GREATER_THAN",
		"TOKEN_OPERATOR_LOGICAL_AND_ASSIGNMENT",
		"TOKEN_OPERATOR_LOGICAL_OR_ASSIGNMENT",
		"TOKEN_OPERATOR_PLUS_ASSIGNMENT",
		"TOKEN_OPERATOR_MINUS_ASSIGNMENT",
		"TOKEN_OPERATOR_MULTIPLICATION_ASSIGNMENT",
		"TOKEN_OPERATOR_DIVISION_ASSIGNMENT",
		"TOKEN_OPERATOR_MODULO_ASSIGNMENT",
		"TOKEN_OPERATOR_BITWISE_AND_ASSIGNMENT",
		"TOKEN_OPERATOR_BITWISE_OR_ASSIGNMENT",
		"TOKEN_OPERATOR_BITWISE_XOR_ASSIGNMENT",
		"TOKEN_OPERATOR_BITWISE_LEFT_SHIFT_ASSIGNMENT",
		"TOKEN_OPERATOR_BITWISE_RIGHT_SHIFT_ASSIGNMENT",
		"TOKEN_OPERATOR_BITWISE_UNSIGNED_RIGHT_SHIFT_ASSIGNMENT",
		"TOKEN_OPERATOR_TERNARY",
		"TOKEN_OPERATOR_LOGICAL_OR",
		"TOKEN_OPERATOR_LOGICAL_AND",
		"TOKEN_OPERATOR_BITWISE_OR",
		"TOKEN_OPERATOR_BITWISE_XOR",
		"TOKEN_OPERATOR_BITWISE_AND",
		"TOKEN_OPERATOR_EQUAL",
		"TOKEN_OPERATOR_NOT_EQUAL",
		"TOKEN_OPERATOR_STRICT_EQUAL",
		"TOKEN_OPERATOR_STRICT_NOT_EQUAL",
		"TOKEN_OPERATOR_GREATER_THAN_EQUALS",
		"TOKEN_OPERATOR_LESS_THAN",
		"TOKEN_OPERATOR_LESS_THAN_EQUALS",
		"TOKEN_KEYWORD_INSTANCEOF",
		"TOKEN_KEYWORD_IS",
		"TOKEN_KEYWORD_AS",
		"TOKEN_OPERATOR_BITWISE_LEFT_SHIFT",
		"TOKEN_OPERATOR_BITWISE_RIGHT_SHIFT",
		"TOKEN_OPERATOR_BITWISE_UNSIGNED_RIGHT_SHIFT",
		"TOKEN_OPERATOR_MINUS",
		"TOKEN_OPERATOR_PLUS",
		"TOKEN_OPERATOR_DIVISION",
		"TOKEN_OPERATOR_MODULO",
		"TOKEN_OPERATOR_STAR",
		"TOKEN_KEYWORD_DELETE",
		"TOKEN_OPERATOR_INCREMENT",
		"TOKEN_OPERATOR_DECREMENT",
		"TOKEN_KEYWORD_VOID",
		"TOKEN_KEYWORD_TYPEOF",
		"TOKEN_OPERATOR_BITWISE_NOT",
		"TOKEN_OPERATOR_LOGICAL_NOT",
		"TOKEN_KEYWORD_NULL",
		"TOKEN_KEYWORD_TRUE",
		"TOKEN_KEYWORD_FALSE",
		"TOKEN_KEYWORD_THIS",
		"TOKEN_VOID_0",
		"TOKEN_LITERAL_REGEXP",
		"TOKEN_LITERAL_NUMBER",
		"TOKEN_LITERAL_HEX_NUMBER",
		"TOKEN_SQUARE_CLOSE",
		"TOKEN_TYPED_LITERAL_OPEN",
		"TOKEN_TYPED_LITERAL_CLOSE",
		"TOKEN_E4X_WHITESPACE",
		"TOKEN_E4X_COMMENT",
		"TOKEN_E4X_CDATA",
		"TOKEN_E4X_PROCESSING_INSTRUCTION",
		"TOKEN_E4X_ENTITY",
		"TOKEN_E4X_DECIMAL_ENTITY",
		"TOKEN_E4X_HEX_ENTITY",
		"TOKEN_E4X_TEXT",
		"TOKEN_E4X_STRING",
		"TOKEN_E4X_OPEN_TAG_START",
		"TOKEN_E4X_CLOSE_TAG_START",
		"HIDDEN_TOKEN_E4X",
		"TOKEN_E4X_NAME",
		"TOKEN_E4X_TAG_END",
		"TOKEN_E4X_EMPTY_TAG_END",
		"TOKEN_E4X_XMLNS",
		"TOKEN_E4X_NAME_DOT",
		"TOKEN_E4X_DOTTED_NAME_PART",
		"TOKEN_E4X_EQUALS",
		"TOKEN_LITERAL_XMLLIST",
		"TOKEN_E4X_XMLLIST_CLOSE",
		"TOKEN_E4X_BINDING_OPEN",
		"TOKEN_E4X_BINDING_CLOSE",
		"TOKEN_KEYWORD_NEW",
		"TOKEN_OPERATOR_ATSIGN",
		"TOKEN_OPERATOR_DESCENDANT_ACCESS"
	};
	
	private static final long[] mk_tokenSet_0() {
		long[] data = { -293379423486349312L, 4611628843822743627L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_0 = new BitSet(mk_tokenSet_0());
	private static final long[] mk_tokenSet_1() {
		long[] data = { -296762380087672832L, 4611628843822743627L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_1 = new BitSet(mk_tokenSet_1());
	private static final long[] mk_tokenSet_2() {
		long[] data = { 3400273676468224L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_2 = new BitSet(mk_tokenSet_2());
	private static final long[] mk_tokenSet_3() {
		long[] data = { 475126599286784L, 4611628843822743616L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_3 = new BitSet(mk_tokenSet_3());
	private static final long[] mk_tokenSet_4() {
		long[] data = { 33831256064L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_4 = new BitSet(mk_tokenSet_4());
	private static final long[] mk_tokenSet_5() {
		long[] data = { 422212599316480L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_5 = new BitSet(mk_tokenSet_5());
	private static final long[] mk_tokenSet_6() {
		long[] data = { -293379423485300734L, 4611628843822743679L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_6 = new BitSet(mk_tokenSet_6());
	private static final long[] mk_tokenSet_7() {
		long[] data = { -293384680367144960L, 4611628843822743627L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_7 = new BitSet(mk_tokenSet_7());
	private static final long[] mk_tokenSet_8() {
		long[] data = { 422212601413632L, 64L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_8 = new BitSet(mk_tokenSet_8());
	private static final long[] mk_tokenSet_9() {
		long[] data = { -293379423485300734L, 4611628843822743675L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_9 = new BitSet(mk_tokenSet_9());
	private static final long[] mk_tokenSet_10() {
		long[] data = { 4503599627370496L, 8387584L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_10 = new BitSet(mk_tokenSet_10());
	private static final long[] mk_tokenSet_11() {
		long[] data = { -572879922008062L, 9223314862258519167L, 63971326L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_11 = new BitSet(mk_tokenSet_11());
	private static final long[] mk_tokenSet_12() {
		long[] data = { -5078678589411326L, 4611628843822743679L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_12 = new BitSet(mk_tokenSet_12());
	private static final long[] mk_tokenSet_13() {
		long[] data = { 288230376151711744L, 140737471578624L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_13 = new BitSet(mk_tokenSet_13());
	private static final long[] mk_tokenSet_14() {
		long[] data = { -572879922008062L, 9223314862266907775L, 63971326L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_14 = new BitSet(mk_tokenSet_14());
	private static final long[] mk_tokenSet_15() {
		long[] data = { 171802886144L, 128L, 67108864L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_15 = new BitSet(mk_tokenSet_15());
	private static final long[] mk_tokenSet_16() {
		long[] data = { -572845558075390L, 9223372036854775551L, 131080190L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_16 = new BitSet(mk_tokenSet_16());
	private static final long[] mk_tokenSet_17() {
		long[] data = { 0L, 0L, 4202494L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_17 = new BitSet(mk_tokenSet_17());
	private static final long[] mk_tokenSet_18() {
		long[] data = { 294912L, 3458764513820540928L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_18 = new BitSet(mk_tokenSet_18());
	private static final long[] mk_tokenSet_19() {
		long[] data = { 475126599286784L, -4629630048192692160L, 55582718L, 0L, 0L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_19 = new BitSet(mk_tokenSet_19());
	
	}
