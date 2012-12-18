<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:4f857b30-414f-4703-8cf7-80455f6ad887(jetbrains.mps.ui.sandbox.swt)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="71c80332-b17f-4f0a-be23-b5cba1d261f7(jetbrains.mps.ui.swt)" />
  <language-engaged-on-generation namespace="fb26dccf-fa54-4e9a-8ddb-b66311a34393(jetbrains.mps.ui)" />
  <import index="1taj" modelUID="r:36693452-2637-4608-8caa-ab32ee7c1be3(jetbrains.mps.ui.multiplexing)" version="-1" />
  <import index="lb0i" modelUID="r:61c770cf-d088-4c1b-909e-3424021db8f2(jetbrains.mps.ui.sandbox)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="3c2k" modelUID="f:java_stub#69934240-945d-492b-83e7-39bda70200e7#org.eclipse.swt.widgets(jetbrains.mps.ui.swt.runtime/org.eclipse.swt.widgets@java_stub)" version="-1" />
  <import index="3xp9" modelUID="f:java_stub#69934240-945d-492b-83e7-39bda70200e7#org.eclipse.swt.layout(jetbrains.mps.ui.swt.runtime/org.eclipse.swt.layout@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="gdfi" modelUID="f:java_stub#69934240-945d-492b-83e7-39bda70200e7#org.eclipse.swt.graphics(jetbrains.mps.ui.swt.runtime/org.eclipse.swt.graphics@java_stub)" version="-1" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1880762541167901442">
      <property name="name" nameId="tpck.1169194664001" value="SWTDemo" />
      <property name="abstractClass" nameId="tpee.1075300953594" value="false" />
    </node>
  </roots>
  <root id="1880762541167901442">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1880762541167901443">
      <property name="name" nameId="tpck.1169194664001" value="main" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1880762541167901444" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1880762541167901445" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1880762541167901446">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901447">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901448">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1880762541167901449">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1880762541167901450">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1880762541167901516" resolveInfo="SWTDemo" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901451">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1880762541167901455" resolveInfo="demo" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1880762541167901452">
        <property name="name" nameId="tpck.1169194664001" value="args" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="1880762541167901453">
          <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1880762541167901454">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1880762541167901455">
      <property name="name" nameId="tpck.1169194664001" value="demo" />
      <property name="isAbstract" nameId="tpee.1178608670077" value="false" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1880762541167901456" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1880762541167901457" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1880762541167901458">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1880762541167901459">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1880762541167901460">
            <property name="name" nameId="tpck.1169194664001" value="dsp" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5021826863145087806">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3c2k.~Display" resolveInfo="Display" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1880762541167901462">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1880762541167901463">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Display%d&lt;init&gt;()" resolveInfo="Display" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1880762541167901464">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1880762541167901465">
            <property name="name" nameId="tpck.1169194664001" value="sh" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5021826863145087807">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3c2k.~Shell" resolveInfo="Shell" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1880762541167901467">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1880762541167901468">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Shell%d&lt;init&gt;(org%declipse%dswt%dwidgets%dDisplay)" resolveInfo="Shell" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901469">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901460" resolveInfo="dsp" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901470">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901471">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901472">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901465" resolveInfo="sh" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901473">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Composite%dsetLayout(org%declipse%dswt%dwidgets%dLayout)%cvoid" resolveInfo="setLayout" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1880762541167901474">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1880762541167901475">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3xp9.~FillLayout%d&lt;init&gt;()" resolveInfo="FillLayout" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901476">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901477">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901478">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lb0i.7046856741208198734" resolveInfo="createComponent" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901479">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901465" resolveInfo="sh" />
              </node>
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1880762541167901480" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901481">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901482">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901483">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901465" resolveInfo="sh" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901484">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Control%dpack()%cvoid" resolveInfo="pack" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901485">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901486">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901487">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901465" resolveInfo="sh" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901488">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Control%dsetSize(int,int)%cvoid" resolveInfo="setSize" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1880762541167901489">
                <property name="value" nameId="tpee.1068580320021" value="800" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1880762541167901490">
                <property name="value" nameId="tpee.1068580320021" value="600" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901491">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901492">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901493">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901465" resolveInfo="sh" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901494">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Shell%dopen()%cvoid" resolveInfo="open" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.WhileStatement" typeId="tpee.1076505808687" id="1880762541167901495">
          <node role="condition" roleId="tpee.1076505808688" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1880762541167901496">
            <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901497">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901498">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901465" resolveInfo="sh" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901499">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Widget%disDisposed()%cboolean" resolveInfo="isDisposed" />
              </node>
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1880762541167901500">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1880762541167901501">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1880762541167901502">
                <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901503">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901504">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901460" resolveInfo="dsp" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901505">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Display%dreadAndDispatch()%cboolean" resolveInfo="readAndDispatch" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1880762541167901506">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901507">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901508">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901509">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901460" resolveInfo="dsp" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901510">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Display%dsleep()%cboolean" resolveInfo="sleep" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1880762541167901511">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1880762541167901512">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1880762541167901513">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1880762541167901460" resolveInfo="dsp" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1880762541167901514">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gdfi.~Device%ddispose()%cvoid" resolveInfo="dispose" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1880762541167901515" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="1880762541167901516">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1880762541167901517" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1880762541167901518" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1880762541167901519" />
    </node>
    <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1880762541167901520">
      <link role="annotation" roleId="tpee.1188208074048" targetNodeId="1taj.8590671622324574702" resolveInfo="Variant" />
      <node role="value" roleId="tpee.1188214630783" type="tpee.ImplicitAnnotationInstanceValue" typeId="tpee.2580416627845338977" id="1880762541167901521">
        <link role="key" roleId="tpee.1188214555875" targetNodeId="1taj.8590671622324574704" resolveInfo="value" />
        <node role="value" roleId="tpee.1188214607812" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1880762541167901522">
          <property name="value" nameId="tpee.1070475926801" value="SWT" />
        </node>
      </node>
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1880762541167901523">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lb0i.7046856741208198715" resolveInfo="UIDemo" />
    </node>
  </root>
</model>

