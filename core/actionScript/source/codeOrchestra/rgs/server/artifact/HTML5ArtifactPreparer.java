package codeOrchestra.rgs.server.artifact;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.server.IArtifactPreparer;

/**
 * @author Alexander Eliseyev
 */
public class HTML5ArtifactPreparer extends AbstractArtifactPreparer implements IArtifactPreparer {

  public static final OutputType[] OUTPUT_TYPES = new OutputType[]{ OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY };
  private static final String[] ARTIFACT_DIRS = new String[0];

  @Override
  protected String[] getArtifactFiles() {
    return ARTIFACT_DIRS;
  }

  @Override
  public OutputType[] getOutputTypes() {
    return OUTPUT_TYPES;
  }
}
