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

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

@SuppressWarnings({"RedundantThrows", "UnusedDeclaration"})
public interface IProjectHandler extends Remote {

  void refreshFS() throws RemoteException;

  CompilationResult buildModule(final String path) throws RemoteException;

  List<String> findInheritors(final String fqName) throws RemoteException;

  void openClass(final String fqName) throws RemoteException;

  void openMethod(final String className, final String name, final int parameterCount) throws RemoteException;

  void openField(final String className, final String name) throws RemoteException;

  void openConstructor(final String className, final int parameterCount) throws RemoteException;

  void addIdeHandler(IMPSIDEHandler handler) throws RemoteException;

  void removeIdeHandler(IMPSIDEHandler handler) throws RemoteException;
}
