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
package jetbrains.mps.newTypesystem.operation;

public class PresentationKind {
  public static final String EQUATION_ADDED = "equation_added";
  public static final String RELATION_ADDED = "relation_added";
  public static final String RELATION_REMOVED = "relation_removed";
  public static final String WHEN_CONCRETE_ADDED = "when_concrete_added";
  public static final String WHEN_CONCRETE_REMOVED = "when_concrete_removed";
  public static final String ERROR_ADDED = "error_added";
  public static final String TRACE_WARNING = "trace_warning";
  public static final String TRACE_MESSAGE = "trace_message";
  public static final String TYPE_ASSIGNED = "type_assigned";
  public static final String TYPE_EXPANDED = "type_expanded";
  public static final String TYPE_REMOVED = "type_removed";    //incremental
  public static final String DEFAULT = "default";
}
