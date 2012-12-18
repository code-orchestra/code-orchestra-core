package codeOrchestra.rgs.generation;

import jetbrains.mps.generator.ModelDigestHelper.DigestProvider;
import jetbrains.mps.generator.ModelDigestUtil;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public final class RGSDigestProvider implements DigestProvider {

  private static RGSDigestProvider instance;
  public synchronized static RGSDigestProvider getInstance() {
    if (instance == null) {
      instance = new RGSDigestProvider();
    }
    return instance;
  }

  private RGSDigestProvider() {
  }

  public List<SModelReference> modelsToRedigest = new ArrayList<SModelReference>();

  public void addModelToRedigest(SModelReference sModelReference) {
    modelsToRedigest.add(sModelReference);
  }

  public void invalidate() {
    modelsToRedigest.clear();
  }

  @Override
  public Map<String, String> getGenerationHashes(IOperationContext operationContext, @NotNull IFile file) {
    EditableSModelDescriptor model = SModelRepository.getInstance().findModel(file);
    if (model != null && modelsToRedigest.contains(model.getSModelReference())) {
      return ModelDigestUtil.getDigestMap(file);
    }

    return null;
  }

}
