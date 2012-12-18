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

import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;

import java.net.InetAddress;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;

public class RMIHandler {
  public static final int REGISTRY_PORT = 2390;

  private static IDEAHandler ourProjectCreator;
  private static MyMPSPlugin ourPlugin;

  public static synchronized void setProjectCreator(IDEAHandler ourProjectCreator) {
    RMIHandler.ourProjectCreator = ourProjectCreator;
  }

  public static MyMPSPlugin getOurPlugin() {
    return ourPlugin;
  }

  static {
    try {
      Registry registry = LocateRegistry.createRegistry(REGISTRY_PORT);
      ourPlugin = new MyMPSPlugin();
      registry.rebind("MPSPlugin", ourPlugin);
    } catch (RemoteException e) {
      e.printStackTrace();
    }
  }

  public static class MyMPSPlugin extends UnicastRemoteObject implements IMPSPlugin {

    public MyMPSPlugin() throws RemoteException {
      super();
    }

    private void checkAccess() {
      try {
        String client = getClientHost();
        String localhost = InetAddress.getLocalHost().getHostAddress();

        boolean equals = client == null ? localhost == null : client.equals(localhost);
        if (equals) return;

        System.out.println("localhost is " + localhost);
        System.out.println("client is " + client);
        System.out.println("access denied");
      } catch (Throwable t) {
        throw new RuntimeException("Access Denied", t);
      }
    }

    public IProjectHandler getProjectHandler() throws RemoteException {
      checkAccess();

      ProjectManager projectManager = ProjectManager.getInstance();
      if (projectManager.getOpenProjects().length == 0) return null;
      return projectManager.getOpenProjects()[0].getComponent(ProjectHandler.class);
    }

    public IProjectHandler getProjectHandlerFor(String projectPath) throws RemoteException {
      checkAccess();

      ProjectManager projectManager = ProjectManager.getInstance();
      for (Project p : projectManager.getOpenProjects()) {
        ProjectHandler handler = p.getComponent(ProjectHandler.class);
        if (handler.findModule(projectPath) != null) {
          return handler;
        }
      }

      return null;
    }

    public IIDEAHandler getProjectCreator() throws RemoteException {
      checkAccess();
      return ourProjectCreator;
    }

  }
}
