package kn.swift.moca.utils;

import kn.swift.pcip.configuration.properties.EsbProperties;
import kn.swift.pcip.configuration.properties.PcipProperties;

public class PropertyUpdater {



    public void updatePcipProperties(String url,
                                      String culture,
                                      String user,
                                      String password,
                                      String applicationid,
                                      String businesskey1,
                                      String businesskey2,
                                      String businesskey3,
                                      String businesskey4){

        PcipProperties pcipProperties = PcipProperties.getInstance();
        EsbProperties esbProperties = EsbProperties.getInstance();

        setEsbProperties(url, user, password, esbProperties);

        setPcipProperties(culture, user, password, applicationid, pcipProperties);

        setBusinessKeys(businesskey1, businesskey2, businesskey3, businesskey4, pcipProperties);

    }

    private void setBusinessKeys(String businesskey1, String businesskey2, String businesskey3, String businesskey4, PcipProperties pcipProperties) {
        pcipProperties.getXpath().setWarehouseId(businesskey1);
        pcipProperties.getXpath().setClientId(businesskey2);
        pcipProperties.getXpath().setShipmentRefno(businesskey3);
        pcipProperties.getXpath().setKnSscc(businesskey4);
    }

    private void setPcipProperties(String culture, String user, String password, String applicationid, PcipProperties pcipProperties) {
        pcipProperties.setAppId(applicationid);
        pcipProperties.getAuthHeader().setCulture(culture);
        pcipProperties.getAuthHeader().setUser(user);
        pcipProperties.getAuthHeader().setPassword(password);
    }

    private void setEsbProperties(String url, String user, String password, EsbProperties esbProperties) {
        esbProperties.setUrl(url);
        esbProperties.setUser(user);
        esbProperties.setPassword(password);
    }
}
