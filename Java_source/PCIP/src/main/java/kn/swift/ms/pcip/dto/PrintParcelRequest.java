//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.1-558 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2019.06.12 at 11:47:31 AM BST 
//


package kn.swift.ms.pcip.dto;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="InputParameters" type="{http://xlogics.eu/blackbox}InputParameters" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "inputParameters"
})
@XmlRootElement(name = "PrintParcelRequest",namespace = "http://xlogics.eu/blackbox")
public class PrintParcelRequest implements IRequest {

    @XmlElementRef(name = "InputParameters", namespace = "http://xlogics.eu/blackbox", type = JAXBElement.class)
    protected JAXBElement<InputParameters> inputParameters;

    /**
     * Gets the value of the inputParameters property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link InputParameters }{@code >}
     *     
     */
    public JAXBElement<InputParameters> getInputParameters() {
        return inputParameters;
    }

    /**
     * Sets the value of the inputParameters property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link InputParameters }{@code >}
     *     
     */
    public void setInputParameters(JAXBElement<InputParameters> value) {
        this.inputParameters = ((JAXBElement<InputParameters> ) value);
    }

}
