/*
 * Copyright 2000-2009 JetBrains s.r.o.
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
package com.intellij.ide.util;

import com.intellij.featureStatistics.ProductivityFeaturesProvider;
import com.intellij.ide.GeneralSettings;
import com.intellij.ide.IdeBundle;
import com.intellij.openapi.application.ApplicationNamesInfo;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.util.IconLoader;
import com.intellij.openapi.util.JDOMUtil;
import com.intellij.openapi.util.SystemInfo;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jdom.Document;
import org.jdom.Element;
import org.jetbrains.annotations.NonNls;

import javax.swing.*;
import javax.swing.event.HyperlinkEvent;
import javax.swing.event.HyperlinkListener;
import javax.swing.text.html.HTMLEditorKit;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

public class TipPanel extends JPanel {
  private static final Logger LOG = Logger.getInstance("#com.intellij.ide.util.TipPanel");

  private static int DEFAULT_WIDTH;
  private static int DEFAULT_HEIGHT;

  private final JCheckBox myCheckBox;
  private final JEditorPane browser;
  private final ArrayList<String> myTipPaths = new ArrayList<String>();
  private final HashMap<String, Class< ? extends ProductivityFeaturesProvider>> myPathsToProviderMap = new HashMap<String, Class<? extends ProductivityFeaturesProvider>>();
  @NonNls
  private static final String ELEMENT_TIP = "tip";
  @NonNls
  private static final String ATTRIBUTE_FILE = "file";

  static {
    Properties tipPanelProperties = new Properties();
    try {
      tipPanelProperties.load(TipPanel.class.getResourceAsStream("tippanel.properties"));

      if (SystemInfo.isMac) {
        DEFAULT_WIDTH = Integer.parseInt(tipPanelProperties.getProperty("width.mac"));
        DEFAULT_HEIGHT = Integer.parseInt(tipPanelProperties.getProperty("height.mac"));
      } else if (SystemInfo.isWindows) {
        DEFAULT_WIDTH = Integer.parseInt(tipPanelProperties.getProperty("width.win"));
        DEFAULT_HEIGHT = Integer.parseInt(tipPanelProperties.getProperty("height.win"));
      } else {
        DEFAULT_WIDTH = Integer.parseInt(tipPanelProperties.getProperty("width.linux"));
        DEFAULT_HEIGHT = Integer.parseInt(tipPanelProperties.getProperty("height.linux"));
      }
    } catch (IOException e) {
      DEFAULT_WIDTH = 350;
      DEFAULT_HEIGHT = 495;
    }
  }

  public static void main(String[] args) {
    JFrame frame = new JFrame();

    frame.setTitle("Simple example");
    frame.setLocationRelativeTo(null);
    frame.setContentPane(new TipPanel());

    frame.setVisible(true);
  }

  public TipPanel() {
    setLayout(new BorderLayout());
    JLabel jlabel = new JLabel(IconLoader.getIcon("/general/tip.png"));
    jlabel.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 5));
    JLabel jlabel1 = new JLabel(IdeBundle.message("label.did.you.know"));
    Font font = jlabel1.getFont();
    jlabel1.setFont(font.deriveFont(Font.PLAIN, font.getSize() + 4));
    JPanel jpanel = new JPanel();
    jpanel.setLayout(new BorderLayout());
    jpanel.add(jlabel, BorderLayout.WEST);
    jpanel.add(jlabel1, BorderLayout.CENTER);
    jpanel.setBorder(BorderFactory.createEmptyBorder(5, 0, 5, 0));
    add(jpanel, BorderLayout.NORTH);
    browser = new JEditorPane();
    browser.setEditable(false);
    browser.setEditorKit(new HTMLEditorKit());
    browser.setBackground(Color.white);
    browser.addHyperlinkListener(
      new HyperlinkListener() {
        public void hyperlinkUpdate(HyperlinkEvent e) {
          if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {
            //TODO: Open url in browser
          }
        }
      }
    );
    JScrollPane scrollPane = ScrollPaneFactory.createScrollPane(browser);
    add(scrollPane, BorderLayout.CENTER);
    myCheckBox = new JCheckBox(IdeBundle.message("checkbox.show.tips.on.startup"), true);
    myCheckBox.setBorder(BorderFactory.createEmptyBorder(5, 0, 0, 0));

    final GeneralSettings settings = GeneralSettings.getInstance();
    myCheckBox.setSelected(settings.showTipsOnStartup());
    myCheckBox.addItemListener(new ItemListener() {
      public void itemStateChanged(ItemEvent e) {
        settings.setShowTipsOnStartup(e.getStateChange() == ItemEvent.SELECTED);
      }
    });
    add(myCheckBox, BorderLayout.SOUTH);

    try {
      readTips();
    }
    catch (Exception exception) {
      exception.printStackTrace();
    }
  }

  public Dimension getPreferredSize() {
    return new Dimension(DEFAULT_WIDTH, DEFAULT_HEIGHT);
  }

  public Dimension getMaximumSize() {
    return new Dimension(DEFAULT_WIDTH, DEFAULT_HEIGHT);
  }

  public void prevTip() {
    if (myTipPaths.size() == 0) {
      browser.setText(IdeBundle.message("error.tips.not.found", ApplicationNamesInfo.getInstance().getFullProductName()));
      return;
    }
    GeneralSettings settings = GeneralSettings.getInstance();
    int lastTip = settings.getLastTip();

    String path;
    lastTip--;
    if (lastTip <= 0) {
      path = myTipPaths.get(myTipPaths.size() - 1);
      lastTip = myTipPaths.size();
    }
    else {
      path = myTipPaths.get(lastTip - 1);
    }

    setTip(path, lastTip, browser, settings);
  }

  @CodeOrchestraPatch
  private void setTip(String path, int lastTip, JEditorPane browser, GeneralSettings settings) {
    // RE-2550
    if (path.toLowerCase().endsWith(".gif")) {
      OnePictureTipUIUtil.openTipInBrowser(path, browser);
    } else {
      TipUIUtil.openTipInBrowser(path, browser, myPathsToProviderMap.get(path));
    }

    settings.setLastTip(lastTip);
  }

  public void nextTip() {
    if (myTipPaths.size() == 0) {
      browser.setText(IdeBundle.message("error.tips.not.found", ApplicationNamesInfo.getInstance().getFullProductName()));
      return;
    }
    GeneralSettings settings = GeneralSettings.getInstance();
    int lastTip = settings.getLastTip();
    String path;
    lastTip++;
    if (lastTip - 1 >= myTipPaths.size()) {
      path = myTipPaths.get(0);
      lastTip = 1;
    }
    else {
      path = myTipPaths.get(lastTip - 1);
    }

    setTip(path, lastTip, browser, settings);
  }

  private void readTips() throws Exception {
    @NonNls String tipsURL = "/tips/" + "tips.xml";
    Document document = JDOMUtil.loadDocument(getClass().getResource(tipsURL).openStream());
    if (document == null) return;
    for (Iterator iterator = document.getRootElement().getChildren(ELEMENT_TIP).iterator(); iterator.hasNext();) {
      Element element = (Element)iterator.next();
      myTipPaths.add(element.getAttributeValue(ATTRIBUTE_FILE));
    }
  }
}
