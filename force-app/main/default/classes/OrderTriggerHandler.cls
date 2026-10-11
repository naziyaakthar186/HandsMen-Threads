
public class OrderTriggerHandler {
    public static void validateOrderQuantity(List<HandsMen_Order__c> orderList) {
        for (HandsMen_Order__c ord : orderList) {
            if (ord.Status__c == 'Confirmed') {
                if (ord.Quantity__c == null || ord.Quantity__c <= 500) {
                    ord.addError('For Status Confirmed, Quantity must be more than 500.');
                }
            } else if (ord.Status__c == 'Pending') {
                if (ord.Quantity__c == null || ord.Quantity__c <= 200) {
                    ord.addError('For Status Pending, Quantity must be more than 200.');
                }
            } else if (ord.Status__c == 'Rejection') {
                if (ord.Quantity__c == null || ord.Quantity__c != 0) {
                    ord.addError('For Status Rejection, Quantity must be 0.');
                }
            }
        }
    }
}
