package codeOrchestra.rgs.server.artifact;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.server.IArtifactPreparer;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public final class ArtifactPreparerRegistry {

  private static ArtifactPreparerRegistry instance;
  public synchronized static ArtifactPreparerRegistry getInstance() {
    if (instance == null) {
      instance = new ArtifactPreparerRegistry();
    }
    return instance;
  }

  private Map<OutputType, List<IArtifactPreparer>> preparersByOutputType = new HashMap<OutputType, List<IArtifactPreparer>>();

  private ArtifactPreparerRegistry() {
    addPreparer(new FlexArtifactPreparer());
    addPreparer(new HTML5ArtifactPreparer());
  }

  private void addPreparer(IArtifactPreparer preparer) {
    for (OutputType outputType : preparer.getOutputTypes()) {
      List<IArtifactPreparer> artifactPreparers = preparersByOutputType.get(outputType);

      if (artifactPreparers == null) {
        artifactPreparers = new ArrayList<IArtifactPreparer>();
        preparersByOutputType.put(outputType, artifactPreparers);
      }

      artifactPreparers.add(preparer);
    }
  }

  @NotNull
  public List<IArtifactPreparer> getPreparer(OutputType outputType) {
    List<IArtifactPreparer> artifactPreparers = preparersByOutputType.get(outputType);
    if (artifactPreparers == null) {
      return Collections.emptyList();
    }
    return artifactPreparers;
  }

}
