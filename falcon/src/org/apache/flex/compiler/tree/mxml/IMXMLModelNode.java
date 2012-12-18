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

package org.apache.flex.compiler.tree.mxml;

/**
 * This AST node represents an MXML <code>&lt;Model&gt;</code> tag.
 * <p>
 * An {@link IMXMLModelNode} has exactly one child, which is an
 * {@link IMXMLModelRootNode} representing the root tag of the data model.
 */
public interface IMXMLModelNode extends IMXMLInstanceNode
{
    /**
     * Gets the node representing the root tag of the data model. This is the
     * sole child of this node.
     * 
     * @return An {@link IMXMLModelRootNode} object.
     */
    IMXMLModelRootNode getRootNode();
}
