package com.saic.uicds.core.infrastructure.exceptions;

@SuppressWarnings("serial")
public class AgreementWithCoreExists extends UICDSException {
    public AgreementWithCoreExists() {
        super(AgreementWithCoreExists.class.getName());
    }

    public AgreementWithCoreExists(String message) {
        super(message);
    }
}
