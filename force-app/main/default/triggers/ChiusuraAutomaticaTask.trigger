trigger ChiusuraAutomaticaTask on LoanRequest__c (after update) {
    ChiusuraAutomaticaTaskTriggerHandler.handleAfter(Trigger.new);
}