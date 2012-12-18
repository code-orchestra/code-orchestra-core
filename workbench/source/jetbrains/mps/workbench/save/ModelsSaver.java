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

package jetbrains.mps.workbench.save;

import com.intellij.AppTopics;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.fileEditor.FileDocumentManagerAdapter;
import com.intellij.util.messages.MessageBusConnection;
import jetbrains.mps.MPSCore;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelRepository;
import org.jetbrains.annotations.NotNull;

public class ModelsSaver implements ApplicationComponent {
  private MessageBusConnection myMessageBusConnection;

  public ModelsSaver(SModelRepository dependsOn) {
  }

  @NotNull
  public String getComponentName() {
    return "VCS Project Helper";
  }

  public void initComponent() {
    myMessageBusConnection = ApplicationManager.getApplication().getMessageBus().connect();
    myMessageBusConnection.subscribe(AppTopics.FILE_DOCUMENT_SYNC, new FileDocumentManagerAdapter() {
      public void beforeAllDocumentsSaving() {
        ModelAccess.instance().runWriteInEDT(new Runnable() {
          public void run() {
            if(MPSCore.getInstance().isTestMode()) {
              return;
            }
            SModelRepository.getInstance().saveAll();
          }
        });
      }
    });
  }

  public void disposeComponent() {
    myMessageBusConnection.disconnect();
  }
}
