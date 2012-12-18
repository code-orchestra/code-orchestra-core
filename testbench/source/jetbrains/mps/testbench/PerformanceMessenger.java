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
package jetbrains.mps.testbench;

import jetbrains.mps.util.FileUtil;
import jetbrains.mps.util.JDOMUtil;
import org.jdom.Document;
import org.jdom.Element;
import org.junit.Assert;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * Evgeny Gryaznov, Oct 7, 2010
 */
public class PerformanceMessenger {

  private Map<String,Long> mySingleValues = new LinkedHashMap<String, Long>();
  private Map<String,Long[]> myPercentValues = new LinkedHashMap<String, Long[]>();

  private static PerformanceMessenger INSTANCE = new PerformanceMessenger();

  public static PerformanceMessenger getInstance() {
    return INSTANCE;
  }

  public synchronized void report(String key, long value) {
    Assert.assertFalse(myPercentValues.containsKey(key));
    Long l = mySingleValues.get(key);
    if(l != null) {
      value += l;
    }
  }

  public synchronized void reportPercent(String key, long amount, long total) {
    Assert.assertFalse(mySingleValues.containsKey(key));
    Long[] l = myPercentValues.get(key);
    if(l != null) {
      l[0] += amount;
      l[1] += total;
    } else {
      myPercentValues.put(key, new Long[]{amount, total});
    }
  }

  public synchronized void generateReport() {
    try {
      File file = new File(System.getProperty("user.dir") + "/teamcity-info.xml");
      if(mySingleValues.isEmpty() && myPercentValues.isEmpty()) {
        FileUtil.delete(file);
        return;
      }
      Element build = new Element("build");
      for(Entry<String,Long> e : mySingleValues.entrySet()) {
        Element child = new Element("statisticValue");
        child.setAttribute("key", e.getKey());
        child.setAttribute("value", Long.toString(e.getValue()));
        build.addContent(child);
      }
      for(Entry<String,Long[]> e : myPercentValues.entrySet()) {
        long amount = e.getValue()[0];
        long total = e.getValue()[1];
        Element child = new Element("statisticValue");
        child.setAttribute("key", e.getKey());
        child.setAttribute("value", Long.toString(amount*100/total));
        build.addContent(child);
      }
      JDOMUtil.writeDocument(new Document(build), file);
    } catch(IOException ex) {
      Assert.fail(ex.getMessage());
    }
  }
}
