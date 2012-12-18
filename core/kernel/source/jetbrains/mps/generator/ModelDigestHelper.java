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
package jetbrains.mps.generator;

import codeOrchestra.rgs.generation.RGSDigestProvider;
import codeOrchestra.rgs.server.RGSParametersCLI;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

public class ModelDigestHelper {
  public static final String HEADER = "header";
  public static final String FILE = "model";

  private static ModelDigestHelper ourInstance = new ModelDigestHelper();
  private List<DigestProvider> myProviders = new CopyOnWriteArrayList<DigestProvider>();

  public static ModelDigestHelper getInstance() {
    return ourInstance;
  }

  private ModelDigestHelper() {

  }

  public void addDigestProvider(DigestProvider provider) {
    myProviders.add(provider);
  }

  public Map<String, String> getGenerationHashes(@NotNull IFile modelFile, IOperationContext operationContext) {
    for (DigestProvider p : getProviders()) {
      Map<String, String> result = p.getGenerationHashes(operationContext, modelFile);
      if (result != null) return result;
    }

    return ModelDigestUtil.getDigestMap(modelFile);
  }

  @CodeOrchestraPatch
  private List<DigestProvider> getProviders() {
    if (RGSParametersCLI.isInServerMode()) {
      return new ArrayList<DigestProvider>() {
        {
          add(RGSDigestProvider.getInstance());
          addAll(myProviders);
        }
      };
    }

    return myProviders;
  }

  public String getModelHashFast(@NotNull SModelDescriptor descriptor, IOperationContext operationContext) {
    if(descriptor instanceof EditableSModelDescriptor) {
      IFile modelFile = ((EditableSModelDescriptor) descriptor).getModelFile();
      if (modelFile != null) {
        for (DigestProvider p : getProviders()) {
          Map<String, String> result = p.getGenerationHashes(operationContext, modelFile);
          if (result != null) return result.get(FILE);
        }
      }
    }

    return descriptor.getModelHash();
  }


  public interface DigestProvider {
    Map<String, String> getGenerationHashes(IOperationContext operationContext, @NotNull IFile f);
  }
}
