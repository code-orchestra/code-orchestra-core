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
package jetbrains.mps.newTypesystem.test;

import jetbrains.mps.newTypesystem.state.Equations;
import jetbrains.mps.newTypesystem.state.NodeMaps;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.newTypesystem.state.blocks.Block;

import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Dec 16, 2010
 * Time: 3:49:28 PM
 */
public class StateMatcher {

  public static boolean match(State state1, State state2) {
    return matchEquations(state1.getEquations(), state2.getEquations()) &&
      matchBlocks(state1.getBlocks(), state2.getBlocks()) &&
      matchNodeMaps(state1.getNodeMaps(), state2.getNodeMaps());
  }

  private static boolean matchEquations(Equations equations1, Equations equations2) {
    return equations1.getRepresentatives().equals(equations2.getRepresentatives());
  }

  private static boolean matchBlocks(Set<Block> blocks1, Set<Block> blocks2) {
    return blocks1.equals(blocks2);
  }

  private static boolean matchNodeMaps(NodeMaps nodeMaps1, NodeMaps nodeMaps2) {

    return nodeMaps1.getNodesToErrors().equals(nodeMaps2.getNodesToErrors()) &&
      nodeMaps1.getNodesToTypes().equals(nodeMaps2.getNodesToTypes());
  }
}
