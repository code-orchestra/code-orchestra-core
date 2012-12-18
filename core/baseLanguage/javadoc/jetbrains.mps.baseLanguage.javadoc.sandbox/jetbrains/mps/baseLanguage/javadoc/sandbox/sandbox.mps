<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:e54ee518-0377-432d-bc34-b3be6fdddf5b(jetbrains.mps.baseLanguage.javadoc.sandbox.sandbox)">
  <persistence version="7" />
  <language namespace="f2801650-65d5-424e-bb1b-463a8781b786(jetbrains.mps.baseLanguage.javadoc)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="2c55c7ac-60c3-4eea-b9db-0d627bd2dcb9(jetbrains.mps.xml)" />
  <language namespace="64f62b28-36e3-4052-9f72-f616211ae615(jetbrains.mps.xmlInternal)" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="1t7x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt(JDK/java.awt@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="m373" modelUID="r:4095af4f-a097-4799-aaa9-03df087ddfa6(jetbrains.mps.baseLanguage.javadoc.structure)" version="5" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="3196018662491356444">
      <property name="name" nameId="tpck.1169194664001" value="ABC" />
    </node>
  </roots>
  <root id="3196018662491356444">
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4021391592916173800">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4021391592916173801" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4021391592916173802" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4021391592916173803" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.MethodDocComment" typeId="m373.5349172909345532724" id="4021391592916173804">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="4021391592916173805">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916173806" />
        </node>
        <node role="author" roleId="m373.5349172909345532722" type="m373.AuthorBlockDocTag" typeId="m373.5349172909345530174" id="4021391592916173809">
          <property name="text" nameId="m373.5349172909345532826" value="Ludwig Zoo" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="4021391592916173790">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4021391592916173791" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4021391592916173792" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4021391592916173793" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.MethodDocComment" typeId="m373.5349172909345532724" id="4021391592916173794">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="4021391592916173795">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916173796">
            <property name="text" nameId="m373.8970989240999019144" value="fasdfasdfasdfasdfasdf" />
          </node>
        </node>
        <node role="version" roleId="m373.8465538089690331491" type="m373.VersionBlockDocTag" typeId="m373.8465538089690324384" id="4021391592916173799">
          <property name="text" nameId="m373.8465538089690324385" value="asdfasdf" />
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="5562345046718955349">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SOME_CONSTANT" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5562345046718955355" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5562345046718955366" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5562345046718955368">
        <property name="value" nameId="tpee.1068580320021" value="4" />
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.FieldDocComment" typeId="m373.6832197706140896242" id="3106559687487257070">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="3106559687487257071">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="3106559687487257072" />
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6832197706140999820">
      <property name="name" nameId="tpck.1169194664001" value="x" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6832197706140999821" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6832197706140999823" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.FieldDocComment" typeId="m373.6832197706140896242" id="4021391592916073099">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="4021391592916073100">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916073101" />
        </node>
        <node role="see" roleId="m373.2217234381367277533" type="m373.SeeBlockDocTag" typeId="m373.2217234381367190443" id="4021391592916073102">
          <property name="text" nameId="m373.2217234381367190444" value="see, yes" />
          <node role="reference" roleId="m373.2217234381367190458" type="m373.ClassifierDocReference" typeId="m373.2217234381367530212" id="3926476116131891511">
            <link role="classifier" roleId="m373.2217234381367530213" targetNodeId="e2lb.~CharacterDataUndefined" resolveInfo="CharacterDataUndefined" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4021391592916227669">
      <property name="name" nameId="tpck.1169194664001" value="y" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4021391592916246307" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4021391592916246306" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7344646339283099538">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7344646339283099547">
        <property name="name" nameId="tpck.1169194664001" value="a" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7344646339283099549" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7344646339283099540" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7344646339283099541">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.CommentedStatementsBlock" typeId="tpee.1177326519037" id="8970989240998551037">
          <node role="statement" roleId="tpee.1177326540772" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7344646339284604304">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7344646339284604306">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7344646339284604309">
                <property name="value" nameId="tpee.1068580320021" value="5" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7344646339284604305">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7344646339283099547" resolveInfo="a" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8970989240999294857">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8970989240999295534">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="8970989240999294858">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8970989240999295538">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(int)%cvoid" resolveInfo="println" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8970989240999295539">
                <property name="value" nameId="tpee.1068580320021" value="3" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4021391592915198829">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4021391592915198831">
            <property name="value" nameId="tpee.1068580320021" value="7" />
          </node>
        </node>
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6832197706140414139">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~ArrayStoreException" resolveInfo="ArrayStoreException" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4021391592915198827" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.MethodDocComment" typeId="m373.5349172909345532724" id="4021391592915198832">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="4021391592916694600">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916694601">
            <property name="text" nameId="m373.8970989240999019144" value="The quick " />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.InlineTagCommentLinePart" typeId="m373.8970989240999019145" id="4021391592916694603">
            <node role="tag" roleId="m373.6962838954693749192" type="m373.InheritDocInlineDocTag" typeId="m373.4730661099054379103" id="4021391592916694605" />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916694602">
            <property name="text" nameId="m373.8970989240999019144" value="brown fox " />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.InlineTagCommentLinePart" typeId="m373.8970989240999019145" id="4021391592916694611">
            <node role="tag" roleId="m373.6962838954693749192" type="m373.CodeInlineDocTag" typeId="m373.2217234381367049075" id="4021391592916694613">
              <node role="line" roleId="m373.3106559687488741665" type="m373.CommentLine" typeId="m373.8465538089690331500" id="6612597108005354622">
                <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="6612597108005354623" />
              </node>
            </node>
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916694610">
            <property name="text" nameId="m373.8970989240999019144" value=" over t{he lazy dog." />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="4021391592916694614">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916694615">
            <property name="text" nameId="m373.8970989240999019144" value="And then... " />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.InlineTagCommentLinePart" typeId="m373.8970989240999019145" id="4021391592916694617">
            <node role="tag" roleId="m373.6962838954693749192" type="m373.LinkInlineDocTag" typeId="m373.2546654756694997551" id="4021391592916694619">
              <node role="line" roleId="m373.3106559687488913694" type="m373.CommentLine" typeId="m373.8465538089690331500" id="6612597108005354620">
                <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="6612597108005354621" />
              </node>
              <node role="reference" roleId="m373.2546654756694997556" type="m373.StaticFieldDocReference" typeId="m373.6501140109493894267" id="4021391592916713255">
                <link role="declaration" roleId="m373.5562345046718956740" targetNodeId="5562345046718955349" resolveInfo="SOME_CONSTANT" />
              </node>
            </node>
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916694616">
            <property name="text" nameId="m373.8970989240999019144" value=" " />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.InlineTagCommentLinePart" typeId="m373.8970989240999019145" id="4021391592916713257">
            <node role="tag" roleId="m373.6962838954693749192" type="m373.ValueInlineDocTag" typeId="m373.6962838954693748795" id="4021391592916713259" />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916713256">
            <property name="text" nameId="m373.8970989240999019144" value="" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="4021391592916713261">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916713262">
            <property name="text" nameId="m373.8970989240999019144" value="Blah " />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.InlineTagCommentLinePart" typeId="m373.8970989240999019145" id="4021391592916713264">
            <node role="tag" roleId="m373.6962838954693749192" type="m373.ValueInlineDocTag" typeId="m373.6962838954693748795" id="4021391592916713266">
              <node role="variableReference" roleId="m373.2565027568480644422" type="m373.StaticFieldDocReference" typeId="m373.6501140109493894267" id="3926476116131891510">
                <link role="declaration" roleId="m373.5562345046718956740" targetNodeId="1t7x.~GridBagConstraints%dNORTH" resolveInfo="NORTH" />
              </node>
            </node>
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592916713263">
            <property name="text" nameId="m373.8970989240999019144" value=" blah" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CodeSnippet" typeId="m373.2565027568480805887" id="4021391592917042321">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592917042322" />
          <node role="statement" roleId="m373.2565027568480905697" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4021391592917060957">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4021391592917060958">
              <property name="name" nameId="tpck.1169194664001" value="a" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4021391592917060959" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4021391592917060961">
                <property name="value" nameId="tpee.1068580320021" value="5" />
              </node>
            </node>
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="4021391592917042319">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="4021391592917042320">
            <property name="text" nameId="m373.8970989240999019144" value="" />
          </node>
        </node>
        <node role="param" roleId="m373.8465538089690917625" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="4021391592915198835">
          <property name="text" nameId="m373.8465538089690881934" value="param :)" />
          <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocMethodParameterReference" typeId="m373.6832197706140518104" id="4021391592915198836">
            <link role="param" roleId="m373.6832197706140518108" targetNodeId="7344646339283099547" resolveInfo="a" />
          </node>
        </node>
        <node role="throwsTag" roleId="m373.5858074156537516428" type="m373.ThrowsBlockDocTag" typeId="m373.5858074156537397872" id="4021391592915198837">
          <property name="text" nameId="m373.5858074156537397874" value="ase :)" />
          <node role="exceptionType" roleId="m373.6832197706140448505" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4021391592915198838">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~ArrayStoreException" resolveInfo="ArrayStoreException" />
          </node>
        </node>
        <node role="return" roleId="m373.5858074156537516440" type="m373.ReturnBlockDocTag" typeId="m373.5858074156537516430" id="4021391592915198839">
          <property name="text" nameId="m373.5858074156537516431" value="int :)" />
        </node>
        <node role="author" roleId="m373.5349172909345532722" type="m373.AuthorBlockDocTag" typeId="m373.5349172909345530174" id="4021391592915198840">
          <property name="text" nameId="m373.5349172909345532826" value="Ludwig Zoo" />
        </node>
        <node role="see" roleId="m373.2217234381367277533" type="m373.SeeBlockDocTag" typeId="m373.2217234381367190443" id="4021391592915198841">
          <node role="reference" roleId="m373.2217234381367190458" type="m373.StaticFieldDocReference" typeId="m373.6501140109493894267" id="4021391592915277124">
            <link role="declaration" roleId="m373.5562345046718956740" targetNodeId="5562345046718955349" resolveInfo="SOME_CONSTANT" />
          </node>
        </node>
        <node role="see" roleId="m373.2217234381367277533" type="m373.SeeBlockDocTag" typeId="m373.2217234381367190443" id="4021391592915304163">
          <node role="reference" roleId="m373.2217234381367190458" type="m373.MethodDocReference" typeId="m373.2217234381367530195" id="4021391592915413267">
            <link role="methodDeclaration" roleId="m373.2217234381367530196" targetNodeId="e2lb.~Integer%dtoString(int,int)%cjava%dlang%dString" resolveInfo="toString" />
          </node>
        </node>
        <node role="see" roleId="m373.2217234381367277533" type="m373.SeeBlockDocTag" typeId="m373.2217234381367190443" id="4021391592915787821">
          <node role="reference" roleId="m373.2217234381367190458" type="m373.ClassifierDocReference" typeId="m373.2217234381367530212" id="4021391592915878290">
            <link role="classifier" roleId="m373.2217234381367530213" targetNodeId="1t7x.~JobAttributes$DialogType" resolveInfo="JobAttributes.DialogType" />
          </node>
        </node>
        <node role="version" roleId="m373.8465538089690331491" type="m373.VersionBlockDocTag" typeId="m373.8465538089690324384" id="4021391592915198843">
          <property name="text" nameId="m373.8465538089690324385" value="1.1.1.1.1" />
        </node>
        <node role="since" roleId="m373.8465538089690331490" type="m373.SinceBlockDocTag" typeId="m373.8465538089690324397" id="4021391592915198844">
          <property name="text" nameId="m373.8465538089690324399" value="2004." />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4021391592915624548">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4021391592915624549" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4021391592915624550" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4021391592915624551" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4021391592915636740">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.VariableArityType" typeId="tpee.1219920932475" id="4021391592915636742">
          <node role="componentType" roleId="tpee.1219921048460" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4021391592915636741">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.MethodDocComment" typeId="m373.5349172909345532724" id="3106559687487257062">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="3106559687487257063">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="3106559687487257064">
            <property name="text" nameId="m373.8970989240999019144" value="asd" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="7532191102949278993">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="7532191102949278994">
            <property name="text" nameId="m373.8970989240999019144" value="teij jk" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960327672247">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960327672248">
            <property name="text" nameId="m373.8970989240999019144" value="asdfasdf" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960327672249">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960327672250">
            <property name="text" nameId="m373.8970989240999019144" value="asfadsfasdfasdf" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960329148088">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960329148089">
            <property name="text" nameId="m373.8970989240999019144" value="asfasdfasdasdfasdf" />
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.HTMLElement" typeId="m373.6612597108003615641" id="2099616960329241038">
            <property name="name" nameId="m373.6612597108003615642" value="code" />
            <node role="line" roleId="m373.6612597108003615643" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960329241039">
              <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960329241040">
                <property name="text" nameId="m373.8970989240999019144" value="asdf" />
              </node>
              <node role="part" roleId="m373.8970989240999019149" type="m373.HTMLElement" typeId="m373.6612597108003615641" id="2099616960329568685">
                <property name="name" nameId="m373.6612597108003615642" value="strong" />
              </node>
              <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960329568684">
                <property name="text" nameId="m373.8970989240999019144" value="asdf" />
              </node>
            </node>
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960329241037">
            <property name="text" nameId="m373.8970989240999019144" value="" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960327672251">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960327672252">
            <property name="text" nameId="m373.8970989240999019144" value="asdfbhj" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960327672253">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960327672254">
            <property name="text" nameId="m373.8970989240999019144" value="asdf" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960327672255">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960327672256">
            <property name="text" nameId="m373.8970989240999019144" value="asdf" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2099616960327672257">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2099616960327672258">
            <property name="text" nameId="m373.8970989240999019144" value="asdfbjhb jhbb jhb" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="7532191102949278995">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="7532191102949278996">
            <property name="text" nameId="m373.8970989240999019144" value="s" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="7532191102949278997">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="7532191102949278998">
            <property name="text" nameId="m373.8970989240999019144" value="tsdfasdfasfoo" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="5521685164201995930">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="5521685164201995931">
            <property name="text" nameId="m373.8970989240999019144" value="as dfndfasffasline2" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="5521685164201281388">
          <node role="part" roleId="m373.8970989240999019149" type="m373.InlineTagCommentLinePart" typeId="m373.8970989240999019145" id="3633133276124409164">
            <node role="tag" roleId="m373.6962838954693749192" type="m373.CodeInlineDocTag" typeId="m373.2217234381367049075" id="3633133276124409166">
              <node role="line" roleId="m373.3106559687488741665" type="m373.CommentLine" typeId="m373.8465538089690331500" id="3633133276124409167">
                <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="3633133276124409168">
                  <property name="text" nameId="m373.8970989240999019144" value="fasdfasdf" />
                </node>
              </node>
            </node>
          </node>
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="3633133276124409163">
            <property name="text" nameId="m373.8970989240999019144" value="" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="439148907936605785">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="439148907936605786">
            <property name="text" nameId="m373.8970989240999019144" value="line3" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="439148907936531653">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="439148907936531654">
            <property name="text" nameId="m373.8970989240999019144" value="line4bar" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="3106559687488650850">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="3106559687488650851">
            <property name="text" nameId="m373.8970989240999019144" value="asdf" />
          </node>
        </node>
        <node role="param" roleId="m373.8465538089690917625" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="3106559687487257065">
          <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocMethodParameterReference" typeId="m373.6832197706140518104" id="3106559687487257066">
            <link role="param" roleId="m373.6832197706140518108" targetNodeId="4021391592915636740" resolveInfo="s" />
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3196018662491356445" />
    <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="6832197706140691340">
      <property name="name" nameId="tpck.1169194664001" value="TT" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.ClassifierDocComment" typeId="m373.2068944020170241612" id="3926476116131891504">
      <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="3926476116131891505">
        <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="3926476116131891506">
          <property name="text" nameId="m373.8970989240999019144" value="Comment for class " />
        </node>
      </node>
      <node role="param" roleId="m373.2068944020170241614" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="3926476116131891507">
        <property name="text" nameId="m373.8465538089690881934" value="param" />
        <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocTypeParameterReference" typeId="m373.6832197706140518107" id="3926476116131891508">
          <link role="param" roleId="m373.6832197706140518108" targetNodeId="6832197706140691340" resolveInfo="TT" />
        </node>
      </node>
    </node>
  </root>
</model>

