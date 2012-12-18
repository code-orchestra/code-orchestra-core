// $ANTLR 2.7.7 (20060906): "MetadataParser.g" -> "MetadataParser.java"$

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
 * This file is generated from MetadataParser.g.
 * DO NOT MAKE EDITS DIRECTLY TO THIS FILE.  THEY WILL BE LOST WHEN THE FILE IS GENERATED AGAIN!!!
 */

import java.util.HashMap;

import antlr.NoViableAltException;
import antlr.ParserSharedInputState;
import antlr.RecognitionException;
import antlr.Token;
import antlr.TokenBuffer;
import antlr.TokenStream;
import antlr.TokenStreamException;
import antlr.collections.impl.BitSet;

import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.metadata.*; 

import org.apache.flex.compiler.tree.metadata.IMetaTagNode;
import org.apache.flex.compiler.constants.IMetaAttributeConstants;


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

@SuppressWarnings("all")
public class MetadataParser extends org.apache.flex.compiler.internal.parsing.as.BaseMetaTagParser       implements MetadataTokenTypes
 {

protected MetadataParser(TokenBuffer tokenBuf, int k) {
  super(tokenBuf,k);
  tokenNames = _tokenNames;
}

public MetadataParser(TokenBuffer tokenBuf) {
  this(tokenBuf,1);
}

protected MetadataParser(TokenStream lexer, int k) {
  super(lexer,k);
  tokenNames = _tokenNames;
}

public MetadataParser(TokenStream lexer) {
  this(lexer,1);
}

public MetadataParser(ParserSharedInputState state) {
  super(state,1);
  tokenNames = _tokenNames;
}

	public final void meta(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		
		Token  openBrace = null;
		Token  closeBrace = null;
		Token  closeParen = null;
		
			MetaTagNode tag = null;
		
		
		try {      // for error handling
			{
			_loop6:
			do {
				switch ( LA(1)) {
				case TOKEN_ASDOC_COMMENT:
				{
					asDocComment();
					break;
				}
				case TOKEN_OPEN_BRACE:
				{
					openBrace = LT(1);
					match(TOKEN_OPEN_BRACE);
					{
					switch ( LA(1)) {
					case TOKEN_EVENT_KEYWORD:
					{
						tag=event(parent);
						break;
					}
					case TOKEN_EFFECT_KEYWORD:
					{
						tag=effect(parent);
						break;
					}
					case TOKEN_STYLE_KEYWORD:
					{
						tag=style(parent);
						break;
					}
					case TOKEN_BINDABLE_KEYWORD:
					case TOKEN_NONCOMMITTINGCHANGE_KEYWORD:
					{
						tag=eventTrigger(parent);
						break;
					}
					case TOKEN_ARRAYELEMENTTYPE_KEYWORD:
					case TOKEN_INSTANCETYPE_KEYWORD:
					case TOKEN_HOST_COMPONENT_KEYWORD:
					{
						tag=typedTag(parent);
						break;
					}
					case TOKEN_INSPECTABLE_KEYWORD:
					{
						tag=inspectable(parent);
						break;
					}
					case TOKEN_DEFAULTPROPERTY_KEYWORD:
					{
						tag=defaultproperty(parent);
						break;
					}
					case TOKEN_ACCESSIBILITY_KEYWORD:
					{
						tag=accessibilityClass(parent);
						break;
					}
					case TOKEN_STATES_KEYWORD:
					case TOKEN_SKIN_STATES_KEYWORD:
					{
						tag=multiValue(parent);
						break;
					}
					case TOKEN_SKINCLASS_KEYWORD:
					{
						tag=skinClass(parent);
						break;
					}
					case TOKEN_ALTERNATIVE_KEYWORD:
					{
						tag=alternative(parent);
						break;
					}
					case TOKEN_RESOURCEBUNDLE_KEYWORD:
					{
						tag=resourcebundle(parent);
						break;
					}
					case TOKEN_UNKNOWN_KEYWORD:
					{
						tag=other(parent);
						break;
					}
					default:
					{
						throw new NoViableAltException(LT(1), getFilename());
					}
					}
					}
					{
					_loop5:
					do {
						switch ( LA(1)) {
						case TOKEN_CLOSE_BRACE:
						{
							closeBrace = LT(1);
							match(TOKEN_CLOSE_BRACE);
							break;
						}
						case TOKEN_CLOSE_PAREN:
						{
							closeParen = LT(1);
							match(TOKEN_CLOSE_PAREN);
							break;
						}
						default:
						{
							break _loop5;
						}
						}
					} while (true);
					}
					break;
				}
				default:
				{
					break _loop6;
				}
				}
			} while (true);
			}
			
					afterTag(tag, openBrace, closeBrace, closeParen);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_0);
		}
	}
	
	public final void asDocComment() throws RecognitionException, TokenStreamException {
		
		Token  docToken = null;
		
		try {      // for error handling
			docToken = LT(1);
			match(TOKEN_ASDOC_COMMENT);
			
					handleComment(docToken);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_1);
		}
	}
	
	public final EventTagNode  event(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		EventTagNode node;
		
		Token  nameString = null;
		Token  typeString = null;
			
				node = new EventTagNode();
				
		
		try {      // for error handling
			match(TOKEN_EVENT_KEYWORD);
			{
			_loop12:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_NAME:
				{
					match(TOKEN_ATTR_NAME);
					{
					nameString = LT(1);
					match(TOKEN_STRING);
					node.setName(build(nameString));
					}
					break;
				}
				case TOKEN_ATTR_TYPE:
				{
					match(TOKEN_ATTR_TYPE);
					{
					typeString = LT(1);
					match(TOKEN_STRING);
					node.setEvent(typeString);
					}
					break;
				}
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop12;
				}
				}
			} while (true);
			}
				
					applyComment(node);
					parent.addTag(node);
					return node;
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final EffectTagNode  effect(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		EffectTagNode node;
		
		Token  nameString = null;
		Token  typeString = null;
		
				node = new EffectTagNode();
			
		
		try {      // for error handling
			match(TOKEN_EFFECT_KEYWORD);
			{
			_loop17:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_NAME:
				{
					match(TOKEN_ATTR_NAME);
					{
					nameString = LT(1);
					match(TOKEN_STRING);
					node.setName(build(nameString));
					}
					break;
				}
				case TOKEN_ATTR_EVENT:
				{
					match(TOKEN_ATTR_EVENT);
					{
					typeString = LT(1);
					match(TOKEN_STRING);
					node.setEvent(build(typeString));
					}
					break;
				}
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop17;
				}
				}
			} while (true);
			}
				
						
					applyComment(node);
					parent.addTag(node);
				
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final StyleTagNode  style(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		StyleTagNode node;
		
		Token  nameString = null;
		Token  typeString = null;
		Token  arrayTypeToken = null;
		Token  boolType = null;
		Token  formatToken = null;
		Token  valuesToken = null;
		Token  statesToken = null;
			
				node = new StyleTagNode();
				
		
		try {      // for error handling
			match(TOKEN_STYLE_KEYWORD);
			{
			_loop27:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_NAME:
				{
					match(TOKEN_ATTR_NAME);
					{
					nameString = LT(1);
					match(TOKEN_STRING);
					node.setName(build(nameString));
					}
					break;
				}
				case TOKEN_ATTR_TYPE:
				{
					match(TOKEN_ATTR_TYPE);
					{
					typeString = LT(1);
					match(TOKEN_STRING);
					node.setType(typeString);
					}
					break;
				}
				case TOKEN_ATTR_ARRAY_TYPE:
				{
					match(TOKEN_ATTR_ARRAY_TYPE);
					{
					arrayTypeToken = LT(1);
					match(TOKEN_STRING);
					node.setArrayType(build(arrayTypeToken));
					}
					break;
				}
				case TOKEN_ATTR_INHERITS:
				{
					match(TOKEN_ATTR_INHERITS);
					{
					boolType = LT(1);
					match(TOKEN_STRING);
					node.setIsInheritable(getText(boolType));
					}
					break;
				}
				case TOKEN_ATTR_FORMAT:
				{
					match(TOKEN_ATTR_FORMAT);
					{
					formatToken = LT(1);
					match(TOKEN_STRING);
					node.setFormat(getText(formatToken).trim());
					}
					break;
				}
				case TOKEN_ATTR_ENUM:
				{
					match(TOKEN_ATTR_ENUM);
					{
					valuesToken = LT(1);
					match(TOKEN_STRING);
					node.parseValues(getText(valuesToken).trim());
					}
					break;
				}
				case TOKEN_ATTR_STATES:
				{
					match(TOKEN_ATTR_STATES);
					{
					statesToken = LT(1);
					match(TOKEN_STRING);
					node.parseStates(getText(statesToken).trim());
					}
					break;
				}
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop27;
				}
				}
			} while (true);
			}
				
					applyComment(node);
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final EventTriggerTagNode  eventTrigger(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		EventTriggerTagNode node;
		
		Token  eventToken = null;
			
				node = null;
				IdentifierNode event = null;
				String name = null;
			
		
		try {      // for error handling
			{
			name=eventTriggerSet();
			}
			
					resetComments(name);
					node = new EventTriggerTagNode(name);
				
			{
			_loop45:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_EVENT:
				{
					match(TOKEN_ATTR_EVENT);
					{
					eventToken = LT(1);
					match(TOKEN_STRING);
					event = build(eventToken); if(event != null) { node.setEventName(event); }
					}
					break;
				}
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop45;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final TypedTagNode  typedTag(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		TypedTagNode node;
		
		Token  typeToken = null;
			
				node = null;
				IdentifierNode type = null;
				String name = null;
			
		
		try {      // for error handling
			{
			name=typedTagSet();
			}
			
						node = new TypedTagNode(name);
						resetComments(name);
					
			{
			_loop50:
			do {
				switch ( LA(1)) {
				case TOKEN_STRING:
				{
					typeToken = LT(1);
					match(TOKEN_STRING);
					node.setTypeName(null, typeToken);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop50;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final InspectableTagNode  inspectable(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		InspectableTagNode node;
		
		Token  nameToken = null;
		Token  atypeToken = null;
		Token  typeToken = null;
		Token  varToken = null;
		Token  formatToken = null;
		Token  valuesToken = null;
		Token  catToken = null;
		Token  defaultToken = null;
		Token  verToken = null;
		Token  envToken = null;
			
				IdentifierNode type = null;
				IdentifierNode var = null;
				IdentifierNode arrayType = null;
				node = new InspectableTagNode();
				resetComments(node.getTagName());
				
		
		try {      // for error handling
			match(TOKEN_INSPECTABLE_KEYWORD);
			{
			_loop40:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_NAME:
				{
					match(TOKEN_ATTR_NAME);
					{
					nameToken = LT(1);
					match(TOKEN_STRING);
					node.setName( getText(nameToken).trim() );
					}
					break;
				}
				case TOKEN_ATTR_ARRAY_TYPE:
				{
					match(TOKEN_ATTR_ARRAY_TYPE);
					{
					atypeToken = LT(1);
					match(TOKEN_STRING);
					node.setArrayType(build(atypeToken));
					}
					break;
				}
				case TOKEN_ATTR_TYPE:
				{
					match(TOKEN_ATTR_TYPE);
					{
					typeToken = LT(1);
					match(TOKEN_STRING);
					node.setType(typeToken);
					}
					break;
				}
				case TOKEN_ATTR_VARIABLE:
				{
					match(TOKEN_ATTR_VARIABLE);
					{
					varToken = LT(1);
					match(TOKEN_STRING);
					node.setVariable(build(varToken));
					}
					break;
				}
				case TOKEN_ATTR_FORMAT:
				{
					match(TOKEN_ATTR_FORMAT);
					{
					formatToken = LT(1);
					match(TOKEN_STRING);
					node.setFormat( getText(formatToken).trim() );
					}
					break;
				}
				case TOKEN_ATTR_ENUM:
				{
					match(TOKEN_ATTR_ENUM);
					{
					valuesToken = LT(1);
					match(TOKEN_STRING);
					node.parseValues( getText(valuesToken).trim() );
					}
					break;
				}
				case TOKEN_ATTR_CATEGORY:
				{
					match(TOKEN_ATTR_CATEGORY);
					{
					catToken = LT(1);
					match(TOKEN_STRING);
					node.setCategory( getText(catToken).trim());
					}
					break;
				}
				case TOKEN_ATTR_DEFAULT_VALUE:
				{
					match(TOKEN_ATTR_DEFAULT_VALUE);
					{
					defaultToken = LT(1);
					match(TOKEN_STRING);
					node.setDefaultValue( getText(defaultToken).trim());
					}
					break;
				}
				case TOKEN_ATTR_VERBOSE:
				{
					match(TOKEN_ATTR_VERBOSE);
					{
					verToken = LT(1);
					match(TOKEN_STRING);
					node.setVerbose(getText(verToken).trim());
					}
					break;
				}
				case TOKEN_ATTR_ENV:
				{
					match(TOKEN_ATTR_ENV);
					{
					envToken = LT(1);
					match(TOKEN_STRING);
					node.setEnvironment(getText(envToken).trim());
					}
					break;
				}
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop40;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final DefaultPropertyTagNode  defaultproperty(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		DefaultPropertyTagNode node;
		
		Token  typeToken = null;
			
				IdentifierNode type = null;
				node = new DefaultPropertyTagNode();
				resetComments(node.getTagName());
			
		
		try {      // for error handling
			match(TOKEN_DEFAULTPROPERTY_KEYWORD);
			{
			_loop68:
			do {
				switch ( LA(1)) {
				case TOKEN_STRING:
				{
					typeToken = LT(1);
					match(TOKEN_STRING);
					type = build(typeToken); if(type != null) { node.setPropertyNameNode(type); }
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop68;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final AccessibilityTagNode  accessibilityClass(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		AccessibilityTagNode node;
		
		Token  nameString = null;
			
				IdentifierNode type = null;
				IdentifierNode name = null;
				node = new AccessibilityTagNode();
				resetComments(node.getTagName());	
			
		
		try {      // for error handling
			match(TOKEN_ACCESSIBILITY_KEYWORD);
			{
			_loop65:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_IMPLEMENTATION:
				{
					match(TOKEN_ATTR_IMPLEMENTATION);
					nameString = LT(1);
					match(TOKEN_STRING);
					node.setTypeName(IMetaAttributeConstants.NAME_ACCESSIBILITY_IMPLEMENTATION, nameString);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop65;
				}
				}
			} while (true);
			}
				parent.addTag(node);
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final MultiValueMetaTagNode  multiValue(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		MultiValueMetaTagNode node;
		
		Token  stateToken = null;
			
				String state = null;
				node = null;
				String name = null;
			
		
		try {      // for error handling
			{
			name=mvSet();
			}
			
						node = new MultiValueMetaTagNode(name);
						resetComments(name);
					
			{
			_loop61:
			do {
				switch ( LA(1)) {
				case TOKEN_STRING:
				{
					stateToken = LT(1);
					match(TOKEN_STRING);
					state = getText(stateToken); if(state != null) { node.addValue(state); state = null;}
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop61;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final SkinClassTagNode  skinClass(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		SkinClassTagNode node;
		
		Token  typeToken = null;
			
				node = null;
				IdentifierNode type = null;
				String name = null;
				node = new SkinClassTagNode();
				resetComments(node.getTagName());
			
		
		try {      // for error handling
			match(TOKEN_SKINCLASS_KEYWORD);
			{
			_loop53:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_TYPE:
				{
					match(TOKEN_ATTR_TYPE);
					typeToken = LT(1);
					match(TOKEN_STRING);
					node.setTypeName(IMetaAttributeConstants.NAME_EVENT_TYPE, typeToken);
					break;
				}
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop53;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final AlternativeTagNode  alternative(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		AlternativeTagNode node;
		
		Token  typeToken = null;
			
				node = null;
				IdentifierNode type = null;
				String name = null;
				node = new AlternativeTagNode();
				resetComments(node.getTagName());
			
		
		try {      // for error handling
			match(TOKEN_ALTERNATIVE_KEYWORD);
			{
			_loop56:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_TYPE:
				{
					match(TOKEN_ATTR_TYPE);
					typeToken = LT(1);
					match(TOKEN_STRING);
					node.setTypeName(IMetaAttributeConstants.NAME_ALTERNATIVE_REPLACEMENT, typeToken);
					break;
				}
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop56;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final ResourceBundleTagNode  resourcebundle(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		ResourceBundleTagNode node;
		
		Token  bundleToken = null;
			
				IdentifierNode bundleNameNode = null;
				node = new ResourceBundleTagNode();
				resetComments(node.getTagName());
			
		
		try {      // for error handling
			match(TOKEN_RESOURCEBUNDLE_KEYWORD);
			{
			_loop71:
			do {
				switch ( LA(1)) {
				case TOKEN_ATTR_TYPE:
				{
					unknownTypeAttribute(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
					if (((LA(1)==TOKEN_STRING))&&(LA(1) == TOKEN_STRING)) {
						bundleToken = LT(1);
						match(TOKEN_STRING);
						bundleNameNode = build(bundleToken); if(bundleNameNode != null) { node.setBundleNameNode(bundleNameNode); }
					}
					else if ((LA(1)==TOKEN_STRING||LA(1)==TOKEN_ATTR_UNKNOWN)) {
						unknownProperty(node);
					}
				else {
					break _loop71;
				}
				}
			} while (true);
			}
				
					parent.addTag(node);
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final MetaTagNode  other(
		MetaTagsNode parent
	) throws RecognitionException, TokenStreamException {
		MetaTagNode node;
		
		Token  keyWord = null;
		
				String name = "";
				node = null; 
			
		
		try {      // for error handling
			keyWord = LT(1);
			match(TOKEN_UNKNOWN_KEYWORD);
			name = getText(keyWord); node = new BasicMetaTagNode(name); resetComments(name);
			{
			_loop76:
			do {
				switch ( LA(1)) {
				case TOKEN_STRING:
				case TOKEN_ATTR_UNKNOWN:
				{
					unknownProperty(node);
					break;
				}
				case TOKEN_OPEN_PAREN:
				{
					match(TOKEN_OPEN_PAREN);
					break;
				}
				default:
				{
					break _loop76;
				}
				}
			} while (true);
			}
			
						parent.addTag(node);
					
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_2);
		}
		return node;
	}
	
	public final void unknownProperty(
		MetaTagNode node
	) throws RecognitionException, TokenStreamException {
		
		Token  attrName = null;
		Token  stringVal = null;
		
			String attr = null; 
		
		
		try {      // for error handling
			{
			switch ( LA(1)) {
			case TOKEN_ATTR_UNKNOWN:
			{
				attrName = LT(1);
				match(TOKEN_ATTR_UNKNOWN);
				attr = getText(attrName);
				break;
			}
			case TOKEN_STRING:
			{
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
			}
			stringVal = LT(1);
			match(TOKEN_STRING);
			node.addToMap(attr, getText(stringVal));
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_3);
		}
	}
	
	public final String  eventTriggerSet() throws RecognitionException, TokenStreamException {
		String value;
		
		Token  bk = null;
		Token  nck = null;
		
				value = null;
			
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_BINDABLE_KEYWORD:
			{
				bk = LT(1);
				match(TOKEN_BINDABLE_KEYWORD);
				
							value = bk.getText();
						
				break;
			}
			case TOKEN_NONCOMMITTINGCHANGE_KEYWORD:
			{
				nck = LT(1);
				match(TOKEN_NONCOMMITTINGCHANGE_KEYWORD);
				
							value = nck.getText();
						
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_4);
		}
		return value;
	}
	
	public final String  typedTagSet() throws RecognitionException, TokenStreamException {
		String value;
		
		Token  ik = null;
		Token  hck = null;
		Token  aek = null;
		
				value = null;
			
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_INSTANCETYPE_KEYWORD:
			{
				ik = LT(1);
				match(TOKEN_INSTANCETYPE_KEYWORD);
				
							value = ik.getText();
						
				break;
			}
			case TOKEN_HOST_COMPONENT_KEYWORD:
			{
				hck = LT(1);
				match(TOKEN_HOST_COMPONENT_KEYWORD);
				
							value = hck.getText();
						
				break;
			}
			case TOKEN_ARRAYELEMENTTYPE_KEYWORD:
			{
				aek = LT(1);
				match(TOKEN_ARRAYELEMENTTYPE_KEYWORD);
				
							value = aek.getText();
						
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_5);
		}
		return value;
	}
	
	public final String  mvSet() throws RecognitionException, TokenStreamException {
		String value;
		
		Token  bk = null;
		Token  nck = null;
		
				value = null;
			
		
		try {      // for error handling
			switch ( LA(1)) {
			case TOKEN_STATES_KEYWORD:
			{
				bk = LT(1);
				match(TOKEN_STATES_KEYWORD);
				
							value = bk.getText();
						
				break;
			}
			case TOKEN_SKIN_STATES_KEYWORD:
			{
				nck = LT(1);
				match(TOKEN_SKIN_STATES_KEYWORD);
				
							value = nck.getText();
						
				break;
			}
			default:
			{
				throw new NoViableAltException(LT(1), getFilename());
			}
			}
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_5);
		}
		return value;
	}
	
	public final void unknownTypeAttribute(
		MetaTagNode node
	) throws RecognitionException, TokenStreamException {
		
		Token  typeToken = null;
		
		try {      // for error handling
			{
			match(TOKEN_ATTR_TYPE);
			typeToken = LT(1);
			match(TOKEN_STRING);
			}
			
					final String val = typeToken.getText();
					if(val != null)
					{
						node.addToMap(IMetaAttributeConstants.NAME_EVENT_TYPE, val);
					}
				
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_6);
		}
	}
	
	
	public static final String[] _tokenNames = {
		"<0>",
		"EOF",
		"<2>",
		"NULL_TREE_LOOKAHEAD",
		"TOKEN_NUMBER",
		"TOKEN_EQUALS",
		"TOKEN_ID",
		"TOKEN_VALUE",
		"TOKEN_STRING",
		"TOKEN_EVENT_KEYWORD",
		"TOKEN_EFFECT_KEYWORD",
		"TOKEN_STYLE_KEYWORD",
		"TOKEN_ICONFILE_KEYWORD",
		"TOKEN_ARRAYELEMENTTYPE_KEYWORD",
		"TOKEN_DEFAULTPROPERTY_KEYWORD",
		"TOKEN_BINDABLE_KEYWORD",
		"TOKEN_INSTANCETYPE_KEYWORD",
		"TOKEN_NONCOMMITTINGCHANGE_KEYWORD",
		"TOKEN_EMBED_KEYWORD",
		"TOKEN_INSPECTABLE_KEYWORD",
		"TOKEN_NAME",
		"TOKEN_OPEN_PAREN",
		"TOKEN_CLOSE_PAREN",
		"TOKEN_OPEN_BRACE",
		"TOKEN_CLOSE_BRACE",
		"TOKEN_UNKNOWN_KEYWORD",
		"TOKEN_ATTR_NAME",
		"TOKEN_ATTR_EVENT",
		"TOKEN_ATTR_FORMAT",
		"TOKEN_ATTR_TYPE",
		"TOKEN_ATTR_ARRAY_TYPE",
		"TOKEN_ATTR_INHERITS",
		"TOKEN_ATTR_ENUM",
		"TOKEN_ATTR_UNKNOWN",
		"TOKEN_ATTR_ENV",
		"TOKEN_ATTR_VERBOSE",
		"TOKEN_ATTR_CATEGORY",
		"TOKEN_ATTR_VARIABLE",
		"TOKEN_ATTR_DEFAULT_VALUE",
		"<39>",
		"<40>",
		"<41>",
		"<42>",
		"<43>",
		"<44>",
		"HIDDEN_TOKEN_NEWLINE",
		"HIDDEN_TOKEN_LETTER",
		"HIDDEN_TOKEN_DIGIT",
		"HIDDEN_TOKEN_HEX_DIGIT",
		"HIDDEN_TOKEN_ID_FIRST",
		"TOKEN_ATTR_STATES",
		"TOKEN_ATTR_IMPLEMENTATION",
		"TOKEN_ACCESSIBILITY_KEYWORD",
		"TOKEN_STATES_KEYWORD",
		"TOKEN_SKIN_STATES_KEYWORD",
		"TOKEN_ASDOC_COMMENT",
		"TOKEN_HOST_COMPONENT_KEYWORD",
		"<57>",
		"<58>",
		"TOKEN_RESOURCEBUNDLE_KEYWORD",
		"TOKEN_SKINCLASS_KEYWORD",
		"TOKEN_ALTERNATIVE_KEYWORD"
	};
	
	private static final long[] mk_tokenSet_0() {
		long[] data = { 2L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_0 = new BitSet(mk_tokenSet_0());
	private static final long[] mk_tokenSet_1() {
		long[] data = { 36028797027352578L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_1 = new BitSet(mk_tokenSet_1());
	private static final long[] mk_tokenSet_2() {
		long[] data = { 36028797048324098L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_2 = new BitSet(mk_tokenSet_2());
	private static final long[] mk_tokenSet_3() {
		long[] data = { 37155246645969154L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_3 = new BitSet(mk_tokenSet_3());
	private static final long[] mk_tokenSet_4() {
		long[] data = { 36028805774573826L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_4 = new BitSet(mk_tokenSet_4());
	private static final long[] mk_tokenSet_5() {
		long[] data = { 36028797050421506L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_5 = new BitSet(mk_tokenSet_5());
	private static final long[] mk_tokenSet_6() {
		long[] data = { 36028806177227010L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_6 = new BitSet(mk_tokenSet_6());
	
	}
