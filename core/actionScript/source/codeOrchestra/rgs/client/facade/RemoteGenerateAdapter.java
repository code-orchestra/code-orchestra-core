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
package codeOrchestra.rgs.client.facade;

import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.state.model.GenerateInput;
import jetbrains.mps.project.structure.modules.ModuleReference;

/**
 * @author Alexander Eliseyev
 */
public class RemoteGenerateAdapter implements RemoteGenerateListener {

  @Override
  public void onSuccess(GenerateInput generateInput) {
  }

  @Override
  public void onFail(GenerateInput generateInput, String message, RGSException e) {
  }
}
