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
package jetbrains.mps.lang.dataFlow.framework;

import jetbrains.mps.lang.dataFlow.framework.instructions.*;

import java.util.*;
import java.util.Map.Entry;

public abstract class StructuralProgramBuilder<N> {
  private Program myProgram = new Program();
  private List<Runnable> myInvokeLater = new ArrayList<Runnable>();

  private Map<N, Map<String, Integer>> myLabels = new HashMap<N, Map<String, Integer>>();

  protected abstract void doBuild(N node);

  public Program buildProgram(N node) {
    build(node);

    for (Runnable r : myInvokeLater) {
      r.run();
    }

    myProgram.init();
    return myProgram;
  }

  public void build(N node) {
    myProgram.start(node);
    doBuild(node);
    myProgram.end(node);
  }

  public Position before(final N node) {
    return new Position() {
      public int getPosition() {
        return myProgram.getStart(node);
      }
    };
  }

  public Position after(final N node) {
    return new Position() {
      public int getPosition() {
        return myProgram.getEnd(node);
      }
    };
  }

  public int insertAfter(Instruction i) {
     return myProgram.indexOf(i)+1;
  }

  public int insertBefore(Instruction i) {
     return myProgram.indexOf(i);
  }

  public Position label(final N node, final String label) {
    return new Position() {
      public int getPosition() {
        if (!myLabels.containsKey(node) || !myLabels.get(node).containsKey(label)) {
          throw new RuntimeException("Can't find a label " + label + " for node " + node);
        }
        return myLabels.get(node).get(label);
      }
    };
  }

  public void emitLabel(String label) {
    if (!myLabels.containsKey((N) myProgram.getCurrent())) {
      myLabels.put((N) myProgram.getCurrent(), new HashMap<String, Integer>());
    }
    myLabels.get((N) myProgram.getCurrent()).put(label, myProgram.size());
  }

  private void updateLabelsOnInsert(final int position) {
    for(Entry<N, Map<String, Integer>> labels : myLabels.entrySet()) {
      for(Entry<String,Integer> label : labels.getValue().entrySet()) {
        if (label.getValue() > position) {
          label.setValue(label.getValue()+1);
        }
      }
    }
  }

  public void insertInstruction(Instruction instruction, int position) {
    updateLabelsOnInsert(position);
    myProgram.insert(instruction, position, false, false);
  }

  private NopInstruction emitNopCommon() {
    NopInstruction instruction = new NopInstruction();
    onInstructionEmitted(instruction);
    return instruction;
  }

  public void emitNop(final int insertPosition) {
    insertInstruction(emitNopCommon(), insertPosition);
  }

  public void emitNop() {
    myProgram.add(emitNopCommon());
  }

  public void emitRead(Object var) {
    ReadInstruction instruction = new ReadInstruction(var);
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
  }

  public void emitWrite(Object var) {
    WriteInstruction instruction = new WriteInstruction(var, null);
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
  }

  public void emitWrite(Object var, Object value) {
    WriteInstruction instruction = new WriteInstruction(var, value);
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
  }

  public void emitRet() {
    RetInstruction instruction = new RetInstruction();
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
  }

  public void emitJump(final Position position) {
    final JumpInstruction instruction = new JumpInstruction();
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
    invokeLater(new Runnable() {
      public void run() {
        instruction.setJumpTo(position);
      }
    });
  }

  private IfJumpInstruction emitIfJumpCommon(final Position position) {
    final IfJumpInstruction instruction = new IfJumpInstruction();
    onInstructionEmitted(instruction);
    invokeLater(new Runnable() {
      public void run() {
        instruction.setJumpTo(position);
      }
    });
    return instruction;
  }

  public void emitIfJump(final Position position) {
    myProgram.add(emitIfJumpCommon(position));
  }

  public void emitIfJump(final Position position, int insertPosition) {
    insertInstruction(emitIfJumpCommon(position),insertPosition);
  }

  public void emitTry() {
    TryInstruction instruction = new TryInstruction();
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
  }

  public void emitFinally() {
    FinallyInstruction instruction = new FinallyInstruction();
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
  }

  public void emitEndTry() {
    EndTryInstruction instruction = new EndTryInstruction();
    onInstructionEmitted(instruction);
    myProgram.add(instruction);
  }

  public void addInstruction(Instruction instruction, Position position) {
    if (position == null) {
      myProgram.add(instruction);
    } else {
      insertInstruction(instruction, position.getPosition());
    }
  }

  protected void onInstructionEmitted(Instruction instruction) {
  }

  private void invokeLater(Runnable r) {
    myInvokeLater.add(r);
  }

  public interface Position {
    int getPosition();
  }

  public boolean contains(Object o) {
      return myProgram.contains(o);
  }

  public List<Instruction> getInstructionsFor(Object o) {
    return myProgram.getInstructionsFor(o);
  }
}
