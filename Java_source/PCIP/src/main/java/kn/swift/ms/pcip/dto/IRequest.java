package kn.swift.ms.pcip.dto;

import javax.xml.bind.JAXBElement;

public interface IRequest {

    public JAXBElement<InputParameters> getInputParameters();

    public void setInputParameters(JAXBElement<InputParameters> value);
}
