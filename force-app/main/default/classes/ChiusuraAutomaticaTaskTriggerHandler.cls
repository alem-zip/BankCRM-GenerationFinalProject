public class ChiusuraAutomaticaTaskTriggerHandler {

    public static void handleAfter(List<LoanRequest__c> requests) {
        
        for (LoanRequest__c req : requests){
            if (req.Status__c == 'Approved') {
                
                List<Task> tasksToClose = [SELECT Id, Status FROM Task WHERE WhatId = :req.Id AND Status != 'Completed'];

                for (Task t : tasksToClose) {
                    t.Status = 'Completed';
                    t.Description = 'Chiuso automaticamente per approvazione pratica';
                }
            }
        }
    }
}