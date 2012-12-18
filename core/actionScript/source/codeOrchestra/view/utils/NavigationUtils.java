package codeOrchestra.view.utils;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.generator.TransientModelsModule.TransientSModelDescriptor;
import jetbrains.mps.generator.template.TemplateQueryContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public class NavigationUtils {

  public static SNode getNodeToDisplay(final SNode node) {
    if (node == null) {
      return null;
    }
    return ModelAccess.instance().runReadAction(new Computable<SNode>() {
      @Override
      public SNode compute() {
        SNode nodeToNavigateTo = node;

        SModelDescriptor modelDescriptor = nodeToNavigateTo.getModel().getModelDescriptor();
        if (modelDescriptor instanceof TransientSModelDescriptor) {
          SNode originalNode = (SNode) nodeToNavigateTo.getUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE);
          return getNodeToDisplay(originalNode);
        }

        return nodeToNavigateTo;
      }
    });
  }

}
