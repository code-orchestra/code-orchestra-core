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
package jetbrains.mps.generator.impl.cache;

import jetbrains.mps.generator.GenerationCacheContainer.ModelCacheContainer;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.util.FileUtil;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Evgeny Gryaznov, Sep 21, 2010
 */
public class IntermediateModelsCache {

  private static final String SIGNATURE = "signature";
  private static final String STEPS = "steps";

  private final ModelCacheContainer myCacheContainer;
  private final String mySignature;
  private boolean isOk = true;

  private List<Integer> mySteps;
  long timeSpent = 0;

  public IntermediateModelsCache(ModelCacheContainer cacheContainer, String signature) {
    myCacheContainer = cacheContainer;
    mySignature = signature;
    mySteps = new ArrayList<Integer>();
  }

  public String getSignature() {
    return mySignature;
  }

  private String getStorageName(int major, int minor) {
    return "step" + major + "_" + minor;
  }

  public static IntermediateModelsCache load(ModelCacheContainer cacheContainer) {
    try {
      ModelInputStream is = new ModelInputStream(cacheContainer.openStream(STEPS));
      List<Integer> steps;
      try {
        int count = is.readInt();
        if (count > 10000) {
          throw new IOException("illegal data");
        }
        steps = new ArrayList<Integer>(count);
        for (int i = 0; i < count; i++) {
          steps.add(is.readInt());
        }
      } finally {
        is.close();
      }

      InputStreamReader reader = new InputStreamReader(cacheContainer.openStream(SIGNATURE), FileUtil.DEFAULT_CHARSET);
      try {
        StringBuilder signature = new StringBuilder();
        char[] buff = new char[512];
        int size;
        while ((size = reader.read(buff)) > 0) {
          signature.append(buff, 0, size);
        }
        IntermediateModelsCache result = new IntermediateModelsCache(cacheContainer, signature.toString());
        result.setSteps(steps);
        return result;
      } finally {
        reader.close();
      }
    } catch (IOException e) {
      /* cannot load */
    }
    return null;
  }

  private void setSteps(List<Integer> steps) {
    mySteps = steps;
  }

  public int getMinorCount(int majorStep) {
    return mySteps.get(majorStep);
  }

  public void store(int majorStep, int minor, TransientModelWithMetainfo model) {
    long start = System.nanoTime();
    try {
      if (majorStep == mySteps.size()) {
        mySteps.add(0);
      }
      int minorStep = mySteps.get(majorStep);
      mySteps.set(majorStep, minorStep + 1);
      assert minor == minorStep;

      ModelOutputStream os = new ModelOutputStream(myCacheContainer.createStream(getStorageName(majorStep, minorStep)));
      try {
        model.save(os);
      } finally {
        os.close();
      }
    } catch (IOException e) {
      isOk = false;
    } finally {
      timeSpent += System.nanoTime() - start;
    }
  }

  public TransientModelWithMetainfo load(int majorStep, int minorStep, SModelReference modelReference) {
    long start = System.nanoTime();
    try {

      InputStream stream = myCacheContainer.openStream(getStorageName(majorStep, minorStep));
      ModelInputStream is = new ModelInputStream(stream);
      try {
        return TransientModelWithMetainfo.load(is, modelReference);
      } finally {
        is.close();
      }
    } catch (IOException e) {
      isOk = false;
    } finally {
      timeSpent += System.nanoTime() - start;
    }
    return null;
  }

  public void store() {
    long start = System.nanoTime();
    try {
      ModelOutputStream os = new ModelOutputStream(myCacheContainer.createStream(STEPS));
      try {
        os.writeInt(mySteps.size());
        for (Integer i : mySteps) {
          os.writeInt(i);
        }
      } finally {
        os.close();
      }

      OutputStreamWriter writer = new OutputStreamWriter(myCacheContainer.createStream(SIGNATURE));
      try {
        writer.write(mySignature);
      } finally {
        writer.close();
      }

      if (isOk) {
        myCacheContainer.commit();
      } else {
        myCacheContainer.revert();
      }
    } catch (IOException e) {
      myCacheContainer.revert();
    } finally {
      timeSpent += System.nanoTime() - start;
    }
  }

  public void remove() {
    myCacheContainer.revert();
  }

  public String getTimeSpent() {
    return timeSpent/1000000/1000. + " ms";
  }
}
