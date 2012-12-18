package jetbrains.mps.baseLanguage.dataFlow;

/*Generated by MPS */


public enum NullableState {
  NULLABLE(),
  NOTNULL(),
  UNKNOWN(),
  NOT_INIT(),
  NULL();

  NullableState() {
  }

  public NullableState merge(NullableState state) {
    if (this.equals(state)) {
      return this;
    }
    if (this.equals(NullableState.NOT_INIT)) {
      return state;
    }
    if (state.equals(NullableState.NOT_INIT)) {
      return this;
    }
    if (state.equals(NullableState.UNKNOWN) && this.equals(NullableState.NOTNULL)) {
      return NullableState.UNKNOWN;
    }
    if (state.equals(NullableState.NOTNULL) && this.equals(NullableState.UNKNOWN)) {
      return NullableState.UNKNOWN;
    }
    return NullableState.NULLABLE;
  }

  public static boolean canBeNull(NullableState state) {
    if (state == null) {
      return false;
    }
    return state.equals(NullableState.NULL) || state.equals(NullableState.NULLABLE);
  }
}
