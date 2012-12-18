package codeOrchestra.rgs.server.view;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;
import java.awt.BorderLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.io.PrintStream;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

public class Console extends JFrame {
  PipedInputStream piOut;
  PipedInputStream piErr;
  PipedOutputStream poOut;
  PipedOutputStream poErr;
  JTextArea console = new JTextArea();
  public Console(String title) throws IOException {
    // Set up System.out
    piOut = new PipedInputStream();
    poOut = new PipedOutputStream(piOut);
    System.setOut(new PrintStream(poOut, true));

    // Set up System.err
    piErr = new PipedInputStream();
    poErr = new PipedOutputStream(piErr);
    System.setErr(new PrintStream(poErr, true));

    // Add a scrolling text area
    console.setEditable(false);
    console.setRows(20);
    console.setColumns(50);
    getContentPane().add(new JScrollPane(console), BorderLayout.CENTER);
    pack();


    setTitle(title);
    setVisible(true);

    addWindowListener(new WindowAdapter() {
      @Override
      public void windowClosing(WindowEvent windowEvent) {
        System.exit(0);
      }
    });

    // Create reader threads
    new ReaderThread(piOut).start();
    new ReaderThread(piErr).start();
  }

  class ReaderThread extends Thread
  {
    PipedInputStream pi;
    Queue q;

    ReaderThread(PipedInputStream pi)
    {
      this.pi = pi;
      q = new LinkedBlockingQueue();
    }
    @Override
    public void run() {
      final byte[] buf = new byte[1024];
      try {
        while (true) {
          final int len = pi.read(buf);
          if (len == -1) {
            break;
          }
          q.add(new String(buf, 0, len));
          SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
              String input =  (String) q.poll();
              if(input==null)
                return;
              console.append(input);

// Make sure the last line is always visible
              console.setCaretPosition(console.getDocument().getLength());
// Keep the text area down to a certain character size
              int idealSize = 1000;
              int maxExcess = 500;
              int excess = console.getDocument().getLength() - idealSize;
              if (excess >= maxExcess) {
                console.replaceRange("", 0, excess);
              }
            }
          });
        }
      } catch (IOException e) {
      }
    }
  }
}