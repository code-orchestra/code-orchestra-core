package codeOrchestra.actionscript.statistics;

import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.SearchedNodesNodeData;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;

import java.util.*;
import java.util.Map.Entry;

/**
 * @author Alexander Eliseyev
 */
public final class DataFlowStatistics extends AbstractTimeStatistics<String> {

  private static final int TRACE_COUNT = 15;

  private static final DataFlowStatistics INSTANCE = new DataFlowStatistics();

  public static DataFlowStatistics instance() {
    return INSTANCE;
  }

  private DataFlowStatistics() {
  }

  protected int getTraceCount() {
    return TRACE_COUNT;
  }

  public void addNodeStat(SNode node, long time) {
    if (time < 1l) {
      return;
    }

    String conceptFqName = node.getConceptFqName();
    if (!conceptFqName.startsWith("com.codeOrchestra")) {
      return;
    }

    addStatObject(conceptFqName, time);
  }

  protected String getActionName() {
    return "build dataflow";
  }

  protected String getStatisticObjectName() {
    return "concept";
  }

}
