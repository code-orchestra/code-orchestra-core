/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.build;

import com.intellij.openapi.application.ApplicationInfo;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.util.BuildNumber;
import com.intellij.openapi.util.io.FileUtil;
import com.intellij.util.io.ZipUtil;
import jetbrains.mps.MPSCore;
import jetbrains.mps.build.SamplesExtractor.MyState;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.samples.SamplesInfo;
import jetbrains.mps.samples.SamplesManager;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.workbench.WorkbenchPathManager;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.IOException;

@State(
  name = "LastBuildNumber",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/other.xml"
    )}
)
public class SamplesExtractor implements ApplicationComponent, PersistentStateComponent<MyState>, SamplesInfo {
  private static final Logger LOG = Logger.getLogger(SamplesExtractor.class);

  private static final String SAMPLES_IN_MPS_HOME_DIR = "samples";
  private static final String MPS = "MPS";

  public static SamplesExtractor getInstance() {
    return ((SamplesExtractor) ApplicationManager.getApplication().getComponent(SamplesInfo.class));
  }

  private MyState myState;
  private final ApplicationInfo myApplicationInfo;
  private boolean myIsSamplesInMPSHome;

  public SamplesExtractor(ApplicationInfo applicationInfo) {
    myApplicationInfo = applicationInfo;
  }

  @NotNull
  public String getComponentName() {
    return "Samples Extractor";
  }

  public void initComponent() {
    SamplesManager.getInstance().registerSamplesInfo(this);

    if (myState == null) {
      myState = new MyState();
    }
    updateSamplesLocation();

    if (MPSCore.getInstance().isTestMode()) return;

    checkSamplesAndUpdateIfNeeded();
  }

  private void checkSamplesAndUpdateIfNeeded() {
    int currentBuildNumber = currentBuildNumberString();
    if (myState.myLastBuildNumber < currentBuildNumber) {

      if (!myIsSamplesInMPSHome) {
        extractSamples();
      }
    }
  }

  private int currentBuildNumberString() {
    BuildNumber buildNumber = myApplicationInfo.getBuild();
    String currentBuildNumberString = buildNumber.asString();
    if (currentBuildNumberString.matches(".*[^\\d\\.].*")) {
      // In "normal" build number only dots and digits allowed.
      // If build number looks like "11.snapshot", we consider it developers build and do not to extract samples.
      return MyState.DEFAULT;
    }
    return buildNumber.getBuildNumber();
  }

  private void updateSamplesLocation() {
    File samplesDirectory = new File(getSamplesPathInMPSHome());
    myIsSamplesInMPSHome = samplesDirectory.exists() && samplesDirectory.isDirectory();
  }

  public void disposeComponent() {
  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  public String getSamplesPath() {
    return myIsSamplesInMPSHome ? getSamplesPathInMPSHome() : getSamplesPathInUserHome();
  }

  private String getSamplesPathInUserHome() {
    return WorkbenchPathManager.getUserHome() + File.separator + SAMPLES_IN_USER_HOME_DIR + "." + getSuffix();
  }

  private String getSuffix() {
    return "10";
  }

  private String getSamplesPathInMPSHome() {
    return PathManager.getHomePath() + File.separator + SAMPLES_IN_MPS_HOME_DIR;
  }

  public void extractSamples() {
    File samplesZipFile = new File(PathManager.getHomePath() + File.separator + SAMPLES_IN_MPS_HOME_ZIP);
    if (samplesZipFile.exists()) {
      File samplesDir = new File(getSamplesPathInUserHome());

      if (samplesDir.exists()) {
        int answer = Messages.showYesNoDialog("Do you want to replace directory\n" + samplesDir + "\n with version " + currentBuildNumberString() + " (old directory contents will be deleted)?", "Replace MPS Samples?", Messages.getQuestionIcon());
        if (answer == 0) {
          FileUtil.delete(samplesDir);
          actuallyExtractSamples(samplesZipFile);
        }
      } else {
        actuallyExtractSamples(samplesZipFile);
      }
    }

    myState.myLastBuildNumber = currentBuildNumberString();
  }

  private void actuallyExtractSamples(File samplesZipFile) {
    try {
      File tmpDir = FileUtil.createTempDirectory("MPSSamples", "");
      ZipUtil.extract(samplesZipFile, tmpDir, null);
      File from = new File(tmpDir + File.separator + SAMPLES_IN_USER_HOME_DIR);
      File to = new File(getSamplesPathInUserHome());
      if (!FileUtil.moveDirWithContent(from, to) && !to.exists()) {
        FileUtil.copyDir(from, to);
      }
      FileUtil.delete(tmpDir);
    } catch (IOException e) {
      LOG.error(e);
    }
  }

  public static class MyState {
    public int myLastBuildNumber = DEFAULT;
    private static final int DEFAULT = -1;
  }
}
