trigger UpdateOrderTotal on HandsMen_Order__c (before insert, before update) {
    Set<Id> productIds = new Set<Id>();

    for (HandsMen_Order__c ord : Trigger.new) {
        if (ord.HandsMen_Product__c != null) {
            productIds.add(ord.HandsMen_Product__c);
        }
    }

    Map<Id, HandsMen_Product__c> productMap =
        new Map<Id, HandsMen_Product__c>([
            SELECT Id, Price__c
            FROM HandsMen_Product__c
            WHERE Id IN :productIds
        ]);

    for (HandsMen_Order__c ord : Trigger.new) {
        if (ord.HandsMen_Product__c != null &&
            ord.Quantity__c != null &&
            productMap.containsKey(ord.HandsMen_Product__c)) {

            HandsMen_Product__c prod =
                productMap.get(ord.HandsMen_Product__c);

            if (prod.Price__c != null) {
                ord.Total_Amount__c = prod.Price__c * ord.Quantity__c;
            }
        }
    }
}