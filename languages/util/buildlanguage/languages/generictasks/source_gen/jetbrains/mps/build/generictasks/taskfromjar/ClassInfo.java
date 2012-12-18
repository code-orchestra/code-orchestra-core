package jetbrains.mps.build.generictasks.taskfromjar;

/*Generated by MPS */

import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.LinkedHashMap;
import org.objectweb.asm.ClassReader;
import org.objectweb.asm.Attribute;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;
import java.util.Collections;
import java.util.Collection;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

public class ClassInfo<T> {
  private final Class<? extends T> myClass;
  private boolean canHaveInternalText;
  private final Set<ClassInfo.MyAttribute> myAttributes = new LinkedHashSet<ClassInfo.MyAttribute>();
  private final Map<Class<?>, ClassInfo.Nested> myNesteds = new LinkedHashMap<Class<?>, ClassInfo.Nested>();
  private boolean isDeprecated;
  private ClassReader myReader;
  private final String myShortName;
  private String myTag;

  public ClassInfo(Class<? extends T> clazz) {
    this.myClass = clazz;
    this.myShortName = Scanner.getShortClassName(this.myClass);
    ClassInfo.this.extract();
  }

  public ClassInfo(Class<? extends T> clazz, ClassReader reader) {
    this.myClass = clazz;
    this.myReader = reader;
    this.myShortName = Scanner.getShortClassName(this.myClass);
    ClassInfo.this.extract();
  }

  private void extract() {
    if (!(ClassInfo.this.isInterface())) {
      ClassInfo.this.extractCanHaveInternalText();
      ClassInfo.this.extractAttributes();
      ClassInfo.this.extractNesteds();
      ClassInfo.this.extractOther();
    }
  }

  private void extractOther() {
    if (this.myReader != null) {
      this.myReader.accept(new ClassInfo.SimpleClassVisitor(), new Attribute[0], 0);

    }
  }

  private void extractAttributes() {
    Method[] methods = this.myClass.getDeclaredMethods();
    for (Method m : methods) {
      if (m.getName().startsWith("set") && Modifier.isPublic(m.getModifiers()) && (m.getParameterTypes().length == 1)) {
        String name = m.getName().substring("set".length()).toLowerCase();
        ClassInfo.MyAttribute attr = new ClassInfo.MyAttribute(name);
        attr.setType(m.getParameterTypes()[0]);
        this.myAttributes.add(attr);
      }
    }
  }

  private void extractNesteds() {
    Map<Class<?>, List<String>> set = new LinkedHashMap<Class<?>, List<String>>();
    Method[] methods = this.myClass.getMethods();
    for (Method m : methods) {
      if (m.getDeclaringClass().equals(this.myClass) && Modifier.isPublic(m.getModifiers())) {
        if (m.getReturnType().equals(void.class)) {
          String name = m.getName();
          if (name.equals("add") || name.equals("addConfigured")) {
            Class<?>[] paramTypes = m.getParameterTypes();
            if (paramTypes.length == 1) {
              ClassInfo.this.putName(paramTypes[0], Scanner.getShortClassName(paramTypes[0]));
            }
          } else
          if (name.equals("addInner")) {
            Class<?>[] paramTypes = m.getParameterTypes();
            if (paramTypes.length == 1) {
              ClassInfo.this.putName(paramTypes[0], name.substring("add".length()).toLowerCase());
            }
          } else
          if (name.equals("addConfiguredInner")) {
            Class<?>[] paramTypes = m.getParameterTypes();
            if (paramTypes.length == 1) {
              ClassInfo.this.putName(paramTypes[0], name.substring("addConfigured".length()).toLowerCase());
            }
          } else
          if (name.startsWith("add")) {
            Class<?>[] paramTypes = m.getParameterTypes();
            if (paramTypes.length == 1) {
              ClassInfo.this.putName(paramTypes[0], name.substring("add".length()).toLowerCase());
            }
          }
        } else
        if (m.getName().startsWith("create") && (m.getParameterTypes().length == 0)) {
          ClassInfo.this.putName(m.getReturnType(), m.getName().substring("create".length()).toLowerCase());
        }
      }
    }
  }

  private void putName(Class<?> type, String name) {
    ClassInfo.Nested nested;
    if (this.myNesteds.containsKey(type)) {
      nested = this.myNesteds.get(type);
    } else {
      nested = new ClassInfo.Nested(type);
      this.myNesteds.put(type, nested);
    }
    nested.addName(name);
  }

  private void extractCanHaveInternalText() {
    try {
      Method addText = this.myClass.getMethod("addText", String.class);
      if (Modifier.isPublic(addText.getModifiers())) {
        this.canHaveInternalText = true;
      }
    } catch (NoSuchMethodException e) {
    }
  }

  public boolean isInterface() {
    return this.myClass.isInterface();
  }

  public boolean isAbstract() {
    return Modifier.isAbstract(this.myClass.getModifiers());
  }

  public boolean isDeprecated() {
    return this.isDeprecated;
  }

  public boolean canHaveInternalText() {
    return this.canHaveInternalText;
  }

  public Class<?> getParentClass() {
    return this.myClass.getSuperclass();
  }

  public Class<?>[] getInterfaces() {
    return this.myClass.getInterfaces();
  }

  public Set<ClassInfo.MyAttribute> getAttributes() {
    return Collections.unmodifiableSet(this.myAttributes);
  }

  public Collection<ClassInfo.Nested> getNesteds() {
    return this.myNesteds.values();
  }

  public Class<?> getDeclarationClass() {
    return this.myClass;
  }

  public String getShortName() {
    return this.myShortName;
  }

  @Override
  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append(this.myShortName);
    sb.append(" ");
    sb.append(this.myClass);
    if (ClassInfo.this.isAbstract()) {
      sb.append(" abstract");
    }
    if (ClassInfo.this.isInterface()) {
      sb.append(" interface");
    }
    if (this.isDeprecated) {
      sb.append(" deprecated");
    }
    if (ClassInfo.this.getParentClass() != null) {
      sb.append(" parent ");
      sb.append(ClassInfo.this.getParentClass());
    }
    sb.append("\n");
    for (Class impl : ClassInfo.this.getInterfaces()) {
      sb.append(impl);
      sb.append("\n");
    }
    for (ClassInfo.Nested n : this.myNesteds.values()) {
      sb.append(n);
      sb.append("\n");
    }
    for (ClassInfo.MyAttribute attr : this.myAttributes) {
      sb.append(attr);
      sb.append("\n");
    }
    return sb.toString();
  }

  public String getTag() {
    return this.myTag;
  }

  public static class MyAttribute {
    private final String myName;
    private Class<?> myType;
    private boolean isDeprecated;
    private String[] myEnumValues;

    public MyAttribute(String name) {
      this.myName = name;
    }

    public String getName() {
      return this.myName;
    }

    public Class<?> getType() {
      return this.myType;
    }

    private void setType(Class<?> type) {
      this.myType = type;
      if (ClassInfo.MyAttribute.isEnum(type)) {
        Constructor<?> constructor = null;
        try {
          constructor = type.getConstructor();
          Object object = constructor.newInstance();
          Method method = type.getMethod("getValues");
          this.myEnumValues = (String[]) method.invoke(object);
        } catch (NoSuchMethodException e) {
          e.printStackTrace();
        } catch (InvocationTargetException e) {
          e.printStackTrace();
        } catch (IllegalAccessException e) {
          e.printStackTrace();
        } catch (InstantiationException e) {
          e.printStackTrace();
        }
      }
    }

    public boolean isDeprecated() {
      return this.isDeprecated;
    }

    private void setDeprecated(boolean deprecated) {
      this.isDeprecated = deprecated;
    }

    public String[] getEnumValues() {
      return this.myEnumValues;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) {
        return true;
      }
      if (o == null) {
        return false;
      }
      ClassInfo.MyAttribute attribute = (ClassInfo.MyAttribute) o;
      if ((this.myName != null ?
        !(this.myName.equals(attribute.myName)) :
        attribute.myName != null
      )) {
        return false;
      }
      return true;
    }

    public int hashCode() {
      return ((this.myName != null ?
        this.myName.hashCode() :
        0
      ));
    }

    @Override
    public String toString() {
      StringBuffer sb = new StringBuffer();
      sb.append(this.myName);
      sb.append(" ");
      sb.append(this.myType);
      if (this.isDeprecated) {
        sb.append(" deprecated");
      }
      if (!((this.myEnumValues == null))) {
        sb.append("in [");
        for (int i = 0; i < this.myEnumValues.length; i++) {
          sb.append(" ");
          sb.append(this.myEnumValues[i]);
        }
        sb.append("]");
      }
      return sb.toString();
    }

    private static boolean isEnum(Class<?> type) {
      try {
        ClassLoader loader = type.getClassLoader();
        if (loader == null) {
          return false;
        }
        return loader.loadClass(EnumeratedAttribute.class.getName()).isAssignableFrom(type);
      } catch (ClassNotFoundException e) {
        e.printStackTrace();
        assert false;
      }
      return false;
    }
  }

  public static class Nested {
    private final Class<?> myClass;
    private final Set<String> myNames = new LinkedHashSet<String>();
    private final String myShortName;

    public Nested(Class<?> clazz) {
      this.myClass = clazz;
      this.myShortName = Scanner.getShortClassName(clazz);
    }

    public Class<?> getNestedClass() {
      return this.myClass;
    }

    public Set<String> getNames() {
      return Collections.unmodifiableSet(this.myNames);
    }

    public String getShortName() {
      return this.myShortName;
    }

    private void addName(String name) {
      this.myNames.add(name);
    }

    @Override
    public String toString() {
      StringBuffer sb = new StringBuffer();
      sb.append(this.myShortName);
      sb.append(" ");
      sb.append(this.myClass);
      for (String name : this.myNames) {
        sb.append(" ");
        sb.append(name);
      }
      return sb.toString();
    }
  }

  private class SimpleClassVisitor extends EmptyClassVisitor {
    private SimpleClassVisitor() {
    }

    @Override
    public void visit(int version, int access, String name, String signature, String superName, String[] interfaces) {
      if (isDeprecated(access)) {
        ClassInfo.this.isDeprecated = true;
      }
    }

    @Override
    public MethodVisitor visitMethod(int access, String name, String desc, String signature, String[] exceptions) {
      if (isDeprecated(access)) {
        String attrName = name.substring("set".length()).toLowerCase();
        for (ClassInfo.MyAttribute attr : ClassInfo.this.myAttributes) {
          if (attr.getName().equals(attrName)) {
            attr.setDeprecated(true);
            break;
          }
        }
      }
      return super.visitMethod(access, name, desc, signature, exceptions);
    }

    private boolean isDeprecated(int access) {
      return (access & Opcodes.ACC_DEPRECATED) != 0;
    }
  }
}
