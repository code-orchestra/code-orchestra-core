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
package jetbrains.mps.runtime;

import jetbrains.mps.util.Interner;
import org.junit.Assert;
import org.junit.Test;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryUsage;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;


/**
 * Created by IntelliJ IDEA.
 * User: fyodor
 * Date: Dec 16, 2010
 * Time: 3:07:02 PM
 * To change this template use File | Settings | File Templates.
 */


public class InternerTest {

  private static final int MEAN_LENGTH = 50;

  private static int magicDivider () {
    return String.valueOf(System.getProperty("os.arch")).contains("64") ? 5 : 3;
  }

  @Test
  public void cacheRandomStrings() {
    final int maxObjects = 20000;
    final int maxThreads = Runtime.getRuntime().availableProcessors()*3;
    final int maxRepetitions = 2000000;

    long[] refTime = computeMedian(new DataProducer() {
      public long[] produce() {
        return new long[] {computePerformanceBenchmark(maxThreads)};
      }
    });

    // stabilize GC
    computeUsedHeap();

    long[] stats = computeMedian(new DataProducer() {
      public long[] produce() {
        long baseLine = computeUsedHeap();
        final Interner interner = new Interner(maxObjects);
        final List<List<String>> listOfLists = new ArrayList<List<String>>();

        long time = loadTestNoOverflow(Collections.synchronizedList(listOfLists), interner, maxObjects, maxThreads, maxRepetitions);

        long used = computeUsedHeap() - baseLine;
        int totalSize = 0;
        for (int idx = listOfLists.size()-1; idx >= 0; --idx) {
          totalSize += listOfLists.get(idx).size();
        }
        return new long[] {time, interner.size(), used, totalSize};
      }
    });

    double perfRatio = stats[0] / (double) refTime[0];
    Assert.assertTrue("Interner perfomance is not within bounds: "+perfRatio,  0.45 < perfRatio && perfRatio < 1.95);

    double memRatio = stats[2] / (double) stats[3] / magicDivider() / MEAN_LENGTH;
    Assert.assertTrue("Interner memory consumption is not within bounds: "+memRatio,  0.30 < memRatio && memRatio < 1.5);
  }

  @Test
  public void stressTestWithRandomStrings() {
    final int maxObjects = 10000;
    final int maxThreads = Runtime.getRuntime().availableProcessors()*3;
    final int maxRepetitions = 100000;

    final int k = Runtime.getRuntime().availableProcessors() > 8 ? 3 : 1;

    long [] refTime = computeMedian(new DataProducer() {
      public long [] produce() {
        return new long [] {k *computePerformanceBenchmark(maxThreads)};
      }
    });

    // stabilize GC
    computeUsedHeap();

    long[] stats = computeMedian(new DataProducer() {
      public long [] produce() {
        long baseLine = computeUsedHeap();
        final Interner interner = new Interner(maxObjects);
        final List<List<String>> listOfLists = new ArrayList<List<String>>();
        long time = loadTestWithOverflow(Collections.synchronizedList(listOfLists), interner, maxObjects, maxThreads, maxRepetitions);

        long used = computeUsedHeap() - baseLine;
        int totalSize = 0;
        for (int idx = listOfLists.size()-1; idx >= 0; --idx) {
          totalSize += listOfLists.get(idx).size();
        }
        return new long[] {time, interner.size(), used, totalSize};
      }
    });

    double perfRatio = stats[0] / (double) refTime[0];
    Assert.assertTrue("Interner perfomance is not within bounds: "+perfRatio,  0.45 < perfRatio && perfRatio < 1.95);

    double memRatio = stats[2] / (double) stats[3] / magicDivider() / MEAN_LENGTH;
    Assert.assertTrue("Interner memory consumption is not within bounds: "+memRatio,  0.45 < memRatio && memRatio < 1.5);
  }

  @Test
  public void stressTestWithSimilarStrings() {
    final int maxObjects = 5000;
    final int maxThreads = Runtime.getRuntime().availableProcessors() * 20;
    final int maxRepetitions = 100000;

    final int k = Runtime.getRuntime().availableProcessors() > 8 ? 3 : 1;

    long[] refTime = computeMedian(new DataProducer() {
      public long[] produce() {
        return new long []{k*computePerformanceBenchmark(maxThreads)};
      }
    });

    // stabilize GC
    computeUsedHeap();

    long[] stats = computeMedian(new DataProducer() {
      public long[] produce() {
        long baseLine = computeUsedHeap();
        final Interner interner = new Interner(maxObjects);
        final List<List<String>> listOfLists = new ArrayList<List<String>>();
        long time = loadTestWithSimilarStrings(Collections.synchronizedList(listOfLists), interner, maxObjects, maxThreads, maxRepetitions);

        long used = computeUsedHeap() - baseLine;
        int totalSize = 0;
        for (int idx = listOfLists.size()-1; idx >= 0; --idx) {
          totalSize += listOfLists.get(idx).size();
        }
        return new long[] {time, interner.size(), used, totalSize};
      }
    });

    double perfRatio = stats[0] / (double) refTime[0];
    Assert.assertTrue("Interner perfomance is not within bounds: "+perfRatio,  0.45 < perfRatio && perfRatio < 1.95);

    double memRatio = stats[2] / (double) stats[3] / magicDivider() / MEAN_LENGTH;
    Assert.assertTrue("Interner memory consumption is not within bounds: "+memRatio,  0.45 < memRatio && memRatio < 1.5);
  }


  private long loadTestNoOverflow(final List<List<String>> listOfLists, final Interner interner, final int maxObjects, final int maxThreads, final int maxRepetitions) {
    final long start = System.currentTimeMillis();

    runInParallel(maxThreads, new Runnable (){
        public void run() {
          Random rnd = new Random ();
          StringBuilder sb = new StringBuilder();
          List<String> list = new ArrayList<String>();
          listOfLists.add(list);
          for (int count=maxObjects/maxThreads/3; count > 0; --count) {
            sb.setLength(0);
            for (int size = Math.max (5, Math.min(200, (int) (rnd.nextGaussian() * 5 + MEAN_LENGTH))); size > 0; --size) {
              sb.append ((char)(rnd.nextInt(127-32)+32));
            }
            list.add (interner.intern(sb.toString()));
          }

          for (int count= maxRepetitions; count > 0; --count) {
            String s = list.get(rnd.nextInt(list.size()));
            Assert.assertSame(s, interner.intern(s));
          }

        }
      });

    return System.currentTimeMillis() - start;
  }

  private long loadTestWithOverflow(final List<List<String>> listOfLists, final Interner interner, final int maxObjects, final int maxThreads, final int maxRepetitions) {
    final long start = System.currentTimeMillis();

    runInParallel(maxThreads, new Runnable (){
        public void run() {
          Random rnd = new Random ();
          StringBuilder sb = new StringBuilder();
          List<String> list = new ArrayList<String>();
          listOfLists.add(list);
          for (int count=maxObjects*2; count > 0; --count) {
            sb.setLength(0);
            for (int size = Math.max (5, Math.min(200, (int) (rnd.nextGaussian() * 5 + MEAN_LENGTH))); size > 0; --size) {
              sb.append ((char)(rnd.nextInt(127-32)+32));
            }
            list.add (interner.intern(sb.toString()));
          }

          for (int count= maxRepetitions; count > 0; --count) {
            String s = list.get(rnd.nextInt(list.size()));
            Assert.assertEquals(s, interner.intern(s));
          }

        }
      });

    return System.currentTimeMillis() - start;
  }

  private long loadTestWithSimilarStrings(final List<List<String>> listOfLists, final Interner interner, final int maxObjects, final int maxThreads, final int maxRepetitions) {
    final long start = System.currentTimeMillis();

    final long seed = System.currentTimeMillis();
    runInParallel(maxThreads, new Runnable (){
        public void run() {
          Random rnd = new Random (seed);
          StringBuilder sb = new StringBuilder();
          List<String> list = new ArrayList<String>();
          listOfLists.add(list);
          for (int count=maxObjects*2; count > 0; --count) {
            sb.setLength(0);
            for (int size = Math.max (5, Math.min(200, (int) (rnd.nextGaussian() * 5 + MEAN_LENGTH))); size > 0; --size) {
              sb.append ((char)(rnd.nextInt(127-32)+32));
            }
            list.add (/*interner.intern*/(sb.toString()));
          }

          rnd = new Random ();
          for (int count= maxRepetitions; count > 0; --count) {
            String s = list.get(rnd.nextInt(list.size()));
            Assert.assertEquals(s, interner.intern(s));
          }

        }
      });

    return System.currentTimeMillis() - start;
  }


  private void runInParallel (int maxThreads, final Runnable runnable) {
    int threads = maxThreads;
    final RuntimeException[] rex = new RuntimeException[maxThreads];
    final CyclicBarrier cbstart = new CyclicBarrier(threads);
    final CyclicBarrier cbend = new CyclicBarrier(threads+1);

    while (--threads>=0) {
      final int reidx = threads;
      new Thread (new Runnable() {
        public void run() {
          try {
            cbstart.await();
          }
          catch (InterruptedException ignore) {}
          catch (BrokenBarrierException ignore) {}

          try {
            runnable.run();
          }
          catch (RuntimeException re) {
            rex[reidx] = re;
          }
          catch (Error er) {
            rex[reidx] = new RuntimeException(er);
          }

          try {
            cbend.await();
          }
          catch (InterruptedException ignore) {}
          catch (BrokenBarrierException ignore) {}
        }
      }).start ();
    }

    try {
      cbend.await();
    }
    catch (InterruptedException ignore) {}
    catch (BrokenBarrierException ignore) {}

    // propagate exceptions
    List<RuntimeException> rexlist = new ArrayList<RuntimeException>();
    for (int i=rex.length-1; i>=0; --i) {
      if (rex[i] != null) {
        rexlist.add(rex[i]);
      }
    }
    if (rexlist.size() == 1) {
      throw rexlist.get(0);
    }
    if (rexlist.size() > 1) {
      for(RuntimeException re: rexlist) {
        re.printStackTrace();
      }
      throw new CompositeRuntimeException(rexlist);
    }
  }

  private long computePerformanceBenchmark (int maxThreads) {
    long start = System.currentTimeMillis();
    final int reps = 150000/maxThreads;

    final List<int[]> list = Collections.synchronizedList(new ArrayList<int[]>());

    runInParallel(maxThreads, new Runnable() {
      public void run() {
        Random rnd = new Random();
        for (int count = reps; count > 0; --count) {
          int size = Math.max (20, Math.min(70, (int) (rnd.nextGaussian() * 10. + MEAN_LENGTH)));
          list.add(new int[size]);
        }
      }
    });

    long alloc = -start + (start = System.currentTimeMillis());

    runInParallel(maxThreads, new Runnable() {
      public void run() {
        Random rnd = new Random();
        for (int[] iarr: list) {
          for (int i=0; i<iarr.length; ++i) {
            iarr[i] = rnd.nextInt();
          }
        }
      }
    });

    long filled = -start + (start = System.currentTimeMillis());

    list.clear();
    System.gc();
    System.gc();
    try {
      Thread.sleep(100);
    } catch (InterruptedException e) {}
    System.gc();

    return alloc + filled;
  }

  private long computeUsedHeap () {
    System.gc();
    System.gc();
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {}
    System.gc();

    MemoryUsage hmu = ManagementFactory.getMemoryMXBean().getHeapMemoryUsage();
    return hmu.getUsed();
  }

  private long[] computeMedian (DataProducer lp) {
    List<long[]> data = new ArrayList<long[]>();
    for (int count=10; count>0; --count) {
      data.add(lp.produce());
    }

    List<Long> medians = new ArrayList<Long>();
with_samples:
    for (int i=0; ;++i) {
      List<Long> samples = new ArrayList<Long>();
      for (long[] smpl: data) {
        if (smpl.length <= i) { break with_samples; }
        samples.add(smpl[i]);
      }
      Collections.sort(samples);
      int middle = samples.size()/2;
      medians.add((samples.get(middle-1)+samples.get(middle))/2);
    }
    long[] retVal = new long[medians.size()];
    for (int i=0; i<medians.size();i++) {
      retVal[i] = medians.get(i);
    }
    return retVal;
  }

  private static interface DataProducer {
    public long[] produce();
  }

  public static class CompositeRuntimeException extends RuntimeException {
    private final List<RuntimeException> myCauses;

    public CompositeRuntimeException (List<RuntimeException> causes) {
      myCauses = causes;
    }

    @Override
    public String toString() {
      return myCauses.toString();
    }
  }

}
