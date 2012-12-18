<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:7900f4da-af76-4836-876d-85dad66193f8(jetbrains.mps.bash.sandbox.sandbox)">
  <persistence version="7" />
  <language namespace="4a1e4a24-105b-44ed-959c-6586fc957db3(jetbrains.mps.bash)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="jvj3" modelUID="r:a8223385-58f6-47fc-9412-c59396fbedb5(jetbrains.mps.bash.builtin)" version="-1" implicit="yes" />
  <import index="u9e0" modelUID="r:49b10014-fe6b-4682-a69d-1c3d6188eba3(jetbrains.mps.bash.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="u9e0.ShellScript" typeId="u9e0.3321051580269925631" id="6382090206696966895">
      <property name="name" nameId="tpck.1169194664001" value="mps_shellscript" />
    </node>
    <node type="u9e0.ShellScript" typeId="u9e0.3321051580269925631" id="9034131902186148363">
      <property name="name" nameId="tpck.1169194664001" value="example1" />
    </node>
    <node type="u9e0.ShellScript" typeId="u9e0.3321051580269925631" id="2362837471612273215">
      <property name="name" nameId="tpck.1169194664001" value="hello_world" />
    </node>
    <node type="u9e0.ShellScript" typeId="u9e0.3321051580269925631" id="3835416431562293713">
      <property name="name" nameId="tpck.1169194664001" value="example2" />
    </node>
    <node type="u9e0.ShellScript" typeId="u9e0.3321051580269925631" id="3835416431562615951">
      <property name="name" nameId="tpck.1169194664001" value="example3" />
    </node>
    <node type="u9e0.ShellScript" typeId="u9e0.3321051580269925631" id="3835416431562846467">
      <property name="name" nameId="tpck.1169194664001" value="test" />
    </node>
    <node type="u9e0.ShellScript" typeId="u9e0.3321051580269925631" id="3835416431564591990">
      <property name="name" nameId="tpck.1169194664001" value="example4" />
    </node>
  </roots>
  <root id="6382090206696966895">
    <node role="commands" roleId="u9e0.3321051580270016552" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="6382090206698392201">
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902190632451">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902190632452">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902190632453">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902190632454" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902190908727">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902190908728">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902190908729">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902190908731">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902190908732">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.QuotesCommandSubstitution" typeId="u9e0.4857814468235197608" id="9034131902190908735">
                  <node role="command" roleId="u9e0.4857814468235197593" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902190908736">
                    <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902190908737">
                      <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902190908738">
                        <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="9034131902191016381">
                          <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.9034131902186148391" resolveInfo="dirname" />
                          <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentReference" typeId="u9e0.7803330421058150857" id="9034131902191016385">
                            <link role="arg" roleId="u9e0.7803330421058150858" targetNodeId="jvj3.9034131902186148392" resolveInfo="DIRNAME" />
                            <node role="value" roleId="u9e0.7803330421058150868" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902191016386">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902191016387">
                                <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902191016388">
                                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902191016389">
                                    <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902190908734" resolveInfo="0" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902193373347">
                <property name="name" nameId="tpck.1169194664001" value="PROJECT_HOME" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902191347532">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902191347533">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902191347534">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902191439538">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902191439539">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902191439542">
                  <property name="word" nameId="u9e0.8353259571485353282" value=".." />
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902193373348">
                <property name="name" nameId="tpck.1169194664001" value="PROJECT_HOME_FROM_STARTUP_DIR" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902191439543">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902191439544">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902191439545">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902191439546" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902191439547">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902191439548">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902191439549">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="9034131902191439551">
              <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="9034131902191439553">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902191439554">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902191439555">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902191439556">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192094524">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094525">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192094527">
                            <property name="word" nameId="u9e0.8353259571485353282" value="java" />
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="9034131902194381600">
                          <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="9034131902192094536" resolveInfo="JAVA" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.ConditionalCommand" typeId="u9e0.3147078024747082354" id="9034131902191996067">
                <node role="conditionalExpression" roleId="u9e0.3147078024747082356" type="u9e0.ZeroStringConditionalExpression" typeId="u9e0.9034131902191629589" id="9034131902192094514">
                  <node role="word" roleId="u9e0.9034131902191439564" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094515">
                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902192094517">
                      <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094518">
                        <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192094519">
                          <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192094516" resolveInfo="JDK_HOME" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="u9e0.7633559109508737480" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="9034131902192094528">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094529">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094530">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094531">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192094537">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094538">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902192094541">
                            <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094542">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192094543">
                                <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192094516" resolveInfo="JDK_HOME" />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192094546">
                                <property name="word" nameId="u9e0.8353259571485353282" value="/bin/java" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="9034131902194381631">
                          <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="9034131902192094536" resolveInfo="JAVA" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094547">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094548">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094549">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902192094550" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094551">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094552">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094553">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192094555">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094556">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192094558">
                  <property name="word" nameId="u9e0.8353259571485353282" value="some.main.class" />
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902193762919">
                <property name="name" nameId="tpck.1169194664001" value="MAIN_CLASS" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094560">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094561">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094562">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902192094563" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094564">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094565">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094566">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="9034131902192094568">
              <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.ConditionalCommand" typeId="u9e0.3147078024747082354" id="9034131902192094575">
                <node role="conditionalExpression" roleId="u9e0.3147078024747082356" type="u9e0.ZeroStringConditionalExpression" typeId="u9e0.9034131902191629589" id="9034131902192094577">
                  <node role="word" roleId="u9e0.9034131902191439564" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094578">
                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902192094580">
                      <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094581">
                        <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192094582">
                          <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192094579" resolveInfo="MPS_VM_OPTIONS" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="9034131902192094570">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094571">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094572">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094573">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192094583">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094584">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902192094586">
                            <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094587">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192094588">
                                <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902193373347" resolveInfo="PROJECT_HOME" />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192094590">
                                <property name="word" nameId="u9e0.8353259571485353282" value="/" />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192094592">
                                <property name="word" nameId="u9e0.8353259571485353282" value="pathToVMOptionsFile" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="9034131902192094585">
                          <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="9034131902192094579" resolveInfo="MPS_VM_OPTIONS" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094593">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094594">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094595">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902192094596" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192094597">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192094598">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192094599">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192094601">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192094602">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.QuotesCommandSubstitution" typeId="u9e0.4857814468235197608" id="9034131902192632559">
                  <node role="command" roleId="u9e0.4857814468235197593" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192847972">
                    <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192847973">
                      <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192847974">
                        <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.RedirectedCommand" typeId="u9e0.4857814468235439117" id="9034131902192847976">
                          <node role="command" roleId="u9e0.4857814468235439118" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="9034131902192847992">
                            <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.9034131902186554428" resolveInfo="tr" />
                            <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="9034131902192847993">
                              <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192847994">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SingleQuote" typeId="u9e0.3263637656455059140" id="9034131902192847995">
                                  <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192847996">
                                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192847997">
                                      <property name="word" nameId="u9e0.8353259571485353282" value="\n" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="9034131902192847998">
                              <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192847999">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SingleQuote" typeId="u9e0.3263637656455059140" id="9034131902192848000">
                                  <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848001">
                                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192848002">
                                      <property name="word" nameId="u9e0.8353259571485353282" value=" " />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="redirection" roleId="u9e0.4857814468235439119" type="u9e0.InputRedirection" typeId="u9e0.4857814468235580318" id="9034131902192848003">
                            <node role="word" roleId="u9e0.4857814468237147396" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848004">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192848005">
                                <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192094579" resolveInfo="MPS_VM_OPTIONS" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="following" roleId="u9e0.8474643070111818352" type="u9e0.PipelineOperatorConnection" typeId="u9e0.8474643070111988418" id="9034131902192848006">
                          <node role="basePipeline" roleId="u9e0.8474643070111988415" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192848007">
                            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="9034131902192848009">
                              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.9034131902186554428" resolveInfo="tr" />
                              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="9034131902192848010">
                                <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848012">
                                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SingleQuote" typeId="u9e0.3263637656455059140" id="9034131902192848013">
                                    <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848014">
                                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192848015">
                                        <property name="word" nameId="u9e0.8353259571485353282" value="\r" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="9034131902192848017">
                                <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848018">
                                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SingleQuote" typeId="u9e0.3263637656455059140" id="9034131902192848019">
                                    <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848020">
                                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192848021">
                                        <property name="word" nameId="u9e0.8353259571485353282" value=" " />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902194381633">
                <property name="name" nameId="tpck.1169194664001" value="JVM_ARGS" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192848043">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192848044">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192848045">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192848047">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848048">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902192848050">
                  <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848051">
                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192848052">
                      <property name="word" nameId="u9e0.8353259571485353282" value="vmoptions" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="9034131902194381637">
                <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="9034131902194381633" resolveInfo="JVM_ARGS" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192848053">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471609314307">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471609314308">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471609314309" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192848057">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192848058">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192848059">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192848061">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848062">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902192848064">
                  <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848065">
                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192848066">
                      <property name="word" nameId="u9e0.8353259571485353282" value="aditional_args" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902194381638">
                <property name="name" nameId="tpck.1169194664001" value="ADDITIONAL_JVM_ARGS" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192848067">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192848068">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192848069">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902192848070" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192848071">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192848072">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192848073">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192848076">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848077">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="9034131902192848079">
                  <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848080" />
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="9034131902194381639">
                <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="9034131902192848075" resolveInfo="CLASS_PATH" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192848092">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192848093">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192848094">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192848100">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192848101">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192955875">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192848075" resolveInfo="CLASS_PATH" />
                </node>
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192955879">
                  <property name="word" nameId="u9e0.8353259571485353282" value=":" />
                </node>
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192955880">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902193373348" resolveInfo="PROJECT_HOME_FROM_STARTUP_DIR" />
                </node>
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192955882">
                  <property name="word" nameId="u9e0.8353259571485353282" value="/" />
                </node>
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192955884">
                  <property name="word" nameId="u9e0.8353259571485353282" value="path" />
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="9034131902194381640">
                <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="9034131902192848075" resolveInfo="CLASS_PATH" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192848096">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192848097">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192848098">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902192848099" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192955887">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192955888">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192955889">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="9034131902192955891">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3263637656462774222" resolveInfo="cd" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentReference" typeId="u9e0.7803330421058150857" id="9034131902192955892">
                <link role="arg" roleId="u9e0.7803330421058150858" targetNodeId="jvj3.3263637656462774227" resolveInfo="directory" />
                <node role="value" roleId="u9e0.7803330421058150868" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192955893">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192955900">
                    <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902193373347" resolveInfo="PROJECT_HOME" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192955901">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192955902">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192955903">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="9034131902192955909">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3263637656462774222" resolveInfo="cd" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentReference" typeId="u9e0.7803330421058150857" id="9034131902192955910">
                <link role="arg" roleId="u9e0.7803330421058150858" targetNodeId="jvj3.3263637656462774227" resolveInfo="directory" />
                <node role="value" roleId="u9e0.7803330421058150868" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192955911">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192955912">
                    <property name="word" nameId="u9e0.8353259571485353282" value="basedir" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192955914">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192955915">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192955916">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902192955917" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192955925">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192955926">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192955927">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="9034131902192955929">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192955930">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192955932">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192955923" resolveInfo="LD_LIBRARY_PATH" />
                </node>
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192955935">
                  <property name="word" nameId="u9e0.8353259571485353282" value=":" />
                </node>
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902192955936">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192955924" resolveInfo="PWD" />
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="9034131902194381641">
                <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="9034131902192955923" resolveInfo="LD_LIBRARY_PATH" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192955947">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192955948">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192955949">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="9034131902192955951">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3263637656462774233" resolveInfo="export" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentReference" typeId="u9e0.7803330421058150857" id="9034131902192955952">
                <link role="arg" roleId="u9e0.7803330421058150858" targetNodeId="jvj3.3263637656462774246" resolveInfo="name" />
                <node role="value" roleId="u9e0.7803330421058150868" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902192955953">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902192955954">
                    <property name="word" nameId="u9e0.8353259571485353282" value="LD_LIBRARY_PATH" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902192955955">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902192955956">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902192955957">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="9034131902192955958" />
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="9034131902193762895">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="9034131902193762896">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="9034131902193762897">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.FreeCommand" typeId="u9e0.9034131902193581134" id="9034131902193762899">
              <node role="translatedWord" roleId="u9e0.9034131902193581135" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902193762900">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902193762901">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192094536" resolveInfo="JAVA" />
                </node>
              </node>
              <node role="translatedWord" roleId="u9e0.9034131902193581135" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902193762906">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902193762910">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902194381633" resolveInfo="JVM_ARGS" />
                </node>
              </node>
              <node role="translatedWord" roleId="u9e0.9034131902193581135" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902193762912">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="9034131902193762913">
                  <property name="word" nameId="u9e0.8353259571485353282" value="-classpath" />
                </node>
              </node>
              <node role="translatedWord" roleId="u9e0.9034131902193581135" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902193762914">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902193762915">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902192848075" resolveInfo="CLASS_PATH" />
                </node>
              </node>
              <node role="translatedWord" roleId="u9e0.9034131902193581135" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="9034131902193762916">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="9034131902193762920">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="9034131902193762919" resolveInfo="MAIN_CLASS" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902190908734">
      <property name="name" nameId="tpck.1169194664001" value="0" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902192094516">
      <property name="name" nameId="tpck.1169194664001" value="JDK_HOME" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902192094536">
      <property name="name" nameId="tpck.1169194664001" value="JAVA" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902192094579">
      <property name="name" nameId="tpck.1169194664001" value="MPS_VM_OPTIONS" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902192848075">
      <property name="name" nameId="tpck.1169194664001" value="CLASS_PATH" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902192955923">
      <property name="name" nameId="tpck.1169194664001" value="LD_LIBRARY_PATH" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="9034131902192955924">
      <property name="name" nameId="tpck.1169194664001" value="PWD" />
    </node>
  </root>
  <root id="9034131902186148363">
    <node role="commands" roleId="u9e0.3321051580270016552" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="2362837471611233913">
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611233914">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611233915">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611233916">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471611233917" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471611233918" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611380659">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611380660">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611380661">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="2362837471611380664">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471611380665">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471611380668">
                  <property name="word" nameId="u9e0.8353259571485353282" value="0" />
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="2362837471611380666">
                <property name="name" nameId="tpck.1169194664001" value="MAX_NO" />
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471611380663" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611380670">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611380671">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611380672">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471611380673" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471611380674" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611380675">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611380676">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611380677">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="2362837471611380680">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.OptionSetReference" typeId="u9e0.7803330421057156061" id="2362837471611380681">
                <node role="refToOptions" roleId="u9e0.7803330421057584568" type="u9e0.OptionReference" typeId="u9e0.7803330421057519636" id="2362837471611380683">
                  <link role="option" roleId="u9e0.7803330421057519637" targetNodeId="jvj3.7803330421062580362" />
                </node>
              </node>
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="2362837471611380685">
                <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471611380686">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="2362837471611380687">
                    <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471611380688">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471611380689">
                        <property name="word" nameId="u9e0.8353259571485353282" value="Enter Number between (5 to 9) : " />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471611380679" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611380690">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611380691">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611380692">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="2362837471611386517">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.2362837471611380696" resolveInfo="read" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="2362837471611386519">
                <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471611560711">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="2362837471611764227">
                    <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="2362837471611380666" resolveInfo="MAX_NO" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611764228">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611764229">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611764230">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471611764231" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471611764232" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611764233">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611764234">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611764235">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="2362837471611764238">
              <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="2362837471611764240">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471611764241">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471611764242">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471611764243">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="2362837471612025734">
                        <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="2362837471612025735">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612025736">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="2362837471612025737">
                              <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612025738">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471612025739">
                                  <property name="word" nameId="u9e0.8353259571485353282" value="I ask to enter number between 5 and 9, Okay" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612025740">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612025741">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612025742">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="2362837471612025745">
                        <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3263637656462774257" resolveInfo="exit" />
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentReference" typeId="u9e0.7803330421058150857" id="2362837471612025746">
                          <link role="arg" roleId="u9e0.7803330421058150858" targetNodeId="jvj3.3263637656462774259" resolveInfo="n" />
                          <node role="value" roleId="u9e0.7803330421058150868" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612025747">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471612025748">
                              <property name="word" nameId="u9e0.8353259571485353282" value="1" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612025744" />
                </node>
              </node>
              <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.NotCommand" typeId="u9e0.2362837471611764246" id="2362837471612025716">
                <node role="command" roleId="u9e0.2362837471611764248" type="u9e0.ConditionalCommand" typeId="u9e0.3147078024747082354" id="2362837471612025718">
                  <node role="conditionalExpression" roleId="u9e0.3147078024747082356" type="u9e0.AndCombiningComditionalExpression" typeId="u9e0.2362837471611859429" id="2362837471612025720">
                    <node role="left" roleId="u9e0.2362837471611859414" type="u9e0.GreaterThanOrEqual" typeId="u9e0.2362837471611859408" id="2362837471612025723">
                      <node role="left" roleId="u9e0.9034131902191635404" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612025724">
                        <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="2362837471612025726">
                          <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="2362837471611380666" resolveInfo="MAX_NO" />
                        </node>
                      </node>
                      <node role="right" roleId="u9e0.9034131902191635405" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612025725">
                        <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471612025727">
                          <property name="word" nameId="u9e0.8353259571485353282" value="5" />
                        </node>
                      </node>
                    </node>
                    <node role="right" roleId="u9e0.2362837471611859415" type="u9e0.LessThanOrEqualNumber" typeId="u9e0.2362837471611859400" id="2362837471612025728">
                      <node role="left" roleId="u9e0.9034131902191635404" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612025729">
                        <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="2362837471612025731">
                          <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="2362837471611380666" resolveInfo="MAX_NO" />
                        </node>
                      </node>
                      <node role="right" roleId="u9e0.9034131902191635405" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612025730">
                        <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471612025733">
                          <property name="word" nameId="u9e0.8353259571485353282" value="9" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471611764237" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612025749">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612025750">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612025751">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471612025752" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612025753" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612025754">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612025755">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612025756">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="2362837471612025759">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.9034131902183284950" resolveInfo="clear" />
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612025758" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612025760">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612025761">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612025762">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471612025763" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612025764" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612273206">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612273207">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612273208">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="2362837471612273211">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3263637656462774257" resolveInfo="exit" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentReference" typeId="u9e0.7803330421058150857" id="2362837471612273212">
                <link role="arg" roleId="u9e0.7803330421058150858" targetNodeId="jvj3.3263637656462774259" resolveInfo="n" />
                <node role="value" roleId="u9e0.7803330421058150868" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612273213">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471612273536">
                    <property name="word" nameId="u9e0.8353259571485353282" value="0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612273210" />
      </node>
    </node>
  </root>
  <root id="2362837471612273215">
    <node role="commands" roleId="u9e0.3321051580270016552" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="2362837471612273216">
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612273227">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612273228">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612273229">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471612273230" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612273231" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612273232">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612273233">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612273234">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="2362837471612273237">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="2362837471612273239">
                <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612273240">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="2362837471612273241">
                    <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="2362837471612273242">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="2362837471612273243">
                        <property name="word" nameId="u9e0.8353259571485353282" value="Hello World!" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612273236" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="2362837471612424032">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="2362837471612424033">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="2362837471612424034">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="2362837471612424035" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="2362837471612424036" />
      </node>
    </node>
  </root>
  <root id="3835416431562293713">
    <node role="commands" roleId="u9e0.3321051580270016552" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562293714">
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615926">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615927">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562615928">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562615929" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562615930" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615931">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615932">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562615933">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562615934" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562615935" />
        <node role="comment" roleId="u9e0.2635812496400429929" type="u9e0.CommentedText" typeId="u9e0.8457058248751600624" id="3835416431562615936">
          <property name="comment" nameId="u9e0.8457058248751600627" value="Linux Shell Scripting Tutorial 1.05r3, Summer-2002" />
        </node>
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293715">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293716">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293717">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562293718" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293719" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293721">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293722">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293723">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431562293726">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293727">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.QuotesCommandSubstitution" typeId="u9e0.4857814468235197608" id="3835416431562293729">
                  <node role="command" roleId="u9e0.4857814468235197593" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293730">
                    <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293731">
                      <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293732">
                        <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562293735">
                          <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.9034131902183284962" resolveInfo="date" />
                        </node>
                        <node role="following" roleId="u9e0.8474643070111818352" type="u9e0.PipelineOperatorConnection" typeId="u9e0.8474643070111988418" id="3835416431562293736">
                          <node role="basePipeline" roleId="u9e0.8474643070111988415" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293737">
                            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562293742">
                              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3835416431562293739" resolveInfo="cut" />
                              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562293743">
                                <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293744">
                                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293745">
                                    <property name="word" nameId="u9e0.8353259571485353282" value="-c12-13" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293734" />
                  </node>
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562293728">
                <property name="name" nameId="tpck.1169194664001" value="temph" />
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293725" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562294023">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562294024">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562294025">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562294026" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562294027" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293746">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293747">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293748">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431562293751">
              <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293752">
                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.QuotesCommandSubstitution" typeId="u9e0.4857814468235197608" id="3835416431562293754">
                  <node role="command" roleId="u9e0.4857814468235197593" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293755">
                    <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293756">
                      <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293757">
                        <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562293760">
                          <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.9034131902183284962" resolveInfo="date" />
                          <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentReference" typeId="u9e0.7803330421058150857" id="3835416431562293761">
                            <link role="arg" roleId="u9e0.7803330421058150858" targetNodeId="jvj3.9034131902183284964" resolveInfo="date" />
                            <node role="value" roleId="u9e0.7803330421058150868" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293762">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293763">
                                <property name="word" nameId="u9e0.8353259571485353282" value="+" />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562293764">
                                <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293765">
                                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293766">
                                    <property name="word" nameId="u9e0.8353259571485353282" value="%A %d in %B of %Y (%r)" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293759" />
                  </node>
                </node>
              </node>
              <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562294016">
                <property name="name" nameId="tpck.1169194664001" value="dat" />
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293750" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293767">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293768">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293769">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562293770" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293771" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293772">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293773">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293774">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="3835416431562293777">
              <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.ConditionalCommand" typeId="u9e0.3147078024747082354" id="3835416431562293785">
                <node role="conditionalExpression" roleId="u9e0.3147078024747082356" type="u9e0.LessThanNumber" typeId="u9e0.2362837471611859396" id="3835416431562293787">
                  <node role="left" roleId="u9e0.9034131902191635404" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293788">
                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293790">
                      <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293728" resolveInfo="temph" />
                    </node>
                  </node>
                  <node role="right" roleId="u9e0.9034131902191635405" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293789">
                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293793">
                      <property name="word" nameId="u9e0.8353259571485353282" value="12" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562293779">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293799">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293800">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293801">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431562293804">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293805">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562293807">
                            <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293808">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293811">
                                <property name="word" nameId="u9e0.8353259571485353282" value="GoodMorning " />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293813">
                                <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293812" resolveInfo="LOGNAME" />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293817">
                                <property name="word" nameId="u9e0.8353259571485353282" value=", Have nice day!" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="3835416431562293863">
                          <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="3835416431562293862" resolveInfo="mes" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293803" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293776" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293818">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293819">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293820">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562293821" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293822" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293823">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293824">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293825">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="3835416431562293828">
              <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.ConditionalCommand" typeId="u9e0.3147078024747082354" id="3835416431562293836">
                <node role="conditionalExpression" roleId="u9e0.3147078024747082356" type="u9e0.AndCombiningComditionalExpression" typeId="u9e0.2362837471611859429" id="3835416431562293841">
                  <node role="left" roleId="u9e0.2362837471611859414" type="u9e0.GreaterThanNumber" typeId="u9e0.2362837471611859404" id="3835416431562293844">
                    <node role="left" roleId="u9e0.9034131902191635404" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293845">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293847">
                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293728" resolveInfo="temph" />
                      </node>
                    </node>
                    <node role="right" roleId="u9e0.9034131902191635405" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293846">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293848">
                        <property name="word" nameId="u9e0.8353259571485353282" value="12" />
                      </node>
                    </node>
                  </node>
                  <node role="right" roleId="u9e0.2362837471611859415" type="u9e0.LessThanOrEqualNumber" typeId="u9e0.2362837471611859400" id="3835416431562293849">
                    <node role="left" roleId="u9e0.9034131902191635404" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293850">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293852">
                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293728" resolveInfo="temph" />
                      </node>
                    </node>
                    <node role="right" roleId="u9e0.9034131902191635405" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293851">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293853">
                        <property name="word" nameId="u9e0.8353259571485353282" value="16" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562293830">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293864">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293865">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293866">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431562293869">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293870">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562293872">
                            <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293873">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293875">
                                <property name="word" nameId="u9e0.8353259571485353282" value="Good Afternoon " />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293876">
                                <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293812" resolveInfo="LOGNAME" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="3835416431562293871">
                          <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="3835416431562293862" resolveInfo="mess" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293868" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293827" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293877">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293878">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293879">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562293880" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293881" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293882">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293883">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293884">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="3835416431562293887">
              <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.ConditionalCommand" typeId="u9e0.3147078024747082354" id="3835416431562293895">
                <node role="conditionalExpression" roleId="u9e0.3147078024747082356" type="u9e0.AndCombiningComditionalExpression" typeId="u9e0.2362837471611859429" id="3835416431562293897">
                  <node role="left" roleId="u9e0.2362837471611859414" type="u9e0.GreaterThanNumber" typeId="u9e0.2362837471611859404" id="3835416431562293900">
                    <node role="left" roleId="u9e0.9034131902191635404" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293901">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293903">
                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293728" resolveInfo="temph" />
                      </node>
                    </node>
                    <node role="right" roleId="u9e0.9034131902191635405" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293902">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293904">
                        <property name="word" nameId="u9e0.8353259571485353282" value="16" />
                      </node>
                    </node>
                  </node>
                  <node role="right" roleId="u9e0.2362837471611859415" type="u9e0.LessThanOrEqualNumber" typeId="u9e0.2362837471611859400" id="3835416431562293905">
                    <node role="left" roleId="u9e0.9034131902191635404" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293906">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293908">
                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293728" resolveInfo="temph" />
                      </node>
                    </node>
                    <node role="right" roleId="u9e0.9034131902191635405" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293907">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293909">
                        <property name="word" nameId="u9e0.8353259571485353282" value="18" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562293889">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293890">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293891">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293892">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431562293915">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293916">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562293918">
                            <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293919">
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293920">
                                <property name="word" nameId="u9e0.8353259571485353282" value="Good Evening " />
                              </node>
                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562293921">
                                <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293812" resolveInfo="LOGNAME" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="3835416431562293917">
                          <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="3835416431562293862" resolveInfo="mess" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293886" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293922">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293923">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293924">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562293925" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293926" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293927">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293928">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293929">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="3835416431562293932">
              <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562293934">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562293935">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562293936">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562293937">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562293969">
                        <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3835416431562293967" resolveInfo="dialog" />
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562293970">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293971">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293972">
                              <property name="word" nameId="u9e0.8353259571485353282" value="--backtitle " />
                            </node>
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562293978">
                              <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293979">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293980">
                                  <property name="word" nameId="u9e0.8353259571485353282" value="Linux Shell Script Tutorial" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562293995">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293996">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293997">
                              <property name="word" nameId="u9e0.8353259571485353282" value="--title " />
                            </node>
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562293998">
                              <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293999">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294000">
                                  <property name="word" nameId="u9e0.8353259571485353282" value="(-: Welcome to Linux :-)" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562294002">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294003">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294004">
                              <property name="word" nameId="u9e0.8353259571485353282" value="--infobox " />
                            </node>
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562294005">
                              <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294006">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294009">
                                  <property name="word" nameId="u9e0.8353259571485353282" value="\n" />
                                </node>
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562294010">
                                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293862" resolveInfo="mess" />
                                </node>
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294013">
                                  <property name="word" nameId="u9e0.8353259571485353282" value="\nThis is " />
                                </node>
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562294014">
                                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562294016" resolveInfo="dat" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562294038">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294039">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294040">
                              <property name="word" nameId="u9e0.8353259571485353282" value="6" />
                            </node>
                          </node>
                        </node>
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562294042">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294043">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294044">
                              <property name="word" nameId="u9e0.8353259571485353282" value="60" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293939" />
                </node>
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562294046">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562294047">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562294048">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562294051">
                        <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.OptionSetReference" typeId="u9e0.7803330421057156061" id="3835416431562294052">
                          <node role="refToOptions" roleId="u9e0.7803330421057584568" type="u9e0.OptionReference" typeId="u9e0.7803330421057519636" id="3835416431562294054">
                            <link role="option" roleId="u9e0.7803330421057519637" targetNodeId="jvj3.7803330421062580362" />
                          </node>
                        </node>
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562294056">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294057">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562294058">
                              <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294059">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294060">
                                  <property name="word" nameId="u9e0.8353259571485353282" value="Press a key to continue..." />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562294050" />
                </node>
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562294061">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562294062">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562294063">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562294066">
                        <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.2362837471611380696" resolveInfo="read" />
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562294065" />
                </node>
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562294067">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562294068">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562294069">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562294072">
                        <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.9034131902183284950" resolveInfo="clear" />
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562294071" />
                </node>
              </node>
              <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.RedirectedCommand" typeId="u9e0.4857814468235439117" id="3835416431562293957">
                <node role="command" roleId="u9e0.4857814468235439118" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562293959">
                  <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3835416431562293940" resolveInfo="which" />
                  <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562293960">
                    <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293961">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293962">
                        <property name="word" nameId="u9e0.8353259571485353282" value="dialog" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="redirection" roleId="u9e0.4857814468235439119" type="u9e0.OutputRedirection" typeId="u9e0.4857814468235580337" id="3835416431562293963">
                  <node role="word" roleId="u9e0.4857814468237147396" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562293964">
                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562293966">
                      <property name="word" nameId="u9e0.8353259571485353282" value="/dev/null" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="u9e0.7633559109508737480" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562294073">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562294074">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562294075">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562294076">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562294079">
                        <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.OptionSetReference" typeId="u9e0.7803330421057156061" id="3835416431562294080">
                          <node role="refToOptions" roleId="u9e0.7803330421057584568" type="u9e0.OptionReference" typeId="u9e0.7803330421057519636" id="3835416431562294082">
                            <link role="option" roleId="u9e0.7803330421057519637" targetNodeId="jvj3.7803330421062862035" />
                          </node>
                        </node>
                        <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562294084">
                          <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294085">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562294086">
                              <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562294087">
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562294090">
                                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562293862" resolveInfo="mess" />
                                </node>
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562294092">
                                  <property name="word" nameId="u9e0.8353259571485353282" value="\nThis is " />
                                </node>
                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562294093">
                                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562294016" resolveInfo="dat" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562294078" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562293931" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562414343">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562414344">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562414345">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562414346" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562414353" />
      </node>
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562293812">
      <property name="name" nameId="tpck.1169194664001" value="LOGNAME" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562293862">
      <property name="name" nameId="tpck.1169194664001" value="mess" />
    </node>
  </root>
  <root id="3835416431562615951">
    <node role="commands" roleId="u9e0.3321051580270016552" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562615952">
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615958">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615959">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562615960">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562615961" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562615962" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615963">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615964">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562615965">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ForeachCommand" typeId="u9e0.7633559109506044887" id="3835416431562615968">
              <node role="variable" roleId="u9e0.7633559109506274372" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562615969">
                <property name="name" nameId="tpck.1169194664001" value="P" />
              </node>
              <node role="commands" roleId="u9e0.7633559109504426808" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562615970">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615971">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615972">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562615973">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431562615986">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562615987">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562615989">
                            <property name="word" nameId="u9e0.8353259571485353282" value=":" />
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562615988">
                          <property name="name" nameId="tpck.1169194664001" value="IFS" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562615975" />
                </node>
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615990">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615991">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562615992">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ForeachCommand" typeId="u9e0.7633559109506044887" id="3835416431562615995">
                        <node role="variable" roleId="u9e0.7633559109506274372" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562615996">
                          <property name="name" nameId="tpck.1169194664001" value="D" />
                        </node>
                        <node role="commands" roleId="u9e0.7633559109504426808" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562615997">
                          <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615998">
                            <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615999">
                              <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562616000">
                                <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ForeachCommand" typeId="u9e0.7633559109506044887" id="3835416431562616011">
                                  <node role="variable" roleId="u9e0.7633559109506274372" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562616012">
                                    <property name="name" nameId="tpck.1169194664001" value="F" />
                                  </node>
                                  <node role="commands" roleId="u9e0.7633559109504426808" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431562616013">
                                    <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562616014">
                                      <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562616015">
                                        <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562616016">
                                          <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ConditionalCommand" typeId="u9e0.3147078024747082354" id="3835416431562616032">
                                            <node role="conditionalExpression" roleId="u9e0.3147078024747082356" type="u9e0.ExecTestConditionalExpression" typeId="u9e0.9034131902191515055" id="3835416431562616034">
                                              <node role="word" roleId="u9e0.9034131902191439564" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562616035">
                                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562616036">
                                                  <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562616037">
                                                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562616040">
                                                      <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562616012" resolveInfo="F" />
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                        <node role="following" roleId="u9e0.8474643070102636486" type="u9e0.AndOperator" typeId="u9e0.8474643070102636535" id="3835416431562616041">
                                          <node role="baseCommand" roleId="u9e0.8474643070102636490" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562616042">
                                            <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562616043">
                                              <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431562616050">
                                                <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
                                                <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431562616051">
                                                  <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562616052">
                                                    <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562616053">
                                                      <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562616012" resolveInfo="F" />
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node role="wordList" roleId="u9e0.7633559109506274411" type="u9e0.WordList" typeId="u9e0.3321051580272063536" id="3835416431562616019">
                                    <node role="words" roleId="u9e0.3321051580272063542" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562616020">
                                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562616024">
                                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562615996" resolveInfo="D" />
                                      </node>
                                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431562616030">
                                        <property name="word" nameId="u9e0.8353259571485353282" value="/" />
                                      </node>
                                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562616031">
                                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562615969" resolveInfo="P" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="wordList" roleId="u9e0.7633559109506274411" type="u9e0.WordList" typeId="u9e0.3321051580272063536" id="3835416431562616004">
                          <node role="words" roleId="u9e0.3321051580272063542" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562616005">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562616010">
                              <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562616003" resolveInfo="PATH" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562615994" />
                </node>
              </node>
              <node role="wordList" roleId="u9e0.7633559109506274411" type="u9e0.WordList" typeId="u9e0.3321051580272063536" id="3835416431562615978">
                <node role="words" roleId="u9e0.3321051580272063542" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562615979">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431562615980">
                    <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431562615981">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431562615985">
                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431562615984" resolveInfo="@" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562615967" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431562615953">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431562615954">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431562615955">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431562615956" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431562615957" />
      </node>
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562615984">
      <property name="name" nameId="tpck.1169194664001" value="@" />
    </node>
    <node role="usedVars" roleId="u9e0.9034131902190735828" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431562616003">
      <property name="name" nameId="tpck.1169194664001" value="PATH" />
    </node>
  </root>
  <root id="3835416431562846467">
    <node role="commands" roleId="u9e0.3321051580270016552" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="1625002555034534937" />
  </root>
  <root id="3835416431564591990">
    <node role="commands" roleId="u9e0.3321051580270016552" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431564591991">
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564591992">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564591993">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564591994">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431564591995" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564591996" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564784049">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564784050">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564784051">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431564784059">
              <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
              <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431564784060">
                <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431564784061">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.DoubleQuote" typeId="u9e0.3263637656455059166" id="3835416431564784062">
                    <node role="word" roleId="u9e0.3147078024751877535" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431564784063">
                      <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431564784066">
                        <property name="word" nameId="u9e0.8353259571485353282" value="Primes Example" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564784053" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950871">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950872">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950873">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431564950874" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564950875" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950895">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950896">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950897">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ForCommand" typeId="u9e0.7633559109507052112" id="3835416431564950908">
              <node role="commands" roleId="u9e0.7633559109504426808" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431564950909">
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950910">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950911">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950912">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431564950934">
                        <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431564950935">
                          <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431564950937">
                            <property name="word" nameId="u9e0.8353259571485353282" value="1" />
                          </node>
                        </node>
                        <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431564950936">
                          <property name="name" nameId="tpck.1169194664001" value="T" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564950914" />
                </node>
                <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950938">
                  <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950939">
                    <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950940">
                      <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ForCommand" typeId="u9e0.7633559109507052112" id="3835416431564950943">
                        <node role="commands" roleId="u9e0.7633559109504426808" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431564950944">
                          <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950945">
                            <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950946">
                              <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950947">
                                <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="3835416431564950964">
                                  <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431564950966">
                                    <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950984">
                                      <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950985">
                                        <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950986">
                                          <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.VariableAssingment" typeId="u9e0.3999172467441325687" id="3835416431564950989">
                                            <node role="value" roleId="u9e0.3999172467441293221" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431564950990">
                                              <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.SimpleWord" typeId="u9e0.8353259571485353280" id="3835416431564950992">
                                                <property name="word" nameId="u9e0.8353259571485353282" value="0" />
                                              </node>
                                            </node>
                                            <node role="lvalue" roleId="u9e0.3999172467441293220" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="3835416431564950991">
                                              <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="3835416431564950936" resolveInfo="T" />
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                      <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564950988" />
                                    </node>
                                    <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950967">
                                      <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950968">
                                        <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950969">
                                          <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431564950983">
                                            <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.3263637656462774219" resolveInfo="break" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.ArithmeticCommand" typeId="u9e0.3999172467437635795" id="3835416431564950972">
                                    <node role="expression" roleId="u9e0.3999172467437635796" type="u9e0.EqualityExpression" typeId="u9e0.3999172467438761816" id="3835416431564950979">
                                      <node role="rightExpression" roleId="u9e0.3999172467437184657" type="u9e0.DecimalConstant" typeId="u9e0.3999172467439274730" id="3835416431564950982">
                                        <property name="value" nameId="u9e0.3999172467439274731" value="0" />
                                      </node>
                                      <node role="leftExpression" roleId="u9e0.3999172467437184656" type="u9e0.ModExpression" typeId="u9e0.3999172467437426998" id="3835416431564950975">
                                        <node role="rightExpression" roleId="u9e0.3999172467437184657" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431564950978">
                                          <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431564950953" resolveInfo="J" />
                                        </node>
                                        <node role="leftExpression" roleId="u9e0.3999172467437184656" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431564950974">
                                          <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431564950918" resolveInfo="I" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564950993">
                            <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564950994">
                              <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564950995">
                                <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.IfCommand" typeId="u9e0.7633559109508737477" id="3835416431564950998">
                                  <node role="testCommand" roleId="u9e0.7633559109508737478" type="u9e0.ArithmeticCommand" typeId="u9e0.3999172467437635795" id="3835416431564951006">
                                    <node role="expression" roleId="u9e0.3999172467437635796" type="u9e0.EqualityExpression" typeId="u9e0.3999172467438761816" id="3835416431564951009">
                                      <node role="rightExpression" roleId="u9e0.3999172467437184657" type="u9e0.DecimalConstant" typeId="u9e0.3999172467439274730" id="3835416431564951012">
                                        <property name="value" nameId="u9e0.3999172467439274731" value="1" />
                                      </node>
                                      <node role="leftExpression" roleId="u9e0.3999172467437184656" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431564951008">
                                        <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431564950936" resolveInfo="T" />
                                      </node>
                                    </node>
                                  </node>
                                  <node role="ifTrue" roleId="u9e0.7633559109508737479" type="u9e0.InputLines" typeId="u9e0.3321051580269917239" id="3835416431564951000">
                                    <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564951001">
                                      <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564951002">
                                        <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564951003">
                                          <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.ExternalCommandCall" typeId="u9e0.4857814468241254997" id="3835416431564951014">
                                            <link role="declaration" roleId="u9e0.4857814468241607046" targetNodeId="jvj3.7803330421062580359" resolveInfo="echo" />
                                            <node role="refToOptions" roleId="u9e0.4857814468241607047" type="u9e0.ArgumentListReference" typeId="u9e0.3147078024744633269" id="3835416431564951015">
                                              <node role="words" roleId="u9e0.3147078024744633271" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431564951016">
                                                <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431564951027">
                                                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431564950918" resolveInfo="I" />
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                      <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564951005" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564950997" />
                          </node>
                        </node>
                        <node role="accord" roleId="u9e0.7633559109507211188" type="u9e0.AssingmentExpression" typeId="u9e0.3999172467440353749" id="3835416431564950950">
                          <node role="lValue" roleId="u9e0.3999172467440224563" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431564950953">
                            <property name="name" nameId="tpck.1169194664001" value="J" />
                          </node>
                          <node role="rValue" roleId="u9e0.3999172467440224564" type="u9e0.DecimalConstant" typeId="u9e0.3999172467439274730" id="3835416431564950954">
                            <property name="value" nameId="u9e0.3999172467439274731" value="2" />
                          </node>
                        </node>
                        <node role="condition" roleId="u9e0.7633559109507211197" type="u9e0.LessThanExpression" typeId="u9e0.3999172467439962839" id="3835416431564950955">
                          <node role="leftExpression" roleId="u9e0.3999172467437184656" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431564950958">
                            <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431564950953" resolveInfo="J" />
                          </node>
                          <node role="rightExpression" roleId="u9e0.3999172467437184657" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431564950959">
                            <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431564950918" resolveInfo="I" />
                          </node>
                        </node>
                        <node role="iteration" roleId="u9e0.7633559109507211198" type="u9e0.PostIncExpression" typeId="u9e0.3999172467438131840" id="3835416431564950960">
                          <node role="word" roleId="u9e0.3263637656462020095" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431564950961">
                            <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="3835416431564950963">
                              <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="3835416431564950953" resolveInfo="J" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564950942" />
                </node>
              </node>
              <node role="accord" roleId="u9e0.7633559109507211188" type="u9e0.AssingmentExpression" typeId="u9e0.3999172467440353749" id="3835416431564950915">
                <node role="lValue" roleId="u9e0.3999172467440224563" type="u9e0.VariableNameDeclaration" typeId="u9e0.7633559109506263695" id="3835416431564950918">
                  <property name="name" nameId="tpck.1169194664001" value="I" />
                </node>
                <node role="rValue" roleId="u9e0.3999172467440224564" type="u9e0.DecimalConstant" typeId="u9e0.3999172467439274730" id="3835416431564950919">
                  <property name="value" nameId="u9e0.3999172467439274731" value="1" />
                </node>
              </node>
              <node role="condition" roleId="u9e0.7633559109507211197" type="u9e0.LessThanExpression" typeId="u9e0.3999172467439962839" id="3835416431564950922">
                <node role="leftExpression" roleId="u9e0.3999172467437184656" type="u9e0.BasicParameterExpansion" typeId="u9e0.3999172467442053841" id="3835416431564950925">
                  <link role="variable" roleId="u9e0.3999172467442053842" targetNodeId="3835416431564950918" resolveInfo="I" />
                </node>
                <node role="rightExpression" roleId="u9e0.3999172467437184657" type="u9e0.DecimalConstant" typeId="u9e0.3999172467439274730" id="3835416431564950927">
                  <property name="value" nameId="u9e0.3999172467439274731" value="100" />
                </node>
              </node>
              <node role="iteration" roleId="u9e0.7633559109507211198" type="u9e0.PostIncExpression" typeId="u9e0.3999172467438131840" id="3835416431564950930">
                <node role="word" roleId="u9e0.3263637656462020095" type="u9e0.GeneralizedWord" typeId="u9e0.8353259571483884165" id="3835416431564950931">
                  <node role="units" roleId="u9e0.8353259571485385865" type="u9e0.VariableReference" typeId="u9e0.9034131902187955344" id="3835416431564950933">
                    <link role="variable" roleId="u9e0.9034131902187955345" targetNodeId="3835416431564950918" resolveInfo="I" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564950899" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564784054">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564784055">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564784056">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431564784057" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564784058" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564784039">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564784040">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564784041">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431564784042" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564784043" />
      </node>
      <node role="lines" roleId="u9e0.3321051580270635008" type="u9e0.CommandList" typeId="u9e0.3321051580269894529" id="3835416431564784044">
        <node role="head" roleId="u9e0.3321051580273150845" type="u9e0.HeadCommandList" typeId="u9e0.8474643070102636479" id="3835416431564784045">
          <node role="base" roleId="u9e0.8474643070102636485" type="u9e0.HeadPipeline" typeId="u9e0.8474643070110245381" id="3835416431564784046">
            <node role="command" roleId="u9e0.8474643070110463418" type="u9e0.Command" typeId="u9e0.3905757829901343108" id="3835416431564784047" />
          </node>
        </node>
        <node role="terminator" roleId="u9e0.7633559109503378344" type="u9e0.CommandTerminator" typeId="u9e0.7633559109503378338" id="3835416431564784048" />
      </node>
    </node>
  </root>
</model>

