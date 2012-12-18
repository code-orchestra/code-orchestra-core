
/*  Generated Tue Oct 02 17:55:24 NOVT 2012 by JBurg version 1.10.1 */

package org.apache.flex.compiler.internal.css.codegen;


    import static org.apache.flex.abc.ABCConstants.*;
    import static org.apache.flex.compiler.internal.css.CSSModelTreeType.*;
    
    import org.apache.flex.compiler.css.*;
    import org.apache.flex.compiler.internal.css.*;

    import org.apache.flex.abc.semantics.*;
    import org.apache.flex.abc.instructionlist.InstructionList;
    import org.apache.flex.compiler.internal.css.codegen.Pair.*;
@SuppressWarnings({"rawtypes", "unchecked", "unused"})
public class CSSEmitter
	
{
	java.util.Stack __reducedValues = new java.util.Stack();

    public CSSEmitter(final CSSReducer reducer)
    {
        this.reducer = reducer;
    }
    
    private final CSSReducer reducer;

	
	public static final int __selector_NT = 1;
	public static final int __namespaceDefinition_NT = 2;
	public static final int __selectorGroup_NT = 3;
	public static final int __fontFace_NT = 4;
	public static final int __property_NT = 5;
	public static final int __propertyList_NT = 6;
	public static final int __ruleList_NT = 7;
	public static final int __fontFaceList_NT = 8;
	public static final int __document_NT = 9;
	public static final int __namespaceList_NT = 10;
	public static final int __mediaQueryCondition_NT = 11;
	public static final int __rule_NT = 12;
	public static final int __mediaQuery_NT = 13;
	public static final int nStates = 13;

	private static final JBurgSubgoal[][] ___subgoals_by_rule = 
	{
		null,
		{
			new JBurgSubgoal(__namespaceList_NT,false,0,0),
			new JBurgSubgoal(__fontFaceList_NT,false,0,1),
			new JBurgSubgoal(__ruleList_NT,false,0,2),
		},
		null,
		{
			new JBurgSubgoal(__fontFace_NT,true,0),
		},
		{
			new JBurgSubgoal(__mediaQueryCondition_NT,true,0),
		},
		null,
		null,
		{
			new JBurgSubgoal(__namespaceDefinition_NT,true,0),
		},
		null,
		{
			new JBurgSubgoal(__property_NT,true,0),
		},
		{
			new JBurgSubgoal(__selectorGroup_NT,false,0,0),
			new JBurgSubgoal(__mediaQuery_NT,false,0,1),
			new JBurgSubgoal(__propertyList_NT,false,0,2),
		},
		{
			new JBurgSubgoal(__rule_NT,true,0),
		},
		null,
		{
			new JBurgSubgoal(__selector_NT,true,0),
		},
	};


	
	public JBurgAnnotation label( ICSSNode to_be_labelled)
	{
		JBurgAnnotation result = null;

		int i;

		int arity;

		result = this.getJBurgAnnotation(to_be_labelled);
		arity = to_be_labelled.getArity();
		i = 0;
		while ( ( arity > i ) )
		{
			result.addChild(this.label(((ICSSNode)to_be_labelled.getNthChild(i))));
			i =  (i + 1) ;
		}
		return(result);
	}

	/* document = DOCUMENT(namespaceList, fontFaceList, ruleList) */
	
	private PairOfInstructionLists action_1( ICSSNode __p) throws java.lang.Exception
	{
		PairOfInstructionLists ruleList = (PairOfInstructionLists)__reducedValues.pop();
		PairOfInstructionLists fontFaceList = (PairOfInstructionLists)__reducedValues.pop();
		PairOfInstructionLists namespaceList = (PairOfInstructionLists)__reducedValues.pop();
		return reducer.reduceDocument(__p,namespaceList,ruleList);
	}

	/* fontFace = FONT_FACE(void) */
	
	private PairOfInstructionLists action_2( ICSSNode __p) throws java.lang.Exception
	{
		return reducer.reduceFontFace(__p);
	}

	/* fontFaceList = FONT_FACE_LIST(fontFace*) */
	
	private PairOfInstructionLists action_3( ICSSNode __p) throws java.lang.Exception
	{
		java.util.Vector<PairOfInstructionLists> fontFaces = (java.util.Vector<PairOfInstructionLists>)__reducedValues.pop();
		return reducer.reduceFontFaceList(__p,fontFaces);
	}

	/* mediaQuery = MEDIA_QUERY(mediaQueryCondition*) */
	
	private PairOfInstructionLists action_4( ICSSNode __p) throws java.lang.Exception
	{
		java.util.Vector<PairOfInstructionLists> conditions = (java.util.Vector<PairOfInstructionLists>)__reducedValues.pop();
		return reducer.reduceMediaQuery(__p,conditions);
	}

	/* mediaQueryCondition = MEDIA_QUERY_CONDITION(void) */
	
	private PairOfInstructionLists action_5( ICSSNode __p) throws java.lang.Exception
	{
		return reducer.reduceMediaQueryCondition(__p);
	}

	/* namespaceDefinition = NAMESPACE_DEFINITION(void) */
	
	private PairOfInstructionLists action_6( ICSSNode __p) throws java.lang.Exception
	{
		return reducer.reduceNamespaceDefinition(__p);
	}

	/* namespaceList = NAMESPACE_LIST(namespaceDefinition*) */
	
	private PairOfInstructionLists action_7( ICSSNode __p) throws java.lang.Exception
	{
		java.util.Vector<PairOfInstructionLists> namespaces = (java.util.Vector<PairOfInstructionLists>)__reducedValues.pop();
		return reducer.reduceNamespaceList(__p,namespaces);
	}

	/* property = PROPERTY(void) */
	
	private PairOfInstructionLists action_8( ICSSNode __p) throws java.lang.Exception
	{
		return reducer.reduceProperty(__p);
	}

	/* propertyList = PROPERTY_LIST(property*) */
	
	private PairOfInstructionLists action_9( ICSSNode __p) throws java.lang.Exception
	{
		java.util.Vector<PairOfInstructionLists> properties = (java.util.Vector<PairOfInstructionLists>)__reducedValues.pop();
		return reducer.reducePropertyList(__p,properties);
	}

	/* rule = RULE(selectorGroup, mediaQuery, propertyList) */
	
	private InstructionListAndClosure action_10( ICSSNode __p) throws java.lang.Exception
	{
		PairOfInstructionLists propertyList = (PairOfInstructionLists)__reducedValues.pop();
		PairOfInstructionLists mediaQuery = (PairOfInstructionLists)__reducedValues.pop();
		InstructionListAndClosure selectorGroup = (InstructionListAndClosure)__reducedValues.pop();
		return reducer.reduceRule(__p,selectorGroup,propertyList);
	}

	/* ruleList = RULE_LIST(rule*) */
	
	private PairOfInstructionLists action_11( ICSSNode __p) throws java.lang.Exception
	{
		java.util.Vector<InstructionListAndClosure> rules = (java.util.Vector<InstructionListAndClosure>)__reducedValues.pop();
		return reducer.reduceRuleList(__p,rules);
	}

	/* selector = SELECTOR(void) */
	
	private InstructionListAndString action_12( ICSSNode __p) throws java.lang.Exception
	{
		return reducer.reduceSelector(__p);
	}

	/* selectorGroup = SELECTOR_GROUP(selector*) */
	
	private InstructionListAndClosure action_13( ICSSNode __p) throws java.lang.Exception
	{
		java.util.Vector<InstructionListAndString> selectors = (java.util.Vector<InstructionListAndString>)__reducedValues.pop();
		return reducer.reduceSelectorGroup(__p,selectors);
	}
	
	private void dispatchAction( JBurgAnnotation ___node, int iRule) throws java.lang.Exception
	{
		ICSSNode __p = ___node.getNode();

		switch( iRule )
		{
			case 1:
			{
				__reducedValues.push(this.action_1(__p));
				break;
			}
			case 2:
			{
				__reducedValues.push(this.action_2(__p));
				break;
			}
			case 3:
			{
				__reducedValues.push(this.action_3(__p));
				break;
			}
			case 4:
			{
				__reducedValues.push(this.action_4(__p));
				break;
			}
			case 5:
			{
				__reducedValues.push(this.action_5(__p));
				break;
			}
			case 6:
			{
				__reducedValues.push(this.action_6(__p));
				break;
			}
			case 7:
			{
				__reducedValues.push(this.action_7(__p));
				break;
			}
			case 8:
			{
				__reducedValues.push(this.action_8(__p));
				break;
			}
			case 9:
			{
				__reducedValues.push(this.action_9(__p));
				break;
			}
			case 10:
			{
				__reducedValues.push(this.action_10(__p));
				break;
			}
			case 11:
			{
				__reducedValues.push(this.action_11(__p));
				break;
			}
			case 12:
			{
				__reducedValues.push(this.action_12(__p));
				break;
			}
			case 13:
			{
				__reducedValues.push(this.action_13(__p));
				break;
			}
			default:
			{
				throw new IllegalStateException("Unmatched reduce action " + iRule);
			}
		}
	}

	class JBurgAnnotation_DOCUMENT_3 extends JBurgSpecializedAnnotation
	{
		private JBurgAnnotation subtree0;
		private JBurgAnnotation subtree1;
		private JBurgAnnotation subtree2;
		JBurgAnnotation_DOCUMENT_3(ICSSNode node)
		{
			super(node);
		}
		private int cachedCostFor_document = -1;
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __document_NT:
				{
					if ( cachedCostFor_document == -1 )
					{
						cachedCostFor_document = getCostForRule_2e8f4fb3(goalState);

					}
					return(cachedCostFor_document);
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __document_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = getCostForRule_2e8f4fb3(goalState);

					if ( ( bestCost > currentCost )  )
					{
						rule = 1;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(3);
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				case 0:
					return subtree0;
				case 1:
					return subtree1;
				case 2:
					return subtree2;
				default:
				{
					throw new IllegalStateException("Invalid index " + index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
			if ( subtree0 == null )
				subtree0 = child;
			else if ( subtree1 == null )
				subtree1 = child;
			else if ( subtree2 == null )
				subtree2 = child;
			else
				throw new IllegalStateException("too many children");
		}
		
		private int getCostForRule_2e8f4fb3( int goalState)
		{

			return(normalizeCost((long)1 + (long) ( (((long)this.getNthChild(2).getCost(__ruleList_NT)) + ((long)this.getNthChild(1).getCost(__fontFaceList_NT)))  + ((long)this.getNthChild(0).getCost(__namespaceList_NT))) ));
		}
	}

	class JBurgAnnotation_FONT_FACE_0 extends JBurgSpecializedAnnotation
	{
		JBurgAnnotation_FONT_FACE_0(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __fontFace_NT:
				{
					return(1);
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __fontFace_NT:
				{
					return(2);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(0);
		}
	}

	class JBurgAnnotation_FONT_FACE_LIST_0_n extends JBurgSpecializedAnnotation
	{
		private java.util.Vector<JBurgAnnotation> narySubtrees = new java.util.Vector<JBurgAnnotation>();
		JBurgAnnotation_FONT_FACE_LIST_0_n(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __fontFaceList_NT:
				{
					return(normalizeCost((long)1 + (long)((long)getNaryCost(this, __fontFace_NT, 0))));
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __fontFaceList_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = normalizeCost((long)1 + (long)((long)getNaryCost(this, __fontFace_NT, 0)));

					if ( ( bestCost > currentCost )  )
					{
						rule = 3;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(narySubtrees.size());
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				default:
				{
					return narySubtrees.get(index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
				narySubtrees.add(child);
		}
	}

	class JBurgAnnotation_MEDIA_QUERY_0_n extends JBurgSpecializedAnnotation
	{
		private java.util.Vector<JBurgAnnotation> narySubtrees = new java.util.Vector<JBurgAnnotation>();
		JBurgAnnotation_MEDIA_QUERY_0_n(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __mediaQuery_NT:
				{
					return(normalizeCost((long)1 + (long)((long)getNaryCost(this, __mediaQueryCondition_NT, 0))));
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __mediaQuery_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = normalizeCost((long)1 + (long)((long)getNaryCost(this, __mediaQueryCondition_NT, 0)));

					if ( ( bestCost > currentCost )  )
					{
						rule = 4;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(narySubtrees.size());
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				default:
				{
					return narySubtrees.get(index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
				narySubtrees.add(child);
		}
	}

	class JBurgAnnotation_MEDIA_QUERY_CONDITION_0 extends JBurgSpecializedAnnotation
	{
		JBurgAnnotation_MEDIA_QUERY_CONDITION_0(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __mediaQueryCondition_NT:
				{
					return(1);
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __mediaQueryCondition_NT:
				{
					return(5);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(0);
		}
	}

	class JBurgAnnotation_NAMESPACE_DEFINITION_0 extends JBurgSpecializedAnnotation
	{
		JBurgAnnotation_NAMESPACE_DEFINITION_0(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __namespaceDefinition_NT:
				{
					return(1);
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __namespaceDefinition_NT:
				{
					return(6);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(0);
		}
	}

	class JBurgAnnotation_NAMESPACE_LIST_0_n extends JBurgSpecializedAnnotation
	{
		private java.util.Vector<JBurgAnnotation> narySubtrees = new java.util.Vector<JBurgAnnotation>();
		JBurgAnnotation_NAMESPACE_LIST_0_n(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __namespaceList_NT:
				{
					return(normalizeCost((long)1 + (long)((long)getNaryCost(this, __namespaceDefinition_NT, 0))));
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __namespaceList_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = normalizeCost((long)1 + (long)((long)getNaryCost(this, __namespaceDefinition_NT, 0)));

					if ( ( bestCost > currentCost )  )
					{
						rule = 7;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(narySubtrees.size());
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				default:
				{
					return narySubtrees.get(index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
				narySubtrees.add(child);
		}
	}

	class JBurgAnnotation_PROPERTY_0 extends JBurgSpecializedAnnotation
	{
		JBurgAnnotation_PROPERTY_0(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __property_NT:
				{
					return(1);
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __property_NT:
				{
					return(8);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(0);
		}
	}

	class JBurgAnnotation_PROPERTY_LIST_0_n extends JBurgSpecializedAnnotation
	{
		private java.util.Vector<JBurgAnnotation> narySubtrees = new java.util.Vector<JBurgAnnotation>();
		JBurgAnnotation_PROPERTY_LIST_0_n(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __propertyList_NT:
				{
					return(normalizeCost((long)1 + (long)((long)getNaryCost(this, __property_NT, 0))));
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __propertyList_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = normalizeCost((long)1 + (long)((long)getNaryCost(this, __property_NT, 0)));

					if ( ( bestCost > currentCost )  )
					{
						rule = 9;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(narySubtrees.size());
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				default:
				{
					return narySubtrees.get(index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
				narySubtrees.add(child);
		}
	}

	class JBurgAnnotation_RULE_3 extends JBurgSpecializedAnnotation
	{
		private JBurgAnnotation subtree0;
		private JBurgAnnotation subtree1;
		private JBurgAnnotation subtree2;
		JBurgAnnotation_RULE_3(ICSSNode node)
		{
			super(node);
		}
		private int cachedCostFor_rule = -1;
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __rule_NT:
				{
					if ( cachedCostFor_rule == -1 )
					{
						cachedCostFor_rule = getCostForRule_2d8aaa1e(goalState);

					}
					return(cachedCostFor_rule);
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __rule_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = getCostForRule_2d8aaa1e(goalState);

					if ( ( bestCost > currentCost )  )
					{
						rule = 10;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(3);
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				case 0:
					return subtree0;
				case 1:
					return subtree1;
				case 2:
					return subtree2;
				default:
				{
					throw new IllegalStateException("Invalid index " + index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
			if ( subtree0 == null )
				subtree0 = child;
			else if ( subtree1 == null )
				subtree1 = child;
			else if ( subtree2 == null )
				subtree2 = child;
			else
				throw new IllegalStateException("too many children");
		}
		
		private int getCostForRule_2d8aaa1e( int goalState)
		{

			return(normalizeCost((long)1 + (long) ( (((long)this.getNthChild(2).getCost(__propertyList_NT)) + ((long)this.getNthChild(1).getCost(__mediaQuery_NT)))  + ((long)this.getNthChild(0).getCost(__selectorGroup_NT))) ));
		}
	}

	class JBurgAnnotation_RULE_LIST_0_n extends JBurgSpecializedAnnotation
	{
		private java.util.Vector<JBurgAnnotation> narySubtrees = new java.util.Vector<JBurgAnnotation>();
		JBurgAnnotation_RULE_LIST_0_n(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __ruleList_NT:
				{
					return(normalizeCost((long)1 + (long)((long)getNaryCost(this, __rule_NT, 0))));
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __ruleList_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = normalizeCost((long)1 + (long)((long)getNaryCost(this, __rule_NT, 0)));

					if ( ( bestCost > currentCost )  )
					{
						rule = 11;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(narySubtrees.size());
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				default:
				{
					return narySubtrees.get(index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
				narySubtrees.add(child);
		}
	}

	class JBurgAnnotation_SELECTOR_0 extends JBurgSpecializedAnnotation
	{
		JBurgAnnotation_SELECTOR_0(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __selector_NT:
				{
					return(1);
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __selector_NT:
				{
					return(12);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(0);
		}
	}

	class JBurgAnnotation_SELECTOR_GROUP_0_n extends JBurgSpecializedAnnotation
	{
		private java.util.Vector<JBurgAnnotation> narySubtrees = new java.util.Vector<JBurgAnnotation>();
		JBurgAnnotation_SELECTOR_GROUP_0_n(ICSSNode node)
		{
			super(node);
		}
		
		public int getCost( int goalState)
		{
			switch( goalState )
			{
				case __selectorGroup_NT:
				{
					return(normalizeCost((long)1 + (long)((long)getNaryCost(this, __selector_NT, 0))));
				}
			}
			return(Integer.MAX_VALUE);
		}
		
		public int getRule( int goalState)
		{
			switch( goalState )
			{
				case __selectorGroup_NT:
				{
					int rule = -1;

					int bestCost = Integer.MAX_VALUE;

					int currentCost = normalizeCost((long)1 + (long)((long)getNaryCost(this, __selector_NT, 0)));

					if ( ( bestCost > currentCost )  )
					{
						rule = 13;
					}
					return(rule);
				}
			}
			return(-1);
		}
		
		public int getArity( )
		{
			return(narySubtrees.size());
		}
		
		public JBurgAnnotation getNthChild( int index)
		{
			switch( index )
			{
				default:
				{
					return narySubtrees.get(index);
				}
			}
		}
		
		public void addChild( JBurgAnnotation child)
		{
				narySubtrees.add(child);
		}
	}
	
	public JBurgAnnotation getJBurgAnnotation( ICSSNode node)
	{
		switch( node.getOperator() )
		{
			case DOCUMENT:
			{
				if ( node.getArity() == 3 )
					return(new JBurgAnnotation_DOCUMENT_3(node));
				break;
			}
			case FONT_FACE:
			{
				if ( node.getArity() == 0 )
					return(new JBurgAnnotation_FONT_FACE_0(node));
				break;
			}
			case FONT_FACE_LIST:
			{
				if ( node.getArity() >= 0 )
					return(new JBurgAnnotation_FONT_FACE_LIST_0_n(node));
				break;
			}
			case MEDIA_QUERY:
			{
				if ( node.getArity() >= 0 )
					return(new JBurgAnnotation_MEDIA_QUERY_0_n(node));
				break;
			}
			case MEDIA_QUERY_CONDITION:
			{
				if ( node.getArity() == 0 )
					return(new JBurgAnnotation_MEDIA_QUERY_CONDITION_0(node));
				break;
			}
			case NAMESPACE_DEFINITION:
			{
				if ( node.getArity() == 0 )
					return(new JBurgAnnotation_NAMESPACE_DEFINITION_0(node));
				break;
			}
			case NAMESPACE_LIST:
			{
				if ( node.getArity() >= 0 )
					return(new JBurgAnnotation_NAMESPACE_LIST_0_n(node));
				break;
			}
			case PROPERTY:
			{
				if ( node.getArity() == 0 )
					return(new JBurgAnnotation_PROPERTY_0(node));
				break;
			}
			case PROPERTY_LIST:
			{
				if ( node.getArity() >= 0 )
					return(new JBurgAnnotation_PROPERTY_LIST_0_n(node));
				break;
			}
			case RULE:
			{
				if ( node.getArity() == 3 )
					return(new JBurgAnnotation_RULE_3(node));
				break;
			}
			case RULE_LIST:
			{
				if ( node.getArity() >= 0 )
					return(new JBurgAnnotation_RULE_LIST_0_n(node));
				break;
			}
			case SELECTOR:
			{
				if ( node.getArity() == 0 )
					return(new JBurgAnnotation_SELECTOR_0(node));
				break;
			}
			case SELECTOR_GROUP:
			{
				if ( node.getArity() >= 0 )
					return(new JBurgAnnotation_SELECTOR_GROUP_0_n(node));
				break;
			}
		}
		return new JBurgAnnotationGeneral(node, nStates+1);
	}
	
	public void reduce( JBurgAnnotation p, int goalState) throws java.lang.Exception
	{
		reduceAntecedent(p,goalState);
		/* Release the annotation's data. */
		p.release();
	}
	
	public void reduceAntecedent( JBurgAnnotation p, int goalState) throws java.lang.Exception
	{int iRule = -1;
		if ( ( goalState > 0 )  )
		{iRule = p.getRule(goalState);
		}
		else
		{
			/* Find the minimum-cost path. */int minCost = Integer.MAX_VALUE;int i;for( i = 0;i <= nStates;i++ )
			{
				if ( ( minCost > p.getCost(i) )  )
				{iRule = p.getRule(i);minCost = p.getCost(i);goalState = i;
				}
			}
		}
		if ( ( iRule > 0 )  )
		{
			reduceSubgoals(p, iRule);
			dispatchAction(p, iRule );
		}
		else
		{
			throw new IllegalStateException ( "Unable to find a rule to process \"" + p.toString() + "\", operator="+ String.valueOf(p.getOperator()) + ", goal=" + String.valueOf(goalState) );
		}
	}
	
	private void reduceSubgoals( JBurgAnnotation p, int rule_num) throws java.lang.Exception
	{
		if ( ___subgoals_by_rule[rule_num] != null )
		{
			for ( JBurgSubgoal sg : ___subgoals_by_rule[rule_num] )
			{
				if ( !sg.isNary() )
				{
					reduce ( sg.getNode(p), sg.getGoalState());
				}
				else
				{
					/* Aggregate the operands of an n-ary operator into a single container. */
					JBurgAnnotation sub_parent = sg.getNode(p);
					java.util.Vector<Object> variadic_result = new java.util.Vector<Object>(sub_parent.getArity() - sg.startIndex);
					for ( int j = sg.startIndex; j < sub_parent.getArity(); j++ )
					{
						reduce(sub_parent.getNthChild(j), sg.getGoalState());
						variadic_result.add(__reducedValues.pop());
					}
					__reducedValues.push(variadic_result);
				}
			}
		}
	}
	
	private int getNaryCost( JBurgAnnotation node, int goalState, int start_index)
	{
		int accumCost = 0;
		for ( int i = start_index; i < node.getArity() && accumCost != Integer.MAX_VALUE; i++ )
		{
			int subCost = node.getNthChild(i).getCost(goalState);
			if ( subCost != Integer.MAX_VALUE )
				accumCost += subCost;
			else
				accumCost = Integer.MAX_VALUE;
		}
		return accumCost;
	}
	
	public void burm( ICSSNode root) throws java.lang.Exception
	{
		/* Use the least-cost goal state available. */
		burm(root, 0);
	}
	
	public void burm( ICSSNode root, int goal_state) throws java.lang.Exception
	{
		JBurgAnnotation annotatedTree = label(root);
		try
		{
			reduce ( annotatedTree, goal_state);
		}
		catch ( Exception cant_reduce )
		{
			this.__problemTree = annotatedTree;
			throw cant_reduce;
		}
	}
	private JBurgAnnotation __problemTree;
	
	public void dump( java.io.PrintWriter debug_output)
	{if ( null == __problemTree )
		{debug_output.println("<bailed reason=\"no problem tree\"/>");
			return;
		}debug_output.println("<jburg><label>");
		describeNode(__problemTree, debug_output);debug_output.println("</label></jburg>");
	}

void describeNode ( JBurgAnnotation node, java.io.PrintWriter debugOutput ) 
{
	if ( node == null ) return;
	String self_description;
	try {
		self_description = java.net.URLEncoder.encode(node.getNode().toString(),"UTF-8");
	} catch ( Exception cant_encode ) {self_description = node.getNode().toString();
	}
	debugOutput.print ( "<node operator=\"" + node.getNode().getOperator() + "\" selfDescription=\"" + self_description + "\">");

	for (int i = 0; i <= nStates ; i++ )
	{
		if ( node.getRule(i) != 0 )
		{
			debugOutput.print ( "<goal");
			debugOutput.print ( " name=\"" + stateName[i] + "\"");
			debugOutput.print ( " rule=\"" + node.getRule(i) + "\"");
			debugOutput.print ( " cost=\"" + node.getCost(i) + "\"");
			debugOutput.println ( "/>" );
		}
	}
	for (int i = 0; i < node.getArity(); i++ )
		describeNode ( node.getNthChild(i), debugOutput );
	debugOutput.println ( "</node>" );
}

	static final String[] stateName = new String[] { "" , "selector", "namespaceDefinition", "selectorGroup", "fontFace", "property", "propertyList", "ruleList", "fontFaceList", "document", "namespaceList", "mediaQueryCondition", "rule", "mediaQuery"};

	
	public Object getResult( )
	{
		return __reducedValues.pop();
	}
	/* @return the input cost, limited to Integer.MAX_VALUE to avoid overflow. */
	
	public int normalizeCost( long c)
	{
		return(c < Integer.MAX_VALUE? (int) c: Integer.MAX_VALUE);
	}

	/** JBurgAnnotation is a data structure internal to the
	 *  JBurg-generated BURM that annotates a JBurgNode with
	 *  information used for dynamic programming and reduction.
	 */
	abstract class JBurgAnnotation
	{
		/**  The INode we're annotating.  */
		ICSSNode m_node; 
		JBurgAnnotation ( ICSSNode newNode)
		{
			m_node = newNode;
		}
		/** @return this node's operator. */
		public CSSModelTreeType getOperator() 
		{
			return m_node.getOperator(); 
		}
		/** @return this node's wrappedICSSNode. */ 
		public ICSSNode getNode()  
		{
			return m_node; 
		}
		/** @return the nth child of this node.  */
		public abstract JBurgAnnotation getNthChild(int idx);
		/** @return this node's child count.  */
		public abstract int getArity();
		/** Add a new child to this node.  */
		public abstract void addChild(JBurgAnnotation new_child);
		/** Release this node's data.  */
		public abstract void release();
		/** @return the wrapped node's toString().  */
		public String toString() 
		{
			return m_node.toString(); 
		}
		/** @return the current best cost to reach a goal state.  */
		public abstract int getCost( int goalState ) ;
		 /** Set the cost/rule configuration of a goal state.
		 * @throws IllegalArgumentException if this node has a fixed cost/rule.*/
		 public abstract void reset ( int goalState, int cost, int rule );
		/** * @return the rule to fire for a specific goal state. */
		public abstract int getRule ( int goalState ) ;
		/**
		 *  A closure's transformation rule succeeded.
		 *  If this path is selected for reduction, then all the actions  must be run in sequence, beginning with the original;
		 *  so the order of the rules matters.  We disallow transformation rules with  cycles (a node should never 
		 *  transition back to a goal state that has already been reduced).*/
		public abstract void recordAntecedent ( int iGoalState, int newAntecedentState );
	
	}

	abstract class JBurgSpecializedAnnotation extends JBurgAnnotation
	{
		JBurgSpecializedAnnotation(ICSSNode node)
		{
			super(node);
		}
		public JBurgAnnotation getNthChild(int idx)
		{
			throw new IllegalStateException(this.getClass().getName() + " has no children.");
		}
		public void addChild(JBurgAnnotation new_child)
		{
			throw new IllegalStateException(this.getClass().getName() + " cannot have children.");
		}
		public void reset ( int goalState, int cost, int rule )
		{
			throw new IllegalStateException(this.getClass().getName() + " cannot be reset.");
		}
		public void release ()
		{
		}
		public void recordAntecedent ( int iGoalState, int newAntecedentState )
		{
			throw new IllegalStateException(this.getClass().getName() + " cannot record antecedents.");
		}
	}

	class ErrorAnnotation extends JBurgSpecializedAnnotation
	{
		ErrorAnnotation()
		{
			super(null);
		}
		public int getRule(int state) { return -1; }
		public int getCost(int state) { return Integer.MAX_VALUE; }
		public int getArity() { return 0; }
	}
	final JBurgAnnotation errorAnnotation = new ErrorAnnotation();

	/**  JBurgAnnotation implementation used for general-purpose computation. */
	class JBurgAnnotationGeneral extends JBurgAnnotation
	{
		/** cost/rule matrices used during dynamic programming to compute
		 *  the most economical rules that can reduce  the input node.
		 */
		private int cost[];
		private int rule[];
		/**  Transformation rules may have antecedents: other states whose
		 *  output the transformation rule is intended to transform.
		 *  All such antecedent states must be executed in sequence when the rule is reduced.
		 */
		private int[] antecedentState = null;
		/** *  This node's children (may be empty).  */
		private java.util.Vector<JBurgAnnotation> m_children = null;
		JBurgAnnotationGeneral ( ICSSNode newNode, int nRules) 
		{
			super(newNode);
			rule   = new int[nRules];
			cost   = new int[nRules];
			//  Initial cost of all rules is "infinite"
			java.util.Arrays.fill ( cost, Integer.MAX_VALUE);
			//  Initial rule for every goal is zero -- the JVM has zero-filled the rules array.
		}
		/** @return this node's operator. */
		public CSSModelTreeType getOperator() 
		{
			return m_node.getOperator(); 
		}
		/** @return this node's wrappedICSSNode. */ 
		public ICSSNode getNode()  
		{
			return m_node; 
		}
		/** @return the nth child of this node.  */
		public JBurgAnnotation getNthChild(int idx)
		{
			if ( m_children != null && m_children.size() > idx)
			{
				return (JBurgAnnotation) m_children.elementAt(idx);
			}
			else
			{
				throw new IllegalArgumentException( String.format("Index %d out of range opcode %s:", idx, this.getOperator() ));
			}
		}
		/** @return this node's child count.  */
		public int getArity()
		{
			return m_children != null? m_children.size():0;
		}
		/** Add a new child to this node.  */
		public void addChild(JBurgAnnotation new_child)
		{
			if (m_children == null)
			m_children = new java.util.Vector<JBurgAnnotation>();
			if (new_child != null)
			m_children.add(new_child);
		}
		/** Release this node's data.  */
		public void release()
		{
			m_children = null;
			cost = null;
			rule = null;
		}
		/** @return the wrapped node's toString().  */
		public String toString() 
		{
			return m_node.toString(); 
		}
		/** @return the current best cost to reach a goal state.  */
		public int getCost( int goalState ) 
		{
			return cost[goalState]; 
		}
		 /** Set the cost/rule configuration of a goal state.
		 * @throws IllegalArgumentException if this node has a fixed cost/rule.*/
		 public void reset ( int goalState, int cost, int rule )
		{
			this.cost[goalState] = cost;
			this.rule[goalState] = rule;
			//  We have a brand new rule, therefore it has no antecedents.
			if ( this.antecedentState != null )this.antecedentState[goalState] = 0;
		}
		/** * @return the rule to fire for a specific goal state. */
		public int getRule ( int goalState ) 
		{
			return rule[goalState]; 
		}
		/**
		 *  A closure's transformation rule succeeded.
		 *  If this path is selected for reduction, then all the actions  must be run in sequence, beginning with the original;
		 *  so the order of the rules matters.  We disallow transformation rules with  cycles (a node should never 
		 *  transition back to a goal state that has already been reduced).*/
		public void recordAntecedent ( int iGoalState, int newAntecedentState )
		{
			int antecedentRule = rule[newAntecedentState];
			//  Sanity-check: we shouldn't be asked to record an antecedent state that hasn't been labelled.
			if ( antecedentRule == 0 )
			throw new IllegalStateException ( "Attempting to record an unlabelled antecedent state." );
			if ( antecedentRule == 1 )
			{
				//  Rule 1 is the simple transformation rule; it doesn't run,  but if it has antecedents, then they must run.
				if ( antecedentState != null )
				antecedentState[iGoalState] = antecedentState[newAntecedentState];
			}
			else
			{
				if ( antecedentState == null )
				antecedentState = new int[rule.length];
				antecedentState[iGoalState] = newAntecedentState;
			}
		}
	
	}
	
	static class JBurgSubgoal
	{
		private int goalState;
		private boolean isNary;
		private int startIndex;
		private int[] accessPath;
		
		public JBurgSubgoal( int goal_state, boolean is_nary, int start_index, int... access_path)
		{
			this.goalState = goal_state;
			this.isNary = is_nary;
			this.startIndex = start_index;
			this.accessPath = access_path;
		}
		public int getGoalState() { return this.goalState; }
		public boolean isNary() { return this.isNary; }
		public JBurgAnnotation getNode(JBurgAnnotation root)
		{
			JBurgAnnotation result = root;
			for ( int idx: this.accessPath )
				result = result.getNthChild(idx);
			return result;
		}
	
	}

}
