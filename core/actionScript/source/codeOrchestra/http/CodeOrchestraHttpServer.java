package codeOrchestra.http;

import codeOrchestra.rgs.server.RGSParametersCLI;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.util.PathManager;
import org.jetbrains.annotations.NotNull;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraHttpServer implements ApplicationComponent {

  public static final String CROSSDOMAIN_XML = "crossdomain.xml";

  public static CodeOrchestraHttpServer getInstance() {
    return ApplicationManager.getApplication().getComponent(CodeOrchestraHttpServer.class);
  }

  private TJWSServer tjwsServer;
  private Acme.Serve.Serve.PathTreeDictionary aliases;

  @Override
  public void initComponent() {
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    tjwsServer = new TJWSServer();

    aliases = new Acme.Serve.Serve.PathTreeDictionary();
    addAlias(new File(PathManager.getHomePath(), CROSSDOMAIN_XML), "/" + CROSSDOMAIN_XML);

    java.util.Properties properties = new java.util.Properties();
    properties.put("port", 8090); // TODO: make configurable
    properties.setProperty(Acme.Serve.Serve.ARG_NOHUP, "nohup");
    tjwsServer.arguments = properties;
    tjwsServer.addDefaultServlets(null);

    new Thread("TJWS Server Runner Thread") {
      @Override
      public void run() {
        tjwsServer.serve();
      }
    }.start();
  }

  public void addModuleAlias(String moduleName, File baseDir) {
    addAlias(new File(baseDir, "output_swf"), "/modules_output/" + moduleName + "/*");
  }

  public void addAlias(File file, String alias) {
    aliases.put(alias, file);
    tjwsServer.setMappingTable(aliases);
  }

  @Override
  public void disposeComponent() {
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    tjwsServer.notifyStop();
    tjwsServer.destroyAllServlets();
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Code Orchestra HTTP Server";
  }

  private class TJWSServer extends Acme.Serve.Serve {
    // Overriding method for public access
    public void setMappingTable(PathTreeDictionary mappingTable) {
      super.setMappingTable(mappingTable);
    }

    // add the method below when .war deployment is needed
    public void addWarDeployer(String deployerFactory, String throttles) {
      super.addWarDeployer(deployerFactory, throttles);
    }
  };

}
