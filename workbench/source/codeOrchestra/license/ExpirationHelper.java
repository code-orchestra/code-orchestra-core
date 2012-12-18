package codeOrchestra.license;

/**
 * @author Alexander Eliseyev
 */
public final class ExpirationHelper {

  public static ExpirationStrategy getExpirationStrategy() {
    return expirationStrategy;
  }

  private static final ExpirationStrategy expirationStrategy = new CalendarUsageDayExpirationStrategyEx();

  public static int getDaysInUse() {
    return expirationStrategy.getDaysInUse();
  }

  public static int getExpirationPeriod() {
    return expirationStrategy.getExpirationPeriod();
  }

  public static int getDaysLeft() {
    if (hasExpired()) {
      throw new IllegalStateException("Expiration period is over");
    }
    return getExpirationPeriod() - getDaysInUse() + 1;
  }

  public static boolean hasExpired() {
    return getDaysInUse() > getExpirationPeriod();
  }

}
