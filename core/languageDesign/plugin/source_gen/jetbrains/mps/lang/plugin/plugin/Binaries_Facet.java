package jetbrains.mps.lang.plugin.plugin;

/*Generated by MPS */

import jetbrains.mps.make.facet.IFacet;
import java.util.List;
import jetbrains.mps.make.facet.ITarget;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.make.resources.IPropertiesPersistence;
import jetbrains.mps.make.resources.IResource;
import jetbrains.mps.smodel.resources.IMResource;
import jetbrains.mps.make.script.IJob;
import jetbrains.mps.make.script.IResult;
import jetbrains.mps.make.script.IJobMonitor;
import jetbrains.mps.make.resources.IPropertiesAccessor;
import jetbrains.mps.make.delta.IDelta;
import jetbrains.mps.baseLanguage.tuples.runtime.Tuples;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.internal.collections.runtime.ITranslator2;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.resources.MResource;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.make.script.IFeedback;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.internal.make.runtime.util.FilesDelta;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SModelOperations;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.smodel.SNode;
import org.apache.commons.lang.StringUtils;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.plugins.MacrosUtil;
import jetbrains.mps.baseLanguage.tuples.runtime.MultiTuple;
import jetbrains.mps.smodel.resources.DResource;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.internal.collections.runtime.IVisitor;
import jetbrains.mps.vfs.IFileUtils;
import jetbrains.mps.make.script.IConfig;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import java.util.Map;
import jetbrains.mps.make.script.IPropertiesPool;
import jetbrains.mps.internal.collections.runtime.MapSequence;

public class Binaries_Facet extends IFacet.Stub {
  private List<ITarget> targets = ListSequence.fromList(new ArrayList<ITarget>());
  private IFacet.Name name = new IFacet.Name("jetbrains.mps.lang.plugin.Binaries");

  public Binaries_Facet() {
    ListSequence.fromList(targets).addElement(new Binaries_Facet.Target_copyBinaries());
  }

  public Iterable<ITarget> targets() {
    return targets;
  }

  public Iterable<IFacet.Name> optional() {
    return null;
  }

  public Iterable<IFacet.Name> required() {
    return Sequence.fromArray(new IFacet.Name[]{new IFacet.Name("jetbrains.mps.lang.core.Make"), new IFacet.Name("jetbrains.mps.lang.core.Generate")});
  }

  public Iterable<IFacet.Name> extended() {
    return null;
  }

  public IFacet.Name getName() {
    return this.name;
  }

  public IPropertiesPersistence propertiesPersistence() {
    return new Binaries_Facet.TargetProperties();
  }

  public static class Target_copyBinaries implements ITarget {
    private static Class<? extends IResource>[] EXPECTED_INPUT = (Class<? extends IResource>[]) new Class[]{IMResource.class};
    private static Class<? extends IResource>[] EXPECTED_OUTPUT = (Class<? extends IResource>[]) new Class[]{};

    private ITarget.Name name = new ITarget.Name("jetbrains.mps.lang.plugin.Binaries.copyBinaries");

    public Target_copyBinaries() {
    }

    public IJob createJob() {
      return new IJob.Stub() {
        public IResult execute(final Iterable<IResource> input, final IJobMonitor monitor, final IPropertiesAccessor pa) {
          Iterable<IResource> _output_8acy7z_a0a = null;
          switch (0) {
            case 0:
              final List<IDelta> deltaList = ListSequence.fromList(new ArrayList<IDelta>());
              final Iterable<Tuples._2<IFile, IFile>> filesToCopy = Sequence.fromIterable(input).translate(new ITranslator2<IResource, Tuples._2<IFile, IFile>>() {
                public Iterable<Tuples._2<IFile, IFile>> translate(IResource res) {
                  final IModule module = ((MResource) res).module();
                  return Sequence.fromIterable(((MResource) res).models()).translate(new ITranslator2<SModelDescriptor, Tuples._2<IFile, IFile>>() {
                    public Iterable<Tuples._2<IFile, IFile>> translate(SModelDescriptor smd) {
                      SModel model = smd.getSModel();
                      String output = module.getOutputFor(smd);
                      if (output == null) {
                        monitor.reportFeedback(new IFeedback.ERROR(String.valueOf("no output location for " + smd.getLongName())));
                        return null;
                      } else {
                        IFile outputRoot = (pa.global().properties(Target_copyBinaries.this.getName(), Binaries_Facet.Target_copyBinaries.Parameters.class).pathToFile() != null ?
                          pa.global().properties(Target_copyBinaries.this.getName(), Binaries_Facet.Target_copyBinaries.Parameters.class).pathToFile().invoke(output) :
                          FileSystem.getInstance().getFileByPath(output)
                        );
                        final IFile outputDir = FileGenerationUtil.getDefaultOutputDir(model, outputRoot);
                        final FilesDelta fd = new FilesDelta(outputDir);
                        ListSequence.fromList(deltaList).addElement(fd);
                        return ListSequence.fromList(SModelOperations.getNodes(model, "jetbrains.mps.lang.plugin.structure.Resource")).where(new IWhereFilter<SNode>() {
                          public boolean accept(SNode it) {
                            return StringUtils.isNotEmpty(SPropertyOperations.getString(it, "path"));
                          }
                        }).select(new ISelector<SNode, String>() {
                          public String select(SNode bin) {
                            return MacrosUtil.expandPath(SPropertyOperations.getString(bin, "path"), module.getModuleFqName());
                          }
                        }).where(new IWhereFilter<String>() {
                          public boolean accept(String p) {
                            return p != null;
                          }
                        }).select(new ISelector<String, Tuples._2<IFile, IFile>>() {
                          public Tuples._2<IFile, IFile> select(String p) {
                            IFile fromFile = FileSystem.getInstance().getFileByPath(p);
                            IFile toFile = outputDir.getDescendant(fromFile.getName());
                            fd.written(toFile);
                            return MultiTuple.<IFile,IFile>from(fromFile, toFile);
                          }
                        });
                      }
                    }
                  });
                }
              });
              _output_8acy7z_a0a = Sequence.fromIterable(_output_8acy7z_a0a).concat(Sequence.fromIterable(Sequence.<IResource>singleton(new DResource(deltaList))));

              ThreadUtils.runInUIThreadAndWait(new Runnable() {
                public void run() {
                  ModelAccess.instance().requireWrite(new Runnable() {
                    public void run() {
                      Sequence.fromIterable(filesToCopy).toListSequence().visitAll(new IVisitor<Tuples._2<IFile, IFile>>() {
                        public void visit(Tuples._2<IFile, IFile> ftc) {
                          IFileUtils.copyFileContent(ftc._0(), ftc._1());
                        }
                      });
                    }
                  });
                }
              });
            default:
              return new IResult.SUCCESS(_output_8acy7z_a0a);
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
      return Sequence.fromArray(new ITarget.Name[]{new ITarget.Name("jetbrains.mps.lang.core.Generate.configure")});
    }

    public Iterable<ITarget.Name> notBefore() {
      return null;
    }

    public Iterable<ITarget.Name> before() {
      return Sequence.fromArray(new ITarget.Name[]{new ITarget.Name("jetbrains.mps.lang.core.Make.make"), new ITarget.Name("jetbrains.mps.lang.core.Make.reconcile")});
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

    public static class Parameters extends MultiTuple._1<_FunctionTypes._return_P1_E0<? extends IFile, ? super String>> {
      public Parameters() {
        super();
      }

      public Parameters(_FunctionTypes._return_P1_E0<? extends IFile, ? super String> pathToFile) {
        super(pathToFile);
      }

      public _FunctionTypes._return_P1_E0<? extends IFile, ? super String> pathToFile(_FunctionTypes._return_P1_E0<? extends IFile, ? super String> value) {
        return super._0(value);
      }

      public _FunctionTypes._return_P1_E0<? extends IFile, ? super String> pathToFile() {
        return super._0();
      }

      @SuppressWarnings(value = "unchecked")
      public Binaries_Facet.Target_copyBinaries.Parameters assignFrom(Tuples._1<_FunctionTypes._return_P1_E0<? extends IFile, ? super String>> from) {
        return (Binaries_Facet.Target_copyBinaries.Parameters) super.assign(from);
      }
    }
  }

  public static class TargetProperties implements IPropertiesPersistence {
    public TargetProperties() {
    }

    public void storeValues(Map<String, String> store, IPropertiesPool properties) {
      {
        ITarget.Name name = new ITarget.Name("jetbrains.mps.lang.plugin.Binaries.copyBinaries");
        if (properties.hasProperties(name)) {
          Binaries_Facet.Target_copyBinaries.Parameters props = properties.properties(name, Binaries_Facet.Target_copyBinaries.Parameters.class);
          MapSequence.fromMap(store).put("jetbrains.mps.lang.plugin.Binaries.copyBinaries.pathToFile", null);
        }
      }
    }

    public void loadValues(Map<String, String> store, IPropertiesPool properties) {
      try {
        {
          ITarget.Name name = new ITarget.Name("jetbrains.mps.lang.plugin.Binaries.copyBinaries");
          Binaries_Facet.Target_copyBinaries.Parameters props = properties.properties(name, Binaries_Facet.Target_copyBinaries.Parameters.class);
          if (MapSequence.fromMap(store).containsKey("jetbrains.mps.lang.plugin.Binaries.copyBinaries.pathToFile")) {
            props.pathToFile(null);
          }
        }
      } catch (RuntimeException re) {
      }
    }
  }
}
