package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Type;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.BaseConcept;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class MeetType extends Type {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.MeetType";
  public static final String ARGUMENT = "argument";

  public MeetType(SNode node) {
    super(node);
  }

  public int getArgumentsCount() {
    return this.getChildCount(MeetType.ARGUMENT);
  }

  public Iterator<BaseConcept> arguments() {
    return this.children(BaseConcept.class, MeetType.ARGUMENT);
  }

  public List<BaseConcept> getArguments() {
    return this.getChildren(BaseConcept.class, MeetType.ARGUMENT);
  }

  public void addArgument(BaseConcept node) {
    this.addChild(MeetType.ARGUMENT, node);
  }

  public void insertArgument(BaseConcept prev, BaseConcept node) {
    this.insertChild(prev, MeetType.ARGUMENT, node);
  }

  public static MeetType newInstance(SModel sm, boolean init) {
    return (MeetType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.MeetType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MeetType newInstance(SModel sm) {
    return MeetType.newInstance(sm, false);
  }
}
