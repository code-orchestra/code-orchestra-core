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
package jetbrains.mps.smodel;

import com.intellij.util.containers.EmptyIterator;

import java.util.Iterator;

class NodesIterator implements Iterator<SNode> {
  private Iterator<SNode> myRoots;
  private Iterator<SNode> myCurrent;

  NodesIterator(Iterator<SNode> roots) {
    myRoots = roots;
    myCurrent = getIterForNextRoot(roots);
  }

  public boolean hasNext() {
    moveToNextRootIfNeeded();
    return myCurrent.hasNext();
  }

  public SNode next() {
    moveToNextRootIfNeeded();
    return myCurrent.next();
  }

  public void remove() {
    throw new UnsupportedOperationException();
  }

  private void moveToNextRootIfNeeded() {
    if (myCurrent.hasNext()) return;
    if (!myRoots.hasNext()) return;

    while (myRoots.hasNext() && !(myCurrent.hasNext())) {
      myCurrent = getIterForNextRoot(myRoots);
    }
  }

  private Iterator<SNode> getIterForNextRoot(Iterator<SNode> roots) {
    if (!roots.hasNext()) return new EmptyIterator<SNode>();
    return roots.next().getDescendantsIterable(null, true).iterator();
  }
}
