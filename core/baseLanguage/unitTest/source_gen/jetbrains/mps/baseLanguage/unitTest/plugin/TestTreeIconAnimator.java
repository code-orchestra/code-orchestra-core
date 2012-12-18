package jetbrains.mps.baseLanguage.unitTest.plugin;

/*Generated by MPS */

import com.intellij.openapi.Disposable;
import javax.swing.Icon;
import com.intellij.execution.testframework.TestsUIUtil;
import com.intellij.util.Alarm;
import com.intellij.openapi.util.Disposer;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.ModelAccess;

public class TestTreeIconAnimator implements Disposable, Runnable {
  private static final int FRAMES_COUNT = 8;
  private static final int MOVIE_TIME = 800;
  private static final int FRAME_TIME = MOVIE_TIME / FRAMES_COUNT;
  private static Icon PAUSED_ICON = TestsUIUtil.loadIcon("testPaused");
  private static Icon[] FRAMES = new Icon[FRAMES_COUNT];

  private long myLastInvocationTime = -1;
  private Alarm myAlarm;
  private TestRunState myState;
  private TestTree myTestTree;

  public TestTreeIconAnimator(TestTree testTree) {
    Disposer.register(testTree, this);
    this.myTestTree = testTree;
  }

  public void init(TestRunState state) {
    this.myState = state;
    this.myAlarm = new Alarm();
  }

  public void run() {
    String methodName = this.myState.getCurrentMethod();
    if (methodName != null) {
      final long time = System.currentTimeMillis();
      if (time - this.myLastInvocationTime >= FRAME_TIME) {
        this.myLastInvocationTime = time;
        String className = this.myState.getCurrentClass();
        TestMethodTreeNode methodTreeNode = this.myTestTree.get(className, methodName);
        this.updateTreeNode(methodTreeNode);
        TestCaseTreeNode testTreeNode = this.myTestTree.get(className);
        this.updateTreeNode(testTreeNode);
      }
    }
    this.scheduleRepaint();
  }

  public void scheduleRepaint() {
    if (this.myAlarm == null) {
      return;
    }
    this.myAlarm.cancelAllRequests();
    if (this.myState.getCurrentMethod() != null) {
      this.myAlarm.addRequest(this, FRAME_TIME);
    }
  }

  public void stopMovie() {
    this.cancelAlarm();
  }

  public void dispose() {
    this.cancelAlarm();
  }

  private void updateTreeNode(@Nullable final BaseTestTreeNode node) {
    if (node == null) {
      return;
    }
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        node.renewPresentation();
      }
    });
  }

  private void cancelAlarm() {
    if (this.myAlarm != null) {
      this.myAlarm.cancelAllRequests();
      this.myAlarm = null;
    }
  }

  public static Icon getCurrentFrame() {
    final int index = (int) ((System.currentTimeMillis() % MOVIE_TIME) / FRAME_TIME);
    return FRAMES[index];
  }

  static {
    for (int i = 0; i < FRAMES_COUNT; i++) {
      FRAMES[i] = TestsUIUtil.loadIcon("testInProgress" + (i + 1));
    }
  }
}
