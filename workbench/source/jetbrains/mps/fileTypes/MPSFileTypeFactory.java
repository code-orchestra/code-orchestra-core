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
package jetbrains.mps.fileTypes;

import com.intellij.openapi.fileTypes.FileType;
import com.intellij.openapi.fileTypes.FileTypeConsumer;
import com.intellij.openapi.fileTypes.FileTypeFactory;
import com.intellij.openapi.vfs.VirtualFile;
import codeOrchestra.actionscript.ASFileType;
import jetbrains.mps.ide.java.JavaFileType;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.fileSystem.FileIcons;
import jetbrains.mps.project.MPSExtentions;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;

public class MPSFileTypeFactory extends FileTypeFactory {
  public static final FileType PROJECT_FILE_TYPE = new MPSProjectFileType("MPS Project", "MPS Project File Type", MPSExtentions.MPS_PROJECT, Icons.PROJECT_ICON);
  public static final FileType MODEL_FILE_TYPE = new XMLFileType("Model", "MPS Model File Type", MPSExtentions.MODEL, Icons.MODEL_ICON);
  public static final FileType SOLUTION_FILE_TYPE = new XMLFileType("Solution", "MPS Solution File Type", MPSExtentions.SOLUTION, Icons.SOLUTION_ICON);
  public static final FileType LANGUAGE_FILE_TYPE = new XMLFileType("Language", "MPS Language File Type", MPSExtentions.LANGUAGE, Icons.PROJECT_LANGUAGE_ICON);
  public static final FileType DEVKIT_FILE_TYPE = new XMLFileType("Devkit", "MPS Devkit File Type", MPSExtentions.DEVKIT, Icons.DEVKIT_ICON);
  public static final FileType JAVA_FILE_TYPE = new JavaFileType();
  public static final FileType XML_FILE_TYPE = new XMLFileType();
  public static final FileType AS_FILE_TYPE = new ASFileType();
  public static final FileType CLASS_FILE_TYPE = new FileType() {
    @NotNull
    @NonNls
    public String getName() {
      return "Class";
    }

    @NotNull
    public String getDescription() {
      return "Java Class File";
    }

    @NotNull
    @NonNls
    public String getDefaultExtension() {
      return MPSExtentions.CLASSFILE;
    }

    @Nullable
    public Icon getIcon() {
      return FileIcons.CLASS_ICON;
    }

    public boolean isBinary() {
      return true;
    }

    public boolean isReadOnly() {
      return true;
    }

    @Nullable
    @NonNls
    public String getCharset(@NotNull VirtualFile file, final byte[] content) {
      return "utf8";//todo ?
    }
  };
  public static final FileType[] MPS_FILE_TYPES = {PROJECT_FILE_TYPE, MODEL_FILE_TYPE, SOLUTION_FILE_TYPE, LANGUAGE_FILE_TYPE, DEVKIT_FILE_TYPE, CLASS_FILE_TYPE, JAVA_FILE_TYPE, XML_FILE_TYPE, AS_FILE_TYPE};
  public static final String[] XML_EXTENSIONS = {MPSExtentions.IDEAWORKSPACE,
    MPSExtentions.WORKSPACE,
    MPSExtentions.IDEAMODULE,
    MPSExtentions.IDEA_PROJECT};

  public void createFileTypes(@NotNull FileTypeConsumer consumer) {
    for (FileType f : MPS_FILE_TYPES) {
      consumer.consume(f, f.getDefaultExtension());
    }
    for (String xmlExt : XML_EXTENSIONS) {
      consumer.consume(XML_FILE_TYPE, xmlExt);
    }
    consumer.consume(new MPSFileType());
  }


}
