package codeOrchestra.rgs.client.sshd.fetching;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.client.sshd.fetching.impl.FlexArtifactsFetcher;
import codeOrchestra.rgs.client.sshd.fetching.impl.HTML5ArtifactsFetcher;
import codeOrchestra.rgs.client.sshd.fetching.impl.JavaArtifactsFetcher;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import org.apache.commons.vfs2.FileObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public final class ArtifactsFetcherFactory {

  private static ArtifactsFetcherFactory instance;

  public static ArtifactsFetcherFactory getInstance() {
    if (instance == null) {
      instance = new ArtifactsFetcherFactory();
    }
    return instance;
  }

  private Map<OutputType, List<ArtifactsFetcherCreator>> creators = new HashMap<OutputType, List<ArtifactsFetcherCreator>>();

  private ArtifactsFetcherFactory() {
    // 1 - FlexArtifactsFetcher
    addCreator(new ArtifactsFetcherCreator() {
      @Override
      public IArtifactsFetcher create(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
        return new FlexArtifactsFetcher(remoteProjectDir, moduleReference, fetchCallback);
      }
      @Override
      public OutputType[] getOutputTypes() {
        return FlexArtifactsFetcher.OUTPUT_TYPES;
      }
    });

    // 2 - HTML5ArtifactsFetcher
    addCreator(new ArtifactsFetcherCreator() {
      @Override
      public IArtifactsFetcher create(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
        return new HTML5ArtifactsFetcher(remoteProjectDir, moduleReference, fetchCallback);
      }

      @Override
      public OutputType[] getOutputTypes() {
        return HTML5ArtifactsFetcher.OUTPUT_TYPES;
      }
    });

    // 3 - GenericArtifactsFetcher (no output type - languages & stuff)
    addCreator(new ArtifactsFetcherCreator() {
      @Override
      public IArtifactsFetcher create(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
        return new JavaArtifactsFetcher(remoteProjectDir, moduleReference, fetchCallback);
      }
      @Override
      public OutputType[] getOutputTypes() {
        return JavaArtifactsFetcher.OUTPUT_TYPES;
      }
    });
  }

  private void addCreator(ArtifactsFetcherCreator creator) {
    for (OutputType outputType : creator.getOutputTypes()) {
      List<ArtifactsFetcherCreator> creatorsByType = creators.get(outputType);
      if (creatorsByType == null) {
        creatorsByType = new ArrayList<ArtifactsFetcherCreator>();
        creators.put(outputType, creatorsByType);
      }

      creatorsByType.add(creator);
    }
  }

  public List<IArtifactsFetcher> getFetchers(OutputType outputType, FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) {
    List<IArtifactsFetcher> fetchers = new ArrayList<IArtifactsFetcher>();

    List<ArtifactsFetcherCreator> artifactsFetcherCreators = creators.get(outputType);
    if (artifactsFetcherCreators != null) {
      for (ArtifactsFetcherCreator artifactsFetcherCreator : artifactsFetcherCreators) {
        fetchers.add(artifactsFetcherCreator.create(remoteProjectDir, moduleReference, fetchCallback));
      }
    }

    return fetchers;
  }

  private static interface ArtifactsFetcherCreator {
    IArtifactsFetcher create(FileObject remoteProjectDir, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback);
    OutputType[] getOutputTypes();
  }

}
