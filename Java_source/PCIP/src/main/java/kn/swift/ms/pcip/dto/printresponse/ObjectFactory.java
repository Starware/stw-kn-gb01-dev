
package kn.swift.ms.pcip.dto.printresponse;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the kn.swift.ms.pcip.dto.printresponse package. 
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
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: kn.swift.ms.pcip.dto.printresponse
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link PrintParcelResponse }
     * 
     */
    public PrintParcelResponse createPrintParcelResponse() {
        return new PrintParcelResponse();
    }

    /**
     * Create an instance of {@link PrintParcelResponse.OutputParameters }
     * 
     */
    public PrintParcelResponse.OutputParameters createPrintParcelResponseOutputParameters() {
        return new PrintParcelResponse.OutputParameters();
    }

    /**
     * Create an instance of {@link PrintParcelResponse.ExitStatus }
     * 
     */
    public PrintParcelResponse.ExitStatus createPrintParcelResponseExitStatus() {
        return new PrintParcelResponse.ExitStatus();
    }

    /**
     * Create an instance of {@link PrintParcelResponse.ExitStatus.StatusDetails }
     * 
     */
    public PrintParcelResponse.ExitStatus.StatusDetails createPrintParcelResponseExitStatusStatusDetails() {
        return new PrintParcelResponse.ExitStatus.StatusDetails();
    }

    /**
     * Create an instance of {@link PrintParcelResponse.OutputParameters.ShippingParameter }
     * 
     */
    public PrintParcelResponse.OutputParameters.ShippingParameter createPrintParcelResponseOutputParametersShippingParameter() {
        return new PrintParcelResponse.OutputParameters.ShippingParameter();
    }

    /**
     * Create an instance of {@link PrintParcelResponse.ExitStatus.StatusDetails.StatusDetail }
     * 
     */
    public PrintParcelResponse.ExitStatus.StatusDetails.StatusDetail createPrintParcelResponseExitStatusStatusDetailsStatusDetail() {
        return new PrintParcelResponse.ExitStatus.StatusDetails.StatusDetail();
    }

}
