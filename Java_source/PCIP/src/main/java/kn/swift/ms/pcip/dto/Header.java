package kn.swift.ms.pcip.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Header {

    private AuthenticationHeader authenticationHeader;
    private Audit audit;

    public Header(AuthenticationHeader authHeader, Audit audit){

        this.authenticationHeader = authHeader;
        this.audit = audit;

    }

}
