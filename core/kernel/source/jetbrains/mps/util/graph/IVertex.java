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
package jetbrains.mps.util.graph;

import java.util.List;

public interface IVertex {
  double getX();

  double getY();

  List<IEdge> getStar();

  int getStarSize();

  void addEdge(IEdge e);

  void setCoords(double newx, double newy);

  void trySetCoords(double newx, double newy);

  void confirmCoords();

  String getName();

  Object getUserObject(Object key);

  void putUserObject(Object key, Object value);

  void removeUserObject(Object key);

  int getWidth();

  int getHeight();
}
