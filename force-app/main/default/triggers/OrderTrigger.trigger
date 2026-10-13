trigger OrderTrigger on HandsMen_Order__c (
    before insert, before update
) {
    OrderTriggerHandler.validateOrderQuantity(Trigger.new);
}