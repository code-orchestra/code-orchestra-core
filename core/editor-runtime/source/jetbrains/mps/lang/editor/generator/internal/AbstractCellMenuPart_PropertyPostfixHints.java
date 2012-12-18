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
package jetbrains.mps.lang.editor.generator.internal;

import jetbrains.mps.ide.ChooseItemComponent;
import jetbrains.mps.lang.editor.cellProviders.PropertyCellContext;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cellMenu.CellContext;
import jetbrains.mps.nodeEditor.cellMenu.SubstituteInfoPart;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.PropertySupport;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.action.AbstractNodeSubstituteAction;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.util.NameUtil;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class AbstractCellMenuPart_PropertyPostfixHints implements SubstituteInfoPart {
  public List<INodeSubstituteAction> createActions(CellContext cellContext, final EditorContext editorContext) {
    SNode node = (SNode) cellContext.get(PropertyCellContext.EDITED_NODE);
    final SNode property = (SNode) cellContext.get(PropertyCellContext.PROPERTY_DECLARATION);
    if (property == null) {
      return Collections.emptyList();
    }
    final IOperationContext context = editorContext.getOperationContext();
    List<INodeSubstituteAction> actions = new LinkedList<INodeSubstituteAction>();
    List<String> postfixes = getPostfixes(node, context.getScope(), context);
    if (postfixes == null) {
      postfixes = new ArrayList<String>();
    }
    final PostfixGroup postfixGroup = new PostfixGroup(postfixes);
    final PropertySupport propertySupport = PropertySupport.getPropertySupport(property);
    for (final String postfix : postfixes) {
      actions.add(new PostfixSubstituteAction(postfix, node, postfixGroup,
        propertySupport, property.getName(), context.getScope(), editorContext));
    }    
    return (List) actions;
  }

  public abstract List<String> getPostfixes(SNode node, IScope scope, IOperationContext operationContext);

  public static class PostfixGroup {
    private List<String> myPostfixes;
    private String myCurrentPattern = null;
    private Map<String, String> myModel = new HashMap<String, String>();
    private boolean myShowUnpostfixed;
    private boolean myUnpostfixedFirst;

    public PostfixGroup(List<String> postfixes) {
      myPostfixes = postfixes;
    }

    public boolean canSubstitute(String pattern, String postfix) {
      update(pattern);
      return myModel.containsKey(postfix);
    }

    public String getMatchingText(String pattern, String postfix) {
      update(pattern);
      return myModel.get(postfix);
    }

    private void update(String pattern) {
      pattern = pattern == null ? "" : pattern;
      if (!pattern.equals(myCurrentPattern)) {
        myCurrentPattern = pattern;
        update();
      }
    }

    private void update() {
      myModel.clear();
      boolean isMatchingSomething = false;
      if (myCurrentPattern.length() > 0) {
        boolean exactMatch = false;
        for (int i = 0; !(isMatchingSomething) && i < myCurrentPattern.length(); i++) {
          if (i > 0 && ! Character.isUpperCase(myCurrentPattern.charAt(i))) {
            continue;
          }
          Matcher itemMatcher = this.getItemPattern(NameUtil.decapitalize(myCurrentPattern.substring(i))).matcher("");
          for (String postfix : myPostfixes) {
            itemMatcher.reset(postfix);
            if (itemMatcher.matches()) {
              isMatchingSomething = true;
              if (postfix.equals(myCurrentPattern)) {
                exactMatch = true;
              }
              if (i != 0) {
                myModel.put(postfix, myCurrentPattern.substring(0, i) + NameUtil.capitalize(postfix));
              } else {
                myModel.put(postfix, postfix);
              }
            }
          }
        }
        myShowUnpostfixed = !exactMatch;
      }
      myUnpostfixedFirst = !isMatchingSomething;
      if (!(isMatchingSomething)) {
        for (String postfix : myPostfixes) {
          if (myCurrentPattern.length() > 0) {
            myModel.put(postfix, myCurrentPattern + NameUtil.capitalize(postfix));
          } else {
            myModel.put(postfix, postfix);
          }
        }
      }

    }

    public boolean isShowUnpostfixed(String pattern) {
      update(pattern);
      return myShowUnpostfixed;
    }

    public boolean isUnpostfixedFirst(String pattern) {
      update(pattern);
      return myUnpostfixedFirst;
    }

    private Pattern getItemPattern(String text) {
      final StringBuilder exactItemPatternBuilder = ChooseItemComponent.getExactItemPatternBuilder(text, true);
      final String itemPattern = exactItemPatternBuilder.append(".*").toString();
      return Pattern.compile(itemPattern);
    }
  }

  private static class PostfixSubstituteAction extends AbstractNodeSubstituteAction {
    private final String myPostfix;
    private final PostfixGroup myPostfixGroup;
    private final PropertySupport myPropertySupport;
    private final String myPropertyName;
    private final IScope myScope;
    private final EditorContext myEditorContext;

    public PostfixSubstituteAction(String postfix, SNode node, PostfixGroup postfixGroup, PropertySupport propertySupport, String propertyName, IScope scope, EditorContext editorContext) {
      super(null, postfix, node);
      myPostfix = postfix;
      myPostfixGroup = postfixGroup;
      myPropertySupport = propertySupport;
      myPropertyName = propertyName;
      myScope = scope;
      myEditorContext = editorContext;
    }

    @Override
    public boolean canSubstituteStrictly(String pattern) {
      return super.canSubstituteStrictly(pattern) && canSubstitute(pattern);
    }

    public boolean canSubstitute(String pattern) {
      if (myPostfixGroup.canSubstitute(pattern, myPostfix)) {
        String text = myPostfixGroup.getMatchingText(pattern, myPostfix);
        return myPropertySupport.canSetValue(getSourceNode(), myPropertyName, text, myScope);
      } else {
        return false;
      }
    }

    protected String getMatchingText(String pattern, boolean referent_presentation, boolean visible) {
      return myPostfixGroup.getMatchingText(pattern, myPostfix);
    }

    public SNode doSubstitute(String pattern) {
      String propertyName = myPropertyName;
      assert propertyName != null;
      getSourceNode().setProperty(propertyName, myPostfixGroup.getMatchingText(pattern, myPostfix));

      myEditorContext.flushEvents();

      EditorCell editorCell = myEditorContext.getSelectedCell();
      if (editorCell instanceof EditorCell_Label) {
        ((EditorCell_Label) editorCell).end();
      }

      return null;
    }
  }
}
