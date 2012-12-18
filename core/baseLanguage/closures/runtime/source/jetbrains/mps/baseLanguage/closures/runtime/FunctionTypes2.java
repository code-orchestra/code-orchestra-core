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

public class FunctionTypes2 {

	public interface _void { public void invoke (); }
	public interface _void_1 <P1> { public void invoke (P1 p1); }
	public interface _void_2 <P1,P2> { public void invoke (P1 p1,P2 p2); }

	public interface _void_0_1<E1 extends Throwable> { public void invoke () throws E1; }
	public interface _void_1_1<P1,E1 extends Throwable> { public void invoke (P1 p1) throws E1; }
	public interface _void_2_1<P1,P2,E1 extends Throwable> { public void invoke (P1 p1,P2 p2) throws E1; }

	public interface _void_0_2<E1 extends Throwable,E2 extends Throwable> { public void invoke () throws E1,E2; }
	public interface _void_1_2<P1,E1 extends Throwable,E2 extends Throwable> { public void invoke (P1 p1) throws E1,E2; }
	public interface _void_2_2<P1,P2,E1 extends Throwable,E2 extends Throwable> { public void invoke (P1 p1,P2 p2) throws E1,E2; }
	
	public interface _retval <R> { public R invoke (); }
	public interface _retval_1 <R,P1> { public R invoke (P1 p1); }
	public interface _retval_2 <R,P1,P2> { public R invoke (P1 p1,P2 p2); }

	public interface _retval_0_1 <R,E1 extends Throwable> { public R invoke () throws E1; }
	public interface _retval_1_1 <R,P1,E1 extends Throwable> { public R invoke (P1 p1) throws E1; }
	public interface _retval_2_1 <R,P1,P2,E1 extends Throwable> { public R invoke (P1 p1,P2 p2) throws E1; }

	public interface _retval_0_2 <R,E1 extends Throwable,E2 extends Throwable> { public R invoke () throws E1,E2; }
	public interface _retval_1_2 <R,P1,E1 extends Throwable,E2 extends Throwable> { public R invoke (P1 p1) throws E1,E2; }
	public interface _retval_2_2 <R,P1,P2,E1 extends Throwable,E2 extends Throwable> { public R invoke (P1 p1,P2 p2) throws E1,E2; }
	
	
}
