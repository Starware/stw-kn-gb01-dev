
package kn.swift.ms.pcip.dto.deleteresponse;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the kn.swift.ms.pcip.dto.deleteresponse package. 
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
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: kn.swift.ms.pcip.dto.deleteresponse
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DeleteParcelResponse }
     * 
     */
    public DeleteParcelResponse createDeleteParcelResponse() {
        return new DeleteParcelResponse();
    }

    /**
     * Create an instance of {@link DeleteParcelResponse.OutputParameters }
     * 
     */
    public DeleteParcelResponse.OutputParameters createDeleteParcelResponseOutputParameters() {
        return new DeleteParcelResponse.OutputParameters();
    }

    /**
     * Create an instance of {@link DeleteParcelResponse.ExitStatus }
     * 
     */
    public DeleteParcelResponse.ExitStatus createDeleteParcelResponseExitStatus() {
        return new DeleteParcelResponse.ExitStatus();
    }

    /**
     * Create an instance of {@link DeleteParcelResponse.ExitStatus.StatusDetails }
     * 
     */
    public DeleteParcelResponse.ExitStatus.StatusDetails createDeleteParcelResponseExitStatusStatusDetails() {
        return new DeleteParcelResponse.ExitStatus.StatusDetails();
    }

    /**
     * Create an instance of {@link DeleteParcelResponse.OutputParameters.ShippingParameter }
     * 
     */
    public DeleteParcelResponse.OutputParameters.ShippingParameter createDeleteParcelResponseOutputParametersShippingParameter() {
        return new DeleteParcelResponse.OutputParameters.ShippingParameter();
    }

    /**
     * Create an instance of {@link DeleteParcelResponse.ExitStatus.StatusDetails.StatusDetail }
     * 
     */
    public DeleteParcelResponse.ExitStatus.StatusDetails.StatusDetail createDeleteParcelResponseExitStatusStatusDetailsStatusDetail() {
        return new DeleteParcelResponse.ExitStatus.StatusDetails.StatusDetail();
    }

}
