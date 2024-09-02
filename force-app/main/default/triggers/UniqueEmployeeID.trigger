trigger UniqueEmployeeID on Employee__c (before insert) {

    Set<String> existingNumbers = new Set<String>();

    // Query existing employee numbers to avoid duplicates
    for (Employee__c emp : [SELECT Employee_Number__c FROM Employee__c WHERE Employee_Number__c != null]) {
        existingNumbers.add(String.valueOf(emp.Employee_Number__c));
    }

    for (Employee__c emp : Trigger.new) {
        if (emp.Employee_Number__c == null) {
            String employeeNumber;
            Boolean isUnique = false;

            // Generate a unique employee number
            while (!isUnique) {
                // Generate a random 4-digit number
                Integer randomNumber = Math.round(Math.random() * 9999);
                String formattedNumber = String.valueOf(randomNumber).leftPad(4, '0');
                employeeNumber = 'A-' + formattedNumber;
	 System.debug('Generated employee number: ' + employeeNumber);


                // Check if the generated number is unique
                if (!existingNumbers.contains(employeeNumber)) {
                    isUnique = true;
                    existingNumbers.add(employeeNumber); // Add the new unique number to the set
 System.debug('Unique employee number: ' + emp.Employee_Number__c);               
 }
            }

            emp.Employee_Number__c = employeeNumber;
 System.debug('Assigned employee number: ' + emp.Employee_Number__c);
        }
    }
}