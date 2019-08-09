//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.1-558 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2019.06.12 at 11:47:31 AM BST 
//


package kn.swift.ms.pcip.dto;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for IdentifierType.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="IdentifierType">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="ParcelIdentcode"/>
 *     &lt;enumeration value="ParcelReferenceNo"/>
 *     &lt;enumeration value="ParcelId"/>
 *     &lt;enumeration value="ParcelGUID"/>
 *     &lt;enumeration value="ShipmentIdentcode"/>
 *     &lt;enumeration value="ShipmentReferenceNo"/>
 *     &lt;enumeration value="ShipmentId"/>
 *     &lt;enumeration value="ShipmentGUID"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "IdentifierType")
@XmlEnum
public enum IdentifierType {

    @XmlEnumValue("ParcelIdentcode")
    PARCEL_IDENTCODE("ParcelIdentcode"),
    @XmlEnumValue("ParcelReferenceNo")
    PARCEL_REFERENCE_NO("ParcelReferenceNo"),
    @XmlEnumValue("ParcelId")
    PARCEL_ID("ParcelId"),
    @XmlEnumValue("ParcelGUID")
    PARCEL_GUID("ParcelGUID"),
    @XmlEnumValue("ShipmentIdentcode")
    SHIPMENT_IDENTCODE("ShipmentIdentcode"),
    @XmlEnumValue("ShipmentReferenceNo")
    SHIPMENT_REFERENCE_NO("ShipmentReferenceNo"),
    @XmlEnumValue("ShipmentId")
    SHIPMENT_ID("ShipmentId"),
    @XmlEnumValue("ShipmentGUID")
    SHIPMENT_GUID("ShipmentGUID");
    private final String value;

    IdentifierType(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static IdentifierType fromValue(String v) {
        for (IdentifierType c: IdentifierType.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
