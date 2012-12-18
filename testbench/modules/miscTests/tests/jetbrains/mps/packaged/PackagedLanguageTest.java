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
package jetbrains.mps.packaged;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.TestMain;
import jetbrains.mps.TestMain.ProjectRunnable;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.FileUtil;
import org.junit.Assert;
import org.junit.Test;

import javax.swing.Icon;
import java.awt.Color;
import java.awt.Component;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 * @author Evgeny Gerashchenko
 * @since 14 December 2010
 */
public class PackagedLanguageTest {
  private static final File DESTINATION_PROJECT_DIR = new File(FileUtil.getTempDir(), "testPackaged");
  private static final File PROJECT_ARCHIVE = new File("testbench/modules/testPackaged.zip");
  private static final String PROJECT_FILE = "ProjectWithPackagedLanguage.mpr";
  private static final String PACKAGED_LANGUAGE = "PackagedLanguage";
  private static final String PACKAGED_CONCEPT = "PackagedConcept";

  @Test
  public void testPackagedLanguageLoading() {
    final boolean result = TestMain.testOnProjectCopy(PROJECT_ARCHIVE, DESTINATION_PROJECT_DIR, PROJECT_FILE,
      new ProjectRunnable() {
        public boolean execute(final MPSProject project) {
          return ModelAccess.instance().runReadAction(new Computable<Boolean>() {
            @Override
            public Boolean compute() {
              checkStructureModelLoaded();
              checkEditorModelLoaded();
              checkIconsLoaded();
              checkStubsLoaded();
              return true;
            }
          });
        }
      });
    if (!result) {
      Assert.fail();
    }
  }

  private void checkStructureModelLoaded() {
    final SModelDescriptor structureModelDescriptor = SModelRepository.getInstance().getModelDescriptor(SModelFqName.fromString(PACKAGED_LANGUAGE + ".structure"));
    Assert.assertNotNull(structureModelDescriptor);
    final SModel structureModel = structureModelDescriptor.getSModel();
    Assert.assertNotNull(structureModel);
    Assert.assertEquals(1, structureModel.rootsCount());
    SNode root = structureModel.rootsIterator().next();
    Assert.assertEquals(PACKAGED_CONCEPT, root.getProperty("name"));
    final SNode propertyDeclaration = root.getChild("propertyDeclaration");
    Assert.assertNotNull(propertyDeclaration);
    Assert.assertEquals("someProperty", propertyDeclaration.getProperty("name"));
  }

  private void checkEditorModelLoaded() {
    final SModelDescriptor editorModelDescriptor = SModelRepository.getInstance().getModelDescriptor(SModelFqName.fromString(PACKAGED_LANGUAGE + ".editor"));
    Assert.assertNotNull(editorModelDescriptor);
    final SModel editorModel = editorModelDescriptor.getSModel();
    Assert.assertNotNull(editorModel);
    Assert.assertEquals(1, editorModel.rootsCount());
  }

  private void checkIconsLoaded() {
    final SModelDescriptor sandboxModelDescriptor = SModelRepository.getInstance().getModelDescriptor(SModelFqName.fromString("ProjectWithPackagedLanguage.sandbox.sandbox"));
    final SNode packagedConceptInstance = new SNode(sandboxModelDescriptor.getSModel(), PACKAGED_LANGUAGE + ".structure." + PACKAGED_CONCEPT);
    final Icon icon = IconManager.getIconFor(packagedConceptInstance);
    Assert.assertNotNull(icon);
    Assert.assertEquals(16, icon.getIconHeight());
    Assert.assertEquals(16, icon.getIconWidth());
    final BufferedImage buf = new BufferedImage(16, 16, BufferedImage.TYPE_INT_RGB);
    icon.paintIcon(new Component() {}, buf.getGraphics(), 0, 0);

    for (int i = 0; i < 16; i++) {
      final Color color = new Color(buf.getRGB(i, i));
      Assert.assertTrue(i % 2 == 0 ? Color.BLACK.equals(color) : Color.WHITE.equals(color));
    }
  }

  private void checkStubsLoaded() {
    final SModelDescriptor libraryModelDescriptor = SModelRepository.getInstance().getModelDescriptor(SModelFqName.fromString(PACKAGED_LANGUAGE + "/" + "dummy" + "@java_stub"));
    Assert.assertNotNull(libraryModelDescriptor);
    final SModel libraryModel = libraryModelDescriptor.getSModel();
    Assert.assertNotNull(libraryModel);
    Assert.assertEquals(1, libraryModel.rootsCount());
    final SNode root = libraryModel.rootsIterator().next();
    Assert.assertEquals("DummyLibraryClass", root.getProperty("name"));
    final SNode method = root.getChild("staticMethod");
    Assert.assertNotNull(method);
    Assert.assertEquals("doSomething", method.getProperty("name"));
  }
}
