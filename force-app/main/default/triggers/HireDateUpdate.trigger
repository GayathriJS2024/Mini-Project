trigger HireDateUpdate on Employee__c (before insert) {
for(Employee__c emp:Trigger.new)
{
Employee__c old=Trigger.oldMap.get(emp.Id);
System.debug('OLd records'+old);
if(old.Hire_date__c!=emp.Hire_date__c)
{
emp.addError('Hire date cant be modified');
}
}
}