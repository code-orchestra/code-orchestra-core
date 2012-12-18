package codeOrchestra.rgs.client.sshd.flitering;

import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.client.sshd.flitering.impl.*;
import codeOrchestra.utils.collections.UniqueList;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public final class SyncBlockerRegistry {

  private static SyncBlockerRegistry instance;

  public static SyncBlockerRegistry getInstance() {
    if (instance == null) {
      instance = new SyncBlockerRegistry();
    }
    return instance;
  }

  private Map<SyncFileOperation, List<ISyncBlocker>> blockersByOperation = new HashMap<SyncFileOperation, List<ISyncBlocker>>();

  private List<ISyncBlocker> cachedTransferBlockers;

  private SyncBlockerRegistry() {
    addBlocker(new GeneratedCodeSyncBlocker());
    addBlocker(new OutputSWFSyncBlocker());
    addBlocker(new VCSFilesCommitBlocker());
    addBlocker(new FlexConfigDeleteBlocker());
    addBlocker(new DSStoreCommitBlocker());
    addBlocker(new RGSSyncZipCommitBlocker());
    addBlocker(new CompileErrorsCommitBlocker());
    addBlocker(new IWSSSyncBlocker());
    addBlocker(new LinkReportSyncBlocker());
    addBlocker(new CodeOrchestraLanguagesProjectBlocker());
  }

  private List<ISyncBlocker> getBlockersForOperation(SyncFileOperation operation) {
    List<ISyncBlocker> result = blockersByOperation.get(operation);
    if (result == null) {
      return Collections.emptyList();
    }

    return result;
  }

  public boolean transferShouldBeBlocked(String relativePath) {
    List<ISyncBlocker> transferBlockers = getCachedTransferBlockers();

    for (ISyncBlocker syncBlocker : transferBlockers) {
      if (syncBlocker.getCondition().met(relativePath)) {
        return true;
      }
    }

    return false;
  }

  private List<ISyncBlocker> getCachedTransferBlockers() {
    if (cachedTransferBlockers == null) {
      cachedTransferBlockers = new UniqueList<ISyncBlocker>();
      cachedTransferBlockers.addAll(getBlockersForOperation(SyncFileOperation.MODIFY));
      cachedTransferBlockers.addAll(getBlockersForOperation(SyncFileOperation.UPLOAD));
    }

    return cachedTransferBlockers;
  }

  private void invalidate() {
    this.cachedTransferBlockers = null;
  }

  public boolean shouldBeBlocked(SyncFileOperation operation, String relativePath) {
    List<ISyncBlocker> syncBlockers = getBlockersForOperation(operation);

    for (ISyncBlocker syncBlocker : syncBlockers) {
      if (syncBlocker.getCondition().met(relativePath)) {
        return true;
      }
    }
    return false;
  }

  public void addBlocker(ISyncBlocker blocker) {
    for (SyncFileOperation operation : blocker.getOperations()) {
      List<ISyncBlocker> blockers = blockersByOperation.get(operation);
      if (blockers == null) {
        blockers = new ArrayList<ISyncBlocker>();
        blockersByOperation.put(operation, blockers);
      }

      blockers.add(blocker);
    }

    invalidate();
  }

}
