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
package jetbrains.mps.util.performance;

import java.util.*;

/**
 * Evgeny Gryaznov, Feb 23, 2010
 */
public class PerformanceTracer implements IPerformanceTracer {

  public static final boolean IS_TRACING = true;

  private int top = 0;
  private StackElement[] myStack = new StackElement[4096];
  private String traceName;

  public PerformanceTracer(String name) {
    this.traceName = name;
    for (int i = 0; i < myStack.length; i++) {
      myStack[i] = new StackElement();
    }
    for (int i = 0; i < precreated.length; i++) {
      precreated[i] = new Task("default");
    }
    myStack[0].name = null;
    myStack[0].task = new Task(myStack[0].name);
  }

  @Override
  public void push(String taskName, boolean isMajor) {
    top++;
    myStack[top].isMajor = isMajor;
    myStack[top].name = isMajor ? "[" + taskName + "]" : taskName;
    myStack[top].correction = 0;
    myStack[top].startTime = System.nanoTime();
  }

  @Override
  public void pop() {
    long len = System.nanoTime() - myStack[top].startTime;
    long correction = myStack[top].correction;
    if (myStack[top].isMajor) {
      for (int i = 0; i < top; i++) {
        myStack[i].correction += len - correction;
      }
    }
    String name = myStack[top].name;
    Task wasTask = myStack[top].task;

    // propagate leaves
    if (!myStack[top].children.isEmpty()) {
      if (wasTask == null) {
        wasTask = getTask(top);
      }
      wasTask.tasks.addAll(myStack[top].children.values());
      myStack[top].children.clear();
    }
    if (wasTask == null) {
      myStack[top - 1].addLeaf(name, len, correction);
    } else {
      wasTask.executionTime += len;
      wasTask.correction += correction;
    }
    myStack[top].task = null;
    top--;
  }

  private Task getTask(int i) {
    Task t = myStack[i].task;
    if (t == null) {
      t = createFast(myStack[i].name);
      myStack[i].task = t;
      Task parent = getTask(i - 1);
      parent.addTask(t);
    }
    return t;
  }

  @Override
  public String report(String... separate) {
    if (top == 0) {
      myStack[0].task.tasks.addAll(myStack[0].children.values());
      myStack[0].task.merge(new HashSet<String>(Arrays.asList(separate)));
      StringBuilder sb = new StringBuilder();
      sb.append("[");
      sb.append(traceName);
      sb.append("]\n");
      myStack[0].task.toString(sb, 0);
      return sb.toString();
    } else {
      return null;
    }
  }

  private class StackElement {
    String name;
    long startTime;
    long correction;
    Task task;
    boolean isMajor;
    Map<String, Task> children = new HashMap<String, Task>();

    private Task addLeaf(String name, long time, long correction) {
      Task t = children.get(name);
      if (t == null) {
        t = createFast(name);
        children.put(name, t);
      } else {
        t.invocationCount++;
      }
      t.executionTime += time;
      t.correction += correction;
      return t;
    }
  }

  private static class Task implements Comparable {
    String name;
    long executionTime;
    long correction;
    int invocationCount;
    List<Task> tasks = new LinkedList<Task>();

    private Task(String name) {
      this.name = name;
      this.executionTime = 0;
      this.invocationCount = 1;
    }

    private void addTask(Task task) {
      tasks.add(task);
    }

    public void merge(Set<String> keepUnmerged) {
      Map<String, Task> map = new HashMap<String, Task>();
      Iterator<Task> it = tasks.iterator();
      while (it.hasNext()) {
        Task n = it.next();
        if (keepUnmerged.contains(n.name)) {
          continue;
        }
        Task prev = map.get(n.name);
        if (prev == null) {
          map.put(n.name, n);
        } else {
          it.remove();
          prev.mergeWith(n);
        }
      }
      for (Task t : tasks) {
        t.merge(keepUnmerged);
      }
    }

    private void mergeWith(Task n) {
      executionTime += n.executionTime;
      invocationCount += n.invocationCount;
      correction += n.correction;
      tasks.addAll(n.tasks);
    }

    public void toString(StringBuilder sb, int indent) {
      if (name != null) {
        for (int i = 0; i < indent; i++) {
          sb.append("  ");
        }
        if (tasks.isEmpty()) {
          sb.append("- ");
        }
        sb.append(name);
        sb.append(": ");
        sb.append(executionTime / 1000000.);
        sb.append(" ms");
        if (correction != 0) {
          sb.append("  (real: ");
          sb.append((executionTime - correction) / 1000000.);
          sb.append(" ms)");
        }
        sb.append("\n");
      }
      Collections.sort(tasks);
      for (Task t : tasks) {
        t.toString(sb, name == null ? indent : indent + 2);
      }
    }

    @Override
    public int compareTo(Object o) {
      return new Long(((Task) o).executionTime).compareTo(executionTime);
    }
  }

  private Task createFast(String name) {
    if (precreatedIndex < precreated.length) {
      Task t = precreated[precreatedIndex++];
      t.name = name;
      return t;
    } else {
      return new Task(name);
    }
  }

  private Task[] precreated = new Task[4096];
  int precreatedIndex = 0;
}
