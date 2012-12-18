<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590431(jetbrains.mps.samples.secretCompartmentLanguage.sandbox)">
  <persistence version="7" />
  <language namespace="6986543d-8218-4ebf-a2e9-565e5049c1ce(jetbrains.mps.samples.secretCompartmentLanguage)" />
  <import index="tpo2" modelUID="r:00000000-0000-4000-0000-011c8959042e(jetbrains.mps.samples.secretCompartmentLanguage.structure)" version="1" implicit="yes" />
  <roots>
    <node type="tpo2.StateMachine" typeId="tpo2.1197149564476" id="1197150020790">
      <property name="stateMachineName" nameId="tpo2.1197166557152" value="MrsH" />
      <link role="startState" roleId="tpo2.1197239402593" targetNodeId="1197223600313" resolveInfo="idle" />
    </node>
    <node type="tpo2.StateMachineTest" typeId="tpo2.1197246912613" id="1197247437082">
      <link role="stateMachine" roleId="tpo2.1197247793411" targetNodeId="1197150020790" resolveInfo="MrsH_StateMachine" />
    </node>
  </roots>
  <root id="1197150020790">
    <node role="state" roleId="tpo2.1197223095983" type="tpo2.State" typeId="tpo2.1197170590231" id="1197223600313">
      <property name="stateName" nameId="tpo2.1197170631630" value="idle" />
      <node role="transition" roleId="tpo2.1197240451739" type="tpo2.Transition" typeId="tpo2.1197240155690" id="1197240843830">
        <link role="trigger" roleId="tpo2.1197240182332" targetNodeId="1197169658976" resolveInfo="doorClosed" />
        <link role="target" roleId="tpo2.1197240188973" targetNodeId="1197240913970" resolveInfo="doorClosed" />
      </node>
    </node>
    <node role="state" roleId="tpo2.1197223095983" type="tpo2.State" typeId="tpo2.1197170590231" id="1197240913970">
      <property name="stateName" nameId="tpo2.1197170631630" value="doorClosed" />
      <node role="transition" roleId="tpo2.1197240451739" type="tpo2.Transition" typeId="tpo2.1197240155690" id="1197242140286">
        <link role="trigger" roleId="tpo2.1197240182332" targetNodeId="1197169676040" resolveInfo="drawOpened" />
        <link role="target" roleId="tpo2.1197240188973" targetNodeId="1197242143240" resolveInfo="drawOpened" />
      </node>
    </node>
    <node role="state" roleId="tpo2.1197223095983" type="tpo2.State" typeId="tpo2.1197170590231" id="1197242143240">
      <property name="stateName" nameId="tpo2.1197170631630" value="drawOpened" />
      <node role="transition" roleId="tpo2.1197240451739" type="tpo2.Transition" typeId="tpo2.1197240155690" id="1197242172476">
        <link role="trigger" roleId="tpo2.1197240182332" targetNodeId="1197169688807" resolveInfo="lightOn" />
        <link role="target" roleId="tpo2.1197240188973" targetNodeId="1197242160585" resolveInfo="panelUnlocked" />
      </node>
    </node>
    <node role="state" roleId="tpo2.1197223095983" type="tpo2.State" typeId="tpo2.1197170590231" id="1197242160585">
      <property name="stateName" nameId="tpo2.1197170631630" value="panelUnlocked" />
    </node>
    <node role="event" roleId="tpo2.1197169554182" type="tpo2.Event" typeId="tpo2.1197169363230" id="1197169658976">
      <property name="eventName" nameId="tpo2.1197169389356" value="doorClosed" />
      <property name="code" nameId="tpo2.1197169394841" value="D1CL" />
    </node>
    <node role="event" roleId="tpo2.1197169554182" type="tpo2.Event" typeId="tpo2.1197169363230" id="1197169676040">
      <property name="eventName" nameId="tpo2.1197169389356" value="drawOpened" />
      <property name="code" nameId="tpo2.1197169394841" value="D2OP" />
    </node>
    <node role="event" roleId="tpo2.1197169554182" type="tpo2.Event" typeId="tpo2.1197169363230" id="1197169688807">
      <property name="eventName" nameId="tpo2.1197169389356" value="lightOn" />
      <property name="code" nameId="tpo2.1197169394841" value="L1ON" />
    </node>
    <node role="event" roleId="tpo2.1197169554182" type="tpo2.Event" typeId="tpo2.1197169363230" id="1197169702886">
      <property name="eventName" nameId="tpo2.1197169389356" value="doorOpened" />
      <property name="code" nameId="tpo2.1197169394841" value="D1OP" />
    </node>
  </root>
  <root id="1197247437082">
    <node role="testMethod" roleId="tpo2.1197252952541" type="tpo2.StateMachineTestMethod" typeId="tpo2.1197252718474" id="1197253131013">
      <property name="methodName" nameId="tpo2.1197252760325" value="A" />
      <link role="finalState" roleId="tpo2.1197255224363" targetNodeId="1197242160585" resolveInfo="panelUnlocked" />
      <node role="handleEvent" roleId="tpo2.1197255818559" type="tpo2.HandleEvent" typeId="tpo2.1197255776563" id="1197255880355">
        <link role="event" roleId="tpo2.1197255783048" targetNodeId="1197169658976" resolveInfo="doorClosed" />
      </node>
      <node role="handleEvent" roleId="tpo2.1197255818559" type="tpo2.HandleEvent" typeId="tpo2.1197255776563" id="1197255894825">
        <link role="event" roleId="tpo2.1197255783048" targetNodeId="1197169676040" resolveInfo="drawOpened" />
      </node>
      <node role="handleEvent" roleId="tpo2.1197255818559" type="tpo2.HandleEvent" typeId="tpo2.1197255776563" id="1197255910138">
        <link role="event" roleId="tpo2.1197255783048" targetNodeId="1197169688807" resolveInfo="lightOn" />
      </node>
    </node>
  </root>
</model>

