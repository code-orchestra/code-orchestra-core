package codeOrchestra.actionscript.statistics;

import jetbrains.mps.logging.Logger;
import org.apache.commons.lang.StringUtils;

import java.util.*;
import java.util.Map.Entry;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractTimeStatistics<S extends Object> {

  private final Logger log = Logger.getLogger(getClass().getSimpleName());

  private Map<S, Long> statisticObjectToTime = new HashMap<S, Long>();
  private Map<S, Long> statisticObjectToMax = new HashMap<S, Long>();
  private Map<S, Integer> statisticObjectToCount = new HashMap<S, Integer>();

  private Object monitor = new Object();

  public void reset() {
    synchronized (monitor) {
      statisticObjectToTime.clear();
      statisticObjectToMax.clear();
      statisticObjectToCount.clear();
    }
  }

  protected void addStatObject(S s, long time) {
    synchronized (monitor) {
      // 1 - statisticObjectToTime
      if (!statisticObjectToTime.containsKey(s)) {
        statisticObjectToTime.put(s, time);
      } else {
        statisticObjectToTime.put(s, statisticObjectToTime.get(s) + time);
      }

      // 2 - statisticObjectToMax
      if (!statisticObjectToMax.containsKey(s)) {
        statisticObjectToMax.put(s, time);
      } else {
        statisticObjectToMax.put(s, Math.max(time, statisticObjectToMax.get(s)));
      }

      // 3 - statisticObjectToCount
      if (!statisticObjectToCount.containsKey(s)) {
        statisticObjectToCount.put(s, 1);
      } else {
        statisticObjectToCount.put(s, statisticObjectToCount.get(s) + 1);
      }
    }
  }

  protected abstract String getActionName();

  protected abstract String getStatisticObjectName();

  protected abstract int getTraceCount();

  public void traceAverage() {
    log.info("Top " + getTraceCount() + " " + getStatisticObjectName() + "(s) to " + getActionName() + " (average time):");

    // Create an average time-map
    Map<S, Long> statObjectToAvgTime = new HashMap<S, Long>();
    for (Entry<S, Long> timeEntry : statisticObjectToTime.entrySet()) {
      S statObject = timeEntry.getKey();
      statObjectToAvgTime.put(statObject, timeEntry.getValue() / statisticObjectToCount.get(statObject));
    }

    // Sort its entry set
    List<Entry<S, Long>> averageEntries = new ArrayList<Entry<S, Long>>(statObjectToAvgTime.entrySet());
    Collections.sort(averageEntries, new Comparator<Entry<S, Long>>() {
      public int compare(Entry<S, Long> o1, Entry<S, Long> o2) {
        return -o1.getValue().compareTo(o2.getValue());
      }
    });

    // Trace
    int i = 1;
    for (Entry<S, Long> averageEntry : averageEntries) {
      if (i++ > getTraceCount()) {
        break;
      }

      log.info(StringUtils.capitalize(getActionName()) + " for [" + averageEntry.getKey() + "] took " + averageEntry.getValue() + "ms (average)");
    }
  }

  public void traceMaximum() {
    log.info("Top " + getTraceCount() + " " + getStatisticObjectName() + "(s) to " + getActionName() + " (max time):");

    // Sort statisticObjectToMax entry set
    List<Entry<S, Long>> maxEntries = new ArrayList<Entry<S, Long>>(statisticObjectToMax.entrySet());
    Collections.sort(maxEntries, new Comparator<Entry<S, Long>>() {
      public int compare(Entry<S, Long> o1, Entry<S, Long> o2) {
        return -o1.getValue().compareTo(o2.getValue());
      }
    });

    // Trace
    int i = 1;
    for (Entry<S, Long> maxEntry : maxEntries) {
      if (i++ > getTraceCount()) {
        break;
      }

      log.info(StringUtils.capitalize(getActionName()) + " for [" + maxEntry.getKey() + "] took " + maxEntry.getValue() + "ms (max)");
    }
  }

}
