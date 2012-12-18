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

/**
 * @author fyodor
 */
public class FunctionTypes {

    public static interface _void {

        void invoke();
    }

    public static interface _void_from_T<T> {

        void invoke(T t);
    }

    public static interface _void_from_S_and_T<S, T> {

        void invoke(S s, T t);
    }

    public static interface _void_from_Q_and_S_and_T<Q, S, T> {

        void invoke(Q q, S s, T t);
    }

    public static interface _void_from_P_and_Q_and_S_and_T<P, Q, S, T> {

        void invoke(P p, Q q, S s, T t);
    }

    public static interface _void_from_O_and_P_and_Q_and_S_and_T<O, P, Q, S, T> {

        void invoke(O o, P p, Q q, S s, T t);
    }

    public static interface _void_from_N_and_O_and_P_and_Q_and_S_and_T<N, O, P, Q, S, T> {

        void invoke(N n, O o, P p, Q q, S s, T t);
    }

    public static interface _void_from_M_and_N_and_O_and_P_and_Q_and_S_and_T<M, N, O, P, Q, S, T> {

        void invoke(M m, N n, O o, P p, Q q, S s, T t);
    }

    public static interface _void_from_L_and_M_and_N_and_O_and_P_and_Q_and_S_and_T<L, M, N, O, P, Q, S, T> {

        void invoke(L ell, M m, N n, O o, P p, Q q, S s, T t);
    }

    public static interface _void_from_K_and_L_and_M_and_N_and_O_and_P_and_Q_and_S_and_T<K, L, M, N, O, P, Q, S, T> {

        void invoke(K k, L ell, M m, N n, O o, P p, Q q, S s, T t);
    }

    public static interface _void_from_J_and_K_and_L_and_M_and_N_and_O_and_P_and_Q_and_S_and_T<J, K, L, M, N, O, P, Q, S, T> {

        void invoke(J j, K k, L ell, M m, N n, O o, P p, Q q, S s, T t);
    }

    public static interface _R<R> {

        R invoke();
    }

    public static interface _R_from_T<R, T> {

        R invoke(T t);
    }

    public static interface _R_from_T_throws<R, T> {

        R invoke(T t) throws Throwable;
    }

    public static interface _R_from_S_and_T<R, S, T> {

        R invoke(S s, T t);
    }

    public static interface _R_from_Q_and_S_and_T<R, Q, S, T> {

        R invoke(Q q, S s, T t);
    }

    public static interface _R_from_P_and_Q_and_S_and_T<R, P, Q, S, T> {

        R invoke(P p, Q q, S s, T t);
    }

    public static interface _R_from_O_and_P_and_Q_and_S_and_T<R, O, P, Q, S, T> {

        R invoke(O o, P p, Q q, S s, T t);
    }

    public static interface _R_from_N_and_O_and_P_and_Q_and_S_and_T<R, N, O, P, Q, S, T> {

        R invoke(N n, O o, P p, Q q, S s, T t);
    }

    public static interface _R_from_M_and_N_and_O_and_P_and_Q_and_S_and_T<R, M, N, O, P, Q, S, T> {

        R invoke(M m, N n, O o, P p, Q q, S s, T t);
    }

    public static interface _R_from_L_and_M_and_N_and_O_and_P_and_Q_and_S_and_T<R, L, M, N, O, P, Q, S, T> {

        R invoke(L ell, M m, N n, O o, P p, Q q, S s, T t);
    }

    public static interface _R_from_K_and_L_and_M_and_N_and_O_and_P_and_Q_and_S_and_T<R, K, L, M, N, O, P, Q, S, T> {

        R invoke(K k, L ell, M m, N n, O o, P p, Q q, S s, T t);
    }

    public static interface _R_from_J_and_K_and_L_and_M_and_N_and_O_and_P_and_Q_and_S_and_T<R, J, K, L, M, N, O, P, Q, S, T> {

        R invoke(J j, K k, L ell, M m, N n, O o, P p, Q q, S s, T t);
    }
}
