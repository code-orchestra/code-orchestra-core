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
package jetbrains.mps.refactoring;

import org.jdom.Element;

import java.util.ArrayList;
import java.util.List;

public class StructureModificationHistory {
  public static final String REFACTORING_HISTORY = "refactoringHistory";

  private List<StructureModificationData> myDataList = new ArrayList<StructureModificationData>();

  public StructureModificationHistory fromElement(Element e) {
    if (e == null) return this;
    for (Element refactoringContextElement : (List<Element>) e.getChildren(StructureModificationData.REFACTORING_CONTEXT)) {
      myDataList.add(new StructureModificationData().fromElement(refactoringContextElement));
    }
    return this;
  }

  public Element toElement() {
    Element element = new Element(REFACTORING_HISTORY);
    for (StructureModificationData data : myDataList) {
      element.addContent(data.toElement());
    }
    return element;
  }
}
