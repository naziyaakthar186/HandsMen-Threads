trigger StockDeduction on Inventory__c (before update) {
    for (Inventory__c inv : Trigger.new) {
        if (inv.Stock_Quantity__c != null &&
            inv.Stock_Quantity__c < 0) {
            inv.addError('Stock quantity cannot be negative.');
        }
    }
}