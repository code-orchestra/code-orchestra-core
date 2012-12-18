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
package jetbrains.mps.nodeEditor.style;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.ModelAccess;
import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

public class Style {
  private static final Logger LOG = Logger.getLogger(Style.class);

  private Style myParent;
  private EditorCell myEditorCell;
  private List<Style> myChildren = new ArrayList<Style>(0);

  private Object[] myAttributeValues = new Object[StyleAttributes.getAttributesCount()];
  private Object[] myCachedAttributeValues = new Object[StyleAttributes.getAttributesCount()];

  private List<StyleListener> myStyleListeners = null;

  public Style() {
    this(null);
  }

  public Style(EditorCell contextCell) {
    myEditorCell = contextCell;
  }

  public void apply(@NotNull EditorCell cell) {
    cell.getStyle().putAll(this);
  }

  public void add(Style child) {
    myChildren.add(child);
    child.myParent = this;
    child.updateCache(getNonDefaultValuedAttributes());
  }

  public void remove(Style child) {
    myChildren.remove(child);
    child.myParent = null;
    child.updateCache(getNonDefaultValuedAttributes());
  }

  public <T> T get(StyleAttribute<T> attribute) {
    final int index = attribute.getIndex();
    if (StyleAttributes.isSimple(attribute)) {
      if (myCachedAttributeValues[index] == null) {
        T value;
        if (myAttributeValues[index] instanceof AttributeCalculator) {
          value = ModelAccess.instance().runReadAction(new Computable<T>() {
            @Override
            public T compute() {
              return (T) ((AttributeCalculator) myAttributeValues[index]).calculate(myEditorCell);
            }
          });
        } else {
          value = (T) myAttributeValues[index];
        }
        myCachedAttributeValues[index] = attribute.combine(null, value);
      }
      return (T) myCachedAttributeValues[index];
    }
    T value = (T) myCachedAttributeValues[index];
    if (value != null) {
      return value;
    } else {
      return attribute.combine(null, null);
    }
  }

  public <T> T getCurrent(StyleAttribute<T> attribute) {
    return (T) myAttributeValues[attribute.getIndex()];
  }

  public <T> void set(StyleAttribute<T> attribute, T value) {
    myAttributeValues[attribute.getIndex()] = value;
    Set<StyleAttribute> attributeSet = singletonSet(attribute);
    if (StyleAttributes.isSimple(attribute)) {
      myCachedAttributeValues[attribute.getIndex()] = null;
      fireStyleChanged(new StyleChangeEvent(this, attributeSet));
    } else {
      updateCache(attributeSet);
    }
  }

  public <T> void set(StyleAttribute<T> attribute, AttributeCalculator<T> valueCalculator) {
    myAttributeValues[attribute.getIndex()] = valueCalculator;
    Set<StyleAttribute> attributeSet = singletonSet(attribute);
    if (StyleAttributes.isSimple(attribute)) {
      myCachedAttributeValues[attribute.getIndex()] = null;
      fireStyleChanged(new StyleChangeEvent(this, attributeSet));
    } else {
      updateCache(attributeSet);
    }
  }

  private Set<StyleAttribute> singletonSet(StyleAttribute sa) {
    return Collections.singleton(sa);
  }

  private Set<StyleAttribute> getNonDefaultValuedAttributes() {
    Set<StyleAttribute> result = new StyleAttributeSet();
    for (StyleAttribute attribute : StyleAttributes.getNotSimpleAttributes()) {
      if (myCachedAttributeValues[attribute.getIndex()] != null) {
        result.add(attribute);
      }
    }
    return result;
  }

  public void putAll(Style s) {
    Set<StyleAttribute> addedSimple = new StyleAttributeSet();
    Set<StyleAttribute> addedNotSimple = new StyleAttributeSet();
    for (int i = 0; i < s.myAttributeValues.length; i++) {
      Object value = s.myAttributeValues[i];
      if (value != null) {
        myAttributeValues[i] = value;
        if (StyleAttributes.isSimple(StyleAttributes.getAttribute(i))) {
          myCachedAttributeValues[i] = null;
          addedSimple.add(StyleAttributes.getAttribute(i));
        } else {
          addedNotSimple.add(StyleAttributes.getAttribute(i));
        }
      }
    }
    updateCache(addedNotSimple);
    fireStyleChanged(new StyleChangeEvent(this, addedSimple));
  }

  private Style getParentStyle() {
    return myParent;
  }

  private void updateCache(Set<StyleAttribute> attributes) {
    if (attributes.isEmpty()) {
      return;
    }

    Set<StyleAttribute> changedAttributes = new StyleAttributeSet();
    for (StyleAttribute attribute : attributes) {
      Object parentValue = getParentStyle() == null ? null : getParentStyle().get(attribute);
      Object currentValue = myAttributeValues[attribute.getIndex()];
      Object oldValue = myCachedAttributeValues[attribute.getIndex()];

      if (parentValue != null || currentValue != null || oldValue != null) {
        if (currentValue instanceof AttributeCalculator) {
          currentValue = ((AttributeCalculator) currentValue).calculate(myEditorCell);
        }

        Object newValue = attribute.combine(parentValue, currentValue);

        if (!ObjectUtils.equals(newValue, oldValue)) {
          changedAttributes.add(attribute);
        }

        myCachedAttributeValues[attribute.getIndex()] = newValue;
      }
    }

    if (!changedAttributes.isEmpty()) {
      for (Style style : myChildren) {
        style.updateCache(changedAttributes);
      }

      fireStyleChanged(new StyleChangeEvent(this, changedAttributes));
    }
  }

  private void fireStyleChanged(StyleChangeEvent e) {
    if (myStyleListeners == null) return;

    for (StyleListener l : myStyleListeners) {
      try {
        l.styleChanged(e);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void addListener(StyleListener l) {
    if (myStyleListeners == null) {
      myStyleListeners = new ArrayList<StyleListener>(1);
    }
    myStyleListeners.add(l);
  }

  public void removeListener(StyleListener l) {
    if (myStyleListeners == null) return;
    myStyleListeners.remove(l);
    if (myStyleListeners.isEmpty()) myStyleListeners = null;
  }
}
