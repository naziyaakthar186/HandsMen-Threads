
trigger LoyaltyStatusUpdate on HandsMen_Customer__c (before insert, before update) {
    for (HandsMen_Customer__c cust : Trigger.new) {
        if (cust.Total_Purchases__c != null) {
            if (cust.Total_Purchases__c > 1000) {
                cust.Loyalty_Status__c = 'Gold';
            } else if (cust.Total_Purchases__c < 500) {
                cust.Loyalty_Status__c = 'Bronze';
            } else {
                cust.Loyalty_Status__c = 'Silver';
            }
        }
    }
}
