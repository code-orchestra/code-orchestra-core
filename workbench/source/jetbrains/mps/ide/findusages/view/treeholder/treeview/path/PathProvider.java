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
package jetbrains.mps.ide.findusages.view.treeholder.treeview.path;

import jetbrains.mps.ide.findusages.model.CategoryKind;
import jetbrains.mps.ide.findusages.model.SearchResult;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PathProvider {
  private static final Logger LOG = Logger.getLogger(PathProvider.class);

  public static List<PathItem> getPathForSearchResult(SearchResult<?> result) {
    List<PathItem> res = new ArrayList<PathItem>();
    Object o = result.getPathObject();

    if (o instanceof SNode) {
      SNode node = (SNode) o;
      if (node.getContainingRoot() == null) {
        SModel model = node.getModel();
        LOG.error("Node with null containing root in model checker results: " +
          "id=" + node.getSNodeId() + ", concept=" + node.getConceptFqName()
          + ", model=" + (model != null ? model.getSModelReference(): "") + ", registered=", node.isRegistered());
        return (List<PathItem>) Collections.EMPTY_LIST;
      }
      res.add(new PathItem(PathItemRole.ROLE_TARGET_NODE, node));

      if (node.getParent() != null) {
        appendNodePathThroughNamedConcepts(res, node.getParent());
      }

      SNode rootNode = node.getContainingRoot();
      if (node != rootNode) {
        res.add(new PathItem(PathItemRole.ROLE_ROOT, rootNode));
      }

      o = node.getModel();
    }

    if (o instanceof SModel) {
      SModel model = (SModel) o;
      res.add(new PathItem(PathItemRole.ROLE_MODEL, model));
      o = model.getModelDescriptor().getModule();
    }

    if (o instanceof IModule) {
      IModule module = (IModule) o;
      res.add(new PathItem(PathItemRole.ROLE_MODULE, module));
    }

    List<Pair<CategoryKind, String>> reversedCategories = new ArrayList<Pair<CategoryKind, String>>(result.getCategories());
    Collections.reverse(reversedCategories);
    for (Pair<CategoryKind, String> category : reversedCategories) {
      res.add(new PathItem(PathItemRole.getCategoryRole(category.o1), category));
    }

    Collections.reverse(res);

    return res;
  }

  private static void appendNodePathThroughNamedConcepts(List<PathItem> path, SNode node) {
    String name;
    try {
      name = node.getName();
    } catch (Throwable t) {
      LOG.error(t);
      name = "<getName() caused an exception on this node>";
    }
    if (name != null) {
      if (node != node.getContainingRoot()) {
        path.add(new PathItem(PathItemRole.ROLE_ROOT_TO_TARGET_NODE, node));
      }
    }

    if (node.getParent() != null) {
      appendNodePathThroughNamedConcepts(path, node.getParent());
    }
  }
}
