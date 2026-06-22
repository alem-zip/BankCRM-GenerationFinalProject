public class TracciamentoInterazioniTriggerHandler {


    // aggiornamento Account.LastInteractionDate__c
    public static void handleAfter(List<Task> tasks) {

        List<Account> accontsToUpdate = new List<Account>();
        
        for (Task t : tasks) {
            if (t.Status == 'Completed' && t.WhatId != null ) {
                accontsToUpdate.add(new Account(Id = t.WhatId, LastInteractionDate__c = Date.today()));
            }
        }
        if (!accontsToUpdate.isEmpty()) {
            update accontsToUpdate;
        }


    }

    public static void handleBeforeDelete(List<Task> oldTasks) {

        List<Account> accontsToUpdate = new List<Account>();
        
        for (Task t : oldTasks) {
            if (t.Status == 'Completed') {
                t.addError('Impossibile eliminare interazioni già completate');
            }
        }
    }
}