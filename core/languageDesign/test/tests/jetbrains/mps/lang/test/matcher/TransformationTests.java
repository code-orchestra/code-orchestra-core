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
package jetbrains.mps.lang.test.matcher;

import jetbrains.mps.TestMain;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.MacrosFactory;
import jetbrains.mps.vfs.IFile;
import junit.framework.Assert;
import org.junit.Test;

import javax.swing.SwingUtilities;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;

/**
 * Created by IntelliJ IDEA.
 */
public class TransformationTests {

  @Test
  public void equalNodeTest() throws Throwable {
    TestMain.configureMPS();
    MPSProject project = TestMain.loadProject(new File(MacrosFactory.mpsHomeMacros().expandPath("${mps_home}languages/util/transformationTest/transformationTest.mpr", ((IFile)null))));

    runCommand(new Runnable() {
      public void run() {
        SModel m = getModel();
        SNode s1 = SModelOperations.getRootByName(m,"c1");
        SNode s2 = SModelOperations.getRootByName(m,"c1");
        Assert.assertEquals(null, NodesMatcher.matchNodes(s1, s2));
      }
    }, project);
  }

  @Test
  public void conceptDiffernse() {
    TestMain.configureMPS();
    MPSProject project = TestMain.loadProject(new File(MacrosFactory.mpsHomeMacros().expandPath("${mps_home}languages/util/transformationTest/transformationTest.mpr", ((IFile)null))));

    runCommand(new Runnable() {
      public void run() {
        SModel m = getModel();
        SNode s1 = SModelOperations.getRootByName(m,"i1");
        SNode s2 = SModelOperations.getRootByName(m,"c2");
        NodeDifference d = difference("i1", new ConceptDifference("jetbrains.mps.baseLanguage.structure.Interface", "jetbrains.mps.baseLanguage.structure.ClassConcept"));
        Assert.assertEquals(d, NodesMatcher.matchNodes(s1, s2));
      }
    }, project);
  }

  @Test
  public void propertyDiffernce() {
    TestMain.configureMPS();
    MPSProject project = TestMain.loadProject(new File(MacrosFactory.mpsHomeMacros().expandPath("${mps_home}languages/util/transformationTest/transformationTest.mpr", ((IFile)null))));

    runCommand(new Runnable() {
      public void run() {
        SModel m = getModel();
        SNode s1 = SModelOperations.getRootByName(m,"c1");
        SNode s2 = SModelOperations.getRootByName(m,"c2");
        NodeDifference d = difference("c1", new PropertyDifferense("name"));
        Assert.assertEquals(d, NodesMatcher.matchNodes(s1, s2));
      }
    }, project);
  }

  private NodeDifference difference(String name, DifferanceItem... items) {
    return new NodeDifference(name, Arrays.asList(items));
  }

  @Test
  public void childrenDiffernce() {
    MPSProject project = TestMain.loadProject(new File(MacrosFactory.mpsHomeMacros().expandPath("${mps_home}languages/util/transformationTest/transformationTest.mpr", ((IFile)null))));

    runCommand(new Runnable() {
      public void run() {
        final SModel m = getModel();
        SNode s1 = SModelOperations.getRootByName(m,"c1");
        SNode s2 = SModelOperations.getRootByName(m,"differentMethod");
        NodeDifference d = difference("c1",
                new PropertyDifferense("name"),
                new ChildrenCountDifference("field", 1, 2),
                difference("m():void",
                        new PropertyDifferense("name")));
        Assert.assertEquals(d, NodesMatcher.matchNodes(s1, s2));
      }
    }, project);
  }

  @Test
  public void referenceDiffernce() {
    TestMain.configureMPS();
    MPSProject project = TestMain.loadProject(new File(MacrosFactory.mpsHomeMacros().expandPath("${mps_home}languages/util/transformationTest/transformationTest.mpr", ((IFile)null))));

    runCommand(new Runnable() {
      public void run() {
        SModel m = getModel();
        SNode s1 = SModelOperations.getRootByName(m,"differentReference1");
        SNode s2 = SModelOperations.getRootByName(m,"differentReference2");
        NodeDifference d = difference("differentReference1",
                new PropertyDifferense("name"),
                difference("c1",
                        new ReferenceDifferense("classifier", true)),
                difference("m():void",
                        difference("StatementList",
                                difference("ExpressionStatement",
                                        difference("DotExpression",
                                                difference("f1",
                                                        new ReferenceDifferense("fieldDeclaration", true)))))));

        Assert.assertEquals(d, NodesMatcher.matchNodes(s1, s2));
      }
    }, project);
  }



  public SModel getModel() {
    TestMain.configureMPS();
    IdeMain.setTestMode(TestMode.CORE_TEST) ;
    final SModelDescriptor sm = SModelRepository.getInstance().getModelDescriptor(SModelReference.fromString("jetbrains.mps.transformationTest.test"));
    return sm.getSModel();
  }

  public void runCommand(final Runnable command, MPSProject project) {
    try {
      SwingUtilities.invokeAndWait(new Runnable() {
        public void run() {
          ModelAccess.instance().runWriteActionInCommand(command);
        }
      });
    } catch (InterruptedException e) {
      e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
    } catch (InvocationTargetException e) {
      e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
    } finally {
      if (project != null) {
        project.dispose();
      }
    }

  }
}
