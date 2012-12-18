package codeOrchestra.rgs.server.artifact;

import codeOrchestra.generator.listener.BuildEvent;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.server.IArtifactPreparer;
import codeOrchestra.utils.CompressUtils;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipOutputStream;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractArtifactPreparer implements IArtifactPreparer {

  public static final String RGSOUTPUT_ZIP = "RGSOutput.zip";

  private static final String[] GENERIC_ARTIFACT_DIRS = new String[] { "source_gen", "source_gen.caches" };

  protected abstract String[] getArtifactFiles();

  @Override
  public final void prepare(BuildEvent buildEvent) throws RGSException {
    ModuleReference rootModuleReference = buildEvent.getRootModuleReference();
    IModule module = MPSModuleRepository.getInstance().getModule(rootModuleReference);
    if (module == null) {
      throw new RGSException("Can't locate the module " + rootModuleReference + " to prepare the build artifact");
    }

    String moduleDirPath = module.getBundleHome().getPath();
    File moduleDir = new File(moduleDirPath);
    if (!moduleDir.exists() || !moduleDir.isDirectory()) {
      throw new RGSException("Can't locate the module dir under " + moduleDirPath + " to prepare the build artifact");
    }

    List<File> filesToCompress = getAllFilesToCompress(moduleDir, buildEvent.getProvider() == BuildProvider.LIVE_CODING_INCREMENTAL);

    try {
      CompressUtils.zip(
        filesToCompress,
        moduleDir,
        new File(moduleDir, RGSOUTPUT_ZIP).getPath(),
        buildEvent.getProvider() == BuildProvider.LIVE_CODING_INCREMENTAL ? ZipOutputStream.STORED : -1);
    } catch (IOException e) {
      throw new RGSException("Can't compress the RGS generation artifact", e);
    }
  }

  private List<File> getAllFilesToCompress(File moduleDir, boolean skipDefaultDirs) {
    List<File> result = new ArrayList<File>();

    // RE-4708
    if (!skipDefaultDirs) {
      for (String genericArtifactDir : GENERIC_ARTIFACT_DIRS) {
        result.add(new File(moduleDir, genericArtifactDir));
      }
    }

    for (String additionalFile : getArtifactFiles()) {
      result.add(new File(moduleDir, additionalFile));
    }

    return result;
  }


}
