/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package codeOrchestra.rgs.server.sshd.mina;

import codeOrchestra.rgs.server.RGSParametersCLI;
import jetbrains.mps.logging.Logger;
import org.apache.sshd.server.SshFile;
import org.apache.sshd.server.FileSystemView;

import java.io.File;

/**
 * <strong>Internal class, do not use directly.</strong>
 *
 * File system view based on native file system. Here the root directory will be
 * user virtual root (/).
 *
 * @author <a href="http://mina.apache.org">Apache MINA Project</a>
 * @author Alexander Eliseyev
 */
public class CodeOrchestraNativeFileSystemView implements FileSystemView {

  private final Logger LOG = Logger.getLogger(CodeOrchestraNativeFileSystemView.class);

  // the first and the last character will always be '/'
  // It is always with respect to the root directory.
  private String currDir;

  /**
   * Constructor - internal do not use directly, use {@link CodeOrchestraFileSystemFactory} instead
   */
  public CodeOrchestraNativeFileSystemView(String homeDirectory) {
    this.currDir = homeDirectory;
  }

  /**
   * Get file object.
   */
  public SshFile getFile(String file) {
    return getFile(currDir, file);
  }

  public SshFile getFile(SshFile baseDir, String file) {
    return getFile(baseDir.getAbsolutePath(), file);
  }

  protected SshFile getFile(String dir, String file) {
    // get actual file object
    String physicalName = CodeOrchestraNativeSshFile.getPhysicalName("/", dir, file, false);
    File fileObj = new File(physicalName);

    // strip the root directory and return
    String userFileName = physicalName.substring("/".length() - 1);
    return new CodeOrchestraNativeSshFile(userFileName, fileObj, RGSParametersCLI.getUsername());
  }
}