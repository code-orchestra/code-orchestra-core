package jetbrains.mps.make.sandbox.sample;

/*Generated by MPS */

import jetbrains.mps.make.facet.IFacet;
import java.util.List;
import jetbrains.mps.make.facet.ITarget;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.make.resources.IPropertiesPersistence;
import jetbrains.mps.make.resources.IResource;
import jetbrains.mps.make.script.IJob;
import jetbrains.mps.make.script.IResult;
import jetbrains.mps.make.script.IJobMonitor;
import jetbrains.mps.make.resources.IPropertiesAccessor;
import jetbrains.mps.make.script.IConfig;
import jetbrains.mps.baseLanguage.tuples.runtime.Tuples;
import jetbrains.mps.baseLanguage.tuples.runtime.MultiTuple;
import java.util.Map;
import jetbrains.mps.make.script.IPropertiesPool;
import jetbrains.mps.internal.collections.runtime.MapSequence;

public class FFFFacet_Facet extends IFacet.Stub {
  private List<ITarget> targets = ListSequence.fromList(new ArrayList<ITarget>());
  private IFacet.Name name = new IFacet.Name("FFFFacet");

  public FFFFacet_Facet() {
    ListSequence.fromList(targets).addElement(new FFFFacet_Facet.Target_QQQ());
    ListSequence.fromList(targets).addElement(new FFFFacet_Facet.Target_qweqwe());
    ListSequence.fromList(targets).addElement(new FFFFacet_Facet.Target_Nanana());
  }

  public Iterable<ITarget> targets() {
    return targets;
  }

  public Iterable<IFacet.Name> optional() {
    return Sequence.fromArray(new IFacet.Name[]{new IFacet.Name("GenerateSpecial")});
  }

  public Iterable<IFacet.Name> required() {
    return Sequence.fromArray(new IFacet.Name[]{new IFacet.Name("Generate")});
  }

  public Iterable<IFacet.Name> extended() {
    return Sequence.fromArray(new IFacet.Name[]{new IFacet.Name("Generate")});
  }

  public IFacet.Name getName() {
    return this.name;
  }

  public IPropertiesPersistence propertiesPersistence() {
    return new FFFFacet_Facet.TargetProperties();
  }

  public static class Target_QQQ implements ITarget {
    private static Class<? extends IResource>[] EXPECTED_INPUT = (Class<? extends IResource>[]) new Class[]{};
    private static Class<? extends IResource>[] EXPECTED_OUTPUT = (Class<? extends IResource>[]) new Class[]{};

    private ITarget.Name name = new ITarget.Name("FFFFacet.QQQ");

    public Target_QQQ() {
    }

    public IJob createJob() {
      return new IJob.Stub() {
        public IResult execute(final Iterable<IResource> input, final IJobMonitor monitor, final IPropertiesAccessor pa) {
          Iterable<IResource> _output_chixuw_a0a = null;
          switch (0) {
            case 0:
              pa.forResource(Sequence.fromIterable(input).first()).properties(Target_QQQ.this.getName(), FFFFacet_Facet.Target_QQQ.Parameters.class).text();
              new IFacet.Name("FFFFacet");
              pa.global().properties(new ITarget.Name("GenerateSpecial.GenerateSpecialTarget"), GenerateSpecial_Facet.Target_GenerateSpecialTarget.Variables.class).bar(0);
              return new IResult.SUCCESS(_output_chixuw_a0a);
            default:
              return new IResult.SUCCESS(_output_chixuw_a0a);
          }
        }
      };
    }

    public IConfig createConfig() {
      return null;
    }

    public Iterable<ITarget.Name> notAfter() {
      return Sequence.fromArray(new ITarget.Name[]{new ITarget.Name("GenerateSpecial.GenerateSpecialTarget")});
    }

    public Iterable<ITarget.Name> after() {
      return null;
    }

    public Iterable<ITarget.Name> notBefore() {
      return null;
    }

    public Iterable<ITarget.Name> before() {
      return null;
    }

    public ITarget.Name getName() {
      return name;
    }

    public boolean requiresInput() {
      return true;
    }

    public boolean producesOutput() {
      return true;
    }

    public Iterable<Class<? extends IResource>> expectedInput() {
      return Sequence.fromArray(EXPECTED_INPUT);
    }

    public Iterable<Class<? extends IResource>> expectedOutput() {
      return null;
    }

    public <T> T createParameters(Class<T> cls) {
      return cls.cast(new Parameters());
    }

    public <T> T createParameters(Class<T> cls, T copyFrom) {
      T t = createParameters(cls);
      if (t != null) {
        ((Tuples._1) t).assign((Tuples._1) copyFrom);
      }
      return t;
    }

    public static class Parameters extends MultiTuple._1<String> {
      public Parameters() {
        super();
      }

      public Parameters(String text) {
        super(text);
      }

      public String text(String value) {
        return super._0(value);
      }

      public String text() {
        return super._0();
      }

      @SuppressWarnings(value = "unchecked")
      public FFFFacet_Facet.Target_QQQ.Parameters assignFrom(Tuples._1<String> from) {
        return (FFFFacet_Facet.Target_QQQ.Parameters) super.assign(from);
      }
    }
  }

  public static class Target_qweqwe implements ITarget {
    private static Class<? extends IResource>[] EXPECTED_INPUT = (Class<? extends IResource>[]) new Class[]{};
    private static Class<? extends IResource>[] EXPECTED_OUTPUT = (Class<? extends IResource>[]) new Class[]{};

    private ITarget.Name name = new ITarget.Name("FFFFacet.qweqwe");

    public Target_qweqwe() {
    }

    public IJob createJob() {
      return new IJob.Stub() {
        public IResult execute(final Iterable<IResource> input, final IJobMonitor monitor, final IPropertiesAccessor pa) {
          Iterable<IResource> _output_chixuw_a0b = null;
          switch (0) {
            case 0:
              pa.global().properties(new ITarget.Name("FFFFacet.QQQ"), FFFFacet_Facet.Target_QQQ.Parameters.class).text();
              monitor.currentProgress().beginWork("Foobar", 10, monitor.currentProgress().workLeft());
              monitor.currentProgress().advanceWork("Foobar", 10);
              monitor.currentProgress().finishWork("Foobar");
              new IFacet.Name("GGG");
            default:
              return new IResult.SUCCESS(_output_chixuw_a0b);
          }
        }
      };
    }

    public IConfig createConfig() {
      return null;
    }

    public Iterable<ITarget.Name> notAfter() {
      return null;
    }

    public Iterable<ITarget.Name> after() {
      return null;
    }

    public Iterable<ITarget.Name> notBefore() {
      return null;
    }

    public Iterable<ITarget.Name> before() {
      return null;
    }

    public ITarget.Name getName() {
      return name;
    }

    public boolean requiresInput() {
      return true;
    }

    public boolean producesOutput() {
      return true;
    }

    public Iterable<Class<? extends IResource>> expectedInput() {
      return Sequence.fromArray(EXPECTED_INPUT);
    }

    public Iterable<Class<? extends IResource>> expectedOutput() {
      return null;
    }

    public <T> T createParameters(Class<T> cls) {
      return null;
    }

    public <T> T createParameters(Class<T> cls, T copyFrom) {
      T t = createParameters(cls);
      return t;
    }
  }

  public static class Target_Nanana implements ITarget {
    private static Class<? extends IResource>[] EXPECTED_INPUT = (Class<? extends IResource>[]) new Class[]{};
    private static Class<? extends IResource>[] EXPECTED_OUTPUT = (Class<? extends IResource>[]) new Class[]{};

    private ITarget.Name name = new ITarget.Name("FFFFacet.Nanana");

    public Target_Nanana() {
    }

    public IJob createJob() {
      return new IJob.Stub() {
        public IResult execute(final Iterable<IResource> input, final IJobMonitor monitor, final IPropertiesAccessor pa) {
          Iterable<IResource> _output_chixuw_a0c = null;
          switch (0) {
            case 0:
            default:
              return new IResult.SUCCESS(_output_chixuw_a0c);
          }
        }
      };
    }

    public IConfig createConfig() {
      return null;
    }

    public Iterable<ITarget.Name> notAfter() {
      return null;
    }

    public Iterable<ITarget.Name> after() {
      return null;
    }

    public Iterable<ITarget.Name> notBefore() {
      return null;
    }

    public Iterable<ITarget.Name> before() {
      return null;
    }

    public ITarget.Name getName() {
      return name;
    }

    public boolean requiresInput() {
      return true;
    }

    public boolean producesOutput() {
      return true;
    }

    public Iterable<Class<? extends IResource>> expectedInput() {
      return Sequence.fromArray(EXPECTED_INPUT);
    }

    public Iterable<Class<? extends IResource>> expectedOutput() {
      return null;
    }

    public <T> T createParameters(Class<T> cls) {
      return null;
    }

    public <T> T createParameters(Class<T> cls, T copyFrom) {
      T t = createParameters(cls);
      return t;
    }
  }

  public static class TargetProperties implements IPropertiesPersistence {
    public TargetProperties() {
    }

    public void storeValues(Map<String, String> store, IPropertiesPool properties) {
      {
        ITarget.Name name = new ITarget.Name("FFFFacet.QQQ");
        if (properties.hasProperties(name)) {
          FFFFacet_Facet.Target_QQQ.Parameters props = properties.properties(name, FFFFacet_Facet.Target_QQQ.Parameters.class);
          MapSequence.fromMap(store).put("FFFFacet.QQQ.text", String.valueOf(props.text()));
        }
      }
    }

    public void loadValues(Map<String, String> store, IPropertiesPool properties) {
      try {
        {
          ITarget.Name name = new ITarget.Name("FFFFacet.QQQ");
          FFFFacet_Facet.Target_QQQ.Parameters props = properties.properties(name, FFFFacet_Facet.Target_QQQ.Parameters.class);
          if (MapSequence.fromMap(store).containsKey("FFFFacet.QQQ.text")) {
            props.text(String.valueOf(MapSequence.fromMap(store).get("FFFFacet.QQQ.text")));
          }
        }
      } catch (RuntimeException re) {
      }
    }
  }
}
