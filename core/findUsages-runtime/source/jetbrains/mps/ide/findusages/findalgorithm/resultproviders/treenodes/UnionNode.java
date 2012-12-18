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
package jetbrains.mps.ide.findusages.findalgorithm.resultproviders.treenodes;

import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.ide.findusages.model.SearchResults;

public class UnionNode extends BaseNode {
  public SearchResults doGetResults(SearchQuery query, ProgressIndicator indicator) {
    SearchResults results = new SearchResults();
    for (BaseNode child : myChildren) {
      if (indicator.isCanceled()) break;
      SearchResults childResults = child.getResults(query, indicator);
      results.getSearchResults().addAll(childResults.getSearchResults());
      results.getSearchedNodes().addAll(childResults.getSearchedNodes());
    }
    return results;
  }
}
