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
package jetbrains.mps.baseLanguage.closures.runtime;


public class Result<T,R> {

	private Outcome outcome;
	
	private String breakLabel;

	private R retVal;
	
	private T termVal;
	
	public static Result<Object, Object> RETURN_VOID = new Result<Object, Object>(Outcome.RETURN_VOID);

	public static Result<Object, Object> TERMINATE_VOID = new Result<Object, Object>(Outcome.TERMINATE_VOID);

	public static Result<Object, Object> BREAK = new Result<Object, Object>(Outcome.BREAK);

        public static Result<Object, Object> NONE = new Result<Object, Object>(Outcome.NONE);

        @SuppressWarnings("unchecked")
	public static <U, S> Result<U, S> RETURN (S val) {
		return (Result<U, S>) new Result<Object, S>(Outcome.RETURN_VALUE, null, val);
	}
	
	@SuppressWarnings("unchecked")
	public static <U, S> Result<U, S> TERMINATE (U val) {
		return (Result<U, S>) new Result<U, Object>(Outcome.TERMINATE_VALUE, val, null);
	}
	
	@SuppressWarnings("unchecked")
	public static <U> Result<U, Object> RETURN_VOID () {
		return (Result<U, Object>) RETURN_VOID;
	}

	@SuppressWarnings("unchecked")
	public static <S> Result<Object, S> TERMINATE_VOID () {
		return (Result<Object, S>) TERMINATE_VOID;
	}
	
	@SuppressWarnings("unchecked")
	public static <U,V> Result<U,V> BREAK () {
		return (Result<U,V>) BREAK;
	}

        @SuppressWarnings("unchecked")
        public static <U,V> Result<U,V> BREAK (String label) {
                return new Result <U,V> (label);
        }

        @SuppressWarnings("unchecked")
        public static <U,V> Result<U,V> NONE () {
                return (Result<U,V>) NONE;
        }

        public Outcome getOutcome() {
		return outcome;
	}

	public R returnObject () {
		return getRetVal();
	}
	
	public T terminateObject () {
		return getTermVal();
	}

	public boolean returnBoolean () {
		return ((Boolean) getRetVal()).booleanValue();
	}
	
	public boolean terminateBoolean () {
		return ((Boolean) getTermVal()).booleanValue();
	}

	public byte returnByte () {
		return ((Byte) getRetVal()).byteValue();
	}
	
	public byte terminateByte () {
		return ((Byte) getTermVal()).byteValue();
	}

	public char returnChar () {
		return ((Character) getRetVal()).charValue();
	}
	
	public char terminateChar () {
		return ((Character) getTermVal()).charValue();
	}

	public double returnDouble () {
		return ((Double) getRetVal()).doubleValue();
	}
	
	public double terminateDouble () {
		return ((Double) getTermVal()).doubleValue();
	}

	public float returnFloat () {
		return ((Float) getRetVal()).floatValue();
	}
	
	public float terminateFloat () {
		return ((Float) getTermVal()).floatValue();
	}

	public int returnInt () {
		return ((Integer) getRetVal()).intValue();
	}
	
	public int terminateInt () {
		return ((Integer) getTermVal()).intValue();
	}
	
	public long returnLong () {
		return ((Long) getRetVal()).longValue();
	}
	
	public long terminateLong () {
		return ((Long) getTermVal()).longValue();
	}

	public short returnShort () {
		return ((Short) getRetVal()).shortValue();
	}

	public short terminateShort () {
		return ((Short) getTermVal()).shortValue();
	}
	
	public String getBreakLabel () {
	    return breakLabel;
	}

	private Result(Outcome outcome, T termVal, R retVal) {
		this.outcome = outcome;
		this.termVal = termVal;
		this.retVal = retVal;
	}

	private Result(Outcome outcome) {
		this.outcome = outcome;
	}
        
	private Result(String label) {
            this.outcome = Outcome.BREAK;
            this.breakLabel = label;
        }
	
	private R getRetVal() {
		switch (outcome) {
		case RETURN_VALUE:
			return retVal;
		default:
			throw new IllegalStateException ();
		}
	}
	
	private T getTermVal() {
		switch (outcome) {
		case TERMINATE_VALUE:
			return termVal;
		default:
			throw new IllegalStateException ();
		}
	}
	
}
