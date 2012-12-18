<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:c6893696-a0eb-4e7f-85af-ba0fc30305cd(jetbrains.mps.bash.editor)">
  <persistence version="7" />
  <language namespace="18bc6592-03a6-4e29-a83a-7ff23bde13ba(jetbrains.mps.lang.editor)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="13744753-c81f-424a-9c1b-cf8943bf4e86(jetbrains.mps.lang.sharedConcepts)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="u9e0" modelUID="r:49b10014-fe6b-4682-a69d-1c3d6188eba3(jetbrains.mps.bash.structure)" version="-1" />
  <import index="zy04" modelUID="r:c574a83a-ec69-4fe6-915d-e101a0ad8839(jetbrains.mps.bash.behavior)" version="-1" />
  <import index="tpc2" modelUID="r:00000000-0000-4000-0000-011c8959029e(jetbrains.mps.lang.editor.structure)" version="32" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3321051580269922208">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3321051580270259006">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3321051580270055527" resolveInfo="SimpleCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3321051580270296805">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3321051580269925631" resolveInfo="ShellScript" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3321051580270761365">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3321051580269894529" resolveInfo="CommandList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3321051580272063543">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3321051580272063536" resolveInfo="WordList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109504426814">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109504426811" resolveInfo="UntilLoopCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109505192341">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109504960433" resolveInfo="WhileLoopCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109506274373">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109506044887" resolveInfo="ForeachCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109506501548">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109506263695" resolveInfo="VariableNameDeclaration" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109507211199">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109507052112" resolveInfo="ForCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109507647020">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="terminator" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109503906472" resolveInfo="AsyncTerminator" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109507763312">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="terminator" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109503378340" resolveInfo="SemicolonTerminator" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109508737486">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="if" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109508737482" resolveInfo="ElifCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109508754192">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="if" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109508737477" resolveInfo="IfCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109510962919">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109510962907" resolveInfo="CaseClause" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109511075343">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109511075340" resolveInfo="CaseCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109511764432">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109511764425" resolveInfo="CaseTerminator" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109512579110">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109512452300" resolveInfo="SelectCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7633559109512908791">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="grouping" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109512908785" resolveInfo="GroupingCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467437184651">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467437635797">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467437635795" resolveInfo="ArithmeticCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467438007074">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467438007070" resolveInfo="PostVariableExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467438007087">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467438007071" resolveInfo="PreVariableExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467439274732">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="number" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467439274730" resolveInfo="DecimalConstant" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467439346941">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="number" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467439274735" resolveInfo="HexIntegerLiteral" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467439473298">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="number" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467439473295" resolveInfo="BasedIntegerLiteral" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467439714974">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467439714972" resolveInfo="BracketExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467440108305">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467440108301" resolveInfo="ConditionalOperation" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467440224572">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467441293218">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467441205664" resolveInfo="BaseVariableAssingment" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467442263101">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467442053841" resolveInfo="BasicParameterExpansion" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3999172467442724023">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467442724020" resolveInfo="ArithmeticExpansion" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8353259571483751825">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8353259571483751823" resolveInfo="TildeExpansion" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8353259571485353283">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8353259571485353280" resolveInfo="SimpleWord" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8353259571485385866">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468235197591">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468235197585" resolveInfo="BaseCommandSubstitution" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468235580308">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468235439117" resolveInfo="RedirectedCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468235580322">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468235580318" resolveInfo="InputRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468235611011">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468235580337" resolveInfo="OutputRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468235866605">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468235866604" resolveInfo="AppendingOutputRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468236240464">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468236240462" resolveInfo="OutputErrorRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468236502409">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468236365434" resolveInfo="AppendingOutputErrorRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468237284485">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468237284479" resolveInfo="HereDocumentRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468237475271">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468237475269" resolveInfo="HereStringRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468237475280">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468237475279" resolveInfo="DuplicateInputFileDiscriptor" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468237475294">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468237475293" resolveInfo="DuplicateOutputFileDiscriptor" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468237475307">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468237475306" resolveInfo="ReadingWritingRedirection" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468237560646">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468237520690" resolveInfo="FunctionDeclaration" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468237744077">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468237744075" resolveInfo="FunctionCallCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468241318044">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468241254994" resolveInfo="ExternalCommandDeclaration" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468241607044">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468241254997" resolveInfo="ExternalCommandCall" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468242547376">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468242547367" resolveInfo="OptionSet" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468242904306">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468242547369" resolveInfo="Option" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468243514706">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468243308834" resolveInfo="OptionWithParam" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="4857814468243911291">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468243911286" resolveInfo="Argument" />
    </node>
    <node type="tpc2.EditorComponentDeclaration" typeId="tpc2.1078938745671" id="7803330421055431010">
      <property name="name" nameId="tpck.1169194664001" value="Option_EditorComponent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468242547369" resolveInfo="Option" />
    </node>
    <node type="tpc2.EditorComponentDeclaration" typeId="tpc2.1078938745671" id="7803330421055753546">
      <property name="name" nameId="tpck.1169194664001" value="OptionDeclaration_EditorComponent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468242547369" resolveInfo="Option" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7803330421057268008">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7803330421057156061" resolveInfo="OptionSetReference" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7803330421057683803">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7803330421057519636" resolveInfo="OptionReference" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7803330421058150859">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7803330421058150857" resolveInfo="ArgumentReference" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="7803330421059093008">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7803330421058939228" resolveInfo="OptionWithParamReference" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3147078024744480397">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3147078024743869739" resolveInfo="ArgumentList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3147078024744633272">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3147078024744633269" resolveInfo="ArgumentListReference" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3147078024747082357">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3147078024747082354" resolveInfo="ConditionalCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3147078024751877536">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3147078024751877531" resolveInfo="QuotedWord" />
    </node>
    <node type="tpc2.StyleSheet" typeId="tpc2.1186402211651" id="3147078024755445596">
      <property name="name" nameId="tpck.1169194664001" value="BashLanguageStyle" />
    </node>
    <node type="tpc2.EditorComponentDeclaration" typeId="tpc2.1078938745671" id="3147078024757582231">
      <property name="name" nameId="tpck.1169194664001" value="ExternalCommandDescription_EditorComponent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468243514698" resolveInfo="IDescribedConcept" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3263637656462020084">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3999172467438007066" resolveInfo="UnaryArithmeticExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8457058248751696148">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8457058248751600624" resolveInfo="CommentedText" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8457058248751696158">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8457058248751696156" resolveInfo="CommentedCommandList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8474643070102636480">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8474643070102636479" resolveInfo="HeadCommandList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8474643070102636525">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8474643070102636489" resolveInfo="FollowingCommandList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8474643070110067655">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8474643070110067628" resolveInfo="CommentedFollowingCommandList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8474643070111564671">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="pipeline" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8474643070110245381" resolveInfo="HeadPipeline" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="8474643070112197221">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="pipeline" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.8474643070111818349" resolveInfo="FollowingPipeline" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3905757829896262164">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3905757829901343111">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.3905757829901343108" resolveInfo="Command" />
    </node>
    <node type="tpc2.EditorComponentDeclaration" typeId="tpc2.1078938745671" id="4515773109208483480">
      <property name="name" nameId="tpck.1169194664001" value="CommentSymbol" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4515773109208483475" resolveInfo="IComment" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9034131902186397591">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.4857814468235197608" resolveInfo="QuotesCommandSubstitution" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9034131902187955346">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.9034131902187955344" resolveInfo="VariableReference" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9034131902191439568">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9034131902191629599">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.9034131902191629597" resolveInfo="StringConditionalExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9034131902191635406">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9034131902193581136">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.9034131902193581134" resolveInfo="FreeCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="2362837471609549588">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="terminator" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.7633559109503378338" resolveInfo="CommandTerminator" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="2362837471611764249">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.2362837471611764246" resolveInfo="NotCommand" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="2362837471611859419">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.combine" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.2362837471611859413" resolveInfo="CombiningConditionalExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="2362837471611859442">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.combine" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="u9e0.2362837471611859440" resolveInfo="BracketConditionalExpression" />
    </node>
  </roots>
  <root id="3321051580269922208">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3321051580270635009">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3321051580270635010" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="3321051580270635012">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3321051580270635008" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutOnNewLineStyleClassItem" typeId="tpc2.1237385578942" id="4857814468235074042">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3321051580270635013" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineChildrenStyleClassItem" typeId="tpc2.1237375020029" id="3321051580270635016">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="emptyCellModel" roleId="tpc2.1140524464359" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3905757829896168337" />
      </node>
    </node>
  </root>
  <root id="3321051580270259006">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3321051580270259019">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3321051580270259020" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3321051580270259021">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3147078024756881581" resolveInfo="CommandName" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3321051580272063553">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3321051580272063551" />
      </node>
    </node>
  </root>
  <root id="3321051580270296805">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="6382090206695312322">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="6382090206695324294">
        <property name="text" nameId="tpc2.1073389577007" value="#!/bin/sh" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="6382090206695324299" resolveInfo="ActivationRecord" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="6382090206695324296">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9034131902190735831">
        <property name="text" nameId="tpc2.1073389577007" value="#" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4515773109208411260" resolveInfo="CommentSymbol" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9034131902190735837">
        <property name="text" nameId="tpc2.1073389577007" value="used variables:" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="9034131902190735838">
          <property name="style" nameId="tpc2.1186403771423" value="ITALIC" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="9034131902190735833">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902190735828" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="9034131902190735834" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="9034131902190735835">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="6382090206696966908">
        <property name="text" nameId="tpc2.1073389577007" value="#" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4515773109208411260" resolveInfo="CommentSymbol" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9034131902192314183">
        <property name="text" nameId="tpc2.1073389577007" value="name:" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="9034131902192314184">
          <property name="style" nameId="tpc2.1186403771423" value="ITALIC" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="6382090206696966910">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="2362837471610351523" resolveInfo="ShellScriptName" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="6382090206696966911">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="6382090206695312323" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109504960434">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3321051580270016552" />
      </node>
    </node>
  </root>
  <root id="3321051580270761365">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3321051580273396579">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3905757829893347586">
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3321051580273396581">
          <property name="attractsFocus" nameId="tpc2.1130859485024" value="3" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3321051580273150845" />
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.DefaultCaretPositionStyleClassItem" typeId="tpc2.1214472762472" id="975347375211484788">
            <property name="position" nameId="tpc2.1214472762473" value="FIRST" />
          </node>
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3905757829893347589">
          <property name="emptyNoTargetText" nameId="tpc2.1214560368769" value="true" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109503378344" />
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SideTransformAnchorTagStyleClassItem" typeId="tpc2.1214320119173" id="3905757829893347590">
            <property name="tag" nameId="tpc2.1214320119174" value="ext_2_RTransform" />
          </node>
        </node>
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="3905757829893675115">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3905757829893675116">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3905757829893675117">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="3905757829893675119">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.OrExpression" typeId="tpee.1080223426719" id="3905757829894475565">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829893831714">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829893831715">
                      <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="3905757829893831716" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3905757829893831717">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="u9e0.2635812496400429929" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNullOperation" typeId="tp25.1171999116870" id="3905757829893831718" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829894475569">
                    <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="3905757829894475568" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="3905757829894475573">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zy04.3905757829894475414" resolveInfo="isBaseCommandExists" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="6382090206695736099" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109508419883" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="2635812496400429925">
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="2635812496400429926">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="2635812496400429930">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.2635812496400429929" />
        </node>
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="2635812496400429928" />
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="2635812496400429931">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2635812496400429932">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2635812496400429933">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2635812496400429940">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2635812496400429935">
                  <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="2635812496400429934" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2635812496400429939">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="u9e0.2635812496400429929" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="2635812496400429944" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3321051580272063543">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3321051580272063545">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="3321051580272063548">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3321051580272063542" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3321051580272063549" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3321051580272063547" />
    </node>
  </root>
  <root id="7633559109504426814">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109504543604">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109504543605" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109504543606">
        <property name="text" nameId="tpc2.1073389577007" value="until" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109505728606">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="7633559109505728607" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109504543607">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109504426812" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109504751957">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109504751954">
        <property name="text" nameId="tpc2.1073389577007" value="do" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109504751955">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109504543610">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109504426808" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109504543611">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109504751958">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109504543614">
        <property name="text" nameId="tpc2.1073389577007" value="done" />
      </node>
    </node>
  </root>
  <root id="7633559109505192341">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109505192343">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109505192346">
        <property name="text" nameId="tpc2.1073389577007" value="while" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109505728604">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="7633559109505728605" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109505192348">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109505070366" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109505192350">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109505192353">
        <property name="text" nameId="tpc2.1073389577007" value="do" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109505192357">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109505192358">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109504426808" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109505192359">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109505192362">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109505192361">
        <property name="text" nameId="tpc2.1073389577007" value="done" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109505192345" />
    </node>
  </root>
  <root id="7633559109506274373">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109506274399">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109506274400" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109506274401">
        <property name="text" nameId="tpc2.1073389577007" value="for" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109507035720">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109506274372" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109506274412">
        <property name="text" nameId="tpc2.1073389577007" value="in" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="7633559109506274414">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109506274411" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109506274415" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109506501545">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="8353259571484522259">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109506274418">
        <property name="text" nameId="tpc2.1073389577007" value="do" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109506274420">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109506274423">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109504426808" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109506274425">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109506274428">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109506274427">
        <property name="text" nameId="tpc2.1073389577007" value="done" />
      </node>
    </node>
  </root>
  <root id="7633559109506501548">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7633559109506501556">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
      <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3147078024755445597" resolveInfo="Variable" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.DefaultCaretPositionStyleClassItem" typeId="tpc2.1214472762472" id="9034131902188290748">
        <property name="position" nameId="tpc2.1214472762473" value="LAST" />
      </node>
    </node>
  </root>
  <root id="7633559109507211199">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109507211201">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211204">
        <property name="text" nameId="tpc2.1073389577007" value="for" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211206">
        <property name="text" nameId="tpc2.1073389577007" value="((" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109507211208">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109507211188" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211210">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="7633559109507416178">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109507211212">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109507211197" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211214">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="7633559109507416179">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109507211216">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109507211198" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211218">
        <property name="text" nameId="tpc2.1073389577007" value="))" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211221">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211224">
        <property name="text" nameId="tpc2.1073389577007" value="do" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109507211225">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109507211228">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109504426808" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109507211229">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109508316534">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507211232">
        <property name="text" nameId="tpc2.1073389577007" value="done" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109507211203" />
    </node>
  </root>
  <root id="7633559109507647020">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507647022">
      <property name="text" nameId="tpc2.1073389577007" value="&amp;" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="2635812496401352277">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="2635812496401352279">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SideTransformAnchorTagStyleClassItem" typeId="tpc2.1214320119173" id="2635812496401687012">
        <property name="tag" nameId="tpc2.1214320119174" value="ext_2_RTransform" />
      </node>
    </node>
  </root>
  <root id="7633559109507763312">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109507763315">
      <property name="text" nameId="tpc2.1073389577007" value=";" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="2635812496401166399">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="2635812496401166401">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="8353259571483530023">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SideTransformAnchorTagStyleClassItem" typeId="tpc2.1214320119173" id="2635812496401687008">
        <property name="tag" nameId="tpc2.1214320119174" value="ext_2_RTransform" />
      </node>
    </node>
  </root>
  <root id="7633559109508737486">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109508737488">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109508737489" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508737490">
        <property name="text" nameId="tpc2.1073389577007" value="elif" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109508737491">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109508737485" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508737498">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508737500">
        <property name="text" nameId="tpc2.1073389577007" value="then" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109508737501">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109508737494">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109508737484" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109508737495">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109508737502">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutOnNewLineStyleClassItem" typeId="tpc2.1237385578942" id="7633559109509427059">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
    </node>
  </root>
  <root id="7633559109508754192">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109508754211">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109508754213" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508852663">
        <property name="text" nameId="tpc2.1073389577007" value="if" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109508852667">
        <property name="emptyNoTargetText" nameId="tpc2.1214560368769" value="false" />
        <property name="noTargetText" nameId="tpc2.1139852716018" value="&lt;test command&gt;" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109508737478" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508852669">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508852672">
        <property name="text" nameId="tpc2.1073389577007" value="then" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109508852674">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109508852678">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109508852679" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109508852676">
          <property name="noTargetText" nameId="tpc2.1139852716018" value="&lt;if true&gt;" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109508737479" />
          <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109508852682">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109508852688">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="7633559109508852686">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109508737481" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109508852687" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109509301282">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="emptyCellModel" roleId="tpc2.1140524464359" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3905757829895296288">
          <property name="text" nameId="tpc2.1073389577007" value="&lt;&lt;elif ...&gt;&gt;" />
          <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3905757829895296290" resolveInfo="HintStyle" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109508852704">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109508852705" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508852706">
          <property name="text" nameId="tpc2.1073389577007" value="else" />
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109508852709">
            <property name="flag" nameId="tpc2.1186414551515" value="true" />
          </node>
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109508852712">
          <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109508852713" />
          <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109508852711">
            <property name="noTargetText" nameId="tpc2.1139852716018" value="&lt;if false&gt;" />
            <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109508737480" />
            <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
          </node>
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109508852714">
            <property name="flag" nameId="tpc2.1186414551515" value="true" />
          </node>
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109508852716">
            <property name="flag" nameId="tpc2.1186414551515" value="true" />
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109508852720">
        <property name="text" nameId="tpc2.1073389577007" value="fi" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutOnNewLineStyleClassItem" typeId="tpc2.1237385578942" id="7633559109509314927">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
    </node>
  </root>
  <root id="7633559109510962919">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109511894336">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109511894337" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109510962921">
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="8353259571487205879">
          <property name="usesFolding" nameId="tpc2.1160590307797" value="false" />
          <property name="separatorText" nameId="tpc2.1140524450557" value=" |" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109510962908" />
          <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8353259571487662707" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109510962927">
          <property name="text" nameId="tpc2.1073389577007" value=")" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109510962929">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109510962909" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109510962931">
          <property name="emptyNoTargetText" nameId="tpc2.1214560368769" value="false" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109510962918" />
        </node>
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="7633559109511894335" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutOnNewLineStyleClassItem" typeId="tpc2.1237385578942" id="7633559109512009307">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
    </node>
  </root>
  <root id="7633559109511075343">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109511075345">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109511075348">
        <property name="text" nameId="tpc2.1073389577007" value="case" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109511075350">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109511075341" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109511075352">
        <property name="text" nameId="tpc2.1073389577007" value="in" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109511075354">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109511075356">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109511075357" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="7633559109511075358">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109511075342" />
          <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109511075359" />
          <node role="emptyCellModel" roleId="tpc2.1140524464359" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3905757829901098830">
            <property name="text" nameId="tpc2.1073389577007" value="&lt;&lt;case clause ... &gt;&gt;" />
            <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3905757829895296290" resolveInfo="HintStyle" />
          </node>
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109511075363">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109511201723">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineChildrenStyleClassItem" typeId="tpc2.1237375020029" id="7633559109511201724">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109511075365">
        <property name="text" nameId="tpc2.1073389577007" value="esac" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109511075347" />
    </node>
  </root>
  <root id="7633559109511764432">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="7633559109511764434">
      <property name="emptyNoTargetText" nameId="tpc2.1214560368769" value="false" />
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109511764428" resolveInfo="terminator" />
    </node>
  </root>
  <root id="7633559109512579110">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109512579112">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109512579113" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109512579120">
        <property name="text" nameId="tpc2.1073389577007" value="select" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109512579123">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109512579105" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109512579125">
        <property name="text" nameId="tpc2.1073389577007" value="in" />
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="7633559109512700653">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7633559109512700654">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7633559109512792656">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7633559109512792663">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7633559109512792658">
                  <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="7633559109512792657" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="7633559109512792662">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="u9e0.7633559109512579106" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="7633559109512792667" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109512579131">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109512579106" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109512579133">
        <property name="text" nameId="tpc2.1073389577007" value=";" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109512579135">
        <property name="text" nameId="tpc2.1073389577007" value="do" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109512579136">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109512579139">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109512579140" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109512579141">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109512579107" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109512579143">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109512579144">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7633559109512579146">
        <property name="text" nameId="tpc2.1073389577007" value="done" />
      </node>
    </node>
  </root>
  <root id="7633559109512908791">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109513140961">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="7633559109513141001">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109512908787" resolveInfo="leftBracket" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109513269852">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7633559109513140993">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109513140994" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7633559109513140986">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109512908790" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="7633559109513269853">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="7633559109513269854">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="7633559109513141004">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7633559109512908789" resolveInfo="rigthBracket" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7633559109513140962" />
    </node>
  </root>
  <root id="3999172467437184651">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467437184653">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3999172467437184654" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467437307215">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467437184656" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3999172467437307217">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467437184648" resolveInfo="sign" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3835416431563851216" resolveInfo="Operator" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467437307219">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467437184657" />
      </node>
    </node>
  </root>
  <root id="3999172467437635797">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467437635799">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467437635804">
        <property name="text" nameId="tpc2.1073389577007" value="((" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467437635806">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467437635796" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467437635809">
        <property name="text" nameId="tpc2.1073389577007" value="))" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3999172467437635801" />
    </node>
  </root>
  <root id="3999172467438007074">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467438007080">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467438007083">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3263637656462020095" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3999172467438007086">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467438007072" resolveInfo="sign" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="8353259571486759890">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467438007082" />
    </node>
  </root>
  <root id="3999172467438007087">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467438007089">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3999172467438007092">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467438007072" resolveInfo="sign" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="8353259571486759888">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3263637656462020100">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3263637656462020095" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467438007091" />
    </node>
  </root>
  <root id="3999172467439274732">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3999172467439274734">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467439274731" resolveInfo="value" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="8353259571483406694">
        <property name="color" nameId="tpc2.1186403713874" value="blue" />
      </node>
    </node>
  </root>
  <root id="3999172467439346941">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467439346943">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467439346946">
        <property name="text" nameId="tpc2.1073389577007" value="0x" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="3999172467439346949">
          <property name="style" nameId="tpc2.1186403771423" value="PLAIN" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="8353259571483406701">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="8353259571483406698">
          <property name="color" nameId="tpc2.1186403713874" value="blue" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3999172467439346948">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467439346940" resolveInfo="value" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="8353259571483406702">
          <property name="color" nameId="tpc2.1186403713874" value="blue" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467439346945" />
    </node>
  </root>
  <root id="3999172467439473298">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467439473300">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3999172467439473303">
        <property name="attractsFocus" nameId="tpc2.1130859485024" value="0" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467439473297" resolveInfo="base" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="8353259571483406695">
          <property name="color" nameId="tpc2.1186403713874" value="blue" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467439473305">
        <property name="text" nameId="tpc2.1073389577007" value="#" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="3999172467439473308">
          <property name="style" nameId="tpc2.1186403771423" value="PLAIN" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="8353259571483283493">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="8353259571483283495">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="7803330421059359254">
          <property name="color" nameId="tpc2.1186403713874" value="LIGHT_BLUE" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3999172467439473307">
        <property name="attractsFocus" nameId="tpc2.1130859485024" value="2" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467439473296" resolveInfo="value" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="8353259571483406696">
          <property name="color" nameId="tpc2.1186403713874" value="blue" />
        </node>
        <node role="focusPolicyApplicable" roleId="tpc2.1198512004906" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="3263637656459386692">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3263637656459386697">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3263637656459386698">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="3263637656459386705">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3263637656459386708">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3263637656459386700">
                  <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="3263637656459386699" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="3263637656459386704">
                    <link role="property" roleId="tp25.1138056395725" targetNodeId="u9e0.3999172467439473297" resolveInfo="base" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467439473302" />
    </node>
  </root>
  <root id="3999172467439714974">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467439714976">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467439714981">
        <property name="text" nameId="tpc2.1073389577007" value="(" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467439714979">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467439714973" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467439714983">
        <property name="text" nameId="tpc2.1073389577007" value=")" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467439714978" />
    </node>
  </root>
  <root id="3999172467440108305">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467440108319">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467440108320" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467440108321">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467440108302" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467440108323">
        <property name="text" nameId="tpc2.1073389577007" value="?" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467440108325">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467440108303" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467440108328">
        <property name="text" nameId="tpc2.1073389577007" value=":" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467440108330">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467440108304" />
      </node>
    </node>
  </root>
  <root id="3999172467440224572">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467440224574">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467440224577">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467440224563" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3999172467440224579">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467440224571" resolveInfo="sign" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3835416431563851216" resolveInfo="Operator" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="2362837471612273537">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="2362837471612273539">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467440224581">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467440224564" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467440224576" />
    </node>
  </root>
  <root id="3999172467441293218">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467441293225">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3999172467441293227" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467441293231">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467441293220" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3999172467441293238">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467441293236" resolveInfo="assingmentSign" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="3999172467441683729">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="3147078024746921925">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="3147078024746921927">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467441293240">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467441293221" />
      </node>
    </node>
  </root>
  <root id="3999172467442263101">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467442263103">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467442335344">
        <property name="text" nameId="tpc2.1073389577007" value="$" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661251953" resolveInfo="ParameterExpansion" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467442335346">
        <property name="text" nameId="tpc2.1073389577007" value="{" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661251953" resolveInfo="ParameterExpansion" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="8353259571483143544">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="8353259571483143546">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661366342">
          <property name="labelName" nameId="tpc2.1238091709220" value="curly-brace" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="3999172467442459847">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467442053842" />
        <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="3999172467442459848">
          <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3999172467442459850">
            <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
            <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
            <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3147078024755445597" resolveInfo="Variable" />
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467442335348">
        <property name="text" nameId="tpc2.1073389577007" value="}" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661251953" resolveInfo="ParameterExpansion" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="8353259571483143547">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661366344">
          <property name="labelName" nameId="tpc2.1238091709220" value="curly-brace" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467442263105" />
    </node>
  </root>
  <root id="3999172467442724023">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3999172467442724025">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467442724029">
        <property name="text" nameId="tpc2.1073389577007" value="$" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="8353259571484038908">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467442724031">
        <property name="text" nameId="tpc2.1073389577007" value="((" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="8353259571484150537">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3999172467442724033">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467442724022" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3999172467442724035">
        <property name="text" nameId="tpc2.1073389577007" value="))" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="8353259571484150538">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3999172467442724027" />
    </node>
  </root>
  <root id="8353259571483751825">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="8353259571483751827">
      <property name="text" nameId="tpc2.1073389577007" value="~" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="4857814468240305105">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
    </node>
  </root>
  <root id="8353259571485353283">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="8353259571485353285">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8353259571485353282" resolveInfo="word" />
      <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661547016" resolveInfo="SimpleWordStyle" />
    </node>
  </root>
  <root id="8353259571485385866">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="8353259571485385868">
      <property name="usesBraces" nameId="tpc2.1140524450556" value="false" />
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8353259571485385865" />
      <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
      <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Flow" typeId="tpc2.1106270637846" id="8353259571486510915" />
    </node>
  </root>
  <root id="4857814468235197591">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468235197600">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468235197601" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="4857814468235197602">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235197588" resolveInfo="left" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="3147078024757238512">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468235197604">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235197593" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="4857814468235197606">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235197590" resolveInfo="right" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="3147078024757238514">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
    </node>
  </root>
  <root id="4857814468235580308">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468235580310">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468235580313">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235439118" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="4857814468235580315">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235439119" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468235580316" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468235580312" />
    </node>
  </root>
  <root id="4857814468235580322">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468235580327">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468236893590">
        <property name="allowEmptyText" nameId="tpc2.1140114345053" value="true" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235580341" resolveInfo="n" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468235580328" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468235580331">
        <property name="text" nameId="tpc2.1073389577007" value="&lt;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="4857814468235580332">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468235580334">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468235580336">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
    </node>
  </root>
  <root id="4857814468235611011">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468235611014">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468235611015" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468235611016">
        <property name="allowEmptyText" nameId="tpc2.1140114345053" value="true" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235580341" resolveInfo="n" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468235611020">
        <property name="text" nameId="tpc2.1073389577007" value="&gt;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="4857814468235611021">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468235611023">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468235611026">
        <property name="text" nameId="tpc2.1073389577007" value="|" />
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="4857814468235642466">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4857814468235642467">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4857814468235740912">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4857814468235740914">
                <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="4857814468235740913" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="4857814468235740918">
                  <link role="property" roleId="tp25.1138056395725" targetNodeId="u9e0.4857814468235611029" resolveInfo="noclobber" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468235611028">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
    </node>
    <node role="inspectedCellModel" roleId="tpc2.1078153129734" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237448948">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237448951">
        <property name="text" nameId="tpc2.1073389577007" value="noclobber:" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237448949" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468235642465">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235611029" resolveInfo="noclobber" />
      </node>
    </node>
  </root>
  <root id="4857814468235866605">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468235866607">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468235866610">
        <property name="allowEmptyText" nameId="tpc2.1140114345053" value="true" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235580341" resolveInfo="n" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468235866612">
        <property name="text" nameId="tpc2.1073389577007" value="&gt;&gt;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="4857814468235866613">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468235866615">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468235866617">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468235866609" />
    </node>
  </root>
  <root id="4857814468236240464">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468236240466">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468236240469">
        <property name="text" nameId="tpc2.1073389577007" value="&amp;&gt;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468236240472">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468236240471">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468236240468" />
    </node>
  </root>
  <root id="4857814468236502409">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468236502411">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468236502413" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468236502414">
        <property name="text" nameId="tpc2.1073389577007" value="&amp;&gt;&gt;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468236502416">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468236502419">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
    </node>
  </root>
  <root id="4857814468237284485">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237284487">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237284490">
        <property name="text" nameId="tpc2.1073389577007" value="&lt;&lt;" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237284492">
        <property name="text" nameId="tpc2.1073389577007" value="-" />
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="4857814468237284509">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4857814468237284510">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4857814468237382955">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4857814468237382957">
                <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="4857814468237382956" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="4857814468237382961">
                  <link role="property" roleId="tp25.1138056395725" targetNodeId="u9e0.4857814468237284484" resolveInfo="striptabs" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237284494">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237284481" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="4857814468237284495">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237284497">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237284482" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="4857814468237284498">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="4857814468237284502">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237284507">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237284483" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237284489" />
    </node>
    <node role="inspectedCellModel" roleId="tpc2.1078153129734" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237422767">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237422770">
        <property name="text" nameId="tpc2.1073389577007" value="strip tabs:" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237422768" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468237284508">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237284484" resolveInfo="striptabs" />
      </node>
    </node>
  </root>
  <root id="4857814468237475271">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237475273">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468237475275" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237475276">
        <property name="text" nameId="tpc2.1073389577007" value="&lt;&lt;&lt;" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237475278">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
    </node>
  </root>
  <root id="4857814468237475280">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237475282">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237475283" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468237475284">
        <property name="allowEmptyText" nameId="tpc2.1140114345053" value="true" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235580341" resolveInfo="n" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237475287">
        <property name="text" nameId="tpc2.1073389577007" value="&lt;&amp;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="4857814468237475290">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468237475292">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237475289">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
    </node>
  </root>
  <root id="4857814468237475294">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237475296">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237475297" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468237475298">
        <property name="allowEmptyText" nameId="tpc2.1140114345053" value="true" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235580341" resolveInfo="n" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237475300">
        <property name="text" nameId="tpc2.1073389577007" value="&gt;&amp;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="4857814468237475303">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468237475305">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237475302">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
    </node>
  </root>
  <root id="4857814468237475307">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237475309">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468237475312">
        <property name="allowEmptyText" nameId="tpc2.1140114345053" value="true" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235580341" resolveInfo="n" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237475314">
        <property name="text" nameId="tpc2.1073389577007" value="&lt;&gt;" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="4857814468237475317">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="4857814468237475319">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237475316">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237147396" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237475311" />
    </node>
  </root>
  <root id="4857814468237560646">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237560648">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237560649" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237560650">
        <property name="text" nameId="tpc2.1073389577007" value="function" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468237560652">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468237560654">
        <property name="text" nameId="tpc2.1073389577007" value="()" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468237560658">
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="4857814468237560659">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4857814468237560662">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237560636" />
        </node>
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237560661" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="4857814468237560668">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237560645" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468237560669" />
      </node>
    </node>
  </root>
  <root id="4857814468237744077">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3147078024757053204">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3147078024757053205" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="4857814468237744079">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468237744076" />
        <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="4857814468237744080">
          <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468237744082">
            <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
            <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
            <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="4857814468237886980">
              <property name="style" nameId="tpc2.1186403771423" value="BOLD" />
            </node>
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3147078024757053207">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3147078024757053201" />
      </node>
    </node>
  </root>
  <root id="4857814468241318044">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468241318046">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3263637656462596679">
        <property name="text" nameId="tpc2.1073389577007" value="command:" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468241318051">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="4857814468241318053">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="4857814468241318062">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468241318043" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468241318063" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="4857814468241318064">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineChildrenStyleClassItem" typeId="tpc2.1237375020029" id="4857814468243173981">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468241318048" />
    </node>
  </root>
  <root id="4857814468241607044">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468241926190">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468241926191" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="4857814468241734030">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468241607046" />
        <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="4857814468241734031">
          <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468241734033">
            <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
            <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
            <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3147078024756881581" resolveInfo="CommandName" />
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="4857814468241926193">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468241607047" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468241926194" />
      </node>
    </node>
  </root>
  <root id="4857814468242547376">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468242547379">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468242623496">
        <property name="text" nameId="tpc2.1073389577007" value="option set" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="4857814468242623497">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468242547380" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="4857814468242547381">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468242547375" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468242547382" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="4857814468242623498">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="4857814468243039140">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineChildrenStyleClassItem" typeId="tpc2.1237375020029" id="7803330421058011324">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
    </node>
  </root>
  <root id="4857814468242904306">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7803330421055581550">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7803330421055581551" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3147078024753267945">
        <property name="text" nameId="tpc2.1073389577007" value="-" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="3147078024753267947">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7803330421056660413">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514691" resolveInfo="symbol" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="3147078024757674256">
        <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="3147078024757582231" resolveInfo="ExternalCommandDescription_EditorComponent" />
      </node>
    </node>
  </root>
  <root id="4857814468243514706">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468243514708">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468243514712">
        <property name="text" nameId="tpc2.1073389577007" value="option with parameter" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="4857814468243514714">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468243514722">
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3147078024753267949">
          <property name="text" nameId="tpc2.1073389577007" value="-" />
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="3147078024753267950">
            <property name="flag" nameId="tpc2.1186414551515" value="true" />
          </node>
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="4857814468243514723">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468243514726">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514691" resolveInfo="symbol" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468243514739">
          <property name="text" nameId="tpc2.1073389577007" value="name" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468243514741">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="3147078024757674258">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="3147078024757582231" resolveInfo="ExternalCommandDescription_EditorComponent" />
        </node>
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468243514725" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="4857814468243663472">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468243514710" />
    </node>
  </root>
  <root id="4857814468243911291">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468243911293">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="4857814468243911294" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4857814468243911295">
        <property name="text" nameId="tpc2.1073389577007" value="argument" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="4857814468243911296">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4857814468243911299">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4857814468243911300" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4857814468243911301">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="3147078024757674260">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="3147078024757582231" resolveInfo="ExternalCommandDescription_EditorComponent" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="4857814468243911310">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
    </node>
  </root>
  <root id="7803330421055431010">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7803330421055431012">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514691" resolveInfo="symbol" />
    </node>
  </root>
  <root id="7803330421055753546">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7803330421055753548">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="7803330421055753549" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7803330421055753551">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514691" resolveInfo="symbol" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7803330421055753555">
        <property name="text" nameId="tpc2.1073389577007" value="@" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7803330421055753553">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514700" resolveInfo="description" />
      </node>
    </node>
  </root>
  <root id="7803330421057268008">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7803330421057519613">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="7803330421057519614" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7803330421057763481">
        <property name="text" nameId="tpc2.1073389577007" value="-" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="7803330421058659094">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="7803330421057763489">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7803330421057584568" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Flow" typeId="tpc2.1106270637846" id="7803330421058519056" />
      </node>
    </node>
  </root>
  <root id="7803330421057683803">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="7803330421057683805">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7803330421057519637" />
      <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="7803330421057683806">
        <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7803330421057683808">
          <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514691" resolveInfo="symbol" />
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="7803330421062439504">
            <property name="flag" nameId="tpc2.1186414551515" value="false" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7803330421058150859">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7803330421058150891">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7803330421058150868" />
    </node>
    <node role="inspectedCellModel" roleId="tpc2.1078153129734" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="7803330421058207299">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7803330421058150858" />
      <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="7803330421058207300">
        <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7803330421058207302">
          <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514700" resolveInfo="description" />
        </node>
      </node>
    </node>
  </root>
  <root id="7803330421059093008">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="7803330421059093010">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="7803330421059093013">
        <property name="text" nameId="tpc2.1073389577007" value="-" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="7803330421059093022">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="7803330421059093018">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7803330421059093017" />
        <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="7803330421059093019">
          <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="7803330421059093021">
            <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
            <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514691" resolveInfo="symbol" />
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="7803330421059093029">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.7803330421059093028" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="7803330421059093012" />
    </node>
  </root>
  <root id="3147078024744480397">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3147078024744480399">
      <property name="text" nameId="tpc2.1073389577007" value="arguments ..." />
    </node>
  </root>
  <root id="3147078024744633272">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3147078024744633281">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="3147078024744633284">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3147078024744633271" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3147078024744633285" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3147078024744633283" />
    </node>
  </root>
  <root id="3147078024747082357">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3147078024747082361">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="3147078024747082362" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3147078024747082363">
        <property name="text" nameId="tpc2.1073389577007" value="[" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661309044">
          <property name="labelName" nameId="tpc2.1238091709220" value="condition" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3147078024747082365">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3147078024747082356" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3147078024747082367">
        <property name="text" nameId="tpc2.1073389577007" value="]" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661309045">
          <property name="labelName" nameId="tpc2.1238091709220" value="condition" />
        </node>
      </node>
    </node>
  </root>
  <root id="3147078024751877536">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3147078024751877543">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3263637656455059151">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3263637656455059148" resolveInfo="quotetype" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4995402009321872858" resolveInfo="QuoteStyle" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="8474643070100157550">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="3263637656455059154">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661309047">
          <property name="labelName" nameId="tpc2.1238091709220" value="quote" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3147078024751877550">
        <property name="attractsFocus" nameId="tpc2.1130859485024" value="2" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3147078024751877535" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661159542" resolveInfo="QuotedWord" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3263637656455059156">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3263637656455059148" resolveInfo="quotetype" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4995402009321872858" resolveInfo="QuoteStyle" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="8474643070100157552">
          <property name="flag" nameId="tpc2.1186414551515" value="false" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="3263637656455059159">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661309049">
          <property name="labelName" nameId="tpc2.1238091709220" value="quote" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3147078024751877545" />
    </node>
  </root>
  <root id="3147078024755445596">
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="3147078024755445597">
      <property name="name" nameId="tpck.1169194664001" value="Variable" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="3147078024755445598">
        <property name="style" nameId="tpc2.1186403771423" value="PLAIN" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="3147078024756881581">
      <property name="name" nameId="tpck.1169194664001" value="CommandName" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="3147078024756881582">
        <property name="style" nameId="tpc2.1186403771423" value="BOLD" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="5610919440661575708">
        <property name="color" nameId="tpc2.1186403713874" value="darkGray" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="3147078024757582229">
      <property name="name" nameId="tpck.1169194664001" value="ExternalCommandDescription" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.BackgroundColorStyleClassItem" typeId="tpc2.1186404574412" id="3147078024758188936">
        <property name="color" nameId="tpc2.1186403713874" value="lightGray" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="3905757829895296290">
      <property name="name" nameId="tpck.1169194664001" value="HintStyle" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.AutoDeletableStyleClassItem" typeId="tpc2.1186414949600" id="3905757829895296291">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="3905757829895296293">
        <property name="color" nameId="tpc2.1186403713874" value="lightGray" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="3905757829898977059">
      <property name="name" nameId="tpck.1169194664001" value="ErrorStyle" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.AutoDeletableStyleClassItem" typeId="tpc2.1186414949600" id="3905757829898977060">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="3905757829898977062">
        <property name="flag" nameId="tpc2.1186414551515" value="false" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="3905757829898977064">
        <property name="flag" nameId="tpc2.1186414551515" value="false" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="3905757829904131083">
        <property name="color" nameId="tpc2.1186403713874" value="red" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.TextBackgroundColorStyleClassItem" typeId="tpc2.1214406454886" id="3905757829904596484">
        <property name="color" nameId="tpc2.1186403713874" value="gray" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="3905757829899284266">
        <property name="style" nameId="tpc2.1186403771423" value="PLAIN" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="4515773109208411260">
      <property name="name" nameId="tpck.1169194664001" value="CommentSymbol" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="4515773109208411263">
        <property name="color" nameId="tpc2.1186403713874" value="gray" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="4515773109208411261">
      <property name="name" nameId="tpck.1169194664001" value="CommentedCommand" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="5610919440661604396">
        <property name="color" nameId="tpc2.1186403713874" value="gray" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="4515773109208411262">
      <property name="name" nameId="tpck.1169194664001" value="CommentedText" />
      <node role="extendedClass" roleId="tpc2.1198252369256" type="tpc2.StyleSheetClassReference" typeId="tpc2.1198252130653" id="4515773109208411266">
        <link role="styleSheetClass" roleId="tpc2.1198252276894" targetNodeId="4515773109208411261" resolveInfo="CommentedCommand" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="4515773109208411267">
        <property name="color" nameId="tpc2.1186403713874" value="darkGray" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="6382090206695324299">
      <property name="name" nameId="tpck.1169194664001" value="ActivationRecord" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="6382090206695324300">
        <property name="color" nameId="tpc2.1186403713874" value="DARK_BLUE" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="2362837471610351523">
      <property name="name" nameId="tpck.1169194664001" value="ShellScriptName" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="2362837471610351524">
        <property name="style" nameId="tpc2.1186403771423" value="PLAIN" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="2362837471610351526">
        <property name="color" nameId="tpc2.1186403713874" value="DARK_MAGENTA" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="3835416431563851216">
      <property name="name" nameId="tpck.1169194664001" value="Operator" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="3835416431563851217">
        <property name="style" nameId="tpc2.1186403771423" value="PLAIN" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="5610919440661159542">
      <property name="name" nameId="tpck.1169194664001" value="QuotedWord" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.TextBackgroundColorStyleClassItem" typeId="tpc2.1214406454886" id="5610919440661159543">
        <property name="color" nameId="tpc2.1186403713874" value="LIGHT_BLUE" />
        <node role="query" roleId="tpc2.1186403803051" type="tpc2.RGBColor" typeId="tpc2.1225456267680" id="5610919440661223467">
          <property name="value" nameId="tpc2.1225456424731" value="e4f2ff" />
        </node>
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="5610919440661251953">
      <property name="name" nameId="tpck.1169194664001" value="ParameterExpansion" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="5610919440661251954">
        <property name="color" nameId="tpc2.1186403713874" value="DARK_MAGENTA" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="5610919440661337693" />
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="5610919440661280460">
      <property name="name" nameId="tpck.1169194664001" value="NullStyle" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.AutoDeletableStyleClassItem" typeId="tpc2.1186414949600" id="5610919440661280463">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundNullColorStyleClassItem" typeId="tpc2.1187258617779" id="5610919440661280461">
        <property name="color" nameId="tpc2.1186403713874" value="lightGray" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="5610919440661547016">
      <property name="name" nameId="tpck.1169194664001" value="SimpleWordStyle" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="5610919440661547019">
        <property name="style" nameId="tpc2.1186403771423" value="ITALIC" />
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="5610919440661633083">
      <property name="name" nameId="tpck.1169194664001" value="QuotesCommandSubstitution" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.BackgroundColorStyleClassItem" typeId="tpc2.1186404574412" id="5610919440661633084">
        <node role="query" roleId="tpc2.1186403803051" type="tpc2.RGBColor" typeId="tpc2.1225456267680" id="5610919440661633085">
          <property name="value" nameId="tpc2.1225456424731" value="feffb3" />
        </node>
      </node>
    </node>
    <node role="styleClass" roleId="tpc2.1186402402630" type="tpc2.StyleSheetClass" typeId="tpc2.1186402373407" id="4995402009321872858">
      <property name="name" nameId="tpck.1169194664001" value="QuoteStyle" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.FontStyleStyleClassItem" typeId="tpc2.1186403751766" id="4995402009321872859">
        <property name="style" nameId="tpc2.1186403771423" value="BOLD" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.ForegroundColorStyleClassItem" typeId="tpc2.1186404549998" id="4995402009321872860">
        <property name="color" nameId="tpc2.1186403713874" value="blue" />
      </node>
    </node>
  </root>
  <root id="3147078024757582231">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3147078024757582233">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3147078024757582236">
        <property name="text" nameId="tpc2.1073389577007" value="@" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3147078024757582229" resolveInfo="ExternalCommandDescription" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="3147078024757582239">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="3147078024757674241">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3147078024757674242">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3147078024757674243">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3147078024757674250">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3147078024757674245">
                  <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="3147078024757674244" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="3147078024757674249">
                    <link role="property" roleId="tp25.1138056395725" targetNodeId="u9e0.4857814468243514700" resolveInfo="description" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.IsNotEmptyOperation" typeId="tpee.1225271408483" id="3147078024757674254" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3147078024757582238">
        <property name="allowEmptyText" nameId="tpc2.1140114345053" value="true" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468243514700" resolveInfo="description" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3147078024757582229" resolveInfo="ExternalCommandDescription" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3147078024757582235" />
    </node>
  </root>
  <root id="3263637656462020084">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3263637656462020086">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3263637656462020087" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="3263637656462020090">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467438007072" resolveInfo="sign" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="3263637656462020093">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="3263637656462020092">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.3999172467438007073" />
      </node>
    </node>
  </root>
  <root id="8457058248751696148">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8457058248751696150">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="4515773109208483485">
        <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="4515773109208483480" resolveInfo="CommentSymbol" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="8457058248751696155">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8457058248751600627" resolveInfo="comment" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4515773109208411262" resolveInfo="CommentedText" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8457058248751696152" />
    </node>
  </root>
  <root id="8457058248751696158">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8457058248751696163">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="4515773109208483490">
        <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="4515773109208483480" resolveInfo="CommentSymbol" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8457058248751696172">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8457058248751696157" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4515773109208411261" resolveInfo="CommentedCommand" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8457058248751696165" />
    </node>
  </root>
  <root id="8474643070102636480">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8474643070102636495">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8474643070102636497">
        <property name="attractsFocus" nameId="tpc2.1130859485024" value="3" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070102636485" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8474643070102636502">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8474643070102636503" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8474643070102636504">
          <property name="noTargetText" nameId="tpc2.1139852716018" value="?c" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070102636486" />
          <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
        </node>
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="8474643070103162691">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8474643070103162692">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3905757829909421693">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NotExpression" typeId="tpee.1081516740877" id="3905757829909421711">
                <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829909421706">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829909421701">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829909421696">
                      <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="3905757829909421695" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3905757829909421700">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="u9e0.8474643070102636485" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3905757829909421705">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="u9e0.8474643070110463418" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="3905757829909421710">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zy04.3905757829907341138" resolveInfo="isAbstractCommand" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="6382090206696049363" />
    </node>
  </root>
  <root id="8474643070102636525">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8474643070102636529">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="8474643070102636532">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070102636523" resolveInfo="operator" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="3905757829909578551">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SideTransformAnchorTagStyleClassItem" typeId="tpc2.1214320119173" id="8474643070112660719">
          <property name="tag" nameId="tpc2.1214320119174" value="ext_1_RTransform" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8474643070107524293">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070102636490" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8474643070102636531" />
    </node>
  </root>
  <root id="8474643070110067655">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8474643070110067657">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="4515773109208483488">
        <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="4515773109208483480" resolveInfo="CommentSymbol" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8474643070110067664">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070110067662" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8474643070110067659" />
    </node>
  </root>
  <root id="8474643070111564671">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8474643070111564673">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8474643070111564676">
        <property name="noTargetText" nameId="tpc2.1139852716018" value="&lt;no command&gt;" />
        <property name="attractsFocus" nameId="tpc2.1130859485024" value="2" />
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070110463418" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8474643070111818355">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8474643070111818356" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8474643070111818354">
          <property name="noTargetText" nameId="tpc2.1139852716018" value="?p" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070111818352" />
          <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
        </node>
        <node role="renderingCondition" roleId="tpc2.1142887637401" type="tpc2.QueryFunction_NodeCondition" typeId="tpc2.1142886221719" id="3905757829909264650">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3905757829909264651">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3905757829909264675">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NotExpression" typeId="tpee.1081516740877" id="3905757829909264677">
                <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829909264685">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3905757829909264680">
                    <node role="operand" roleId="tpee.1197027771414" type="tpc2.ConceptFunctionParameter_node" typeId="tpc2.1142886811589" id="3905757829909264679" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3905757829909264684">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="u9e0.8474643070110463418" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="3905757829909264689">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zy04.3905757829907341138" resolveInfo="isAbstractCommand" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="6382090206695892731" />
    </node>
  </root>
  <root id="8474643070112197221">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="8474643070112197223">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="8474643070112197226">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070111818351" resolveInfo="pypetype" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="3905757829911089617">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="3905757829911147951">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SideTransformAnchorTagStyleClassItem" typeId="tpc2.1214320119173" id="3905757829910932843">
          <property name="tag" nameId="tpc2.1214320119174" value="ext_1_RTransform" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="8474643070112197228">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.8474643070111988415" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="8474643070112197225" />
    </node>
  </root>
  <root id="3905757829896262164">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Error" typeId="tpc2.1075375595203" id="3905757829905921766">
      <property name="text" nameId="tpc2.1075375595204" value="&lt;no command&gt;" />
    </node>
  </root>
  <root id="3905757829901343111">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="975347375211242238">
      <property name="nullText" nameId="tpc2.1082639509531" value="?command" />
      <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661280460" resolveInfo="NullStyle" />
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.DefaultCaretPositionStyleClassItem" typeId="tpc2.1214472762472" id="975347375211572477">
        <property name="position" nameId="tpc2.1214472762473" value="FIRST" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="975347375211572479">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="975347375211831632">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
    </node>
  </root>
  <root id="4515773109208483480">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4515773109208483483">
      <property name="text" nameId="tpc2.1073389577007" value="#" />
      <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4515773109208411260" resolveInfo="CommentSymbol" />
    </node>
  </root>
  <root id="9034131902186397591">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="9034131902186403395">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="9034131902186403398">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235197588" resolveInfo="left" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4995402009321872858" resolveInfo="QuoteStyle" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="9034131902186403403">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661633087">
          <property name="labelName" nameId="tpc2.1238091709220" value="quote-command" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9034131902186403400">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235197593" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="5610919440661633083" resolveInfo="QuotesCommandSubstitution" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="9034131902186403402">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.4857814468235197590" resolveInfo="right" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="4995402009321872858" resolveInfo="QuoteStyle" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationLeftStyleClassItem" typeId="tpc2.1233758997495" id="9034131902186403404">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.MatchingLabelStyleClassItem" typeId="tpc2.1236262245656" id="5610919440661633089">
          <property name="labelName" nameId="tpc2.1238091709220" value="quote-command" />
        </node>
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="9034131902186403397" />
    </node>
  </root>
  <root id="9034131902187955346">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="9034131902187955348">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902187955345" />
      <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="9034131902187955349">
        <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="9034131902187955351">
          <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
          <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3147078024755445597" resolveInfo="Variable" />
        </node>
      </node>
    </node>
  </root>
  <root id="9034131902191439568">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="9034131902191439570">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9034131902191439582">
        <property name="text" nameId="tpc2.1073389577007" value="-" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.PunctuationRightStyleClassItem" typeId="tpc2.1233759184865" id="9034131902191439583">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="9034131902191439574">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902191439565" resolveInfo="op" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3835416431563851216" resolveInfo="Operator" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9034131902191439576">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902191439564" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="9034131902191439572" />
    </node>
  </root>
  <root id="9034131902191629599">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9034131902191635401">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902191629598" />
    </node>
  </root>
  <root id="9034131902191635406">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="9034131902191635408">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9034131902191635411">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902191635404" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="9034131902191635413">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902191635403" resolveInfo="op" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9034131902191635416">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902191635405" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="9034131902191635410" />
    </node>
  </root>
  <root id="9034131902193581136">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="9034131902193581138">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.9034131902193581135" />
      <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="9034131902193581139" />
    </node>
  </root>
  <root id="2362837471609549588">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="2362837471609549590">
      <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.EditableStyleClassItem" typeId="tpc2.1186414860679" id="2362837471609726142">
        <property name="flag" nameId="tpc2.1186414551515" value="true" />
      </node>
    </node>
  </root>
  <root id="2362837471611764249">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="2362837471611764251">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="2362837471611764255">
        <property name="text" nameId="tpc2.1073389577007" value="!" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="2362837471611764257">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.2362837471611764248" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="2362837471611764253" />
    </node>
  </root>
  <root id="2362837471611859419">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="2362837471611859421">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="2362837471611859424">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.2362837471611859414" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_ConceptProperty" typeId="tpc2.1137553248617" id="2362837471611859426">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.2362837471611859418" resolveInfo="sign" />
        <link role="styleClass" roleId="tpc2.1186406756722" targetNodeId="3835416431563851216" resolveInfo="Operator" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="2362837471611859428">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.2362837471611859415" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="2362837471611859423" />
    </node>
  </root>
  <root id="2362837471611859442">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="2362837471611859444">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="2362837471611859448">
        <property name="text" nameId="tpc2.1073389577007" value="(" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="2362837471611859452">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="u9e0.2362837471611859441" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="2362837471611859450">
        <property name="text" nameId="tpc2.1073389577007" value=")" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="2362837471611859446" />
    </node>
  </root>
</model>

