package kn.swift.ms.pcip.dto;

import javax.xml.bind.JAXBElement;

public interface IResponse {

    public JAXBElement<ExitStatus> getExitStatus();

    public void setExitStatus(JAXBElement<ExitStatus> value);

    public JAXBElement<InputParameters> getOutputParameters();

    public void setOutputParameters(JAXBElement<InputParameters> value);

}
