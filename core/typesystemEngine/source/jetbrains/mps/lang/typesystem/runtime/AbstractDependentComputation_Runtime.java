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
package jetbrains.mps.lang.typesystem.runtime;

import jetbrains.mps.smodel.SNode;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 12.02.2010
 * Time: 16:45:44
 * To change this template use File | Settings | File Templates.
 */
public abstract class AbstractDependentComputation_Runtime implements IApplicableToConcept {
  private DependentComputationWrapper myWrapper = null;

  public abstract String getConceptFQName();

  public abstract String getBlockingConceptFQName();

  public abstract SNode getBlockingNode(SNode node);

  @Override
  public String getApplicableConceptFQName() {
    return getConceptFQName();
  }

  public boolean isApplicable(SNode node) {
    return true;
  }

  public boolean isBlocking(SNode node) {
    return true;
  }

  public DependentComputationWrapper getWrapper() {
    if (myWrapper == null) myWrapper = new DependentComputationWrapper(this);
    return myWrapper;
  }

  public static class DependentComputationWrapper implements IApplicableToConcept {
    private AbstractDependentComputation_Runtime myPeer;

    public DependentComputationWrapper(AbstractDependentComputation_Runtime peer) {
      myPeer = peer;
    }

    public AbstractDependentComputation_Runtime getPeer() {
      return myPeer;
    }

    @Override
    public String getApplicableConceptFQName() {
      return myPeer.getBlockingConceptFQName();
    }

    public boolean isBlocking(SNode node) {
      return myPeer.isBlocking(node);
    }
  }
}
