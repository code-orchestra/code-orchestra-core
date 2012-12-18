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

import java.util.Iterator;
import java.util.NoSuchElementException;

/**
 * @author fyodor
 */
public abstract class YieldingIterator<T> implements Iterator<T> {

    private T yielded;

    private State state = State.UNKNOWN;

    private DelayedException delayedEx;

    public boolean hasNext() {
        if (state == State.UNKNOWN) {
        	try {
        		this.state = (this.moveToNext() ? State.HAS_NEXT : State.AT_END);
        	}
        	catch (DelayedException ex) {
        		this.state = State.AT_END;
        		throw ex;
        	}
        }
        if (delayedEx != null) {
            DelayedException tmp = this.delayedEx;
            this.delayedEx = null;
            throw tmp;
        }
        return state == State.HAS_NEXT;
    }

    public T next() {
    	switch (state) {
		case AT_END:
			throw new NoSuchElementException();
			
		case UNKNOWN:
			try {
				if (!this.moveToNext()) {
					this.state = State.AT_END;
					throw new NoSuchElementException();
				}
			}
			catch (DelayedException ex) {
				this.delayedEx = ex;
				this.state = State.AT_END;
				throw new NoSuchElementException ();
			}
			// fall through
			
		case HAS_NEXT:
			T res = this.yielded;
			this.yielded = null;
			this.state = State.UNKNOWN;
			return res;
			
		default:
			throw new IllegalStateException ();
		}
    }

    public void remove() {
        throw new UnsupportedOperationException();
    }

    protected abstract boolean moveToNext();

    protected void yield(T t) {
        this.yielded = t;
    }
    
    private enum State {
    	HAS_NEXT,
    	AT_END,
    	UNKNOWN;
    }
}
