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
package postingrules;

import junit.framework.TestCase;
import mf.MfDate;
import mf.Money;
import mf.Unit;

public class PostingRuleTester extends TestCase {
    private SharedFixture myFixture;
    public PostingRuleTester(String name) {
        super(name);
    }
    protected void setUp() throws Exception {
        MfDate.setToday(2001,1,1);
        myFixture = new SharedFixture();
    }

    public void testEntryAccountTypeMatchesAccountTypeLookupOnCustomer() {
        for (Entry e : myFixture.getWatson().accountFor(AccountType.BASE_USAGE).entries())
            assertEquals(AccountType.BASE_USAGE, e.getAccount().type());
    }
    public void testBalancesFromASingleUsageEvent() {
        assertEquals(Money.dollars(500), myFixture.getWatson().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(0), myFixture.getWatson().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(27.5), myFixture.getWatson().balanceFor(AccountType.TAX));
    }
    public void testServiceCallAfterChangeOfRuleUsesLaterRule() {
        myFixture.getWatson().clearEntries();
        AccountingEvent evt = new MonetaryEvent(Money.dollars(40),
                EventType.SERVICE_CALL,
                new MfDate(1999, 12, 1),
                new MfDate(1999, 12, 1),
                myFixture.getWatson());
        myFixture.getEventList().add(evt);
        myFixture.getEventList().process();
        assertEquals(Money.dollars(35), myFixture.getWatson().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(0), myFixture.getWatson().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(1.93), myFixture.getWatson().balanceFor(AccountType.TAX));
    }
    public void testServiceCallBeforeChangeOfRuleUsesEarlierRule() {
        myFixture.getWatson().clearEntries();
        AccountingEvent evt = new MonetaryEvent(Money.dollars(40),
                EventType.SERVICE_CALL,
                new MfDate(1999, 11, 30),
                new MfDate(1999, 11, 30),
                myFixture.getWatson());
        myFixture.getEventList().add(evt);
        myFixture.getEventList().process();
        assertEquals(Money.dollars(30), myFixture.getWatson().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(0), myFixture.getWatson().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(1.65), myFixture.getWatson().balanceFor(AccountType.TAX));
    }

    public void testLowPayUsageCharge() {
        Usage evt = new Usage(Unit.KWH.amount(50),
                new MfDate(1999, 10, 1),
                new MfDate(1999, 10, 1),
                myFixture.getReggie());
        myFixture.getEventList().add(evt);
        myFixture.getEventList().process();
        assertEquals(Money.dollars(250), myFixture.getReggie().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(0), myFixture.getReggie().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(13.75), myFixture.getReggie().balanceFor(AccountType.TAX));
        Usage evt2 = new Usage(Unit.KWH.amount(51),
                new MfDate(1999, 11, 1),
                new MfDate(1999, 11, 1),
                myFixture.getReggie());
        evt2.process();
        assertEquals(Money.dollars(760), myFixture.getReggie().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(0), myFixture.getReggie().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(41.8), myFixture.getReggie().balanceFor(AccountType.TAX));
    }
    public void testTaxesOnLowPay() {
        Usage evt = new Usage(Unit.KWH.amount(50),
                new MfDate(1999, 10, 1),
                new MfDate(1999, 10, 1),
                myFixture.getReggie());
        myFixture.getEventList().add(evt);
        myFixture.getEventList().process();
        assertEquals(Money.dollars(250), myFixture.getReggie().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(0), myFixture.getReggie().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(13.75), myFixture.getReggie().balanceFor(AccountType.TAX));
    }
    public void testIfThereIsNoPostingRuleForTypeThenRaiseException() {
        AccountingEvent evt = new MonetaryEvent(Money.dollars(40),
                new EventType("none"),
                new MfDate(1999, 10, 5),
                new MfDate(1999, 10, 5),
                myFixture.getWatson());
        myFixture.getEventList().add(evt);
        try {
            myFixture.getEventList().process();
        } catch (RuntimeException expected){}
        assertTrue(myFixture.getEventList().hasProcessingErrors());
    }
    public void testIfThereIsNoPostingRuleForDateThenRaiseException() {
        AccountingEvent evt = new MonetaryEvent(Money.dollars(40),
                EventType.SERVICE_CALL,
                new MfDate(1999, 1, 5),
                new MfDate(1999, 1, 5),
                myFixture.getWatson());
        myFixture.getEventList().add(evt);
        try {
            myFixture.getEventList().process();
        } catch (RuntimeException expected){}
        assertTrue(myFixture.getEventList().hasProcessingErrors());
   }
    public void testGetAllDirectEntriesFromAnEvent() {
        assertEquals(Money.dollars(500), Entry.total(myFixture.getUsageEvent().getResultingEntries()));
    }
    public void testGetDirectAndSecondaryEntriesFromAnEvent() {
        assertEquals(Money.dollars(527.5), Entry.total(myFixture.getUsageEvent().getAllResultingEntries()));
    }
    public void testAddingEventAndProcessingTheQueueCausesEntries() {
        myFixture.getWatson().clearEntries();
        AccountingEvent evt = new MonetaryEvent(Money.dollars(40),
                EventType.SERVICE_CALL,
                new MfDate(1999, 10, 5), //occurred
                new MfDate(1999, 12, 5), //noticed
                myFixture.getWatson());
        myFixture.getEventList().add(evt);
        myFixture.getEventList().process();
        assertEquals(Money.dollars(30), myFixture.getWatson().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(0), myFixture.getWatson().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(1.65), myFixture.getWatson().balanceFor(AccountType.TAX));
    }
    public void testBalancesSumUpActivityFromEvent() {
        assertEquals(Money.dollars(500), myFixture.getWatson().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(27.5), myFixture.getWatson().balanceFor(AccountType.TAX));
        assertEquals(Money.dollars(0), myFixture.getWatson().balanceFor(AccountType.SERVICE));
    }
    public void testRateChangesEffectCharge() {
        myFixture.getWatson().clearEntries();
        AccountingEvent evt = new Usage(Unit.KWH.amount(50),
                     new MfDate(1999, 12, 15),
                     new MfDate(1999, 12, 20),
                     myFixture.getWatson());
        myFixture.getEventList().add(evt);
        myFixture.getEventList().process();
        assertEquals(Money.dollars(600), myFixture.getWatson().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(33), myFixture.getWatson().balanceFor(AccountType.TAX));
        assertEquals(Money.dollars(0), myFixture.getWatson().balanceFor(AccountType.SERVICE));

    }

    public void testCapChangeEffectsCharge() {
        Usage evt3 = new Usage(Unit.KWH.amount(60),
                new MfDate(1999, 12, 1),
                new MfDate(1999, 12, 1),
                myFixture.getReggie());
        evt3.process();
        assertEquals(Money.dollars(300), myFixture.getReggie().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(0), myFixture.getReggie().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(16.50), myFixture.getReggie().balanceFor(AccountType.TAX));
        myFixture.getReggie().clearEntries();
        Usage evt4 = new Usage(Unit.KWH.amount(61),
                new MfDate(1999, 12, 1),
                new MfDate(1999, 12, 1),
                myFixture.getReggie());
        evt4.process();
        assertEquals(Money.dollars(610), myFixture.getReggie().balanceFor(AccountType.BASE_USAGE));
        assertEquals(Money.dollars(0), myFixture.getReggie().balanceFor(AccountType.SERVICE));
        assertEquals(Money.dollars(33.55), myFixture.getReggie().balanceFor(AccountType.TAX));
    }
}
