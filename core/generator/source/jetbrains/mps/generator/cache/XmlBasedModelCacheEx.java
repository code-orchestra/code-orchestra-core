package jetbrains.mps.generator.cache;

import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.generationTypes.StreamHandler;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
@CodeOrchestraPatch
public abstract class XmlBasedModelCacheEx<T> extends XmlBasedModelCache<T> {

  public XmlBasedModelCacheEx(SModelRepository modelRepository) {
    super(modelRepository);
  }

  public String getCacheFileName(SModelDescriptor modelDescriptor) {
    try {
      String moduleName = modelDescriptor.getModule().toString();
      return moduleName + "." + getCacheFileName();
    } catch (Throwable t) {
      return getCacheFileName();
    }
  }

  @Nullable
  protected IFile getCacheFile(SModelDescriptor modelDescriptor) {
    IModule m = modelDescriptor.getModule();
    IFile cachesModuleDir = getCachesDirInternal(m, m.getOutputFor(modelDescriptor));
    if (cachesModuleDir == null) return null;
    IFile cachesDir = FileGenerationUtil.getDefaultOutputDir(modelDescriptor, cachesModuleDir);
    if (cachesDir == null) return null;

    return cachesDir.getDescendant(getCacheFileName(modelDescriptor));
  }

  @Override
  protected void saveCache(@NotNull T cache, SModelDescriptor model, StreamHandler handler) {
    handler.saveStream(getCacheFileName(model), toXml(cache), isCache());
  }

}
