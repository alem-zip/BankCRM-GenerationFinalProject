trigger TracciamentoInterazioni on Task (after insert, after update, before delete) {

    switch on Trigger.operationType {
        when AFTER_INSERT {
            TracciamentoInterazioniTriggerHandler.handleAfter(Trigger.new);
        }
        when AFTER_UPDATE {
            TracciamentoInterazioniTriggerHandler.handleAfter(Trigger.new);
        }
        when BEFORE_DELETE {
            TracciamentoInterazioniTriggerHandler.handleBeforeDelete(Trigger.old);
        }
    }
}