package codeOrchestra.environment;

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.Triplet;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class EnvironmentLibrary {

  private ModuleReference libraryReference;
  private ModuleReference implementationReference;
  private Environment environment;

  public EnvironmentLibrary(@NotNull String libraryReference, @NotNull String implementationReference, @NotNull Environment environment) {
    this(
      MPSModuleRepository.getInstance().getSolution(libraryReference).getModuleReference(),
      MPSModuleRepository.getInstance().getSolution(implementationReference).getModuleReference(),
      environment
    );
  }

  public EnvironmentLibrary(@NotNull ModuleReference libraryReference, @NotNull ModuleReference implementationReference, @NotNull Environment environment) {
    this.libraryReference = libraryReference;
    this.implementationReference = implementationReference;
    this.environment = environment;
  }

  public Triplet<String, String, Environment> toTriple() {
    return new Triplet<String, String, Environment>(libraryReference.getModuleFqName(), implementationReference.getModuleFqName(), environment);
  }

  public void setLibraryReference(ModuleReference libraryReference) {
    this.libraryReference = libraryReference;
  }

  public void setImplementationReference(ModuleReference implementationReference) {
    this.implementationReference = implementationReference;
  }

  public void setEnvironment(Environment environment) {
    this.environment = environment;
  }

  public ModuleReference getLibraryReference() {
    return libraryReference;
  }

  public ModuleReference getImplementationReference() {
    return implementationReference;
  }

  public Environment getEnvironment() {
    return environment;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    EnvironmentLibrary that = (EnvironmentLibrary) o;

    if (environment != that.environment) return false;
    if (implementationReference != null ? !implementationReference.equals(that.implementationReference) : that.implementationReference != null)
      return false;
    if (libraryReference != null ? !libraryReference.equals(that.libraryReference) : that.libraryReference != null)
      return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = libraryReference != null ? libraryReference.hashCode() : 0;
    result = 31 * result + (implementationReference != null ? implementationReference.hashCode() : 0);
    result = 31 * result + (environment != null ? environment.hashCode() : 0);
    return result;
  }

  @NotNull
  public Element save() {
    final Element result = new Element("environmentLibrary");

    result.setAttribute("libraryReference", libraryReference.toString());
    result.setAttribute("implementationReference", implementationReference.toString());
    result.setAttribute("environment", environment.name());

    return result;
  }

  @NotNull
  public static EnvironmentLibrary loadFrom(Element element) {
    String libraryReference = element.getAttributeValue("libraryReference");
    String implementationReference = element.getAttributeValue("implementationReference");
    Environment environment = Environment.valueOf(element.getAttributeValue("environment"));

    return new EnvironmentLibrary(ModuleReference.fromString(libraryReference),
      ModuleReference.fromString(implementationReference),
      environment);
  }

}
