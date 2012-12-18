package jetbrains.mps.platform.conf.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.ConceptDescriptor;
import java.util.Arrays;
import jetbrains.mps.smodel.runtime.impl.CompiledConceptDescriptor;
import jetbrains.mps.smodel.runtime.interpreted.StructureAspectInterpreted;

public class StructureAspectDescriptor implements jetbrains.mps.smodel.runtime.StructureAspectDescriptor {
  private static String[] stringSwitchCases_1htk8d_a0a0a = new String[]{"jetbrains.mps.platform.conf.structure.AbstractAction", "jetbrains.mps.platform.conf.structure.Action", "jetbrains.mps.platform.conf.structure.ActionReference", "jetbrains.mps.platform.conf.structure.Actions", "jetbrains.mps.platform.conf.structure.BeanExtension", "jetbrains.mps.platform.conf.structure.BeanExtensionAttribute", "jetbrains.mps.platform.conf.structure.BeanExtensionPoint", "jetbrains.mps.platform.conf.structure.Component", "jetbrains.mps.platform.conf.structure.ComponentRoot", "jetbrains.mps.platform.conf.structure.Components", "jetbrains.mps.platform.conf.structure.ComponentsRoot", "jetbrains.mps.platform.conf.structure.ConfigurationXmlDocument", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", "jetbrains.mps.platform.conf.structure.Extension", "jetbrains.mps.platform.conf.structure.ExtensionPoint", "jetbrains.mps.platform.conf.structure.ExtensionPoints", "jetbrains.mps.platform.conf.structure.Extensions", "jetbrains.mps.platform.conf.structure.Group", "jetbrains.mps.platform.conf.structure.GroupReference", "jetbrains.mps.platform.conf.structure.HasLevel", "jetbrains.mps.platform.conf.structure.IActionItem", "jetbrains.mps.platform.conf.structure.IConfiguration", "jetbrains.mps.platform.conf.structure.IConfigurationElement", "jetbrains.mps.platform.conf.structure.IConfigurationElementFragment", "jetbrains.mps.platform.conf.structure.IConfigurationFragment", "jetbrains.mps.platform.conf.structure.IExternalConfigurationFragment", "jetbrains.mps.platform.conf.structure.IPluginConfigurationFragment", "jetbrains.mps.platform.conf.structure.IdeaPluginRoot", "jetbrains.mps.platform.conf.structure.IdeaVersion", "jetbrains.mps.platform.conf.structure.IntefaceExtensionPoint", "jetbrains.mps.platform.conf.structure.InterfaceExtension", "jetbrains.mps.platform.conf.structure.KeyboardShortcut", "jetbrains.mps.platform.conf.structure.MouseShortcut", "jetbrains.mps.platform.conf.structure.Plugin", "jetbrains.mps.platform.conf.structure.PluginDependency", "jetbrains.mps.platform.conf.structure.PluginDetails", "jetbrains.mps.platform.conf.structure.PluginHelpset", "jetbrains.mps.platform.conf.structure.PluginVendor", "jetbrains.mps.platform.conf.structure.RootRoot", "jetbrains.mps.platform.conf.structure.Separator", "jetbrains.mps.platform.conf.structure.Service", "jetbrains.mps.platform.conf.structure.Shortcut", "jetbrains.mps.platform.conf.structure.XInclude"};

  public StructureAspectDescriptor() {
  }

  public ConceptDescriptor getDescriptor(String conceptFqName) {
    switch (Arrays.binarySearch(stringSwitchCases_1htk8d_a0a0a, conceptFqName)) {
      case 0:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.AbstractAction", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfigurationElement", "jetbrains.mps.lang.core.structure.IResolveInfo"}, new String[]{"id", "text", "description", "icon", "popup"}, new String[]{});
      case 1:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Action", "jetbrains.mps.platform.conf.structure.AbstractAction", false, new String[]{"jetbrains.mps.platform.conf.structure.AbstractAction", "jetbrains.mps.platform.conf.structure.IActionItem"}, new String[]{}, new String[]{"actionClass"});
      case 2:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ActionReference", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.platform.conf.structure.IActionItem"}, new String[]{}, new String[]{"action"});
      case 3:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Actions", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 4:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.BeanExtension", "jetbrains.mps.platform.conf.structure.Extension", false, new String[]{"jetbrains.mps.platform.conf.structure.Extension"}, new String[]{}, new String[]{"beanExtensionPoint"});
      case 5:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.BeanExtensionAttribute", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.lang.core.structure.INamedConcept"}, new String[]{"value"}, new String[]{});
      case 6:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.BeanExtensionPoint", "jetbrains.mps.platform.conf.structure.ExtensionPoint", false, new String[]{"jetbrains.mps.platform.conf.structure.ExtensionPoint"}, new String[]{}, new String[]{"beanClass"});
      case 7:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Component", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfigurationElement"}, new String[]{}, new String[]{"ifaceClass", "implClass"});
      case 8:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ComponentRoot", "jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 9:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Components", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfiguration", "jetbrains.mps.platform.conf.structure.HasLevel"}, new String[]{}, new String[]{});
      case 10:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ComponentsRoot", "jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 11:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ConfigurationXmlDocument", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.lang.core.structure.INamedConcept"}, new String[]{}, new String[]{});
      case 12:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.platform.conf.structure.IConfigurationFragment"}, new String[]{}, new String[]{});
      case 13:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 14:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Extension", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfigurationElement"}, new String[]{}, new String[]{"extensionPoint"});
      case 15:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ExtensionPoint", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.lang.core.structure.INamedConcept", "jetbrains.mps.lang.core.structure.IResolveInfo", "jetbrains.mps.platform.conf.structure.IConfigurationElement"}, new String[]{}, new String[]{});
      case 16:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.ExtensionPoints", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 17:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Extensions", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 18:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Group", "jetbrains.mps.platform.conf.structure.AbstractAction", false, new String[]{"jetbrains.mps.platform.conf.structure.AbstractAction"}, new String[]{}, new String[]{"groupClass"});
      case 19:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.GroupReference", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept"}, new String[]{"position"}, new String[]{"group", "anchor"});
      case 20:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.HasLevel", null, true, new String[]{}, new String[]{"level"}, new String[]{});
      case 21:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IActionItem", null, true, new String[]{}, new String[]{}, new String[]{});
      case 22:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IConfiguration", null, true, new String[]{"jetbrains.mps.platform.conf.structure.IConfigurationFragment"}, new String[]{}, new String[]{});
      case 23:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IConfigurationElement", null, true, new String[]{"jetbrains.mps.platform.conf.structure.IConfigurationFragment"}, new String[]{}, new String[]{});
      case 24:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IConfigurationElementFragment", null, true, new String[]{}, new String[]{}, new String[]{});
      case 25:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IConfigurationFragment", null, true, new String[]{}, new String[]{}, new String[]{});
      case 26:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IExternalConfigurationFragment", null, true, new String[]{"jetbrains.mps.platform.conf.structure.IConfigurationFragment"}, new String[]{}, new String[]{});
      case 27:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IPluginConfigurationFragment", null, true, new String[]{}, new String[]{}, new String[]{});
      case 28:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IdeaPluginRoot", "jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 29:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IdeaVersion", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept"}, new String[]{"sinceBuild", "untilBuild"}, new String[]{});
      case 30:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.IntefaceExtensionPoint", "jetbrains.mps.platform.conf.structure.ExtensionPoint", false, new String[]{"jetbrains.mps.platform.conf.structure.ExtensionPoint"}, new String[]{}, new String[]{"iface"});
      case 31:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.InterfaceExtension", "jetbrains.mps.platform.conf.structure.Extension", false, new String[]{"jetbrains.mps.platform.conf.structure.Extension"}, new String[]{}, new String[]{"intefaceExtensionPoint", "impl"});
      case 32:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.KeyboardShortcut", "jetbrains.mps.platform.conf.structure.Shortcut", false, new String[]{"jetbrains.mps.platform.conf.structure.Shortcut"}, new String[]{}, new String[]{});
      case 33:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.MouseShortcut", "jetbrains.mps.platform.conf.structure.Shortcut", false, new String[]{"jetbrains.mps.platform.conf.structure.Shortcut"}, new String[]{}, new String[]{});
      case 34:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Plugin", "jetbrains.mps.platform.conf.structure.IdeaPluginRoot", false, new String[]{"jetbrains.mps.platform.conf.structure.IdeaPluginRoot", "jetbrains.mps.platform.conf.structure.IConfigurationFragment", "jetbrains.mps.lang.core.structure.INamedConcept", "jetbrains.mps.lang.core.structure.IResolveInfo"}, new String[]{"id", "version"}, new String[]{});
      case 35:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.PluginDependency", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept"}, new String[]{"optional", "config"}, new String[]{"plugin"});
      case 36:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.PluginDetails", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept"}, new String[]{"kind", "value"}, new String[]{});
      case 37:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.PluginHelpset", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept"}, new String[]{"file", "path"}, new String[]{});
      case 38:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.PluginVendor", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.lang.core.structure.INamedConcept"}, new String[]{"url", "email", "logo"}, new String[]{});
      case 39:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.RootRoot", "jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlRootNode", "jetbrains.mps.platform.conf.structure.IConfiguration"}, new String[]{}, new String[]{});
      case 40:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Separator", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.platform.conf.structure.IActionItem"}, new String[]{}, new String[]{});
      case 41:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Service", "jetbrains.mps.platform.conf.structure.Extension", false, new String[]{"jetbrains.mps.platform.conf.structure.Extension", "jetbrains.mps.platform.conf.structure.HasLevel"}, new String[]{}, new String[]{"serviceIface", "serviceImpl"});
      case 42:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.Shortcut", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept"}, new String[]{"keystroke", "keystroke2", "keymap"}, new String[]{});
      case 43:
        return new CompiledConceptDescriptor("jetbrains.mps.platform.conf.structure.XInclude", "jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", false, new String[]{"jetbrains.mps.platform.conf.structure.ConfigurationXmlNode", "jetbrains.mps.platform.conf.structure.IExternalConfigurationFragment"}, new String[]{"includeRoot"}, new String[]{"document"});
      default:
        return StructureAspectInterpreted.getInstance().getDescriptor(conceptFqName);
    }
  }
}
