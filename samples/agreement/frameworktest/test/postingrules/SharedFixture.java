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

import mf.MfDate;
import mf.Unit;

public class SharedFixture {
    public SharedFixture() {
        prepareEventList();
    }
    private EventList myEventList = new EventList();
    private Usage myUsageEvent;
    private Customer myWatson, myReggie;
    public void prepareEventList() {
        setupCustomers();
        myUsageEvent = new Usage(Unit.KWH.amount(50),
                     new MfDate(1999, 10, 1),
                     new MfDate(1999, 10, 15),
                myWatson);
        myEventList.add(myUsageEvent);
        myEventList.process();
    }

    private void setupCustomers() {
        myReggie = new Customer("Reginald Perrin");
        myWatson = new Customer("Dr Watson");
        AgreementRegistryBuilder agreementRegistryBuilder = new AgreementRegistryBuilder();

        AgreementRegistry registry = new AgreementRegistry();
        agreementRegistryBuilder.setUp(registry);
        myReggie.setServiceAgreement(registry.getAgreement("lowPay"));
        myWatson.setServiceAgreement(registry.getAgreement("regular"));
    }


    public EventList getEventList() {
        return myEventList;
    }
    public Usage getUsageEvent() {
        return myUsageEvent;
    }
    public Customer getWatson() {
        return myWatson;
    }
    public Customer getReggie() {
        return myReggie;
    }
}
