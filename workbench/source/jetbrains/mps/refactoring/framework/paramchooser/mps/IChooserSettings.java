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
package jetbrains.mps.refactoring.framework.paramchooser.mps;

import jetbrains.mps.util.Condition;
import org.jetbrains.annotations.Nullable;

public interface IChooserSettings<T> extends Condition<T> {
  @Nullable
  String getTitle();

  @Nullable
  T getInitialValue();

  boolean met(T entity);

  public abstract class BaseChooserSettings<T> implements IChooserSettings<T> {
    private String myTitle;

    protected BaseChooserSettings(String title) {
      myTitle = title;
    }

    public final String getTitle() {
      return myTitle;
    }

    public T getInitialValue() {
      return null;
    }

    public boolean met(T entity) {
      return true;
    }
  }
}
