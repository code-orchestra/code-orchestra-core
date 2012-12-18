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
package jetbrains.mps.typesystem.util;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Pair;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

public class GoToTypeErrorRuleUtil {
  private static Logger LOG = Logger.getLogger(GoToTypeErrorRuleUtil.class);

  public GoToTypeErrorRuleUtil() {
  }

  public static void goToTypeErrorRule(final IOperationContext context, IErrorReporter error) {
    goToRuleById(context, new Pair<String, String>(error.getRuleModel(), error.getRuleId()));
  }

  public static void goToRuleById(IOperationContext context, Pair<String, String> ruleModelAndId) {
    String ruleModel = ruleModelAndId.o1;
    final String ruleID = ruleModelAndId.o2;
    SModelReference modelUID = SModelReference.fromString(ruleModel);
    if (modelUID == null) {
      LOG.error("can't find rule's model " + ruleModel);
      return;
    }
    modelUID = SModelReference.fromString(modelUID.getLongName());
    final SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelUID);
    if (modelDescriptor == null) {
      LOG.error("can't find rule's model " + ruleModel);
      return;
    }
    Computable<SNode> c = new Computable<SNode>() {
      public SNode compute() {
        return modelDescriptor.getSModel().getNodeById(ruleID);
      }
    };
    SNode rule = (ModelAccess.instance().canRead() ?
      c.compute() :
      ModelAccess.instance().runReadAction(c)
    );
    if (rule == null) {
      LOG.error("can't find rule with id " + ruleID + " in the model " + modelDescriptor);
      return;
    }
    context.getComponent(MPSEditorOpener.class).openNode(rule, context, false, true);
  }
}
