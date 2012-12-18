package jetbrains.mps.ide.findusages.findalgorithm.finders.specific;

/*Generated by MPS */

import jetbrains.mps.ide.findusages.findalgorithm.finders.IFinder;
import jetbrains.mps.ide.findusages.model.SearchResults;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.ide.findusages.model.holders.IHolder;
import jetbrains.mps.ide.findusages.model.holders.ModelHolder;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.smodel.ModelFindOperations;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.ide.findusages.model.SearchResult;

public class ModelUsagesFinder implements IFinder {
  public ModelUsagesFinder() {
  }

  public SearchResults find(SearchQuery query, ProgressIndicator indicator) {
    SearchResults searchResults = new SearchResults();
    IHolder holder = query.getObjectHolder();
    assert holder instanceof ModelHolder;
    SModel model = ((ModelHolder) holder).getObject();
    searchResults.getSearchedNodes().add(model);
    SModelReference modelReference = model.getSModelReference();
    for (SModelDescriptor modelDescriptor : SModelRepository.getInstance().getModelDescriptors()) {
      if (indicator.isCanceled()) {
        return searchResults;
      }
      if (!(SModelStereotype.isUserModel(modelDescriptor))) {
        continue;
      }
      if (new ModelFindOperations(modelDescriptor).hasUsages(CollectionUtil.set(modelReference))) {
        searchResults.getSearchResults().add(new SearchResult<SModel>(modelDescriptor.getSModel(), "usages in imports"));
      }
    }
    return searchResults;
  }
}
