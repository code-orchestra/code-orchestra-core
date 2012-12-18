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
package codeOrchestra.rgs.server.artifact;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.server.IArtifactPreparer;

/**
 * @author Alexander Eliseyev
 */
public class FlexArtifactPreparer extends AbstractArtifactPreparer implements IArtifactPreparer {

  public static final OutputType[] OUTPUT_TYPES = new OutputType[] { OutputType.FLEX_APPLICATION, OutputType.FLEX_LIBRARY };
  private static final String[] ARTIFACT_FILES = new String[] { "output_swf", "compile_errors.log" };

  @Override
  public OutputType[] getOutputTypes() {
    return OUTPUT_TYPES;
  }

  @Override
  protected String[] getArtifactFiles() {
    return ARTIFACT_FILES;
  }
}
