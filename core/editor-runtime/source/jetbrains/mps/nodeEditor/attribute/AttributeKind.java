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
package jetbrains.mps.nodeEditor.attribute;

/**
 * Created by IntelliJ IDEA.
 * Date: 15.12.2010
 * Time: 17:03:33
 * To change this template use File | Settings | File Templates.
 */
public enum AttributeKind {
  NODE, REFERENCE, PROPERTY, NOTHING;

  //todo temp for compatibility
  public static class Node {}
  public static class Reference {}
  public static class Property {}
  public static class Nothing {}
}
