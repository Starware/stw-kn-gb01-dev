
package kn.swift.ms.pcip.dto.closeresponse;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
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
 *         &lt;element name="ExitStatus">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="Status" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                   &lt;element name="StatusDetails">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;sequence>
 *                             &lt;element name="StatusDetail" maxOccurs="unbounded" minOccurs="0">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;sequence>
 *                                       &lt;element name="Status" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                       &lt;element name="Code" type="{http://www.w3.org/2001/XMLSchema}short"/>
 *                                       &lt;element name="Message" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                       &lt;element name="Details" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                     &lt;/sequence>
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                           &lt;/sequence>
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="OutputParameters">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="ShippingParameter" maxOccurs="unbounded" minOccurs="0">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;sequence>
 *                             &lt;element name="Name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                             &lt;element name="Value" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                           &lt;/sequence>
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
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
    "exitStatus",
    "outputParameters"
})
@XmlRootElement(name = "CloseShipmentsResponse", namespace = "http://xlogics.eu/blackbox")
public class CloseShipmentsResponse {

    @XmlElement(name = "ExitStatus", namespace = "http://xlogics.eu/blackbox", required = true)
    protected CloseShipmentsResponse.ExitStatus exitStatus;
    @XmlElement(name = "OutputParameters", namespace = "http://xlogics.eu/blackbox", required = true)
    protected CloseShipmentsResponse.OutputParameters outputParameters;

    /**
     * Gets the value of the exitStatus property.
     * 
     * @return
     *     possible object is
     *     {@link CloseShipmentsResponse.ExitStatus }
     *     
     */
    public CloseShipmentsResponse.ExitStatus getExitStatus() {
        return exitStatus;
    }

    /**
     * Sets the value of the exitStatus property.
     * 
     * @param value
     *     allowed object is
     *     {@link CloseShipmentsResponse.ExitStatus }
     *     
     */
    public void setExitStatus(CloseShipmentsResponse.ExitStatus value) {
        this.exitStatus = value;
    }

    /**
     * Gets the value of the outputParameters property.
     * 
     * @return
     *     possible object is
     *     {@link CloseShipmentsResponse.OutputParameters }
     *     
     */
    public CloseShipmentsResponse.OutputParameters getOutputParameters() {
        return outputParameters;
    }

    /**
     * Sets the value of the outputParameters property.
     * 
     * @param value
     *     allowed object is
     *     {@link CloseShipmentsResponse.OutputParameters }
     *     
     */
    public void setOutputParameters(CloseShipmentsResponse.OutputParameters value) {
        this.outputParameters = value;
    }


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
     *         &lt;element name="Status" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *         &lt;element name="StatusDetails">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;sequence>
     *                   &lt;element name="StatusDetail" maxOccurs="unbounded" minOccurs="0">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;sequence>
     *                             &lt;element name="Status" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                             &lt;element name="Code" type="{http://www.w3.org/2001/XMLSchema}short"/>
     *                             &lt;element name="Message" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                             &lt;element name="Details" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                           &lt;/sequence>
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                 &lt;/sequence>
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
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
        "status",
        "statusDetails"
    })
    public static class ExitStatus {

        @XmlElement(name = "Status", namespace = "http://xlogics.eu/blackbox", required = true)
        protected String status;
        @XmlElement(name = "StatusDetails", namespace = "http://xlogics.eu/blackbox", required = true)
        protected CloseShipmentsResponse.ExitStatus.StatusDetails statusDetails;

        /**
         * Gets the value of the status property.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getStatus() {
            return status;
        }

        /**
         * Sets the value of the status property.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setStatus(String value) {
            this.status = value;
        }

        /**
         * Gets the value of the statusDetails property.
         * 
         * @return
         *     possible object is
         *     {@link CloseShipmentsResponse.ExitStatus.StatusDetails }
         *     
         */
        public CloseShipmentsResponse.ExitStatus.StatusDetails getStatusDetails() {
            return statusDetails;
        }

        /**
         * Sets the value of the statusDetails property.
         * 
         * @param value
         *     allowed object is
         *     {@link CloseShipmentsResponse.ExitStatus.StatusDetails }
         *     
         */
        public void setStatusDetails(CloseShipmentsResponse.ExitStatus.StatusDetails value) {
            this.statusDetails = value;
        }


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
         *         &lt;element name="StatusDetail" maxOccurs="unbounded" minOccurs="0">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;sequence>
         *                   &lt;element name="Status" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *                   &lt;element name="Code" type="{http://www.w3.org/2001/XMLSchema}short"/>
         *                   &lt;element name="Message" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *                   &lt;element name="Details" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *                 &lt;/sequence>
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
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
            "statusDetail"
        })
        public static class StatusDetails {

            @XmlElement(name = "StatusDetail", namespace = "http://xlogics.eu/blackbox")
            protected List<CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail> statusDetail;

            /**
             * Gets the value of the statusDetail property.
             * 
             * <p>
             * This accessor method returns a reference to the live list,
             * not a snapshot. Therefore any modification you make to the
             * returned list will be present inside the JAXB object.
             * This is why there is not a <CODE>set</CODE> method for the statusDetail property.
             * 
             * <p>
             * For example, to add a new item, do as follows:
             * <pre>
             *    getStatusDetail().add(newItem);
             * </pre>
             * 
             * 
             * <p>
             * Objects of the following type(s) are allowed in the list
             * {@link CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail }
             * 
             * 
             */
            public List<CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail> getStatusDetail() {
                if (statusDetail == null) {
                    statusDetail = new ArrayList<CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail>();
                }
                return this.statusDetail;
            }


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
             *         &lt;element name="Status" type="{http://www.w3.org/2001/XMLSchema}string"/>
             *         &lt;element name="Code" type="{http://www.w3.org/2001/XMLSchema}short"/>
             *         &lt;element name="Message" type="{http://www.w3.org/2001/XMLSchema}string"/>
             *         &lt;element name="Details" type="{http://www.w3.org/2001/XMLSchema}string"/>
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
                "status",
                "code",
                "message",
                "details"
            })
            public static class StatusDetail {

                @XmlElement(name = "Status", namespace = "http://xlogics.eu/blackbox", required = true)
                protected String status;
                @XmlElement(name = "Code", namespace = "http://xlogics.eu/blackbox")
                protected short code;
                @XmlElement(name = "Message", namespace = "http://xlogics.eu/blackbox", required = true)
                protected String message;
                @XmlElement(name = "Details", namespace = "http://xlogics.eu/blackbox", required = true)
                protected String details;

                /**
                 * Gets the value of the status property.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getStatus() {
                    return status;
                }

                /**
                 * Sets the value of the status property.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setStatus(String value) {
                    this.status = value;
                }

                /**
                 * Gets the value of the code property.
                 * 
                 */
                public short getCode() {
                    return code;
                }

                /**
                 * Sets the value of the code property.
                 * 
                 */
                public void setCode(short value) {
                    this.code = value;
                }

                /**
                 * Gets the value of the message property.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getMessage() {
                    return message;
                }

                /**
                 * Sets the value of the message property.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setMessage(String value) {
                    this.message = value;
                }

                /**
                 * Gets the value of the details property.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getDetails() {
                    return details;
                }

                /**
                 * Sets the value of the details property.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setDetails(String value) {
                    this.details = value;
                }

            }

        }

    }


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
     *         &lt;element name="ShippingParameter" maxOccurs="unbounded" minOccurs="0">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;sequence>
     *                   &lt;element name="Name" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                   &lt;element name="Value" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                 &lt;/sequence>
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
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
        "shippingParameter"
    })
    public static class OutputParameters {

        @XmlElement(name = "ShippingParameter", namespace = "http://xlogics.eu/blackbox")
        protected List<CloseShipmentsResponse.OutputParameters.ShippingParameter> shippingParameter;

        /**
         * Gets the value of the shippingParameter property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the shippingParameter property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getShippingParameter().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CloseShipmentsResponse.OutputParameters.ShippingParameter }
         * 
         * 
         */
        public List<CloseShipmentsResponse.OutputParameters.ShippingParameter> getShippingParameter() {
            if (shippingParameter == null) {
                shippingParameter = new ArrayList<CloseShipmentsResponse.OutputParameters.ShippingParameter>();
            }
            return this.shippingParameter;
        }


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
         *         &lt;element name="Name" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *         &lt;element name="Value" type="{http://www.w3.org/2001/XMLSchema}string"/>
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
            "name",
            "value"
        })
        public static class ShippingParameter {

            @XmlElement(name = "Name", namespace = "http://xlogics.eu/blackbox", required = true)
            protected String name;
            @XmlElement(name = "Value", namespace = "http://xlogics.eu/blackbox", required = true)
            protected String value;

            /**
             * Gets the value of the name property.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getName() {
                return name;
            }

            /**
             * Sets the value of the name property.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setName(String value) {
                this.name = value;
            }

            /**
             * Gets the value of the value property.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getValue() {
                return value;
            }

            /**
             * Sets the value of the value property.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setValue(String value) {
                this.value = value;
            }

        }

    }

}
