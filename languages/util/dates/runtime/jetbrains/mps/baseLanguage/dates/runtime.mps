<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:dbe7fdbb-7a29-48a8-a58a-3fa318d60c28(jetbrains.mps.baseLanguage.dates.runtime)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="cccc689c-f365-4862-a8b6-34ecddf8ee26(jetbrains.mps.baseLanguage.dates)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <import index="ojzd" modelUID="f:java_stub#2ebbb458-8ebb-481e-a5d7-9e27903323d4#org.joda.time(jetbrains.mps.baseLanguage.dates.runtime/org.joda.time@java_stub)" version="-1" />
  <import index="d0m4" modelUID="f:java_stub#2ebbb458-8ebb-481e-a5d7-9e27903323d4#org.joda.time.format(jetbrains.mps.baseLanguage.dates.runtime/org.joda.time.format@java_stub)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="a2d2" modelUID="f:java_stub#2ebbb458-8ebb-481e-a5d7-9e27903323d4#org.joda.time.base(jetbrains.mps.baseLanguage.dates.runtime/org.joda.time.base@java_stub)" version="-1" />
  <import index="ov05" modelUID="f:java_stub#2ebbb458-8ebb-481e-a5d7-9e27903323d4#org.joda.time.field(jetbrains.mps.baseLanguage.dates.runtime/org.joda.time.field@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="tp6x" modelUID="r:00000000-0000-4000-0000-011c895903d5(jetbrains.mps.baseLanguage.dates.structure)" version="1" implicit="yes" />
  <roots>
    <node type="tpee.EnumClass" typeId="tpee.1083245097125" id="734650238126517378">
      <property name="name" nameId="tpck.1169194664001" value="CompareType" />
    </node>
    <node type="tpee.Interface" typeId="tpee.1107796713796" id="734650238126517491">
      <property name="name" nameId="tpck.1169194664001" value="Constants" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126517500">
      <property name="name" nameId="tpck.1169194664001" value="DateTimeOperations" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126519447">
      <property name="abstractClass" nameId="tpee.1075300953594" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="ConditionalDateTimePrinter" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126519758">
      <property name="name" nameId="tpck.1169194664001" value="FixedLocaleDateTimeFormatter" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126520179">
      <property name="name" nameId="tpck.1169194664001" value="InlineDateFormatter" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126520198">
      <property name="name" nameId="tpck.1169194664001" value="DateTimeArithmetics" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126520716">
      <property name="isFinal" nameId="tpee.1221565133444" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="PredefinedFormats" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126520742">
      <property name="name" nameId="tpck.1169194664001" value="OffsetDateTimePrinter" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="4300821714594275807">
      <property name="name" nameId="tpck.1169194664001" value="DateTimeUtil" />
    </node>
  </roots>
  <root id="734650238126517378">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517379" />
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="734650238126517380">
      <property name="name" nameId="tpck.1169194664001" value="EQ" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517386" resolveInfo="CompareType" />
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="734650238126517381">
      <property name="name" nameId="tpck.1169194664001" value="NE" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517386" resolveInfo="CompareType" />
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="734650238126517382">
      <property name="name" nameId="tpck.1169194664001" value="GT" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517386" resolveInfo="CompareType" />
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="734650238126517383">
      <property name="name" nameId="tpck.1169194664001" value="GE" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517386" resolveInfo="CompareType" />
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="734650238126517384">
      <property name="name" nameId="tpck.1169194664001" value="LT" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517386" resolveInfo="CompareType" />
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="734650238126517385">
      <property name="name" nameId="tpck.1169194664001" value="LE" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517386" resolveInfo="CompareType" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126517386">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126517387" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126517388" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517389" />
    </node>
  </root>
  <root id="734650238126517491">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517492" />
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="734650238126517493">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="NULL_DATE_TIME" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517494">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517495" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517496">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517497">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(long,org%djoda%dtime%dDateTimeZone)" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126517498">
            <property name="value" nameId="tpee.1068580320021" value="0" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126517499">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ojzd.~DateTimeZone" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ojzd.~DateTimeZone%dUTC" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="734650238126517500">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517501" />
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="734650238126517502">
      <property name="name" nameId="tpck.1169194664001" value="currentZone" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517503">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~InheritableThreadLocal" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517504">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126517505" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517506">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="734650238126517507">
          <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="734650238126517508">
            <property name="name" nameId="tpck.1169194664001" value="" />
            <link role="classifier" roleId="tpee.1170346070688" targetNodeId="e2lb.~InheritableThreadLocal" resolveInfo="InheritableThreadLocal" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~InheritableThreadLocal%d&lt;init&gt;()" />
            <node role="typeParameter" roleId="tpee.1201186121363" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517509">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" resolveInfo="DateTimeZone" />
            </node>
            <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126517510">
              <property name="name" nameId="tpck.1169194664001" value="initialValue" />
              <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="734650238126517511" />
              <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517512">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
              </node>
              <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519305">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519306">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126519307">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ojzd.~DateTimeZone" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeZone%dgetDefault()%corg%djoda%dtime%dDateTimeZone" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126517513">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126517514">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126517515" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126517516" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517517" />
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517518">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517519" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517520">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517521">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517522">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517523">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517524">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517525">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517526">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517527">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517528">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517523" resolveInfo="formatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517529">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dprint(org%djoda%dtime%dReadableInstant)%cjava%dlang%dString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517530">
                <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517531">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517532">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517521" resolveInfo="datetime" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517533" />
                </node>
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517534">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517535">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517536">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517521" resolveInfo="datetime" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517537">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126517538">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517539">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126517540">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="734650238126517491" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517493" resolveInfo="NULL_DATE_TIME" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126517541">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517542">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517543" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517544">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517545">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517546">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517547">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517548">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517549">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517550">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517551">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517552">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126517553">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517518" resolveInfo="print" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517554">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517545" resolveInfo="datetime" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517555">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517556">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517547" resolveInfo="formatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517557">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithLocale(java%dutil%dLocale)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517558">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517549" resolveInfo="locale" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126517559">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517560">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517561" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517562">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517563">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517564">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517565">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517566">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517567">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517568">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517569">
        <property name="name" nameId="tpck.1169194664001" value="zone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517570">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517571">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517572">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517573">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517574">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517575">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126517576">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517577">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517578">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517563" resolveInfo="value" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517579" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126517580">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517581">
                  <node role="condition" roleId="tpee.1163668914799" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126517582">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517583">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517584">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517569" resolveInfo="zone" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517585" />
                    </node>
                  </node>
                  <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517586">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517587">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517588">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517563" resolveInfo="value" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517589">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517569" resolveInfo="zone" />
                      </node>
                    </node>
                  </node>
                  <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517590">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517591">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517592">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517563" resolveInfo="value" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517593">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126517594">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517595">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126517596">
                <link role="classifier" roleId="tpee.1144433057691" targetNodeId="734650238126517491" />
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517493" resolveInfo="NULL_DATE_TIME" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517597">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517598">
            <property name="name" nameId="tpck.1169194664001" value="dateTimeFormatter" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517599">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517600">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126517601">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126517602">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517603">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517567" resolveInfo="locale" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517604" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517605">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517565" resolveInfo="formatter" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517606">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517607">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517565" resolveInfo="formatter" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517608">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithLocale(java%dutil%dLocale)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517609">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517567" resolveInfo="locale" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517610">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517611">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517612">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517598" resolveInfo="dateTimeFormatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517613">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dprint(org%djoda%dtime%dReadableInstant)%cjava%dlang%dString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517614">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517573" resolveInfo="dateTime" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126517615">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517616">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517617" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517618">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517619">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517620">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517621">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517622">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517623">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517624">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517625">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517626">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517627">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517628">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517629">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126517630">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517631">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517632">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517619" resolveInfo="value" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517633" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517634">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517619" resolveInfo="value" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126517635">
                <link role="classifier" roleId="tpee.1144433057691" targetNodeId="734650238126517491" />
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517493" resolveInfo="NULL_DATE_TIME" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517636">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517637">
            <property name="name" nameId="tpck.1169194664001" value="dateTimeFormatter" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517638">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517639">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126517640">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126517641">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517642">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517623" resolveInfo="locale" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517643" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517644">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517621" resolveInfo="formatter" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517645">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517646">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517621" resolveInfo="formatter" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517647">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithLocale(java%dutil%dLocale)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517648">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517623" resolveInfo="locale" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517649">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517650">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517651">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517637" resolveInfo="dateTimeFormatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517652">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dprint(org%djoda%dtime%dReadableInstant)%cjava%dlang%dString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517653">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517627" resolveInfo="dateTime" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517654">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517655" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517656">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517657">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517658">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517659">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517660">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~PeriodFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517661">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517662">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517663">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517664">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517665">
            <property name="name" nameId="tpck.1169194664001" value="period" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517666">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517667">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517668">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517669">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517657" resolveInfo="value" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517670" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517671">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517657" resolveInfo="value" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517672">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517673">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;()" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517674">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517675">
            <property name="name" nameId="tpck.1169194664001" value="dateTimeFormatter" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517676">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~PeriodFormatter" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517677">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126517678">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517679">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517661" resolveInfo="locale" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517680" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517681">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517659" resolveInfo="formatter" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517682">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517683">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517659" resolveInfo="formatter" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517684">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~PeriodFormatter%dwithLocale(java%dutil%dLocale)%corg%djoda%dtime%dformat%dPeriodFormatter" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517685">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517661" resolveInfo="locale" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517686">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517687">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517688">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517675" resolveInfo="dateTimeFormatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517689">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~PeriodFormatter%dprint(org%djoda%dtime%dReadablePeriod)%cjava%dlang%dString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517690">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517665" resolveInfo="period" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517691">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517692" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517693">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517694">
        <property name="name" nameId="tpck.1169194664001" value="period" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517695">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517696">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517697">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517698">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517699">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517700">
        <property name="name" nameId="tpck.1169194664001" value="zone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517701">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517702">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517703">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126517704">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517560" resolveInfo="print" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126517705">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517774" resolveInfo="convert" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517706">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517694" resolveInfo="period" />
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517707">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517696" resolveInfo="formatter" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517708">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517698" resolveInfo="locale" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517709">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517700" resolveInfo="zone" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126517710">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517711">
      <property name="name" nameId="tpck.1169194664001" value="convert" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517712" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517713">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517714">
        <property name="name" nameId="tpck.1169194664001" value="l" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517715">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517716">
        <property name="name" nameId="tpck.1169194664001" value="zone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517717">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517718">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517719">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517720">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517721">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517722">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517714" resolveInfo="l" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517723" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517724">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517725">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517726">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517714" resolveInfo="l" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517727">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517716" resolveInfo="zone" />
                </node>
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517728" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517729">
      <property name="name" nameId="tpck.1169194664001" value="convert" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517730" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517731">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517732">
        <property name="name" nameId="tpck.1169194664001" value="dateTime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517733">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517734">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517735">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517736">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517737">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517738">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517732" resolveInfo="dateTime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517739" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517740">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517741">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517732" resolveInfo="dateTime" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517742">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517743" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517744">
      <property name="name" nameId="tpck.1169194664001" value="convert" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517745" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517746">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517747">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517748">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Date" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517749">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517750">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517751">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517752">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517753">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517747" resolveInfo="date" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517754" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517755">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517756">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517747" resolveInfo="date" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517757">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Date%dgetTime()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517758" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517759">
      <property name="name" nameId="tpck.1169194664001" value="convert" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517760" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517761">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517762">
        <property name="name" nameId="tpck.1169194664001" value="calendar" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517763">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Calendar" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517764">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517765">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517766">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517767">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517768">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517762" resolveInfo="calendar" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517769" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517770">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517771">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517762" resolveInfo="calendar" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517772">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Calendar%dgetTimeInMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517773" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517774">
      <property name="name" nameId="tpck.1169194664001" value="convert" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517775" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517776">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517777">
        <property name="name" nameId="tpck.1169194664001" value="period" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517778">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517779">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517780">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517781">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517782">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517783">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517777" resolveInfo="period" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517784" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517785">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517786">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517787">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517777" resolveInfo="period" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517788">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dtoStandardDuration()%corg%djoda%dtime%dDuration" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517789">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDuration%dgetMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517790" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517791">
      <property name="name" nameId="tpck.1169194664001" value="convert" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517792" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517793">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517794">
        <property name="name" nameId="tpck.1169194664001" value="period" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517795">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517796">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517797">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517798">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517799">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517800">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517794" resolveInfo="period" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517801" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517802">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517803">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517794" resolveInfo="period" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517804">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDuration%dgetMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517805" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517806">
      <property name="name" nameId="tpck.1169194664001" value="toDuration" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517807" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517808">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517809">
        <property name="name" nameId="tpck.1169194664001" value="p" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517810">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517811">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517812">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517813">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517814">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517815">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517809" resolveInfo="p" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517816" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517817">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517818">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517809" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517819">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dtoStandardDuration()%corg%djoda%dtime%dDuration" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517820" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517821">
      <property name="name" nameId="tpck.1169194664001" value="parse" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517822" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517823">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517824">
        <property name="name" nameId="tpck.1169194664001" value="datetimeString" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517825">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517826">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517827">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517828">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517829">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517830">
        <property name="name" nameId="tpck.1169194664001" value="zone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517831">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517832">
        <property name="name" nameId="tpck.1169194664001" value="defValues" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517833">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517834">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126517835">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126517836">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517837">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517830" resolveInfo="zone" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517838" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517839">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126517840">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126517841">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517842">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517830" resolveInfo="zone" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517843">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126517844">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517845">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126517846">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517847">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517848">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517828" resolveInfo="locale" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517849" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517850">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126517851">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126517852">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517853">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517826" resolveInfo="formatter" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517854">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517855">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517826" resolveInfo="formatter" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517856">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithLocale(java%dutil%dLocale)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517857">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517828" resolveInfo="locale" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126517858">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517859">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517860">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517830" resolveInfo="zone" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517861" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517862">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126517863">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126517864">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517865">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517826" resolveInfo="formatter" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517866">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517867">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517826" resolveInfo="formatter" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517868">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithZone(org%djoda%dtime%dDateTimeZone)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517869">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517830" resolveInfo="zone" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="734650238126517870">
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="734650238126517871">
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517872">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126517873">
                <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517874">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517875">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126517876">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126517877">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126517878">
                          <property name="value" nameId="tpee.1070475926801" value="Error parsing date/time (" />
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517879">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517880">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517883" resolveInfo="iae" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517881">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Throwable%dgetMessage()%cjava%dlang%dString" />
                          </node>
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126517882">
                        <property name="value" nameId="tpee.1070475926801" value=")" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517883">
              <property name="name" nameId="tpck.1169194664001" value="iae" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517884">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~IllegalArgumentException" />
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="734650238126517885">
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517886">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126517887">
                <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517888">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517889">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126517890">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126517891">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126517892">
                          <property name="value" nameId="tpee.1070475926801" value="Error parsing date/time (" />
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517893">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517894">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517897" resolveInfo="uoe" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517895">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Throwable%dgetMessage()%cjava%dlang%dString" />
                          </node>
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126517896">
                        <property name="value" nameId="tpee.1070475926801" value=")" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517897">
              <property name="name" nameId="tpck.1169194664001" value="uoe" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517898">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~UnsupportedOperationException" />
              </node>
            </node>
          </node>
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517899">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126517900">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517901">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517902">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517832" resolveInfo="defValues" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517903" />
              </node>
              <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126517904">
                <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517905">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517906">
                    <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517907">
                      <property name="name" nameId="tpck.1169194664001" value="dt" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517908">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
                      </node>
                      <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517909">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517910">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517826" resolveInfo="formatter" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517911">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dparseDateTime(java%dlang%dString)%corg%djoda%dtime%dDateTime" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517912">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517824" resolveInfo="datetimeString" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517913">
                    <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126517914">
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517729" resolveInfo="convert" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517915">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517907" resolveInfo="dt" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517916">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517917">
                  <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517918">
                    <property name="name" nameId="tpck.1169194664001" value="mdt" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517919">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~MutableDateTime" />
                    </node>
                    <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517920">
                      <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517921">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~MutableDateTime%d&lt;init&gt;(long)" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126517922">
                          <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517923">
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517924">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517832" resolveInfo="defValues" />
                            </node>
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517925" />
                          </node>
                          <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517926">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517832" resolveInfo="defValues" />
                          </node>
                          <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="734650238126517927">
                            <property name="value" nameId="tpee.4269842503726207157" value="0L" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126517928">
                  <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517929">
                    <property name="name" nameId="tpck.1169194664001" value="res" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126517930" />
                    <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517931">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517932">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517826" resolveInfo="formatter" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517933">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dparseInto(org%djoda%dtime%dReadWritableInstant,java%dlang%dString,int)%cint" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517934">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517918" resolveInfo="mdt" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517935">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517824" resolveInfo="datetimeString" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126517936">
                          <property name="value" nameId="tpee.1068580320021" value="0" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126517937">
                  <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="734650238126517938">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517939">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517929" resolveInfo="res" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126517940">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                  <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517941">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126517942">
                      <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517943">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517944">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517945">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517824" resolveInfo="datetimeString" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126517946">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126517947">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517729" resolveInfo="convert" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517948">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517949">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517918" resolveInfo="mdt" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517950">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%dtoDateTime()%corg%djoda%dtime%dDateTime" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126517951">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126517952">
      <property name="name" nameId="tpck.1169194664001" value="parseDateTime" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126517953" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517954">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517955">
        <property name="name" nameId="tpck.1169194664001" value="datetimeString" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517956">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517957">
        <property name="name" nameId="tpck.1169194664001" value="formatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517958">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517959">
        <property name="name" nameId="tpck.1169194664001" value="zone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517960">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517961">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517962">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126517963">
        <property name="name" nameId="tpck.1169194664001" value="defValue" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517964">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517965">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126517966">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126517967">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517968">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517961" resolveInfo="locale" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126517969" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517970">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126517971">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126517972">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517973">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517957" resolveInfo="formatter" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517974">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517975">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517957" resolveInfo="formatter" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517976">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithLocale(java%dutil%dLocale)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517977">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517961" resolveInfo="locale" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126517978">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126517979">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517980">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517957" resolveInfo="formatter" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517981">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517982">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517957" resolveInfo="formatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517983">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithZone(org%djoda%dtime%dDateTimeZone)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126517984">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517959" resolveInfo="zone" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="734650238126517985">
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="734650238126517986">
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126517987">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126517988">
                <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126517989">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126517990">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126517991">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126517992">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126517993">
                          <property name="value" nameId="tpee.1070475926801" value="Error parsing date/time (" />
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126517994">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126517995">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517998" resolveInfo="iae" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126517996">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Throwable%dgetMessage()%cjava%dlang%dString" />
                          </node>
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126517997">
                        <property name="value" nameId="tpee.1070475926801" value=")" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126517998">
              <property name="name" nameId="tpck.1169194664001" value="iae" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126517999">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~IllegalArgumentException" />
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="734650238126518000">
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518001">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126518002">
                <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518003">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518004">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518005">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518006">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126518007">
                          <property name="value" nameId="tpee.1070475926801" value="Error parsing date/time (" />
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518008">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518009">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518012" resolveInfo="uoe" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518010">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Throwable%dgetMessage()%cjava%dlang%dString" />
                          </node>
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126518011">
                        <property name="value" nameId="tpee.1070475926801" value=")" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518012">
              <property name="name" nameId="tpck.1169194664001" value="uoe" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518013">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~UnsupportedOperationException" />
              </node>
            </node>
          </node>
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518014">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518015">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518016">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518017">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517963" resolveInfo="defValue" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518018" />
              </node>
              <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126518019">
                <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518020">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518021">
                    <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518022">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518023">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517957" resolveInfo="formatter" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518024">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dparseDateTime(java%dlang%dString)%corg%djoda%dtime%dDateTime" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518025">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517955" resolveInfo="datetimeString" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518026">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518027">
                  <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518028">
                    <property name="name" nameId="tpck.1169194664001" value="mdt" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518029">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~MutableDateTime" />
                    </node>
                    <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518030">
                      <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518031">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~MutableDateTime%d&lt;init&gt;(java%dlang%dObject)" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518032">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517963" resolveInfo="defValue" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518033">
                  <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518034">
                    <property name="name" nameId="tpck.1169194664001" value="res" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126518035" />
                    <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518036">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518037">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517957" resolveInfo="formatter" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518038">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dparseInto(org%djoda%dtime%dReadWritableInstant,java%dlang%dString,int)%cint" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518039">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518028" resolveInfo="mdt" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518040">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517955" resolveInfo="datetimeString" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518041">
                          <property name="value" nameId="tpee.1068580320021" value="0" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518042">
                  <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="734650238126518043">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518044">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518034" resolveInfo="res" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518045">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                  <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518046">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126518047">
                      <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518048">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518049">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518050">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517955" resolveInfo="datetimeString" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518051">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518052">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518053">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518028" resolveInfo="mdt" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518054">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%dtoDateTime()%corg%djoda%dtime%dDateTime" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518055">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518056" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518057" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518058">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518059">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518060">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518061">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518062">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518063">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518064">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518065">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518066">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518067">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518068">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518069">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518058" resolveInfo="op1" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518070">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518164" resolveInfo="roundFloor" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518071">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518058" resolveInfo="op1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518072">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518064" resolveInfo="type" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518073">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518074">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518075">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518062" resolveInfo="op2" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518076">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518164" resolveInfo="roundFloor" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518077">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518062" resolveInfo="op2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518078">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518064" resolveInfo="type" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518079">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518080">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518081">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518058" resolveInfo="op1" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518082" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518083">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518084">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518085">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518086">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518058" resolveInfo="op1" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126518087">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~Long" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~Long%dMIN_VALUE" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518088">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518089">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518090">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518062" resolveInfo="op2" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518091" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518092">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518093">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518094">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518095">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518062" resolveInfo="op2" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126518096">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~Long" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~Long%dMIN_VALUE" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518097">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518098">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519042" resolveInfo="compareResult" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518099">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518100">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518058" resolveInfo="op1" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518101">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Long%dcompareTo(java%dlang%dLong)%cint" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518102">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518062" resolveInfo="op2" />
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518103">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518060" resolveInfo="cmp" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518104">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518105">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518106" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518107" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518108">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518109">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518110">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518111">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518112">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518113">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518114">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518115">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518116">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518117">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518118">
            <property name="name" nameId="tpck.1169194664001" value="dtc" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518119">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeComparator" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518120">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518121">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518122">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518114" resolveInfo="type" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518123" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518124">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ojzd.~DateTimeComparator" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeComparator%dgetInstance(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTimeComparator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518125">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518114" resolveInfo="type" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518126">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ojzd.~DateTimeComparator" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeComparator%dgetInstance()%corg%djoda%dtime%dDateTimeComparator" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518127">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518128">
            <property name="name" nameId="tpck.1169194664001" value="compareValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126518129" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518130">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518131">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518132">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518108" resolveInfo="op1" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518133" />
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126518134">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518135">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518136">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518137">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518138">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518128" resolveInfo="compareValue" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518139">
                    <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518140">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518141">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518112" resolveInfo="op2" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518142" />
                    </node>
                    <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518143">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518144">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518118" resolveInfo="dtc" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518145">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeComparator%dcompare(java%dlang%dObject,java%dlang%dObject)%cint" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518146">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518108" resolveInfo="op1" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518147">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518112" resolveInfo="op2" />
                        </node>
                      </node>
                    </node>
                    <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518148">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518149">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518150">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518151">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518152">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518128" resolveInfo="compareValue" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518153">
                  <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518154">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518155">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518112" resolveInfo="op2" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518156" />
                  </node>
                  <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.UnaryMinus" typeId="tpee.8064396509828172209" id="734650238126518157">
                    <node role="expression" roleId="tpee.1239714902950" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518158">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                  <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518159">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518160">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518161">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519042" resolveInfo="compareResult" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518162">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518128" resolveInfo="compareValue" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518163">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518110" resolveInfo="cmp" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518164">
      <property name="name" nameId="tpck.1169194664001" value="roundFloor" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518165" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518166">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518167">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518168">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518169">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518170">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518171">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518172">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518173">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518174">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518175">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518167" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518176" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518177">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518178">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518179">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518180">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518181">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518182">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518167" resolveInfo="datetime" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518183">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518184">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518185">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518186">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518187">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518169" resolveInfo="type" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518188">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%droundFloorCopy()%corg%djoda%dtime%dDateTime" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518189">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518190" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518191">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518192">
      <property name="name" nameId="tpck.1169194664001" value="roundFloor" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518193" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518194">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518195">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518196">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518197">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518198">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518199">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518200">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518201">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518202">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518203">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518195" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518204" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518205">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518206">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518207">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518195" resolveInfo="datetime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518208">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518209">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518197" resolveInfo="type" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518210">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%droundFloorCopy()%corg%djoda%dtime%dDateTime" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518211" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518212">
      <property name="name" nameId="tpck.1169194664001" value="roundCeiling" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518213" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518214">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518215">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518216">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518217">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518218">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518219">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518220">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518221">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518222">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518223">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518215" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518224" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518225">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518226">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518227">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518228">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518229">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518230">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518215" resolveInfo="datetime" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518231">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518232">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518233">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518234">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518235">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518217" resolveInfo="type" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518236">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%droundCeilingCopy()%corg%djoda%dtime%dDateTime" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518237">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518238" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518239">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518240">
      <property name="name" nameId="tpck.1169194664001" value="roundCeiling" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518241" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518242">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518243">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518244">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518245">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518246">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518247">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518248">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518249">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518250">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518251">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518243" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518252" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518253">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518254">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518255">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518243" resolveInfo="datetime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518256">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518257">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518245" resolveInfo="type" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518258">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%droundCeilingCopy()%corg%djoda%dtime%dDateTime" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518259" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518260">
      <property name="name" nameId="tpck.1169194664001" value="round" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518261" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518262">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518263">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518264">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518265">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518266">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518267">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518268">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518269">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518270">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518271">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518263" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518272" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518273">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518274">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518275">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518276">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518277">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518278">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518263" resolveInfo="datetime" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518279">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518280">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518281">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518282">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518283">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518265" resolveInfo="type" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518284">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%droundHalfCeilingCopy()%corg%djoda%dtime%dDateTime" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518285">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518286" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518287">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518288">
      <property name="name" nameId="tpck.1169194664001" value="round" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518289" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518290">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518291">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518292">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518293">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518294">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518295">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518296">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518297">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518298">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518299">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518291" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518300" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518301">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518302">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518303">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518291" resolveInfo="datetime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518304">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518305">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518293" resolveInfo="type" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518306">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%droundHalfCeilingCopy()%corg%djoda%dtime%dDateTime" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518307" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518308">
      <property name="name" nameId="tpck.1169194664001" value="get" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518309" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518310">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518311">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518312">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518313">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518314">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518315">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518316">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518317">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518318">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518319">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518311" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518320" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518321">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518322">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518323">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518324">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518325">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518311" resolveInfo="datetime" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518326">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518327">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518328">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518329">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518330">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518313" resolveInfo="type" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518331">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ov05.~AbstractReadableInstantFieldProperty%dget()%cint" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518332" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518333">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518334">
      <property name="name" nameId="tpck.1169194664001" value="get" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518335" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518336">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518337">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518338">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518339">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518340">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518341">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518342">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518343">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518344">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518345">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518337" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518346" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518347">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518348">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518349">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518337" resolveInfo="datetime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518350">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518351">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518339" resolveInfo="type" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518352">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ov05.~AbstractReadableInstantFieldProperty%dget()%cint" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518353" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518354">
      <property name="name" nameId="tpck.1169194664001" value="with" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518355" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518356">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518357">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518358">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518359">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518360">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518361">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126518362" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518363">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518364">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518365">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518366">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518367">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518357" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518368" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518369">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518370">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518371">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518372">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518373">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518374">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518357" resolveInfo="datetime" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518375">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518376">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518377">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518378">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518379">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518359" resolveInfo="type" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518380">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%dsetCopy(int)%corg%djoda%dtime%dDateTime" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518381">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518361" resolveInfo="value" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518382">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518383" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518384">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518385">
      <property name="name" nameId="tpck.1169194664001" value="with" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518386" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518387">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518388">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518389">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518390">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518391">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518392">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126518393" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518394">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518395">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518396">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518397">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518398">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518388" resolveInfo="datetime" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518399" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518400">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518401">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518402">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518388" resolveInfo="datetime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518403">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dproperty(org%djoda%dtime%dDateTimeFieldType)%corg%djoda%dtime%dDateTime$Property" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518404">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518390" resolveInfo="type" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518405">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime$Property%dsetCopy(int)%corg%djoda%dtime%dDateTime" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518406">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518392" resolveInfo="value" />
                </node>
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518407" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518408">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518409" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518410">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518411">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518412">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518413">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518414">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518415">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518416">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518417">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518418">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518419" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518420">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518421">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518422">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518423">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126518424">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ojzd.~Period" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ojzd.~Period%dZERO" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518425">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518426">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518427">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518428" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518429">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518430">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518431">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518432">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126518433">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ojzd.~Period" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ojzd.~Period%dZERO" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518434">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518435">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518436">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(int,int,int,int,int,int,int,int)" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518437">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518438">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518439">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518440">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetYears()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518441">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518442">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518443">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetYears()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518444">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518445">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518446">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518447">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMonths()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518448">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518449">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518450">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMonths()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518451">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518452">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518453">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518454">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetWeeks()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518455">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518456">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518457">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetWeeks()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518458">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518459">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518460">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518461">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetDays()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518462">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518463">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518464">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetDays()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518465">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518466">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518467">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518468">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetHours()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518469">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518470">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518471">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetHours()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518472">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518473">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518474">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518475">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMinutes()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518476">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518477">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518478">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMinutes()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518479">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518480">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518481">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518482">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetSeconds()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518483">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518484">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518485">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetSeconds()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518486">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518487">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518488">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518411" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518489">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMillis()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518490">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518491">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518413" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518492">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMillis()%cint" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518493">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518494">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518495" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518496">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518497">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518498">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518499">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518500">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518501">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518502">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518503">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518504">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518505" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518506">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518507">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518508">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518509">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126518510">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ojzd.~Period" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ojzd.~Period%dZERO" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518511">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518512">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518513">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518514" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518515">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518516">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518517">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518518">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126518519">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ojzd.~Period" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ojzd.~Period%dZERO" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518520">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518521">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518522">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(int,int,int,int,int,int,int,int)" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518523">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518524">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518525">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518526">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetYears()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518527">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518528">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518529">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetYears()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518530">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518531">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518532">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518533">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMonths()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518534">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518535">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518536">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMonths()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518537">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518538">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518539">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518540">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetWeeks()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518541">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518542">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518543">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetWeeks()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518544">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518545">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518546">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518547">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetDays()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518548">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518549">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518550">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetDays()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518551">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518552">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518553">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518554">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetHours()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518555">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518556">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518557">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetHours()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518558">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518559">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518560">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518561">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMinutes()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518562">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518563">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518564">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMinutes()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518565">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518566">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518567">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518568">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetSeconds()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518569">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518570">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518571">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetSeconds()%cint" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126518572">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518573">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518574">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518497" resolveInfo="leftExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518575">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMillis()%cint" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518576">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518577">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518499" resolveInfo="rightExpression" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518578">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dgetMillis()%cint" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518579">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518580">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518581" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518582">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518583">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518584">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518585">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518586">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518587">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518588">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518589">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518590">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518591">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518592">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518593">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518583" resolveInfo="leftExpression" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518594" />
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126518595">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518596">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518597">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518598">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518599">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518589" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518600">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518601">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518602">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518603">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518604">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518583" resolveInfo="leftExpression" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518605">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518606">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518607">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518608">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dplus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dDateTime" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518609">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518585" resolveInfo="rightExpression" />
                        </node>
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518610">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518611">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518612">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518613">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518614">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518589" resolveInfo="result" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518615" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518616">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518617">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518589" resolveInfo="result" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518618">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518619">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518620" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518621">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518622">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518623">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518624">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518625">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518626">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518627">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518628">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518580" resolveInfo="plus" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518629">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518624" resolveInfo="right" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518630">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518622" resolveInfo="left" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518631">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518632">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518633" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518634">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518635">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518636">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518637">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518638">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518639">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518640">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126518641">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518642">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518635" resolveInfo="left" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518643">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518637" resolveInfo="right" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518644">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518645">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518646" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518647">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518648">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518649">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518650">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518651">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518652">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518653">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518654">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518655">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(long,long)" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518656">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518657">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518650" resolveInfo="right" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518658">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Long%dlongValue()%clong" />
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518659">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518660">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518648" resolveInfo="left" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518661">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Long%dlongValue()%clong" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518662">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518663">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518664" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518665">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518666">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518667">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518668">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518669">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518670">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518671">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518672">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518673">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518674">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518675">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518676">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518666" resolveInfo="leftExpression" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518677" />
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126518678">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518679">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518680">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518681">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518682">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518672" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518683">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518684">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518685">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518686">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518687">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518666" resolveInfo="leftExpression" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518688">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518689">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518690">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518691">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dminus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dDateTime" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518692">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518668" resolveInfo="rightExpression" />
                        </node>
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518693">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518694">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518695">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518696">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518697">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518672" resolveInfo="result" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518698" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518699">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518700">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518672" resolveInfo="result" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518701">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518702">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518703" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518704">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518705">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518706">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518707">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518708">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518709">
        <property name="name" nameId="tpck.1169194664001" value="periodType" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518710">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~PeriodType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518711">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518712">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518713">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518714">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518715">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126518716">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518717">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518718">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518705" resolveInfo="leftExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518719" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518720">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518721">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518707" resolveInfo="rightExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518722" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126518723">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518724">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518725">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518726">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518727">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518713" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518728">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518729">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(long,long,org%djoda%dtime%dPeriodType)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518730">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518707" resolveInfo="rightExpression" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518731">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518705" resolveInfo="leftExpression" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518732">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518709" resolveInfo="periodType" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518733">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518734">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518735">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518736">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518713" resolveInfo="result" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518737" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518738">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518739">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518713" resolveInfo="result" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518740">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518741">
      <property name="name" nameId="tpck.1169194664001" value="absMinus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518742" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518743">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518744">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518745">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518746">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518747">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518748">
        <property name="name" nameId="tpck.1169194664001" value="periodType" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518749">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~PeriodType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518750">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518751">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518752">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518753">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518754">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126518755">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518756">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518757">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518744" resolveInfo="leftExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518758" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518759">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518760">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518746" resolveInfo="rightExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518761" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126518762">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518763">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518764">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518765">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518766">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518752" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518767">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518768">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(long,long,org%djoda%dtime%dPeriodType)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518769">
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" />
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmin(long,long)%clong" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518770">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518744" resolveInfo="leftExpression" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518771">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518746" resolveInfo="rightExpression" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518772">
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" />
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmax(long,long)%clong" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518773">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518744" resolveInfo="leftExpression" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518774">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518746" resolveInfo="rightExpression" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518775">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518748" resolveInfo="periodType" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518776">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518777">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518778">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518779">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518752" resolveInfo="result" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518780" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518781">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518782">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518752" resolveInfo="result" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126518783">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518784">
      <property name="name" nameId="tpck.1169194664001" value="never" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518785" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518786">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518787">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518788">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518789" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518790">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518791" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518792" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518793">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518794">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518795">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518796">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518797">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518798">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518799">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518800">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518801">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518996" resolveInfo="compare" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518802">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518793" resolveInfo="op1" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518803">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518795" resolveInfo="cmp" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518804">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518805">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518806">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518797" resolveInfo="op2" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518807" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518808">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518809">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518797" resolveInfo="op2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518810">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dtoStandardDuration()%corg%djoda%dtime%dDuration" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518811" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518812">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518813" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518814" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518815">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518816">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518817">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518818">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518819">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518820">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518821">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518822">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518823">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518996" resolveInfo="compare" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518824">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518825">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518826">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518815" resolveInfo="op1" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518827" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518828">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518829">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518815" resolveInfo="op1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518830">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dtoStandardDuration()%corg%djoda%dtime%dDuration" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518831" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518832">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518817" resolveInfo="cmp" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518833">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518819" resolveInfo="op2" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518834">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518835" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518836" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518837">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518838">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518839">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518840">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518841">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518842">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518843">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518844">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518845">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518996" resolveInfo="compare" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518846">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518847">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518848">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518837" resolveInfo="op1" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518849" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518850">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518851">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%d&lt;init&gt;(java%dlang%dObject)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518852">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518837" resolveInfo="op1" />
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518853" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518854">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518839" resolveInfo="cmp" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518855">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518856">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518857">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518841" resolveInfo="op2" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518858" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518859">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518860">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518841" resolveInfo="op2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518861">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dtoStandardDuration()%corg%djoda%dtime%dDuration" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518862" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518863">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518864" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518865" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518866">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518867">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518868">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518869">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518870">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518871">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518872">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518873">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518874">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518996" resolveInfo="compare" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518875">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518876">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518877">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518866" resolveInfo="op1" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518878" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518879">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518880">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518866" resolveInfo="op1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518881">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dtoStandardDuration()%corg%djoda%dtime%dDuration" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518882" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518883">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518868" resolveInfo="cmp" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518884">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518885">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518886">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518870" resolveInfo="op2" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518887" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518888">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518889">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%d&lt;init&gt;(java%dlang%dObject)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518890">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518870" resolveInfo="op2" />
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518891" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518892">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518893" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518894" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518895">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518896">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518897">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518898">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518899">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518900">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518901">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518902">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518903">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518996" resolveInfo="compare" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518904">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518905">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518906">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518895" resolveInfo="op1" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518907" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518908">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518909">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%d&lt;init&gt;(java%dlang%dObject)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518910">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518895" resolveInfo="op1" />
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518911" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518912">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518897" resolveInfo="cmp" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518913">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518899" resolveInfo="op2" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518914">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518915" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518916" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518917">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518918">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518919">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518920">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518921">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518922">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518923">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518924">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518925">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126518996" resolveInfo="compare" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518926">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518917" resolveInfo="op1" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518927">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518919" resolveInfo="cmp" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518928">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518929">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518930">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518921" resolveInfo="op2" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518931" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518932">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518933">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%d&lt;init&gt;(java%dlang%dObject)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518934">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518921" resolveInfo="op2" />
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518935" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518936">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518937" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518938" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518939">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518940">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518941">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518942">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518943">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518944">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518945">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518946">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518947">
            <property name="name" nameId="tpck.1169194664001" value="now" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126518948">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126518949">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126518950">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(org%djoda%dtime%dDateTimeZone)" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518951">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126518952">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518953">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126518954">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126518955">
            <property name="name" nameId="tpck.1169194664001" value="compareValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126518956" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126518957">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126518958">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518959">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518939" resolveInfo="op1" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518960" />
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126518961">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518962">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518963">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518964">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518965">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518955" resolveInfo="compareValue" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518966">
                    <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518967">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518968">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518943" resolveInfo="op2" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518969" />
                    </node>
                    <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518970">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518971">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518972">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518939" resolveInfo="op1" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518973">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BasePeriod%dtoDurationFrom(org%djoda%dtime%dReadableInstant)%corg%djoda%dtime%dDuration" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518974">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518947" resolveInfo="now" />
                          </node>
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518975">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractDuration%dcompareTo(java%dlang%dObject)%cint" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126518976">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518977">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518943" resolveInfo="op2" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126518978">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BasePeriod%dtoDurationFrom(org%djoda%dtime%dReadableInstant)%corg%djoda%dtime%dDuration" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518979">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518947" resolveInfo="now" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518980">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126518981">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126518982">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126518983">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518984">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518955" resolveInfo="compareValue" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126518985">
                  <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126518986">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518987">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518943" resolveInfo="op2" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126518988" />
                  </node>
                  <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.UnaryMinus" typeId="tpee.8064396509828172209" id="734650238126518989">
                    <node role="expression" roleId="tpee.1239714902950" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518990">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                  <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126518991">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126518992">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126518993">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519042" resolveInfo="compareResult" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126518994">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518955" resolveInfo="compareValue" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126518995">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518941" resolveInfo="cmp" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126518996">
      <property name="name" nameId="tpck.1169194664001" value="compare" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126518997" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126518998" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126518999">
        <property name="name" nameId="tpck.1169194664001" value="op1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519000">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519001">
        <property name="name" nameId="tpck.1169194664001" value="cmp" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519002">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519003">
        <property name="name" nameId="tpck.1169194664001" value="op2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519004">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519005">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519006">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519007">
            <property name="name" nameId="tpck.1169194664001" value="compareValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519008" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126519009">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519010">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519011">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518999" resolveInfo="op1" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519012" />
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126519013">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519014">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519015">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519016">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519017">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519007" resolveInfo="compareValue" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126519018">
                    <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126519019">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519020">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519003" resolveInfo="op2" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519021" />
                    </node>
                    <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519022">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519023">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126518999" resolveInfo="op1" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519024">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractDuration%dcompareTo(java%dlang%dObject)%cint" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519025">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519003" resolveInfo="op2" />
                        </node>
                      </node>
                    </node>
                    <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519026">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519027">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519028">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519029">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519030">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519007" resolveInfo="compareValue" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126519031">
                  <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126519032">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519033">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519003" resolveInfo="op2" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519034" />
                  </node>
                  <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.UnaryMinus" typeId="tpee.8064396509828172209" id="734650238126519035">
                    <node role="expression" roleId="tpee.1239714902950" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519036">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                  <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519037">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519038">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126519039">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519042" resolveInfo="compareResult" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519040">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519007" resolveInfo="compareValue" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519041">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519001" resolveInfo="cmp" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519042">
      <property name="name" nameId="tpck.1169194664001" value="compareResult" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519043" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519044" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519045">
        <property name="name" nameId="tpck.1169194664001" value="compareValue" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519046" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519047">
        <property name="name" nameId="tpck.1169194664001" value="kind" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519048">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="734650238126517378" resolveInfo="CompareType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519049">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519050">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519051">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519052" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SwitchStatement" typeId="tpee.1163670490218" id="734650238126519053">
          <node role="expression" roleId="tpee.1163670766145" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519054">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519047" resolveInfo="kind" />
          </node>
          <node role="defaultBlock" roleId="tpee.1163670592366" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519055">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126519056">
              <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126519057">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126519058">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~UnsupportedOperationException%d&lt;init&gt;(java%dlang%dString)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126519059">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126519060">
                      <property name="value" nameId="tpee.1070475926801" value="Unsupported compare type: " />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519061">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519047" resolveInfo="kind" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="734650238126519062">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="734650238126519063">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="734650238126517378" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="734650238126517380" resolveInfo="EQ" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519064">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519065">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519066">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519067">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519051" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519068">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519069">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519045" resolveInfo="compareValue" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519070">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="734650238126519071" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="734650238126519072">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="734650238126519073">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="734650238126517378" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="734650238126517381" resolveInfo="NE" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519074">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519075">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519076">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519077">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519051" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126519078">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519079">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519045" resolveInfo="compareValue" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519080">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="734650238126519081" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="734650238126519082">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="734650238126519083">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="734650238126517378" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="734650238126517384" resolveInfo="LT" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519084">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519085">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519086">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519087">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519051" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="734650238126519088">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519089">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519045" resolveInfo="compareValue" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519090">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="734650238126519091" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="734650238126519092">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="734650238126519093">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="734650238126517378" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="734650238126517382" resolveInfo="GT" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519094">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519095">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519096">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519097">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519051" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="734650238126519098">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519099">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519045" resolveInfo="compareValue" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519100">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="734650238126519101" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="734650238126519102">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="734650238126519103">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="734650238126517378" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="734650238126517385" resolveInfo="LE" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519104">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519105">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519106">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519107">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519051" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="734650238126519108">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519109">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519045" resolveInfo="compareValue" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519110">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="734650238126519111" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="734650238126519112">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="734650238126519113">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="734650238126517378" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="734650238126517383" resolveInfo="GE" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519114">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519115">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519116">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519117">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519051" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="734650238126519118">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519119">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519045" resolveInfo="compareValue" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519120">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="734650238126519121" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519122">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519123">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519051" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519124">
      <property name="name" nameId="tpck.1169194664001" value="equals" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519125" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519126" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519127">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519128">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519129">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519130">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519131">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519132">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519133">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519134" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126519135">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126519136">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519137">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519138">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519127" resolveInfo="leftExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519139" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519140">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519141">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519129" resolveInfo="rightExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519142" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126519143">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519144">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519145">
                <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519146">
                  <property name="name" nameId="tpck.1169194664001" value="now" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519147">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
                  </node>
                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126519148">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126519149">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519150">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126519151">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519152">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519153">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519154">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519155">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519133" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519156">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519157">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519158">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519127" resolveInfo="leftExpression" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519159">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BasePeriod%dtoDurationFrom(org%djoda%dtime%dReadableInstant)%corg%djoda%dtime%dDuration" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519160">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519146" resolveInfo="now" />
                        </node>
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519161">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractDuration%dequals(java%dlang%dObject)%cboolean" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519162">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519163">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519129" resolveInfo="rightExpression" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519164">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BasePeriod%dtoDurationFrom(org%djoda%dtime%dReadableInstant)%corg%djoda%dtime%dDuration" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519165">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519146" resolveInfo="now" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519166">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519167">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519168">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519169">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519133" resolveInfo="result" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519170">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519171">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519127" resolveInfo="leftExpression" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519172">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519129" resolveInfo="rightExpression" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519173">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519174">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519133" resolveInfo="result" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126519175">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519176">
      <property name="name" nameId="tpck.1169194664001" value="less" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519177" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519178" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519179">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519180">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519181">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519182">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519183">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519184">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519185">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519186" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126519187">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126519188">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519189">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519190">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519179" resolveInfo="leftExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519191" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519192">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519193">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519181" resolveInfo="rightExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519194" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126519195">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519196">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519197">
                <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519198">
                  <property name="name" nameId="tpck.1169194664001" value="now" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519199">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
                  </node>
                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126519200">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126519201">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(org%djoda%dtime%dDateTimeZone)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519202">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126519203">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519204">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519205">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519206">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519207">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519185" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="734650238126519208">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519209">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519210">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519211">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519179" resolveInfo="leftExpression" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519212">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BasePeriod%dtoDurationFrom(org%djoda%dtime%dReadableInstant)%corg%djoda%dtime%dDuration" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519213">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519198" resolveInfo="now" />
                          </node>
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519214">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractDuration%dcompareTo(java%dlang%dObject)%cint" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519215">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519216">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519181" resolveInfo="rightExpression" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519217">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BasePeriod%dtoDurationFrom(org%djoda%dtime%dReadableInstant)%corg%djoda%dtime%dDuration" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519218">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519198" resolveInfo="now" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519219">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519220">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="734650238126519221">
              <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126519222">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126519223">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~NullPointerException%d&lt;init&gt;(java%dlang%dString)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126519224">
                    <property name="value" nameId="tpee.1070475926801" value="Operands shouldn't be null" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519225">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519226">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519185" resolveInfo="result" />
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126519227">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519228">
      <property name="name" nameId="tpck.1169194664001" value="isNull" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519229" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519230" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519231">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519232">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519233">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519234">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519235">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519236">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519231" resolveInfo="datetime" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519237" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519238">
      <property name="name" nameId="tpck.1169194664001" value="isNotNull" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519239" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519240" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519241">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519242">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519243">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519244">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126519245">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519246">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519241" resolveInfo="datetime" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519247" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519248">
      <property name="name" nameId="tpck.1169194664001" value="isNull" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519249" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519250" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519251">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519252">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519253">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519254">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519255">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519256">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519251" resolveInfo="datetime" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519257" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519258">
      <property name="name" nameId="tpck.1169194664001" value="isNotNull" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519259" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519260" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519261">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519262">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519263">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519264">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126519265">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519266">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519261" resolveInfo="datetime" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519267" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519268">
      <property name="name" nameId="tpck.1169194664001" value="isNull" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519269" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519270" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519271">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519272" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519273">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519274">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="734650238126519275" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519276">
      <property name="name" nameId="tpck.1169194664001" value="isNotNull" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519277" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519278" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519279">
        <property name="name" nameId="tpck.1169194664001" value="datetime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519280" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519281">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519282">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="734650238126519283">
            <property name="value" nameId="tpee.1068580123138" value="true" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519284">
      <property name="name" nameId="tpck.1169194664001" value="withTimeZone" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519285" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519286" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519287">
        <property name="name" nameId="tpck.1169194664001" value="tz" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519288">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519289">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519290">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519291">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126519292">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519293">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dset(java%dlang%dObject)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519294">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519287" resolveInfo="tz" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126519295">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126519296">
      <property name="name" nameId="tpck.1169194664001" value="getCurrentTimeZone" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519297" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519298">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519299">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519300">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519301">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126519302">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126517502" resolveInfo="currentZone" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519303">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~ThreadLocal%dget()%cjava%dlang%dObject" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126519304">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
  </root>
  <root id="734650238126519447">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519448" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519449">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126519450">
      <property name="name" nameId="tpck.1169194664001" value="myPrinters" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519451">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519452">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519453" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126519454">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519455" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519456" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519457" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519458">
      <property name="name" nameId="tpck.1169194664001" value="estimatePrintedLength" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519459" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519460" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519461">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519462">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519463">
            <property name="name" nameId="tpck.1169194664001" value="max" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519464" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519465">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="734650238126519466">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519467">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519662" resolveInfo="getAllPrinters" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519468">
            <property name="name" nameId="tpck.1169194664001" value="printer" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519469">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519470">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519471">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519472">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519473">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519463" resolveInfo="max" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126519474">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmax(int,int)%cint" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519475">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519463" resolveInfo="max" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519476">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519477">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519468" resolveInfo="printer" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519478">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%destimatePrintedLength()%cint" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519479">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519480">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519463" resolveInfo="max" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519481">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519482" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519483" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519484">
        <property name="name" nameId="tpck.1169194664001" value="buf" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519485">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519486">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519487" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519488">
        <property name="name" nameId="tpck.1169194664001" value="chrono" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519489">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Chronology" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519490">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519491" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519492">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519493">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519494">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519495">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519496">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519497">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519498">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519499">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519600" resolveInfo="getPrinter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519500">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519486" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519501">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519490" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519502">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519492" resolveInfo="displayZone" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519503">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519494" resolveInfo="locale" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519504">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dlang%dStringBuffer,long,org%djoda%dtime%dChronology,int,org%djoda%dtime%dDateTimeZone,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519505">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519484" resolveInfo="buf" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519506">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519486" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519507">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519488" resolveInfo="chrono" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519508">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519490" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519509">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519492" resolveInfo="displayZone" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519510">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519494" resolveInfo="locale" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519511">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519512" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519513" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519514">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519515">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~Writer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519516">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519517" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519518">
        <property name="name" nameId="tpck.1169194664001" value="chrono" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519519">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Chronology" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519520">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519521" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519522">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519523">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519524">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519525">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519526">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519527">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519528">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519529">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519600" resolveInfo="getPrinter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519530">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519516" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519531">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519520" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519532">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519522" resolveInfo="displayZone" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519533">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519524" resolveInfo="locale" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519534">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dio%dWriter,long,org%djoda%dtime%dChronology,int,org%djoda%dtime%dDateTimeZone,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519535">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519514" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519536">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519516" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519537">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519518" resolveInfo="chrono" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519538">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519520" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519539">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519522" resolveInfo="displayZone" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519540">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519524" resolveInfo="locale" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519541">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519542">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519543" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519544" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519545">
        <property name="name" nameId="tpck.1169194664001" value="buf" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519546">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519547">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519548">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519549">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519550">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519551">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519552">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519553">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519554">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519581" resolveInfo="getPrinter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519555">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519547" resolveInfo="partial" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519556">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519549" resolveInfo="locale" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519557">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dlang%dStringBuffer,org%djoda%dtime%dReadablePartial,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519558">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519545" resolveInfo="buf" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519559">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519547" resolveInfo="partial" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519560">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519549" resolveInfo="locale" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519561">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519562" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519563" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519564">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519565">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~Writer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519566">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519567">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519568">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519569">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519570">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519571">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519572">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519573">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519581" resolveInfo="getPrinter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519574">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519566" resolveInfo="partial" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519575">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519568" resolveInfo="locale" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519576">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dio%dWriter,org%djoda%dtime%dReadablePartial,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519577">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519564" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519578">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519566" resolveInfo="partial" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519579">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519568" resolveInfo="locale" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519580">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519581">
      <property name="name" nameId="tpck.1169194664001" value="getPrinter" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="734650238126519582" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519583">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519584">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519585">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519586">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519587">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519588">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519589">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519590">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519625" resolveInfo="getPrinter" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126519591">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126519592">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519593">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519584" resolveInfo="partial" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519594" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519595">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519596">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519584" resolveInfo="partial" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519597">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~ReadablePartial%dtoDateTime(org%djoda%dtime%dReadableInstant)%corg%djoda%dtime%dDateTime" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519598" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519599" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519600">
      <property name="name" nameId="tpck.1169194664001" value="getPrinter" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="734650238126519601" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519602">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519603">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519604" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519605">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519606" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519607">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519608">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519609">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519610">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519611">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519612">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519613">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519625" resolveInfo="getPrinter" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126519614">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126519615">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519616">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519603" resolveInfo="instant" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519617">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126519618">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126519619">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(long,org%djoda%dtime%dDateTimeZone)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126519620">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519621">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519603" resolveInfo="instant" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519622">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519605" resolveInfo="displayOffset" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519623">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519607" resolveInfo="displayZone" />
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519624" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519625">
      <property name="name" nameId="tpck.1169194664001" value="getPrinter" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519626" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519627">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519628">
        <property name="name" nameId="tpck.1169194664001" value="dateTime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519629">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519630">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519631">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519632">
            <property name="name" nameId="tpck.1169194664001" value="index" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519633" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519634">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="734650238126519635" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519636">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519690" resolveInfo="getPrinterIndex" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126519637">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126517729" resolveInfo="convert" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519638">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519628" resolveInfo="dateTime" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126519639">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="734650238126519640">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519641">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519632" resolveInfo="index" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126519642">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126519643">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519644">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519645">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519646">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126519647">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="d0m4.~DateTimeFormat" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormat%dshortDateTime()%corg%djoda%dtime%dformat%dDateTimeFormatter" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519648">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetPrinter()%corg%djoda%dtime%dformat%dDateTimePrinter" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519649">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126519650">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126519651">
                <property name="name" nameId="tpck.1169194664001" value="printers" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519652">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519653">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
                  </node>
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519654">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="734650238126519655" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519656">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519662" resolveInfo="getAllPrinters" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519657">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519658">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519659">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519651" resolveInfo="printers" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519660">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dget(int)%cjava%dlang%dObject" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126519661">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519632" resolveInfo="index" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519662">
      <property name="name" nameId="tpck.1169194664001" value="getAllPrinters" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519663" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519664">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519665">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519666">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126519667">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519668">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519669">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="734650238126519670">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="734650238126519450" resolveInfo="myPrinters" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="734650238126519671" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519672" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519673">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.SynchronizedStatement" typeId="tpee.1170075670744" id="734650238126519674">
              <node role="expression" roleId="tpee.1170075728144" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="734650238126519675" />
              <node role="block" roleId="tpee.1170075736412" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519676">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126519677">
                  <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126519678">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519679">
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="734650238126519680">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="734650238126519450" resolveInfo="myPrinters" />
                      </node>
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="734650238126519681" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126519682" />
                  </node>
                  <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519683">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519684">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519685">
                        <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519686">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519450" resolveInfo="myPrinters" />
                        </node>
                        <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126519687">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519696" resolveInfo="createPrinters" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519688">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519689">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519450" resolveInfo="myPrinters" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519690">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="getPrinterIndex" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="734650238126519691" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519692" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519693">
        <property name="name" nameId="tpck.1169194664001" value="datetimeToFormat" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519694">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519695" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519696">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="createPrinters" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="734650238126519697" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519698">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519699">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519700" />
    </node>
  </root>
  <root id="734650238126519758">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519759" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519760">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
    </node>
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519761">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeParser" />
    </node>
    <node role="staticInnerClassifiers" roleId="tpee.1178616825527" type="tpee.ClassConcept" typeId="tpee.1068390468198" id="734650238126519762">
      <property name="name" nameId="tpck.1169194664001" value="LocaledDateTimeParserBucketWrapper" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519763" />
      <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519764">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeParserBucket" />
      </node>
      <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126519765">
        <property name="name" nameId="tpck.1169194664001" value="myBucket" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519766">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeParserBucket" />
        </node>
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519767" />
      </node>
      <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126519768">
        <property name="name" nameId="tpck.1169194664001" value="myLocale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519769">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519770" />
      </node>
      <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126519771">
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519772" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519773" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519774">
          <property name="name" nameId="tpck.1169194664001" value="bucket" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519775">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeParserBucket" />
          </node>
        </node>
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519776">
          <property name="name" nameId="tpck.1169194664001" value="locale" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519777">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
          </node>
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520018">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="734650238126520019">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%d&lt;init&gt;(long,org%djoda%dtime%dChronology,java%dutil%dLocale)" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126520020">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520021" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520022" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520023">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126520024">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520025">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520026">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519774" resolveInfo="bucket" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520027">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126520028">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520029">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519768" resolveInfo="myLocale" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520030">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519776" resolveInfo="locale" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520031">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520032">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519787" resolveInfo="setZone" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520033">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520034">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ojzd.~DateTimeUtils" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeUtils%dgetChronology(org%djoda%dtime%dChronology)%corg%djoda%dtime%dChronology" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520035" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520036">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Chronology%dgetZone()%corg%djoda%dtime%dDateTimeZone" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519778">
        <property name="name" nameId="tpck.1169194664001" value="getChronology" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519779" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519780">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Chronology" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520037">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520038">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520039">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520040">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520041">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dgetChronology()%corg%djoda%dtime%dChronology" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519781">
        <property name="name" nameId="tpck.1169194664001" value="getLocale" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519782" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519783">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520042">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520043">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520044">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519768" resolveInfo="myLocale" />
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519784">
        <property name="name" nameId="tpck.1169194664001" value="getZone" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519785" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519786">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520045">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520046">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520047">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520048">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520049">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dgetZone()%corg%djoda%dtime%dDateTimeZone" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519787">
        <property name="name" nameId="tpck.1169194664001" value="setZone" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519788" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519789" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519790">
          <property name="name" nameId="tpck.1169194664001" value="zone" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519791">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
          </node>
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520050">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520051">
            <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126520052">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520053">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520054" />
            </node>
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520055">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520056">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520057">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520058">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520059">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dsetZone(org%djoda%dtime%dDateTimeZone)%cvoid" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520060">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519790" resolveInfo="zone" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519792">
        <property name="name" nameId="tpck.1169194664001" value="getOffset" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519793" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519794" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520061">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520062">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520063">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520064">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520065">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dgetOffset()%cint" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519795">
        <property name="name" nameId="tpck.1169194664001" value="setOffset" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519796" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519797" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519798">
          <property name="name" nameId="tpck.1169194664001" value="offset" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519799" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520066">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520067">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520068">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520069">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520070">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dsetOffset(int)%cvoid" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520071">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519798" resolveInfo="offset" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519800">
        <property name="name" nameId="tpck.1169194664001" value="getPivotYear" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519801" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519802">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520072">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520073">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520074">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520075">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520076">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dgetPivotYear()%cjava%dlang%dInteger" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519803">
        <property name="name" nameId="tpck.1169194664001" value="setPivotYear" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519804" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519805" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519806">
          <property name="name" nameId="tpck.1169194664001" value="pivotYear" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519807">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" />
          </node>
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520077">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520078">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520079">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520080">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520081">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dsetPivotYear(java%dlang%dInteger)%cvoid" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520082">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519806" resolveInfo="pivotYear" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519808">
        <property name="name" nameId="tpck.1169194664001" value="saveField" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519809" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519810" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519811">
          <property name="name" nameId="tpck.1169194664001" value="field" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519812">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeField" />
          </node>
        </node>
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519813">
          <property name="name" nameId="tpck.1169194664001" value="value" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519814" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520083">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520084">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520085">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520086">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520087">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dsaveField(org%djoda%dtime%dDateTimeField,int)%cvoid" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520088">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519811" resolveInfo="field" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520089">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519813" resolveInfo="value" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519815">
        <property name="name" nameId="tpck.1169194664001" value="saveField" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519816" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519817" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519818">
          <property name="name" nameId="tpck.1169194664001" value="fieldType" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519819">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
          </node>
        </node>
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519820">
          <property name="name" nameId="tpck.1169194664001" value="value" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519821" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520090">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520091">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520092">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520093">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520094">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dsaveField(org%djoda%dtime%dDateTimeFieldType,int)%cvoid" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520095">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519818" resolveInfo="fieldType" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520096">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519820" resolveInfo="value" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519822">
        <property name="name" nameId="tpck.1169194664001" value="saveField" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519823" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519824" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519825">
          <property name="name" nameId="tpck.1169194664001" value="fieldType" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519826">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeFieldType" />
          </node>
        </node>
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519827">
          <property name="name" nameId="tpck.1169194664001" value="text" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519828">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
          </node>
        </node>
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519829">
          <property name="name" nameId="tpck.1169194664001" value="locale" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519830">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
          </node>
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520097">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520098">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520099">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520100">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520101">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dsaveField(org%djoda%dtime%dDateTimeFieldType,java%dlang%dString,java%dutil%dLocale)%cvoid" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520102">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519825" resolveInfo="fieldType" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520103">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519827" resolveInfo="text" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520104">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519829" resolveInfo="locale" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519831">
        <property name="name" nameId="tpck.1169194664001" value="saveState" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519832" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519833">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520105">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520106">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520107">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520108">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520109">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dsaveState()%cjava%dlang%dObject" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519834">
        <property name="name" nameId="tpck.1169194664001" value="restoreState" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519835" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519836" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519837">
          <property name="name" nameId="tpck.1169194664001" value="savedState" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519838">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
          </node>
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520110">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520111">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520112">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520113">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520114">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%drestoreState(java%dlang%dObject)%cboolean" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520115">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519837" resolveInfo="savedState" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519839">
        <property name="name" nameId="tpck.1169194664001" value="computeMillis" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519840" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519841" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520116">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520117">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520118">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520119">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520120">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dcomputeMillis()%clong" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519842">
        <property name="name" nameId="tpck.1169194664001" value="computeMillis" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519843" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519844" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519845">
          <property name="name" nameId="tpck.1169194664001" value="resetFields" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519846" />
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520121">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520122">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520123">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520124">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520125">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dcomputeMillis(boolean)%clong" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520126">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519845" resolveInfo="resetFields" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519847">
        <property name="name" nameId="tpck.1169194664001" value="computeMillis" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519848" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519849" />
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519850">
          <property name="name" nameId="tpck.1169194664001" value="resetFields" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126519851" />
        </node>
        <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519852">
          <property name="name" nameId="tpck.1169194664001" value="text" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519853">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
          </node>
        </node>
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520127">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520128">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520129">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520130">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519765" resolveInfo="myBucket" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520131">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParserBucket%dcomputeMillis(boolean,java%dlang%dString)%clong" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520132">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519850" resolveInfo="resetFields" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520133">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519852" resolveInfo="text" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126519854">
      <property name="name" nameId="tpck.1169194664001" value="myDateTimeFormatter" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519855">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519856" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126519857">
      <property name="name" nameId="tpck.1169194664001" value="myLocale" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519858">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126519859" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126519860">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519861" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519862" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519863">
        <property name="name" nameId="tpck.1169194664001" value="dateTimeFormatter" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519864">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519865">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519866">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519867">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519868">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519869">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519870">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="734650238126519871">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="734650238126519872" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519873">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519863" resolveInfo="dateTimeFormatter" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519874">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126519875">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519876">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="734650238126519877">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="734650238126519857" resolveInfo="myLocale" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="734650238126519878" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519879">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519865" resolveInfo="locale" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519880">
      <property name="name" nameId="tpck.1169194664001" value="estimatePrintedLength" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519881" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519882" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519883">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519884">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519885">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519886">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519887">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519888">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetPrinter()%corg%djoda%dtime%dformat%dDateTimePrinter" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519889">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%destimatePrintedLength()%cint" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519890">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519891" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519892" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519893">
        <property name="name" nameId="tpck.1169194664001" value="buf" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519894">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519895">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519896" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519897">
        <property name="name" nameId="tpck.1169194664001" value="chrono" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519898">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Chronology" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519899">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519900" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519901">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519902">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519903">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519904">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519905">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519906">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519907">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519908">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519909">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519910">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetPrinter()%corg%djoda%dtime%dformat%dDateTimePrinter" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519911">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dlang%dStringBuffer,long,org%djoda%dtime%dChronology,int,org%djoda%dtime%dDateTimeZone,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519912">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519893" resolveInfo="buf" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519913">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519895" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519914">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519897" resolveInfo="chrono" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519915">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519899" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519916">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519901" resolveInfo="displayZone" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519917">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519857" resolveInfo="myLocale" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519918">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519919" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519920" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519921">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519922">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~Writer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519923">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126519924" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519925">
        <property name="name" nameId="tpck.1169194664001" value="chrono" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519926">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Chronology" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519927">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519928" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519929">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519930">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519931">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519932">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519933">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519934">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519935">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519936">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519937">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519938">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetPrinter()%corg%djoda%dtime%dformat%dDateTimePrinter" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519939">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dio%dWriter,long,org%djoda%dtime%dChronology,int,org%djoda%dtime%dDateTimeZone,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519940">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519921" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519941">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519923" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519942">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519925" resolveInfo="chrono" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519943">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519927" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519944">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519929" resolveInfo="displayZone" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519945">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519857" resolveInfo="myLocale" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519946">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519947">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519948" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519949" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519950">
        <property name="name" nameId="tpck.1169194664001" value="buf" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519951">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519952">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519953">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519954">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519955">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519956">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519957">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519958">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519959">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519960">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519961">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetPrinter()%corg%djoda%dtime%dformat%dDateTimePrinter" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519962">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dlang%dStringBuffer,org%djoda%dtime%dReadablePartial,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519963">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519950" resolveInfo="buf" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519964">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519952" resolveInfo="partial" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519965">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519857" resolveInfo="myLocale" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519966">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519967" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126519968" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519969">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519970">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~Writer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519971">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519972">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519973">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519974">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519975">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126519976">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519977">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519978">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519979">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519980">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetPrinter()%corg%djoda%dtime%dformat%dDateTimePrinter" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519981">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimePrinter%dprintTo(java%dio%dWriter,org%djoda%dtime%dReadablePartial,java%dutil%dLocale)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519982">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519969" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126519983">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519971" resolveInfo="partial" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519984">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519857" resolveInfo="myLocale" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126519985">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519986">
      <property name="name" nameId="tpck.1169194664001" value="estimateParsedLength" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519987" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519988" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126519989">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126519990">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519991">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126519992">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126519993">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519994">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetParser()%corg%djoda%dtime%dformat%dDateTimeParser" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126519995">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParser%destimateParsedLength()%cint" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126519996">
      <property name="name" nameId="tpck.1169194664001" value="parseInto" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126519997" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126519998" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126519999">
        <property name="name" nameId="tpck.1169194664001" value="bucket" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520000">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeParserBucket" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520001">
        <property name="name" nameId="tpck.1169194664001" value="text" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520002">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520003">
        <property name="name" nameId="tpck.1169194664001" value="position" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126520004" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520005">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520006">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520007">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520008">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520009">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519854" resolveInfo="myDateTimeFormatter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520010">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dgetParser()%corg%djoda%dtime%dformat%dDateTimeParser" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520011">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeParser%dparseInto(org%djoda%dtime%dformat%dDateTimeParserBucket,java%dlang%dString,int)%cint" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520012">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520013">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519771" resolveInfo="FixedLocaleDateTimeFormatter.LocaledDateTimeParserBucketWrapper" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520014">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519999" resolveInfo="bucket" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520015">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126519857" resolveInfo="myLocale" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520016">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520001" resolveInfo="text" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520017">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520003" resolveInfo="position" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="734650238126520179">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520180" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126520181">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520182" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520183" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520184" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520185">
      <property name="name" nameId="tpck.1169194664001" value="createFormatter" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520186" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520187">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520188">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520189">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520190">
            <property name="name" nameId="tpck.1169194664001" value="builder" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520191">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatterBuilder" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520192">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520193">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatterBuilder%d&lt;init&gt;()" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520194">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520195">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520196">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520190" resolveInfo="builder" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520197">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatterBuilder%dtoFormatter()%corg%djoda%dtime%dformat%dDateTimeFormatter" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="734650238126520198">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520199" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126520200">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520201" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520202" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520203" />
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520204">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520205" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520206">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520207">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520208">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520209">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520210">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520211">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520212">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520213">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520214">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520215">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520207" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520216" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520217">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520218">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520209" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520219" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520220">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520221">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520222">
                <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520223">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520224">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520209" resolveInfo="right" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520225" />
                </node>
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126520226">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520227">
                    <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126520228">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520229">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520207" resolveInfo="left" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520230" />
                    </node>
                    <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520231">
                      <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520232">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%d&lt;init&gt;(java%dlang%dObject)" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520233">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520207" resolveInfo="left" />
                        </node>
                      </node>
                    </node>
                    <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520234" />
                  </node>
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520235">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520236">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%d&lt;init&gt;(long)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.UnaryMinus" typeId="tpee.8064396509828172209" id="734650238126520237">
                      <node role="expression" roleId="tpee.1239714902950" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520238">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520209" resolveInfo="right" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520239">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520240">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520241">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%d&lt;init&gt;(long,long)" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520242">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520209" resolveInfo="right" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520243">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520207" resolveInfo="left" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520244">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520245" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520246">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520247">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520248">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520249">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520250">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520251">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520252">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520253">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520254">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520255">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520247" resolveInfo="leftExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520256" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520257">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520258">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520249" resolveInfo="rightExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520259" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520260">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520261">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126520262">
                <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ojzd.~Period" />
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ojzd.~Period%dZERO" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520263">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="734650238126520264">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520265">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520266">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520247" resolveInfo="leftExpression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520267">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%dcompareTo(java%dlang%dObject)%cint" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520268">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520249" resolveInfo="rightExpression" />
                </node>
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126520269">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="734650238126520270">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520271">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520272">
                <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520273">
                  <property name="name" nameId="tpck.1169194664001" value="i" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520274">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Interval" />
                  </node>
                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520275">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520276">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Interval%d&lt;init&gt;(org%djoda%dtime%dReadableInstant,org%djoda%dtime%dReadableInstant)" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520277">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520249" resolveInfo="rightExpression" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520278">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520247" resolveInfo="leftExpression" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520279">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520280">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520281">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520273" resolveInfo="i" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520282">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInterval%dtoPeriod()%corg%djoda%dtime%dPeriod" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520283">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520284">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520285">
                <property name="name" nameId="tpck.1169194664001" value="i" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520286">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Interval" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520287">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520288">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Interval%d&lt;init&gt;(org%djoda%dtime%dReadableInstant,org%djoda%dtime%dReadableInstant)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520289">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520247" resolveInfo="leftExpression" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520290">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520249" resolveInfo="rightExpression" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520291">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520292">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520293">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520294">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(long)" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126520295">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520296">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dminus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dPeriod" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520297">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520298">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520285" resolveInfo="i" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520299">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInterval%dtoPeriod()%corg%djoda%dtime%dPeriod" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520300">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520301" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520302">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520303">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520304">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520305">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520306">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520307">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520308">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520309">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520310">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520311">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520303" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520312" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520313">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520314">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520305" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520315" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520316">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520317">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520318">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520303" resolveInfo="left" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520319">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520320">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520321">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520303" resolveInfo="left" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520322">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dminus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dPeriod" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520323">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520305" resolveInfo="right" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520324">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520325" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520326">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520327">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520328">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520329">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520330">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520331">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520332">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520333">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520334">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520335">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520327" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520336" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520337">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520338">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520329" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520339" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520340">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520341">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520342" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520343">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520344">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520345">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520327" resolveInfo="left" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520346">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%dminus(org%djoda%dtime%dReadableDuration)%corg%djoda%dtime%dDuration" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520347">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520329" resolveInfo="right" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520348">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520349" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520350">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520351">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520352">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520353">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520354">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520355">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520356">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520357">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520358">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520359">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520351" resolveInfo="leftExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520360" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520361">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520362">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520353" resolveInfo="rightExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520363" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520364">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520365">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520366">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520351" resolveInfo="leftExpression" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520367">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520368">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520369">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520370">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520371">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520372">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520351" resolveInfo="leftExpression" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520373">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519296" resolveInfo="getCurrentTimeZone" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520374">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dminus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dDateTime" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520375">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520353" resolveInfo="rightExpression" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520376">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126520377">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520378">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520379" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520380">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520381">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520382">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520383">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520384">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520385">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520386">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520387">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520388">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520389">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520381" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520390" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520391">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520392">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520383" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520393" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520394">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520395">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520396">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520381" resolveInfo="left" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520397">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126520398">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520399">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520400">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520381" resolveInfo="left" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520401">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Long%dlongValue()%clong" />
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520402">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520403">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520383" resolveInfo="right" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520404">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDuration%dgetMillis()%clong" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520405">
      <property name="name" nameId="tpck.1169194664001" value="minus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520406" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520407">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520408">
        <property name="name" nameId="tpck.1169194664001" value="leftExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520409">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520410">
        <property name="name" nameId="tpck.1169194664001" value="rightExpression" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520411">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520412">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520413">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520414">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520415">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520416">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520408" resolveInfo="leftExpression" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520417" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520418" />
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520419">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520420">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520408" resolveInfo="leftExpression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520421">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dminus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dDateTime" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520422">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520410" resolveInfo="rightExpression" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520423">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520424" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520425">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520426">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520427">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520428">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520429">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520430">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520431">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520432">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520433">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520434">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520426" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520435" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520436">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520437">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520428" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520438" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520439">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520440">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520441">
                <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520442">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520443">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520426" resolveInfo="left" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520444" />
                </node>
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520445">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520428" resolveInfo="right" />
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520446">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520426" resolveInfo="left" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520447">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520448">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520449">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520426" resolveInfo="left" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520450">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%dplus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dPeriod" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520451">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520428" resolveInfo="right" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520452">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520453" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520454">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520455">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520456">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520457">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520458">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520459">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520460">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520461">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520462">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520463">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520455" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520464" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520465">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520466">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520457" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520467" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520468">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520469">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520470">
                <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520471">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520472">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520455" resolveInfo="left" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520473" />
                </node>
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520474">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520457" resolveInfo="right" />
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520475">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520455" resolveInfo="left" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520476">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520477">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520478">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520455" resolveInfo="left" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520479">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Duration%dplus(org%djoda%dtime%dReadableDuration)%corg%djoda%dtime%dDuration" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520480">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520457" resolveInfo="right" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520481">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520482" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520483">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520484">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520485">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520486">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520487">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520488">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520489">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520490">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126520198" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520494" resolveInfo="plus" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520491">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520486" resolveInfo="right" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520492">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520484" resolveInfo="left" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126520493">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520494">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520495" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520496">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520497">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520498">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520499">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520500">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520501">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520502">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520503">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520504">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520505">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520497" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520506" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520507">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520508">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520499" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520509" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520510">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520511">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520512">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520497" resolveInfo="left" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520513">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520514">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520515">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520516">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520517">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject,org%djoda%dtime%dDateTimeZone)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520518">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520497" resolveInfo="left" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520519">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519296" resolveInfo="getCurrentTimeZone" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520520">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dplus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dDateTime" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520521">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520499" resolveInfo="right" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520522">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDateTime%dgetMillis()%clong" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="734650238126520523">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Deprecated" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520524">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520525" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520526">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520527">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520528">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520529">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520530">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520531">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520532">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520533">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126520198" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520536" resolveInfo="plus" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520534">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520529" resolveInfo="right" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520535">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520527" resolveInfo="left" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520536">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520537" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520538">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520539">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520540">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520541">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520542">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Duration" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520543">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520544">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520545">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520546">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520547">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520539" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520548" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520549">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520550">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520541" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520551" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520552">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520553">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520554">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520539" resolveInfo="left" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520555">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="734650238126520556">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520557">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520558">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520539" resolveInfo="left" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520559">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Long%dlongValue()%clong" />
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520560">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520561">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520541" resolveInfo="right" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520562">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~BaseDuration%dgetMillis()%clong" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520563">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520564" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520565">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520566">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520567">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520568">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520569">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520570">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520571">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520572">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520573">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520574">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520566" resolveInfo="left" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520575" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520576">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520577">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520568" resolveInfo="right" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520578" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520579">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520580">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520581">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520566" resolveInfo="left" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520582">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520583">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520584">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520566" resolveInfo="left" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520585">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%dplus(org%djoda%dtime%dReadablePeriod)%corg%djoda%dtime%dDateTime" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520586">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520568" resolveInfo="right" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520587">
      <property name="name" nameId="tpck.1169194664001" value="plus" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520588" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520589">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520590">
        <property name="name" nameId="tpck.1169194664001" value="left" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520591">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520592">
        <property name="name" nameId="tpck.1169194664001" value="right" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520593">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520594">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520595">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520596">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126520198" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520563" resolveInfo="plus" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520597">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520592" resolveInfo="right" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520598">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520590" resolveInfo="left" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520599">
      <property name="name" nameId="tpck.1169194664001" value="min" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520600" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520601">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520602">
        <property name="name" nameId="tpck.1169194664001" value="a" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520603">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520604">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520605">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520606">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520607">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520608">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520609">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520610">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520611">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520602" resolveInfo="a" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520612" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520613">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520614">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520604" resolveInfo="b" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520615" />
              </node>
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520616" />
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520617">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmin(long,long)%clong" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520618">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520602" resolveInfo="a" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520619">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520604" resolveInfo="b" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520620">
      <property name="name" nameId="tpck.1169194664001" value="max" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520621" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520622">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520623">
        <property name="name" nameId="tpck.1169194664001" value="a" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520624">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520625">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520626">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520627">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520628">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520629">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520630">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520631">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520623" resolveInfo="a" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520632" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520633">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520625" resolveInfo="b" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="734650238126520634">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520635">
                <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520636">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520637">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520625" resolveInfo="b" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520638" />
                </node>
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520639">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520623" resolveInfo="a" />
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520640">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmax(long,long)%clong" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520641">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520623" resolveInfo="a" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520642">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520625" resolveInfo="b" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520643">
      <property name="name" nameId="tpck.1169194664001" value="min" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520644" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520645">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520646">
        <property name="name" nameId="tpck.1169194664001" value="a" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520647">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520648">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520649">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520650">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520651">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520652">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520653">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520654">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520646" resolveInfo="a" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520655" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520656">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520657">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520648" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520658" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520659">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520660">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520661" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520662">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520663">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126520664" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520665">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520666">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ojzd.~DateTimeComparator" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeComparator%dgetInstance()%corg%djoda%dtime%dDateTimeComparator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520667">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeComparator%dcompare(java%dlang%dObject,java%dlang%dObject)%cint" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520668">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520646" resolveInfo="a" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520669">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520648" resolveInfo="b" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520670">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520671">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="734650238126520672">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520673">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520663" resolveInfo="res" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126520674">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520675">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520646" resolveInfo="a" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520676">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520648" resolveInfo="b" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520677">
      <property name="name" nameId="tpck.1169194664001" value="max" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520678" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520679">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520680">
        <property name="name" nameId="tpck.1169194664001" value="a" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520681">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520682">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520683">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520684">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="734650238126520685">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="734650238126520686">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520687">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520688">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520680" resolveInfo="a" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520689" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520690">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520691">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520682" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520692" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520693">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520694">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520695">
                <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="734650238126520696">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520697">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520680" resolveInfo="a" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520698" />
                </node>
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520699">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520680" resolveInfo="a" />
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520700">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520682" resolveInfo="b" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520701">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520702">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126520703" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520704">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520705">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ojzd.~DateTimeComparator" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeComparator%dgetInstance()%corg%djoda%dtime%dDateTimeComparator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520706">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTimeComparator%dcompare(java%dlang%dObject,java%dlang%dObject)%cint" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520707">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520680" resolveInfo="a" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520708">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520682" resolveInfo="b" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520709">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520710">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="734650238126520711">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520712">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520702" resolveInfo="res" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126520713">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520714">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520680" resolveInfo="a" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520715">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520682" resolveInfo="b" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="734650238126520716">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520717" />
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="734650238126520718">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="RSS_DATE_FORMATTER" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520719">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520720" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520721">
        <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520722">
          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="d0m4.~DateTimeFormat" />
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormat%dforPattern(java%dlang%dString)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126520723">
            <property name="value" nameId="tpee.1070475926801" value="EEE, dd MMM yyyy HH:mm:ss zzz" />
          </node>
        </node>
        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520724">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~DateTimeFormatter%dwithLocale(java%dutil%dLocale)%corg%djoda%dtime%dformat%dDateTimeFormatter" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="734650238126520725">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k7g3.~Locale" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k7g3.~Locale%dUS" />
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126520726">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520727" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520728" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520729" />
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520730">
      <property name="name" nameId="tpck.1169194664001" value="rssDate" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520731" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520732">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520733">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520734">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126520735">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520718" resolveInfo="RSS_DATE_FORMATTER" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="734650238126520736">
      <property name="name" nameId="tpck.1169194664001" value="defaultFormat" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520737" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520738">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimeFormatter" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520739">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520740">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="734650238126520741">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520718" resolveInfo="RSS_DATE_FORMATTER" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="734650238126520742">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520743" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520744">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~DateTimePrinter" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126520745">
      <property name="name" nameId="tpck.1169194664001" value="myPeriodType" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520746">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~PeriodType" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520747" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126520748">
      <property name="name" nameId="tpck.1169194664001" value="myPeriodFormatter" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520749">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="d0m4.~PeriodFormatter" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520750" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="734650238126520751">
      <property name="name" nameId="tpck.1169194664001" value="myReference" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520752">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadableInstant" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520753" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126520754">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520755" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520756" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520757">
        <property name="name" nameId="tpck.1169194664001" value="reference" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520758">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520759">
        <property name="name" nameId="tpck.1169194664001" value="types" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.VariableArityType" typeId="tpee.1219920932475" id="734650238126520760">
          <node role="componentType" roleId="tpee.1219921048460" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520761">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DurationFieldType" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520762">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520763">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126520764">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520765">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520745" resolveInfo="myPeriodType" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520766">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ojzd.~PeriodType" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~PeriodType%dforFields(org%djoda%dtime%dDurationFieldType[])%corg%djoda%dtime%dPeriodType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520767">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520759" resolveInfo="types" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520768">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126520769">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520770">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520748" resolveInfo="myPeriodFormatter" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="734650238126520771">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="d0m4.~PeriodFormat" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~PeriodFormat%dgetDefault()%corg%djoda%dtime%dformat%dPeriodFormatter" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520772">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="734650238126520773">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520774">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520775">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520757" resolveInfo="reference" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="734650238126520776">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520777" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520778" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520779">
        <property name="name" nameId="tpck.1169194664001" value="types" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.VariableArityType" typeId="tpee.1219920932475" id="734650238126520780">
          <node role="componentType" roleId="tpee.1219921048460" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520781">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DurationFieldType" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520782">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ThisConstructorInvocation" typeId="tpee.1178893518978" id="734650238126520783">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520754" resolveInfo="OffsetDateTimePrinter" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520784" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520785">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520779" resolveInfo="types" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520786">
      <property name="name" nameId="tpck.1169194664001" value="estimatePrintedLength" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520787" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126520788" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520789">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520790">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126520791">
            <property name="value" nameId="tpee.1068580320021" value="10" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520792">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520793" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520794" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520795">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520796">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520797">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126520798" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520799">
        <property name="name" nameId="tpck.1169194664001" value="chrono" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520800">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Chronology" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520801">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126520802" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520803">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520804">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520805">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520806">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520807">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520808">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520809">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520810">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520811">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520946" resolveInfo="toDateTime" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520812">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520797" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520813">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520801" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520814">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520803" resolveInfo="displayZone" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520815">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520816">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520817">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520795" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520818">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dString)%cjava%dlang%dStringBuffer" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520819">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521020" resolveInfo="prefix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520820">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520809" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520821">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520822">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520823">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520748" resolveInfo="myPeriodFormatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520824">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~PeriodFormatter%dprintTo(java%dlang%dStringBuffer,org%djoda%dtime%dReadablePeriod)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520825">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520795" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520826">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520981" resolveInfo="toPeriod" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520827">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520809" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520828">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520829">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520830">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520795" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520831">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dString)%cjava%dlang%dStringBuffer" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520832">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521047" resolveInfo="suffix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520833">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520809" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520834">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520835" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520836" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520837">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520838">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~Writer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520839">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126520840" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520841">
        <property name="name" nameId="tpck.1169194664001" value="chrono" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520842">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Chronology" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520843">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126520844" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520845">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520846">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520847">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520848">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520849">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520850">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520851">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520852">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520853">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520946" resolveInfo="toDateTime" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520854">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520839" resolveInfo="instant" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520855">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520843" resolveInfo="displayOffset" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520856">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520845" resolveInfo="displayZone" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520857">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520858">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520859">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520837" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520860">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~Writer%dappend(java%dlang%dCharSequence)%cjava%dio%dWriter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520861">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521020" resolveInfo="prefix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520862">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520851" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520863">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520864">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520865">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520748" resolveInfo="myPeriodFormatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520866">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~PeriodFormatter%dprintTo(java%dio%dWriter,org%djoda%dtime%dReadablePeriod)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520867">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520837" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520868">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520981" resolveInfo="toPeriod" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520869">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520851" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520870">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520871">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520872">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520837" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520873">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~Writer%dappend(java%dlang%dCharSequence)%cjava%dio%dWriter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520874">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521047" resolveInfo="suffix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520875">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520851" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520876">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520877">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520878" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520879" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520880">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520881">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520882">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520883">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520884">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520885">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520886">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520887">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520888">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520889">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520890">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520967" resolveInfo="toDateTime" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520891">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520882" resolveInfo="partial" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520892">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520893">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520894">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520880" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520895">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dString)%cjava%dlang%dStringBuffer" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520896">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521020" resolveInfo="prefix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520897">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520888" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520898">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520899">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520900">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520748" resolveInfo="myPeriodFormatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520901">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~PeriodFormatter%dprintTo(java%dlang%dStringBuffer,org%djoda%dtime%dReadablePeriod)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520902">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520880" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520903">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520981" resolveInfo="toPeriod" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520904">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520888" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520905">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520906">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520907">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520880" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520908">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dString)%cjava%dlang%dStringBuffer" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520909">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521047" resolveInfo="suffix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520910">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520888" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520911">
      <property name="name" nameId="tpck.1169194664001" value="printTo" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="734650238126520912" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="734650238126520913" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520914">
        <property name="name" nameId="tpck.1169194664001" value="out" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520915">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~Writer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520916">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520917">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520918">
        <property name="name" nameId="tpck.1169194664001" value="locale" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520919">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Locale" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520920">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520921">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520922">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520923">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520924">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520967" resolveInfo="toDateTime" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520925">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520916" resolveInfo="partial" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520926">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520927">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520928">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520914" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520929">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~Writer%dappend(java%dlang%dCharSequence)%cjava%dio%dWriter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520930">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521020" resolveInfo="prefix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520931">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520922" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520932">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520933">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520934">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520748" resolveInfo="myPeriodFormatter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520935">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="d0m4.~PeriodFormatter%dprintTo(java%dio%dWriter,org%djoda%dtime%dReadablePeriod)%cvoid" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520936">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520914" resolveInfo="out" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520937">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126520981" resolveInfo="toPeriod" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520938">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520922" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="734650238126520939">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520940">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520941">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520914" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520942">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~Writer%dappend(java%dlang%dCharSequence)%cjava%dio%dWriter" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="734650238126520943">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126521047" resolveInfo="suffix" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520944">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520922" resolveInfo="dateTime" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520945">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520946">
      <property name="name" nameId="tpck.1169194664001" value="toDateTime" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520947" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520948">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520949">
        <property name="name" nameId="tpck.1169194664001" value="instant" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.LongType" typeId="tpee.1068581242867" id="734650238126520950" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520951">
        <property name="name" nameId="tpck.1169194664001" value="displayOffset" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="734650238126520952" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520953">
        <property name="name" nameId="tpck.1169194664001" value="displayZone" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520954">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520955">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520956">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520957">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520958">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520959">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520960">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(long,org%djoda%dtime%dDateTimeZone)" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="734650238126520961">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520962">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520949" resolveInfo="instant" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520963">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520951" resolveInfo="displayOffset" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520964">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520953" resolveInfo="displayZone" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520965">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520966">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520957" resolveInfo="dateTime" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520967">
      <property name="name" nameId="tpck.1169194664001" value="toDateTime" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520968" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520969">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520970">
        <property name="name" nameId="tpck.1169194664001" value="partial" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520971">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~ReadablePartial" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520972">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520973">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520974">
            <property name="name" nameId="tpck.1169194664001" value="dateTime" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520975">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126520976">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126520977">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~DateTime%d&lt;init&gt;(java%dlang%dObject)" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520978">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520970" resolveInfo="partial" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126520979">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126520980">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520974" resolveInfo="dateTime" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126520981">
      <property name="name" nameId="tpck.1169194664001" value="toPeriod" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126520982" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520983">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126520984">
        <property name="name" nameId="tpck.1169194664001" value="dateTime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126520985">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126520986">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126520987">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126520988">
            <property name="name" nameId="tpck.1169194664001" value="isBefore" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126520989" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126520990">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126520991">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126520992">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126520993" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520994">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520995">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520984" resolveInfo="dateTime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126520996">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%disBeforeNow()%cboolean" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="734650238126520997">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126520998">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126520999">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520984" resolveInfo="dateTime" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126521000">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%dcompareTo(java%dlang%dObject)%cint" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521001">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126521002">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126521003">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126521004">
            <property name="name" nameId="tpck.1169194664001" value="period" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126521005">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~Period" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126521006">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126521007">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520988" resolveInfo="isBefore" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126521008">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126521009">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(org%djoda%dtime%dReadableInstant,org%djoda%dtime%dReadableInstant,org%djoda%dtime%dPeriodType)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126521010">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520984" resolveInfo="dateTime" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521011">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521012">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520745" resolveInfo="myPeriodType" />
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="734650238126521013">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="734650238126521014">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ojzd.~Period%d&lt;init&gt;(org%djoda%dtime%dReadableInstant,org%djoda%dtime%dReadableInstant,org%djoda%dtime%dPeriodType)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521015">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126521016">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520984" resolveInfo="dateTime" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521017">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520745" resolveInfo="myPeriodType" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126521018">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126521019">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126521004" resolveInfo="period" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126521020">
      <property name="name" nameId="tpck.1169194664001" value="prefix" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126521021" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126521022">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126521023">
        <property name="name" nameId="tpck.1169194664001" value="dateTime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126521024">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126521025">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126521026">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126521027">
            <property name="name" nameId="tpck.1169194664001" value="isBefore" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126521028" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126521029">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126521030">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521031">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126521032" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126521033">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126521034">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126521023" resolveInfo="dateTime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126521035">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%disBeforeNow()%cboolean" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="734650238126521036">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126521037">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126521038">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126521023" resolveInfo="dateTime" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126521039">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%dcompareTo(java%dlang%dObject)%cint" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521040">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126521041">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126521042">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126521043">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126521044">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126521027" resolveInfo="isBefore" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126521045">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126521046">
              <property name="value" nameId="tpee.1070475926801" value="in " />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="734650238126521047">
      <property name="name" nameId="tpck.1169194664001" value="suffix" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="734650238126521048" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126521049">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="734650238126521050">
        <property name="name" nameId="tpck.1169194664001" value="dateTime" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="734650238126521051">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTime" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="734650238126521052">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="734650238126521053">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="734650238126521054">
            <property name="name" nameId="tpck.1169194664001" value="isBefore" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="734650238126521055" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126521056">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="734650238126521057">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521058">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="734650238126521059" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126521060">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126521061">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126521050" resolveInfo="dateTime" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126521062">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%disBeforeNow()%cboolean" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="734650238126521063">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="734650238126521064">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="734650238126521065">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126521050" resolveInfo="dateTime" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="734650238126521066">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a2d2.~AbstractInstant%dcompareTo(java%dlang%dObject)%cint" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="734650238126521067">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126520751" resolveInfo="myReference" />
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="734650238126521068">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="734650238126521069">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="734650238126521070">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="734650238126521071">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="734650238126521054" resolveInfo="isBefore" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126521072">
              <property name="value" nameId="tpee.1070475926801" value=" ago" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="734650238126521073">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="4300821714594275807">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="4300821714594275808">
      <property name="name" nameId="tpck.1169194664001" value="withTimeZone" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4300821714594275809">
        <property name="name" nameId="tpck.1169194664001" value="tz" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp6x.DateTimeZoneType" typeId="tp6x.1238513516532" id="4300821714594275810" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4300821714594275811">
        <property name="name" nameId="tpck.1169194664001" value="block" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2c.UnrestrictedFunctionType" typeId="tp2c.1229708828035" id="4300821714594275812">
          <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="4300821714594275813" />
          <node role="terminateType" roleId="tp2c.1232020907791" type="tpee.VoidType" typeId="tpee.1068581517677" id="4300821714594275814" />
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4300821714594275815" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4300821714594275816" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4300821714594275817">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4300821714594275818">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4300821714594275819">
            <property name="name" nameId="tpck.1169194664001" value="currenttz" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4300821714594275820">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ojzd.~DateTimeZone" resolveInfo="DateTimeZone" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4300821714594275821">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" resolveInfo="DateTimeOperations" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519296" resolveInfo="getCurrentTimeZone" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryStatement" typeId="tpee.1153952380246" id="4300821714594275822">
          <node role="body" roleId="tpee.1153952416686" type="tpee.StatementList" typeId="tpee.1068580123136" id="4300821714594275823">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4300821714594275824">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4300821714594275825">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" resolveInfo="DateTimeOperations" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519284" resolveInfo="withTimeZone" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4300821714594275826">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4300821714594275809" resolveInfo="tz" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4300821714594275827">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4300821714594275828">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4300821714594275829">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4300821714594275811" resolveInfo="block" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2c.InvokeFunctionOperation" typeId="tp2c.1225797177491" id="4300821714594275830" />
              </node>
            </node>
          </node>
          <node role="finallyBody" roleId="tpee.1153952429843" type="tpee.StatementList" typeId="tpee.1068580123136" id="4300821714594275831">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4300821714594275832">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4300821714594275833">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="734650238126517500" resolveInfo="DateTimeOperations" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="734650238126519284" resolveInfo="withTimeZone" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4300821714594275834">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4300821714594275819" resolveInfo="currenttz" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4300821714594275835" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4300821714594275836">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4300821714594275837" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4300821714594275838" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4300821714594275839" />
    </node>
  </root>
</model>

