package com.saic.uicds.core.infrastructure.exceptions;

@SuppressWarnings("serial")
public class UICDSException extends Exception {

    public UICDSException() {
        super();
    }

    public UICDSException(String message) {
        super(message);
    }
}
