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
package jetbrains.mps.ide.findusages.model.holders;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

public class VoidHolder implements IHolder {
  private String myCaption = "<void>";
  private Icon myIcon = null;

  public VoidHolder(Element element, Project project) {
    throw new UnsupportedOperationException();
  }

  public VoidHolder(String caption, Icon icon) {
    myCaption = caption;
    myIcon = icon;
  }

  public VoidHolder() {

  }

  public Object getObject() {
    throw new UnsupportedOperationException();
  }

  @NotNull
  public String getCaption() {
    return myCaption;
  }

  public Icon getIcon() {
    return myIcon;
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    throw new CantLoadSomethingException("VoidHolder is not loadable");
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    throw new CantSaveSomethingException("VoidHolder is not saveable");
  }
}
