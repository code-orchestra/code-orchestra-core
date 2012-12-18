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
package jetbrains.mps.generator.traceInfo;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.traceInfo.UnitPositionInfo;
import jetbrains.mps.util.Mapper2;
import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.SModelFqName;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.traceInfo.PositionInfo;

public class TraceInfoUtil {
  public TraceInfoUtil() {
  }

  @Nullable
  private static <T> T findInDebugInfo(@NotNull String className, @NotNull final Mapper2<? super DebugInfo, ? super SModelDescriptor, ? extends T> nodeGetter) {
    int lastDot = className.lastIndexOf(".");
    String pkg = (lastDot == -1 ?
      "" :
      className.substring(0, lastDot)
    );
    for (String stereotype : SModelStereotype.values) {
      final SModelDescriptor descriptor = SModelRepository.getInstance().getModelDescriptor(new SModelFqName(pkg, stereotype));
      if (descriptor == null) {
        continue;
      }
      if (SModelStereotype.isStubModelStereotype(descriptor.getStereotype())) {
        continue;
      }

      final DebugInfo info = TraceInfoCache.getInstance().get(descriptor);
      if (info == null) {
        continue;
      }

      // todo tryRead does really fit here(?)
      T result = ModelAccess.instance().tryRead(new Computable<T>() {
        @Override
        public T compute() {
          return nodeGetter.value(info, descriptor);
        }
      });
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  @Nullable
  public static String getUnitName(@NotNull String className, final String file, final int position) {
    return findInDebugInfo(className, new Mapper2<DebugInfo, SModelDescriptor, String>() {
      public String value(DebugInfo info, SModelDescriptor descriptor) {
        return info.getUnitNameForLine(file, position);
      }
    });
  }

  @Nullable
  public static SNode getUnitNode(@NotNull String className, final String file, final int position) {
    return findInDebugInfo(className, new Mapper2<DebugInfo, SModelDescriptor, SNode>() {
      public SNode value(DebugInfo result, SModelDescriptor descriptor) {
        return result.getUnitNodeForLine(file, position, descriptor.getSModel());
      }
    });
  }

  @Nullable
  public static SNode getNode(@NotNull String className, final String file, final int position) {
    return findInDebugInfo(className, new Mapper2<DebugInfo, SModelDescriptor, SNode>() {
      public SNode value(DebugInfo result, SModelDescriptor descriptor) {
        return result.getNodeForLine(file, position, descriptor.getSModel());
      }
    });
  }

  @Nullable
  public static SNode getVar(@NotNull String className, final String file, final int position, @NotNull final String varName) {
    return findInDebugInfo(className, new Mapper2<DebugInfo, SModelDescriptor, SNode>() {
      public SNode value(DebugInfo result, SModelDescriptor descriptor) {
        return result.getVarForLine(file, position, descriptor.getSModel(), varName);
      }
    });
  }

  @Nullable
  public static SNode getNodes(String stacktraceLine, String position) {
    int lastDot = stacktraceLine.lastIndexOf(".");
    String pkg = (lastDot == -1 ?
      "" :
      stacktraceLine.substring(0, lastDot)
    );
    String[] split = position.split(":");
    if (split.length >= 2) {
      return getNode(pkg, split[0], Integer.parseInt(split[1]));
    }
    return null;
  }

  @Nullable
  public static String getGeneratedFileName(SNode node) {
    SModel model = node.getModel();
    DebugInfo debugInfo = TraceInfoCache.getInstance().get(model.getModelDescriptor());
    if (debugInfo == null) {
      return null;
    }
    PositionInfo positionInfo = debugInfo.getPositionForNode(node.getId());
    if (positionInfo != null) {
      return model.getLongName() + "." + positionInfo.getFileName();
    }
    UnitPositionInfo unitForNode = debugInfo.getUnitForNode(node.getId());
    if (unitForNode != null) {
      return model.getLongName() + "." + unitForNode.getFileName();
    }
    return null;
  }

  public static String getUnitName(SNode node) {
    SModel model = node.getModel();
    DebugInfo debugInfo = TraceInfoCache.getInstance().get(model.getModelDescriptor());
    if (debugInfo == null) {
      return null;
    }
    UnitPositionInfo unitForNode = debugInfo.getUnitForNode(node.getId());
    if (unitForNode != null) {
      return unitForNode.getUnitName();
    }
    return null;
  }
}
