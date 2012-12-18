package codeOrchestra.actionscript.chooser;

import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;

/**
 * @author Alexander Eliseyev
 */
public interface ASModelChooseCallback {

  void onModelChosen(SModelReference sModelDescriptor);

}
