package codeOrchestra.actionscript.modulemaker.config.linkreport;

import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class LinkReportBuilder {

  private Solution compiledModule;
  private List<Solution> dependencyModules = new ArrayList<Solution>();

  public LinkReportBuilder(Solution compiledModule) {
    this.compiledModule = compiledModule;
  }

  public boolean hasDependenciesToReport() {
    return !dependencyModules.isEmpty();
  }

  public void addDependencyModule(Solution dependencyModule) {
    dependencyModules.add(dependencyModule);
  }

  public LinkReport build() {
    LinkReport linkReport = new LinkReport(new File(compiledModule.getBundleHome().getPath(), "link-report.xml").getPath());

    for (Solution dependencyModule : dependencyModules) {
      for (SModelDescriptor modelDescriptor : dependencyModule.getOwnModelDescriptors()) {
        String packageName = modelDescriptor.getLongName();

        for (SNode root : modelDescriptor.getSModel().roots()) {
          linkReport.addScript(getDefinitionId(packageName, root.getName()));
        }
      }
    }

    return linkReport;
  }

  public static String getDefinitionId(String namespace, String name) {
    if (StringUtils.isEmpty(namespace)) {
      return name;
    }
    return namespace + ':' + name;
  }

}
