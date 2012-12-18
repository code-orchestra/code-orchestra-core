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
package jetbrains.mps.migration20.stages;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.findusages.model.IResultProvider;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.ide.findusages.model.SearchResult;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.findusages.view.FindUtils;
import jetbrains.mps.ide.migration.actions.ScriptsFinder;
import jetbrains.mps.ide.script.plugin.migrationtool.MigrationScriptFinder;
import jetbrains.mps.ide.script.plugin.migrationtool.MigrationScriptUtil;
import jetbrains.mps.lang.script.runtime.AbstractMigrationRefactoring;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.project.ProjectScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.choose.base.ModulesOnlyScope;

import java.util.List;

public class LanguageMigrationStage implements MigrationStage {
  public String title() {
    return "Language migrations";
  }

  public void execute(MPSProject p) {
    executeScripts(p.getProject(), ScriptsFinder.find());
  }

  public boolean needsCommand() {
    return true;
  }

  public String messageBefore() {
    return "Language migration scripts help to change your code accordingly to changes in languages, in which the code is written.\n" +
      "Now we'll execute all migration scripts from all languages in MPS.";
  }

  public String messageAfter() {
    return null;
  }

  private static void executeScripts(Project project, List<SNodePointer> scripts) {
    SearchQuery query = new SearchQuery(new ModulesOnlyScope(project.getComponent(MPSProject.class).getModulesWithGenerators()));
    MigrationScriptFinder finder = new MigrationScriptFinder(scripts, ProjectOperationContext.get(project));
    IResultProvider provider = FindUtils.makeProvider(finder);
    SearchResults<SNode> results = FindUtils.getSearchResults(new EmptyProgressIndicator(), query, provider);

    for (SearchResult<SNode> aliveIncludedResult : results.getAliveResults()) {
      SNode node = aliveIncludedResult.getObject();
      AbstractMigrationRefactoring migrationRefactoring = finder.getRefactoring(aliveIncludedResult);
      MigrationScriptUtil.performRefactoring(node, migrationRefactoring);
    }
  }
}
