package jetbrains.mps.project.persistence;

/*Generated by MPS */

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import jetbrains.mps.project.structure.modules.LibraryDescriptor;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.util.Macros;
import jetbrains.mps.util.MacrosFactory;
import org.jdom.Document;
import jetbrains.mps.util.JDOMUtil;
import org.jdom.Element;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import jetbrains.mps.xmlQuery.runtime.AttributeUtils;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.List;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.project.structure.modules.ModuleReference;
import java.io.OutputStream;

public class LibraryDescriptorPersistence {
  protected static Log log = LogFactory.getLog(LibraryDescriptorPersistence.class);

  private LibraryDescriptorPersistence() {
  }

  public static LibraryDescriptor loadLibraryDescriptor(final IFile file) {
    final Macros macros = MacrosFactory.libraryDescriptor();
    LibraryDescriptor descriptor;
    try {
      Document document = JDOMUtil.loadDocument(file);
      Element rootElement = document.getRootElement();
      final Element libraryElement = (Element) rootElement;

      assert libraryElement != null;

      descriptor = new _FunctionTypes._return_P0_E0<LibraryDescriptor>() {
        public LibraryDescriptor invoke() {
          final LibraryDescriptor result_u6e1uy_a0a0g0c0a = new LibraryDescriptor();
          final String result_u6e1uy_a0a0a0g0c0a = libraryElement.getAttributeValue("name");
          result_u6e1uy_a0a0g0c0a.setNamespace(result_u6e1uy_a0a0a0g0c0a);

          if (libraryElement.getAttributeValue("uuid") != null) {
            final String result_u6e1uy_a0a2a0a0g0c0a = libraryElement.getAttributeValue("uuid");
            result_u6e1uy_a0a0g0c0a.setUUID(result_u6e1uy_a0a2a0a0g0c0a);
          }

          result_u6e1uy_a0a0g0c0a.getModelRoots().addAll(ModuleDescriptorPersistence.loadModelRoots(AttributeUtils.elementChildren(ListSequence.fromList(AttributeUtils.elementChildren(libraryElement, "models")).first(), "modelRoot"), file, macros));

          List<Dependency> depList = ModuleDescriptorPersistence.loadDependenciesList(ListSequence.fromList(AttributeUtils.elementChildren(libraryElement, "dependencies")).first());
          result_u6e1uy_a0a0g0c0a.getDependencies().addAll(depList);

          result_u6e1uy_a0a0g0c0a.getUsedLanguages().addAll(ListSequence.fromList(AttributeUtils.elementChildren(ListSequence.fromList(AttributeUtils.elementChildren(libraryElement, "usedLanguages")).first(), "usedLanguage")).select(new ISelector<Element, ModuleReference>() {
            public ModuleReference select(Element ul) {
              return ModuleReference.fromString(ul.getText());
            }
          }).toListSequence());
          return result_u6e1uy_a0a0g0c0a;
        }
      }.invoke();
    } catch (Exception e) {
      throw new ModuleReadException(e);
    }
    ModuleDescriptorPersistence.setTimestamp(descriptor, file);
    return descriptor;
  }

  public static void saveLibraryDescriptor(final IFile file, final LibraryDescriptor descriptor) {
    if (file.isReadOnly()) {
      if (log.isErrorEnabled()) {
        log.error("Can't save " + file.getPath());
      }
      return;
    }

    final Macros macros = MacrosFactory.libraryDescriptor();
    Element solElem = new _FunctionTypes._return_P0_E0<Element>() {
      public Element invoke() {
        final Element result_u6e1uy_a0a0d0b = new Element("library");
        if (descriptor.getNamespace() != null) {
          final String result_u6e1uy_a0a0a0a0d0b = descriptor.getNamespace();
          result_u6e1uy_a0a0d0b.setAttribute("name", "" + result_u6e1uy_a0a0a0a0d0b);
        }
        if (descriptor.getUUID() != null) {
          final String result_u6e1uy_a0a1a0a0d0b = descriptor.getUUID();
          result_u6e1uy_a0a0d0b.setAttribute("uuid", "" + result_u6e1uy_a0a1a0a0d0b);
        }

        final Element result_u6e1uy_a3a0a0d0b = new Element("models");
        ModuleDescriptorPersistence.saveModelRoots(result_u6e1uy_a3a0a0d0b, descriptor.getModelRoots(), file, macros);
        result_u6e1uy_a0a0d0b.addContent(result_u6e1uy_a3a0a0d0b);

        ModuleDescriptorPersistence.saveDependencies(result_u6e1uy_a0a0d0b, descriptor);
        return result_u6e1uy_a0a0d0b;
      }
    }.invoke();

    try {
      OutputStream os = file.openOutputStream();
      JDOMUtil.writeDocument(new Document(solElem), os);
    } catch (Exception e) {
      if (log.isErrorEnabled()) {
        log.error("", e);
      }
    }

    ModuleDescriptorPersistence.setTimestamp(descriptor, file);
  }
}
