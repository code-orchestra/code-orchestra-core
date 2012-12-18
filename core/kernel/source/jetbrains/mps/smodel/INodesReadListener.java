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

public interface INodesReadListener {
  public void nodeChildReadAccess(SNode node, String childRole, SNode child);

  public void nodePropertyReadAccess(SNode node, String propertyName, String value);

  public void propertyExistenceAccess(SNode node, String propertyName);

  public void propertyDirtyReadAccess(SNode node, String propertyName);

  public void propertyCleanReadAccess(SNode node, String propertyName);

  public void nodeReferentReadAccess(SNode node, String referentRole, SNode referent);

  public void nodeUnclassifiedReadAccess(SNode node);

  public void modelNodesReadAccess(SModel model);
}
