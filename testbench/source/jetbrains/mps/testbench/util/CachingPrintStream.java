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
package jetbrains.mps.testbench.util;

import java.io.*;

/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: Aug 18, 2010
 * Time: 1:07:22 PM
 * To change this template use File | Settings | File Templates.
 */
public class CachingPrintStream extends PrintStream implements Output {

  private final int LS_BYTES;

  private int bytes = 0;
  private StringBuilder buffer = new StringBuilder();
  private String name;
  private boolean caching;

  public CachingPrintStream(OutputStream out, String name) {
    super(out);
    this.name = name;
    this.LS_BYTES = System.getProperty("line.separator").getBytes().length;
  }

  public PrintStream getOut () {
    return (PrintStream) out;
  }

  public void startCaching () {
    if (caching) throw new IllegalStateException("Already caching");
    this.caching = true;
  }

  public void stopCaching () {
    if (!caching) throw new IllegalStateException("Not caching");
    this.caching = false;
  }

  public void clear () {
    if (caching) throw new IllegalStateException("Currently caching");
    this.buffer.setLength(0);
    this.bytes = 0;
  }

  @Override
  public synchronized boolean isNotEmpty() {
    return bytes > 0;
  }

  @Override
  public synchronized String getDescription() {
    return bytes + " bytes in " + name;
  }

  @Override
  public synchronized String getText() {
    return buffer.toString();
  }

  public synchronized int getBytesCount() {
    return bytes;
  }

  public synchronized String getBuffer () {
    return buffer.toString();
  }

  @Override
  public synchronized void flush() {
    super.flush();    
  }

  @Override
  public synchronized void close() {
    super.close();
  }

  @Override
  public synchronized void write(int buf) {
    if (caching) {
      bytes++;
      buffer.append((char)buf);
    }
    super.write(buf);
  }

  @Override
  public synchronized void write(byte[] buf) throws IOException {
    if (caching) {
      bytes+=LS_BYTES;
      buffer.append(new String(buf));
    }
    super.write(buf);
  }

  @Override
  public synchronized void write(byte[] buf, int off, int len) {
    if (caching) {
      bytes+=len;
      buffer.append(new String(buf, off, len));
    }
    super.write(buf, off, len);
  }

  @Override
  public synchronized void print(boolean b) {
    if (caching) bytes+=String.valueOf(b).getBytes().length;
    super.print(b);    
  }

  @Override
  public synchronized void print(char c) {
    if (caching) bytes+=String.valueOf(c).getBytes().length;
    super.print(c);    
  }

  @Override
  public synchronized void print(int i) {
    if (caching) bytes+=String.valueOf(i).getBytes().length;
    super.print(i);    
  }

  @Override
  public synchronized void print(long lo) {
    if (caching) bytes+=String.valueOf(lo).getBytes().length;
    super.print(lo);
  }

  @Override
  public synchronized void print(float f) {
    if (caching) bytes+=String.valueOf(f).getBytes().length;
    super.print(f);
  }

  @Override
  public synchronized void print(double d) {
    if (caching) bytes+=String.valueOf(d).getBytes().length;
    super.print(d);
  }

  @Override
  public synchronized void print(char[] s) {
    if (caching) bytes+=String.copyValueOf(s).getBytes().length;
    super.print(s);
  }

  @Override
  public synchronized void print(String s) {
    if (caching) bytes+=String.valueOf(s).getBytes().length;
    super.print(s);
  }

  @Override
  public synchronized void print(Object obj) {
    if (caching) bytes+=String.valueOf(obj).getBytes().length;
    super.print(obj);
  }

  @Override
  public synchronized void println() {
    if (caching) bytes+=LS_BYTES;
    super.println();
  }

  @Override
  public synchronized void println(boolean x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(char x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(int x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(long x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(float x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(double x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(char[] x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(String x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

  @Override
  public synchronized void println(Object x) {
    if (caching) bytes+=LS_BYTES;
    super.println(x);
  }

}
