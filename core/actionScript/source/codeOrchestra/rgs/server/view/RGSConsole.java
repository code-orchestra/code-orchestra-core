package codeOrchestra.rgs.server.view;

import jetbrains.mps.nodeEditor.DefaultEditorSettingsHelper;

import javax.swing.*;
import javax.swing.text.DefaultCaret;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.PrintStream;

/**
 * @author Alexander Eliseyev
 */
public class RGSConsole {

  public static final int MAX_LINES_COUNT = 500;

  public static void init() {
    JFrame frame = new JFrame("Code Orchestra RGS");
    frame.addWindowListener(new WindowAdapter() {
      @Override
      public void windowClosing(WindowEvent windowEvent) {
        new Thread() {
          @Override
          public void run() {
            System.exit(0);
          }
        }.start();
      }
    });
    frame.add(new JLabel("Output:"), BorderLayout.NORTH);

    JTextArea ta = new JTextArea();
    Font font = new Font(DefaultEditorSettingsHelper.getDefaultFontFamily(), Font.PLAIN, DefaultEditorSettingsHelper.getDefaultFontSize() - 1);
    ta.setFont(font);

    DefaultCaret caret = (DefaultCaret) ta.getCaret();
    caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);

    TextAreaOutputStream textAreaOutputStream = new TextAreaOutputStream(ta, MAX_LINES_COUNT);
    PrintStream ps = new PrintStream(textAreaOutputStream);
    System.setOut(ps);
    System.setErr(ps);

    Toolkit tk = Toolkit.getDefaultToolkit();
    Dimension screenSize = tk.getScreenSize();
    final int WIDTH = screenSize.width;
    final int HEIGHT = screenSize.height;
    frame.setLocation(WIDTH / 4, HEIGHT / 4);

    JScrollPane scrollPane = new JScrollPane(ta);

    scrollPane.setMinimumSize(new Dimension(500, 300));
    scrollPane.setPreferredSize(new Dimension(900, 400));

    scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
    scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

    frame.add(scrollPane);
    frame.pack();
    frame.setVisible(true);
  }

}