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
package jetbrains.mps.plugin;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import org.jetbrains.annotations.NotNull;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class IDEAHandler extends UnicastRemoteObject implements ApplicationComponent, IIDEAHandler {
  static {
    RMIHandler.class.getClassLoader();
  }

  public static IDEAHandler getInstance() {
    return ApplicationManager.getApplication().getComponent(IDEAHandler.class);
  }

  public IDEAHandler() throws RemoteException {
    super();
  }

  @NotNull
  public String getComponentName() {
    return "Project Creator";
  }

  public void ping() {
  }

  public void initComponent() {
    RMIHandler.setProjectCreator(this);
  }

  public void disposeComponent() {
  }
}
