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


@SuppressWarnings("unused")
public interface MetadataTokenTypes {
	int EOF = 1;
	int NULL_TREE_LOOKAHEAD = 3;
	int TOKEN_NUMBER = 4;
	int TOKEN_EQUALS = 5;
	int TOKEN_ID = 6;
	int TOKEN_VALUE = 7;
	int TOKEN_STRING = 8;
	int TOKEN_EVENT_KEYWORD = 9;
	int TOKEN_EFFECT_KEYWORD = 10;
	int TOKEN_STYLE_KEYWORD = 11;
	int TOKEN_ICONFILE_KEYWORD = 12;
	int TOKEN_ARRAYELEMENTTYPE_KEYWORD = 13;
	int TOKEN_DEFAULTPROPERTY_KEYWORD = 14;
	int TOKEN_BINDABLE_KEYWORD = 15;
	int TOKEN_INSTANCETYPE_KEYWORD = 16;
	int TOKEN_NONCOMMITTINGCHANGE_KEYWORD = 17;
	int TOKEN_EMBED_KEYWORD = 18;
	int TOKEN_INSPECTABLE_KEYWORD = 19;
	int TOKEN_NAME = 20;
	int TOKEN_OPEN_PAREN = 21;
	int TOKEN_CLOSE_PAREN = 22;
	int TOKEN_OPEN_BRACE = 23;
	int TOKEN_CLOSE_BRACE = 24;
	int TOKEN_UNKNOWN_KEYWORD = 25;
	int TOKEN_ATTR_NAME = 26;
	int TOKEN_ATTR_EVENT = 27;
	int TOKEN_ATTR_FORMAT = 28;
	int TOKEN_ATTR_TYPE = 29;
	int TOKEN_ATTR_ARRAY_TYPE = 30;
	int TOKEN_ATTR_INHERITS = 31;
	int TOKEN_ATTR_ENUM = 32;
	int TOKEN_ATTR_UNKNOWN = 33;
	int TOKEN_ATTR_ENV = 34;
	int TOKEN_ATTR_VERBOSE = 35;
	int TOKEN_ATTR_CATEGORY = 36;
	int TOKEN_ATTR_VARIABLE = 37;
	int TOKEN_ATTR_DEFAULT_VALUE = 38;
	int HIDDEN_TOKEN_NEWLINE = 45;
	int HIDDEN_TOKEN_LETTER = 46;
	int HIDDEN_TOKEN_DIGIT = 47;
	int HIDDEN_TOKEN_HEX_DIGIT = 48;
	int HIDDEN_TOKEN_ID_FIRST = 49;
	int TOKEN_ATTR_STATES = 50;
	int TOKEN_ATTR_IMPLEMENTATION = 51;
	int TOKEN_ACCESSIBILITY_KEYWORD = 52;
	int TOKEN_STATES_KEYWORD = 53;
	int TOKEN_SKIN_STATES_KEYWORD = 54;
	int TOKEN_ASDOC_COMMENT = 55;
	int TOKEN_HOST_COMPONENT_KEYWORD = 56;
	int TOKEN_RESOURCEBUNDLE_KEYWORD = 59;
	int TOKEN_SKINCLASS_KEYWORD = 60;
	int TOKEN_ALTERNATIVE_KEYWORD = 61;
}
