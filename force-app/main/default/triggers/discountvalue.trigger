trigger discountvalue on Project_order__c (before insert) {

    for (Project_order__c order : Trigger.new) {
        if (order.Order_Total__c >= 1000) {
            order.Discount__c = order.Order_Total__c * 0.10;
        } else if (order.Order_Total__c >= 500) {
            order.Discount__c = order.Order_Total__c * 0.05;
        } else {
            order.Discount__c = 0;
        }
    }
}