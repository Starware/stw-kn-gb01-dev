package kn.swift.moca.utils;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.ms.pcip.dto.Audit;
import kn.swift.ms.pcip.dto.AuthenticationHeader;
import kn.swift.ms.pcip.dto.Header;
import kn.swift.ms.pcip.dto.ObjectFactory;
import kn.swift.pcip.configuration.properties.PcipProperties;

import java.util.UUID;

public class HeaderGenerator {

    public Header createHeader(){

        PcipProperties pcipProperties = PcipProperties.getInstance();
        ObjectFactory factory = new ObjectFactory();
        AuthenticationHeader authHeader = new AuthenticationHeader();
        authHeader.setCulture(factory.createAuthenticationHeaderCulture(pcipProperties.getAuthHeader().getCulture()));
        authHeader.setPassword(factory.createAuthenticationHeaderPassword(pcipProperties.getAuthHeader().getPassword()));
        authHeader.setUser(factory.createAuthenticationHeaderUser(pcipProperties.getAuthHeader().getUser()));



        Logger.log("autheader Created: "+authHeader.getCulture().getValue());

        String uuid = UUID.randomUUID().toString();

        Logger.log("uuid created: "+ uuid);
        Audit audit = new Audit();
        audit.setApplicationID(pcipProperties.getAppId());
        Logger.log("appID set: "+ audit.getApplicationID());
        audit.setCorrelationID(uuid);
        Logger.log("corrID set: "+ audit.getCorrelationID());
        audit.setRequestID(uuid);
        Logger.log("reqId set: "+ audit.getRequestID());

        Audit.BusinessKeys businessKeys = factory.createAuditBusinessKeys();
        audit.setBusinessKeys(businessKeys);
        audit.getBusinessKeys().setBusinessKey1(pcipProperties.getXpath().getWarehouseId());
        audit.getBusinessKeys().setBusinessKey2(pcipProperties.getXpath().getClientId());
        audit.getBusinessKeys().setBusinessKey3(pcipProperties.getXpath().getShipmentRefno());
        audit.getBusinessKeys().setBusinessKey4(pcipProperties.getXpath().getKnSscc());

        Logger.log("audit created: "+ audit.getBusinessKeys().getBusinessKey1());


        return new Header(authHeader,audit);

    }
}
