package codeOrchestra.rgs.server.sshd;

import codeOrchestra.rgs.server.RGSParametersCLI;
import codeOrchestra.rgs.server.sshd.mina.CodeOrchestraFileSystemFactory;
import org.apache.sshd.SshServer;
import org.apache.sshd.common.NamedFactory;
import org.apache.sshd.server.Command;
import org.apache.sshd.server.PasswordAuthenticator;
import org.apache.sshd.server.UserAuth;
import org.apache.sshd.server.auth.UserAuthPassword;
import org.apache.sshd.server.command.ScpCommandFactory;
import org.apache.sshd.server.keyprovider.SimpleGeneratorHostKeyProvider;
import org.apache.sshd.server.session.ServerSession;
import org.apache.sshd.server.sftp.SftpSubsystem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class RGSSSHDServer {

  private static RGSSSHDServer instance = new RGSSSHDServer();

  private static final String HOST_KEY_PROVIDER_FILE = "hostkey.ser";

  public static RGSSSHDServer getInstance() {
    return instance;
  }

  private SshServer sshd;
  private boolean running;

  private RGSSSHDServer() {
  }

  public boolean isRunning() {
    return sshd != null && running;
  }

  public void restart() throws IOException {
    stop();
    start();
  }

  public void start() throws IOException {
    if (isRunning()) {
      return;
    }

    sshd = SshServer.setUpDefaultServer();

    sshd.setPort(RGSParametersCLI.getSSHDServerPort());
    sshd.setKeyPairProvider(new SimpleGeneratorHostKeyProvider(HOST_KEY_PROVIDER_FILE));
    sshd.setFileSystemFactory(new CodeOrchestraFileSystemFactory(RGSParametersCLI.getWorkspacePath()));

    //sshd.setShellFactory(new ProcessShellFactory(new String[] { "/bin/sh", "-i", "-l" }));

    List<NamedFactory<UserAuth>> userAuthFactories = new ArrayList<NamedFactory<UserAuth>>();
    userAuthFactories.add(new UserAuthPassword.Factory());
    sshd.setUserAuthFactories(userAuthFactories);
    sshd.setPasswordAuthenticator(new PasswordAuthenticator() {
      @Override
      public boolean authenticate(String user, String password, ServerSession serverSession) {
        return user.equals(RGSParametersCLI.getUsername()) && password.equals(RGSParametersCLI.getPassword());
      }
    });

    sshd.setCommandFactory(new ScpCommandFactory());

    List<NamedFactory<Command>> namedFactoryList = new ArrayList<NamedFactory<Command>>();
    namedFactoryList.add(new SftpSubsystem.Factory());
    sshd.setSubsystemFactories(namedFactoryList);

    sshd.start();

    running = true;
  }

  public void stop() {
    if (!isRunning()) {
      return;
    }

    try {
      sshd.stop(true);
    } catch (InterruptedException e) {
      // ignore
    }

    sshd = null;
    running = false;
  }


}
