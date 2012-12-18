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
package jetbrains.mps.typesystem.newTypesystem.structure;

import gnu.trove.THashMap;
import gnu.trove.THashSet;
import jetbrains.mps.logging.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 26.01.2010
 * Time: 13:35:28
 * To change this template use File | Settings | File Templates.
 */
public class Type<Meta, Target> {
  private static Logger LOG = Logger.getLogger(Type.class);

  protected String myRole;
  protected IReference<Meta> myMeta;
  protected List<Type<Meta, Target>> myChildren = new ArrayList<Type<Meta, Target>>(2);
  protected Map<String, IReference<Target>> myReferences = new THashMap<String, IReference<Target>>(0);

  public List<Type<Meta, Target>> getChildren() {
    return new ArrayList<Type<Meta, Target>>(myChildren);
  }

  public List<Type<Meta, Target>> getChildren(String role) {
    List<Type<Meta, Target>> result = new ArrayList<Type<Meta, Target>>();
    if (role == null) return result;
    for (Type<Meta, Target> t : myChildren) {
      if (role.equals(t.myRole)) {
        result.add(t);
      }
    }
    return result;
  }

  public Target getReferent(String role) {
    IReference<Target> reference = getReference(role);
    if (reference != null) {
      return reference.getTarget();
    }
    return null;
  }

  public IReference<Target> getReference(String role) {
    if (role == null) return null;
    return myReferences.get(role);
  }

  //no properties needed imho

  public Meta getMeta() {
    return myMeta.getTarget();
  }

  public Set<String> getReferenceRoles() {
    return new THashSet<String>(myReferences.keySet());
  }

  public void addChild(Type<Meta, Target> child, String role) {
    if (child == null) {
      LOG.error("child is null");
      return;
    }
    if (role == null) {
      LOG.error("role is null");
      return;
    }
    if (myChildren.contains(child)) {
      LOG.error("this child already exists");
      return;
    }
    myChildren.add(child);
    child.myRole = role;
  }

  public Set<String> getChildRoles() {
    Set<String> result = new THashSet<String>();
    for (Type t : myChildren) {
      result.add(t.myRole);
    }
    return result;
  }

  public boolean isVar() {
    return false;
  }
}
