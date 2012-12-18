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

import mf.Currency;
import mf.DateRange;
import mf.MfDate;
import mf.Money;

import java.util.ArrayList;
import java.util.List;

public class AccountTester extends junit.framework.TestCase {
    private Account myReceivables = new Account(Currency.USD);
    private Account myRevenue = new Account(Currency.USD);
    private Account myDeferred = new Account(Currency.USD);

    public AccountTester(String name) {
        super(name);
    }
    public void setUp() {
        MfDate.setToday(2001,1,1);
        myReceivables.addEntry(Money.dollars(500), new MfDate(1999, 12, 4));
        myReceivables.addEntry(Money.dollars(300), new MfDate(2000, 1, 4));
        myReceivables.addEntry(new Entry(Money.dollars(-400), new MfDate(2000, 2, 15)));
    }
    public void testNewAccountIsValid() {
        assertTrue(myReceivables.isValid());
    }
    public void testEntriesAreAddedCorrectly() { //condsider ditching this one
        List<Entry> entries = new ArrayList<Entry>();
        entries.add(new Entry(Money.dollars(500), MfDate.today()));
        entries.add(new Entry(Money.dollars(300), MfDate.today()));
        entries.add(new Entry(Money.dollars(-400), MfDate.today()));
        assertEquals(Money.dollars(400), Entry.total(entries));
    }
    public void testAddingOtherCurrencyCausesException() {
        try {
            myReceivables.addEntry(new Money(10, Currency.DEM), new MfDate(1999, 12, 4));
            fail();
        } catch (IllegalArgumentException correctReponse) {
        }
        assertEquals(Money.dollars(400), myReceivables.balance());
    }
    public void testBalanceOfEmptyAccountIsZero() {
        Account empty = new Account(Currency.USD);
        assertEquals(Money.dollars(0), empty.balance());
    }
    public void testBalanceIsSumOfEntries() {
        assertEquals(Money.dollars(400), myReceivables.balance());
        assertEquals(Money.dollars(800), myReceivables.balance(new MfDate(2000, 2, 1)));
        assertEquals(Money.dollars(-100), myReceivables.balance(new DateRange(new MfDate(2000, 1, 1), new MfDate(2000, 12, 31))));
    }
    public void testBalanceWorksUsingTransactions() {
        myReceivables = new Account(Currency.USD);
        myRevenue.withdraw(Money.dollars(500), myReceivables, new MfDate(1, 4, 99));
        myRevenue.withdraw(Money.dollars(200), myDeferred, new MfDate(1, 4, 99));
        assertEquals(Money.dollars(500), myReceivables.balance());
        assertEquals(Money.dollars(200), myDeferred.balance());
        assertEquals(Money.dollars(-700), myRevenue.balance());
    }
    public void testCopyMakesCopiesOfEntriesInNewAccount() {
        Account copy = myReceivables.copy();
        assertEquals(Money.dollars(400), copy.balance());
        copy.addEntry(Money.dollars(200), MfDate.today());
        assertEquals(Money.dollars(600), copy.balance());
        assertEquals(Money.dollars(400), myReceivables.balance());
        assertTrue(copy.isValid());

    }
    public void testDepositsSumsPositiveEntries() {
        assertEquals(Money.dollars(300), myReceivables.deposits(new DateRange(new MfDate(2000, 1, 1), new MfDate(2000, 12, 31))));
    }
    public void testBalanceSumsCorrectlyWithNonDollars() { //consider remove
        Account newAccount = new Account(Currency.DEM);
        newAccount.addEntry(new Money(10, Currency.DEM), MfDate.today());
        assertEquals(new Money(10, Currency.DEM), newAccount.balance());
        DateRange range = new DateRange(MfDate.today(), MfDate.today());
        assertEquals(new Money(10, Currency.DEM), newAccount.deposits(range));
        assertEquals(new Money(0, Currency.DEM), newAccount.withdrawels(range));
    }
    public void testWithdrawelsSumsNegativeEntries() {
        assertEquals(Money.dollars(-400), myReceivables.withdrawels(new DateRange(new MfDate(2000, 1, 1), new MfDate(2000, 12, 31))));
        assertEquals(Money.dollars(0), myReceivables.withdrawels(new DateRange(new MfDate(1999, 1, 1), new MfDate(1999, 12, 31))));
    }
}
