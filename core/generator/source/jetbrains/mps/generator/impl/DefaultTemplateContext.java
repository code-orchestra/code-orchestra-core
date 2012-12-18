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
package jetbrains.mps.generator.impl;

import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.ImmutableObject;
import org.jetbrains.annotations.NotNull;

import java.util.Iterator;
import java.util.Map;

/**
 * Evgeny Gryaznov, 10/22/10
 */
@ImmutableObject
public class DefaultTemplateContext implements TemplateContext {

  private final DefaultTemplateContext myParent;
  private final SNode myInputNode;
  private final String myInputName;

  private final GeneratedMatchingPattern pattern;
  private final Map<String, Object> variables;

  /**
   * Only context node.
   */
  public DefaultTemplateContext(SNode inputNode) {
    this((GeneratedMatchingPattern) null, null, inputNode);
  }

  /**
   * Creates a new context for template declaration.
   */
  public DefaultTemplateContext(GeneratedMatchingPattern pattern, Map<String, Object> variables, SNode inputNode) {
    this.pattern = pattern;
    this.variables = variables;
    this.myParent = null;

    this.myInputName = null;
    this.myInputNode = inputNode;
  }

  /**
   * Creates a new context for loop.
   */
  private DefaultTemplateContext(@NotNull DefaultTemplateContext parent, String inputName, SNode inputNode) {
    this.myParent = parent;
    this.pattern = null;
    this.variables = null;
    this.myInputName = inputName;
    this.myInputNode = inputNode;
  }

  /**
   * Creates a new context for template declaration.
   */
  private DefaultTemplateContext(DefaultTemplateContext parent, Map<String, Object> variables) {
    this.myParent = parent;
    this.variables = variables;
    this.pattern = null;
    this.myInputName = null;
    this.myInputNode = parent.getInput();
  }

  public DefaultTemplateContext getParent() {
    return myParent;
  }

  public SNode getInput() {
    return myInputNode;
  }

  public String getInputName() {
    return myInputName;
  }

  public Object getPatternVariable(String id) {
    for (DefaultTemplateContext current = this; current != null; current = current.myParent) {
      if (current.pattern != null) {
        return current.pattern.getFieldValue(id);
      }
    }
    return null;
  }

  public Object getVariable(String name) {
    for (DefaultTemplateContext current = this; current != null; current = current.myParent) {
      if (current.variables != null && current.variables.containsKey(name)) {
        return current.variables.get(name);
      }
    }
    return null;
  }

  public boolean hasVariable(String name) {
    for (DefaultTemplateContext current = this; current != null; current = current.myParent) {
      if (current.variables != null && current.variables.containsKey(name)) {
        return true;
      }
    }
    return false;
  }

  public SNode getNamedInput(String name) {
    for (DefaultTemplateContext current = this; current != null; current = current.myParent) {
      if (current.myInputName != null && current.myInputName.equals(name)) {
        return current.myInputNode;
      }
    }
    return null;
  }

  public Iterable<SNode> getInputHistory() {
    return new Iterable<SNode>() {
      @Override
      public Iterator<SNode> iterator() {
        return new Iterator<SNode>() {
          SNode previous;
          DefaultTemplateContext current;

          {
            current = DefaultTemplateContext.this;
            while (current != null && current.myInputNode == null) {
              current = current.myParent;
            }
            previous = current != null ? current.myInputNode : null;
          }

          @Override
          public boolean hasNext() {
            skipOdd();
            return current != null;
          }

          @Override
          public SNode next() {
            skipOdd();
            if (current != null) {
              previous = current.myInputNode;
              current = current.myParent;
              return previous;
            }
            return null;
          }

          private void skipOdd() {
            while (current != null && (current.myInputNode == null || current.myInputNode == previous)) {
              current = current.myParent;
            }
          }

          @Override
          public void remove() {
            throw new UnsupportedOperationException();
          }
        };
      }
    };
  }

  @Override
  public TemplateContext subContext(String inputName, SNode inputNode) {
    if (inputNode == getInput() && (inputName == null || inputName.equals(getInputName()))) {
      return this;
    }
    return new DefaultTemplateContext(this, inputName, inputNode);
  }

  @Override
  public TemplateContext subContext(String inputName) {
    if (inputName == null || inputName.equals(getInputName())) {
      return this;
    }
    return new DefaultTemplateContext(this, inputName, getInput());
  }

  @Override
  public TemplateContext subContext(Map<String, Object> variables) {
    if (variables == null || variables.isEmpty()) {
      return this;
    }
    return new DefaultTemplateContext(this, variables);
  }

  @Override
  public TemplateContext subContext(GeneratedMatchingPattern pattern) {
    // TODO parent = this
    return new DefaultTemplateContext(pattern, null, getInput());
  }
}
