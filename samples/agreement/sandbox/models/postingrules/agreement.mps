<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8959040f(postingrules.agreement)">
  <persistence version="7" />
  <language namespace="144f7012-c2d5-43be-be2b-4bfb7dff6503(jetbrains.mps.samples.agreementLanguage)" />
  <language namespace="b1a9bc47-8a26-4792-8b68-4660c531090a(jetbrains.mps.samples.formulaLanguage)" />
  <import index="tpnb" modelUID="r:00000000-0000-4000-0000-011c8959040b(jetbrains.mps.samples.agreementLanguage.declarations)" version="-1" />
  <import index="tpna" modelUID="r:00000000-0000-4000-0000-011c8959040a(jetbrains.mps.samples.agreementLanguage.structure)" version="0" implicit="yes" />
  <import index="tpnk" modelUID="r:00000000-0000-4000-0000-011c8959043c(jetbrains.mps.samples.formulaLanguage.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpna.Plan" typeId="tpna.1111790951422" id="1112303557868">
      <property name="name" nameId="tpck.1169194664001" value="Regular" />
    </node>
    <node type="tpna.Plan" typeId="tpna.1111790951422" id="1112304761925">
      <property name="name" nameId="tpck.1169194664001" value="LowPay" />
    </node>
  </roots>
  <root id="1112303557868">
    <node role="event" roleId="tpna.1111791084333" type="tpna.Event" typeId="tpna.1111791038612" id="1112383986387">
      <link role="type" roleId="tpna.1111793668132" targetNodeId="tpnb.1112316681746" />
      <node role="postingRule" roleId="tpna.1111794644919" type="tpna.PostingRuleTemporalProperty" typeId="tpna.1111794734295" id="1112384017937">
        <node role="value" roleId="tpna.1111792463585" type="tpna.PostingRule" typeId="tpna.1111794888922" id="1112384017938">
          <link role="account" roleId="tpna.1111795211704" targetNodeId="tpnb.1112315990977" />
          <node role="expression" roleId="tpnk.1111784226798" type="tpnk.MultOperation" typeId="tpnk.1112384225757" id="1112384394412">
            <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.ValueReference" typeId="tpna.1112038445100" id="1112384405975">
              <link role="value" roleId="tpna.1112038462507" targetNodeId="1112383765038" />
            </node>
            <node role="rightOperand" roleId="tpnk.1111784647019" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112384408586">
              <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316685513" />
            </node>
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112383994545">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="10" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
    <node role="event" roleId="tpna.1111791084333" type="tpna.Event" typeId="tpna.1111791038612" id="1112384423559">
      <link role="type" roleId="tpna.1111793668132" targetNodeId="tpnb.1112316021402" />
      <node role="postingRule" roleId="tpna.1111794644919" type="tpna.PostingRuleTemporalProperty" typeId="tpna.1111794734295" id="1112384647065">
        <node role="value" roleId="tpna.1111792463585" type="tpna.PostingRule" typeId="tpna.1111794888922" id="1112384488572">
          <link role="account" roleId="tpna.1111795211704" targetNodeId="tpnb.1112316007244" />
          <node role="expression" roleId="tpnk.1111784226798" type="tpnk.PlusOperation" typeId="tpnk.1111786301085" id="1112384458969">
            <node role="leftOperand" roleId="tpnk.1111784613299" type="tpnk.MultOperation" typeId="tpnk.1112384225757" id="1112384462940">
              <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112384464879">
                <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316252581" />
              </node>
              <node role="rightOperand" roleId="tpnk.1111784647019" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112384472881">
                <property name="value" nameId="tpnk.1113257000626" value="0.5" />
              </node>
            </node>
            <node role="rightOperand" roleId="tpnk.1111784647019" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112384483477">
              <property name="unit" nameId="tpna.1111793358083" value="USD" />
              <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112384483476">
                <property name="value" nameId="tpnk.1113257000626" value="10.0" />
              </node>
            </node>
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112384434482">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="10" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
      <node role="postingRule" roleId="tpna.1111794644919" type="tpna.PostingRuleTemporalProperty" typeId="tpna.1111794734295" id="1112384647066">
        <node role="value" roleId="tpna.1111792463585" type="tpna.PostingRule" typeId="tpna.1111794888922" id="1112384560413">
          <link role="account" roleId="tpna.1111795211704" targetNodeId="tpnb.1112316007244" />
          <node role="expression" roleId="tpnk.1111784226798" type="tpnk.PlusOperation" typeId="tpnk.1111786301085" id="1112384540389">
            <node role="leftOperand" roleId="tpnk.1111784613299" type="tpnk.MultOperation" typeId="tpnk.1112384225757" id="1112384543203">
              <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112384548298">
                <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316252581" />
              </node>
              <node role="rightOperand" roleId="tpnk.1111784647019" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112384551659">
                <property name="value" nameId="tpnk.1113257000626" value="0.5" />
              </node>
            </node>
            <node role="rightOperand" roleId="tpnk.1111784647019" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112384556772">
              <property name="unit" nameId="tpna.1111793358083" value="USD" />
              <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112384556771">
                <property name="value" nameId="tpnk.1113257000626" value="15.0" />
              </node>
            </node>
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112384528448">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="12" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
    <node role="event" roleId="tpna.1111791084333" type="tpna.Event" typeId="tpna.1111791038612" id="1112384607478">
      <property name="taxable" nameId="tpna.1116368080504" value="false" />
      <link role="type" roleId="tpna.1111793668132" targetNodeId="tpnb.1112316644479" />
      <node role="postingRule" roleId="tpna.1111794644919" type="tpna.PostingRuleTemporalProperty" typeId="tpna.1111794734295" id="1112384647067">
        <node role="value" roleId="tpna.1111792463585" type="tpna.PostingRule" typeId="tpna.1111794888922" id="1112384638486">
          <link role="account" roleId="tpna.1111795211704" targetNodeId="tpnb.1112316013167" />
          <node role="expression" roleId="tpnk.1111784226798" type="tpnk.MultOperation" typeId="tpnk.1112384225757" id="1112384627513">
            <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112384629280">
              <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316673589" />
            </node>
            <node role="rightOperand" roleId="tpnk.1111784647019" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112384632188">
              <property name="value" nameId="tpnk.1113257000626" value="0.055" />
            </node>
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112384610291">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="10" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
    <node role="value" roleId="tpna.1111791064925" type="tpna.Value" typeId="tpna.1111791020814" id="1112383765038">
      <property name="name" nameId="tpck.1169194664001" value="BASE_RATE" />
      <node role="quantity" roleId="tpna.1111791826558" type="tpna.QuantityTemporalProperty" typeId="tpna.1111792520557" id="1112383882932">
        <node role="value" roleId="tpna.1111792463585" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112383882933">
          <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112383772351">
            <property name="value" nameId="tpnk.1113257000626" value="10.0" />
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date_Past" typeId="tpna.1116445695828" id="1116446878604" />
      </node>
      <node role="quantity" roleId="tpna.1111791826558" type="tpna.QuantityTemporalProperty" typeId="tpna.1111792520557" id="1112383979448">
        <node role="value" roleId="tpna.1111792463585" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112383979449">
          <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112383963275">
            <property name="value" nameId="tpnk.1113257000626" value="12.0" />
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112383954446">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="12" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
  </root>
  <root id="1112304761925">
    <node role="event" roleId="tpna.1111791084333" type="tpna.Event" typeId="tpna.1111791038612" id="1112393068783">
      <link role="type" roleId="tpna.1111793668132" targetNodeId="tpnb.1112316681746" />
      <node role="postingRule" roleId="tpna.1111794644919" type="tpna.PostingRuleTemporalProperty" typeId="tpna.1111794734295" id="1112393265148">
        <node role="value" roleId="tpna.1111792463585" type="tpna.PostingRule" typeId="tpna.1111794888922" id="1112393120898">
          <link role="account" roleId="tpna.1111795211704" targetNodeId="tpnb.1112315990977" />
          <node role="expression" roleId="tpnk.1111784226798" type="tpnk.IfFunction" typeId="tpnk.1111785030296" id="1112393084582">
            <node role="valueIfTrue" roleId="tpnk.1111785091720" type="tpnk.MultOperation" typeId="tpnk.1112384225757" id="1112393099763">
              <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.ValueReference" typeId="tpna.1112038445100" id="1112407052649">
                <link role="value" roleId="tpna.1112038462507" targetNodeId="1112392957192" />
              </node>
              <node role="rightOperand" roleId="tpnk.1111784647019" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112393104282">
                <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316685513" />
              </node>
            </node>
            <node role="valueIfFalse" roleId="tpnk.1111785124143" type="tpnk.MultOperation" typeId="tpnk.1112384225757" id="1112393106926">
              <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.ValueReference" typeId="tpna.1112038445100" id="1112407055697">
                <link role="value" roleId="tpna.1112038462507" targetNodeId="1112393006024" />
              </node>
              <node role="rightOperand" roleId="tpnk.1111784647019" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112393114163">
                <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316685513" />
              </node>
            </node>
            <node role="logicalTest" roleId="tpnk.1111785044750" type="tpnk.GreaterThanOperation" typeId="tpnk.1112406908640" id="1112717731865">
              <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112717731270">
                <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316685513" />
              </node>
              <node role="rightOperand" roleId="tpnk.1111784647019" type="tpna.ValueReference" typeId="tpna.1112038445100" id="1112717733617">
                <link role="value" roleId="tpna.1112038462507" targetNodeId="1112393034216" />
              </node>
            </node>
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112393071752">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="10" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
    <node role="event" roleId="tpna.1111791084333" type="tpna.Event" typeId="tpna.1111791038612" id="1112393126916">
      <link role="type" roleId="tpna.1111793668132" targetNodeId="tpnb.1112316021402" />
      <node role="postingRule" roleId="tpna.1111794644919" type="tpna.PostingRuleTemporalProperty" typeId="tpna.1111794734295" id="1112393265149">
        <node role="value" roleId="tpna.1111792463585" type="tpna.PostingRule" typeId="tpna.1111794888922" id="1112393162687">
          <link role="account" roleId="tpna.1111795211704" targetNodeId="tpnb.1112316007244" />
          <node role="expression" roleId="tpnk.1111784226798" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112393154670">
            <property name="unit" nameId="tpna.1111793358083" value="USD" />
            <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112393154669">
              <property name="value" nameId="tpnk.1113257000626" value="10.0" />
            </node>
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112393138448">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="10" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
    <node role="event" roleId="tpna.1111791084333" type="tpna.Event" typeId="tpna.1111791038612" id="1112393222389">
      <property name="taxable" nameId="tpna.1116368080504" value="false" />
      <link role="type" roleId="tpna.1111793668132" targetNodeId="tpnb.1112316644479" />
      <node role="postingRule" roleId="tpna.1111794644919" type="tpna.PostingRuleTemporalProperty" typeId="tpna.1111794734295" id="1112393265151">
        <node role="value" roleId="tpna.1111792463585" type="tpna.PostingRule" typeId="tpna.1111794888922" id="1112393255131">
          <link role="account" roleId="tpna.1111795211704" targetNodeId="tpnb.1112316013167" />
          <node role="expression" roleId="tpnk.1111784226798" type="tpnk.MultOperation" typeId="tpnk.1112384225757" id="1112393235456">
            <node role="leftOperand" roleId="tpnk.1111784613299" type="tpna.EventVariableReference" typeId="tpna.1112036490295" id="1112393237535">
              <link role="eventVariable" roleId="tpna.1112036516483" targetNodeId="tpnb.1112316673589" />
            </node>
            <node role="rightOperand" roleId="tpnk.1111784647019" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112393248818">
              <property name="value" nameId="tpnk.1113257000626" value="0.055" />
            </node>
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1112393225124">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="10" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
    <node role="value" roleId="tpna.1111791064925" type="tpna.Value" typeId="tpna.1111791020814" id="1112392957192">
      <property name="name" nameId="tpck.1169194664001" value="BASE_RATE" />
      <node role="quantity" roleId="tpna.1111791826558" type="tpna.QuantityTemporalProperty" typeId="tpna.1111792520557" id="1112393265152">
        <node role="value" roleId="tpna.1111792463585" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112393265153">
          <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112392991085">
            <property name="value" nameId="tpnk.1113257000626" value="10.0" />
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date_Past" typeId="tpna.1116445695828" id="1116446666034" />
      </node>
    </node>
    <node role="value" roleId="tpna.1111791064925" type="tpna.Value" typeId="tpna.1111791020814" id="1112393006024">
      <property name="name" nameId="tpck.1169194664001" value="REDUCED_RATE" />
      <node role="quantity" roleId="tpna.1111791826558" type="tpna.QuantityTemporalProperty" typeId="tpna.1111792520557" id="1112393265154">
        <node role="value" roleId="tpna.1111792463585" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112393034215">
          <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112393022197">
            <property name="value" nameId="tpnk.1113257000626" value="5.0" />
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date_Past" typeId="tpna.1116445695828" id="1116446834806" />
      </node>
    </node>
    <node role="value" roleId="tpna.1111791064925" type="tpna.Value" typeId="tpna.1111791020814" id="1112393034216">
      <property name="name" nameId="tpck.1169194664001" value="CAP" />
      <node role="quantity" roleId="tpna.1111791826558" type="tpna.QuantityTemporalProperty" typeId="tpna.1111792520557" id="1112393265155">
        <node role="value" roleId="tpna.1111792463585" type="tpna.Quantity" typeId="tpna.1111792102248" id="1112393052453">
          <property name="unit" nameId="tpna.1111793358083" value="KWH" />
          <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1112393046749">
            <property name="value" nameId="tpnk.1113257000626" value="50.0" />
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date_Past" typeId="tpna.1116445695828" id="1116446763488" />
      </node>
      <node role="quantity" roleId="tpna.1111791826558" type="tpna.QuantityTemporalProperty" typeId="tpna.1111792520557" id="1116446773943">
        <node role="value" roleId="tpna.1111792463585" type="tpna.Quantity" typeId="tpna.1111792102248" id="1116446773945">
          <property name="unit" nameId="tpna.1111793358083" value="KWH" />
          <node role="amount" roleId="tpna.1111793363741" type="tpnk.FloatingPointConstant" typeId="tpnk.1111784926012" id="1116446773946">
            <property name="value" nameId="tpnk.1113257000626" value="60.0" />
          </node>
        </node>
        <node role="date" roleId="tpna.1111792372299" type="tpna.Date" typeId="tpna.1111792389581" id="1116446773944">
          <property name="year" nameId="tpna.1111792409129" value="1999" />
          <property name="month" nameId="tpna.1111792417427" value="12" />
          <property name="day" nameId="tpna.1111792417975" value="01" />
        </node>
      </node>
    </node>
  </root>
</model>

