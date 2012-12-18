package postingrules;

/*Generated by MPS */

import mf.Quantity;
import mf.MfDate;

public class Usage extends AccountingEvent {
  private Quantity myAmount;

  public Usage(Quantity amount, MfDate whenOccurred, MfDate whenNoticed, Customer customer) {
    super(EventType.USAGE, whenOccurred, whenNoticed, customer);
    this.myAmount = amount;
  }

  public Usage(Quantity amount, MfDate whenOccurred, MfDate whenNoticed, Subject subject, AccountingEvent adjustedEvent) {
    super(EventType.USAGE, whenOccurred, whenNoticed, subject, adjustedEvent);
    this.myAmount = amount;
  }

  public Quantity getAmount() {
    return myAmount;
  }

  public String toString() {
    return "Usage " + myAmount;
  }
}
