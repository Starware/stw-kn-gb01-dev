
package kn.swift.ms.pcip.dto.closeresponse;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the kn.swift.ms.pcip.dto.closeresponse package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: kn.swift.ms.pcip.dto.closeresponse
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link CloseShipmentsResponse }
     * 
     */
    public CloseShipmentsResponse createCloseShipmentsResponse() {
        return new CloseShipmentsResponse();
    }

    /**
     * Create an instance of {@link CloseShipmentsResponse.OutputParameters }
     * 
     */
    public CloseShipmentsResponse.OutputParameters createCloseShipmentsResponseOutputParameters() {
        return new CloseShipmentsResponse.OutputParameters();
    }

    /**
     * Create an instance of {@link CloseShipmentsResponse.ExitStatus }
     * 
     */
    public CloseShipmentsResponse.ExitStatus createCloseShipmentsResponseExitStatus() {
        return new CloseShipmentsResponse.ExitStatus();
    }

    /**
     * Create an instance of {@link CloseShipmentsResponse.ExitStatus.StatusDetails }
     * 
     */
    public CloseShipmentsResponse.ExitStatus.StatusDetails createCloseShipmentsResponseExitStatusStatusDetails() {
        return new CloseShipmentsResponse.ExitStatus.StatusDetails();
    }

    /**
     * Create an instance of {@link CloseShipmentsResponse.OutputParameters.ShippingParameter }
     * 
     */
    public CloseShipmentsResponse.OutputParameters.ShippingParameter createCloseShipmentsResponseOutputParametersShippingParameter() {
        return new CloseShipmentsResponse.OutputParameters.ShippingParameter();
    }

    /**
     * Create an instance of {@link CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail }
     * 
     */
    public CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail createCloseShipmentsResponseExitStatusStatusDetailsStatusDetail() {
        return new CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail();
    }

}
