package codeOrchestra.actionscript.liveCoding.listener;

import jetbrains.mps.smodel.SNode;

/**
 * This one gets called on a server
 *
 * @author: Alexander Eliseyev
 */
public interface LiveSimplePropertyChangeListener {

  void onChange(SNode node, long timeStamp);

}
