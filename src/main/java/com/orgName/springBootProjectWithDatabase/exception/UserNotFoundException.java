package com.orgName.springBootProjectWithDatabase.exception;

public class UserNotFoundException extends RuntimeException{
    public UserNotFoundException(String errorMsg){
        super(errorMsg);
    }
}
