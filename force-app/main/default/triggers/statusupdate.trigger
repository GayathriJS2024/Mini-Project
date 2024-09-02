trigger statusupdate on Project_order__c (before insert) {
for (Project_Order__c projectOrder : Trigger.new) {
        // Set Start_Date__c to today's date if not provided
        if (projectOrder.Start_Date__c == null) {
            projectOrder.Start_Date__c = Date.today();
        }
        
        // Set Status__c to 'Not Started' if not provided
        if (String.isBlank(projectOrder.Status__c)) {
            projectOrder.Status__c = 'Not Started';
        }
    }
}