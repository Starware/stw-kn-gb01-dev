package kn.swift.pcip.service.saajsoapwebservice;
import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.moca.utils.PCIPLogger;
import kn.swift.ms.pcip.dto.Audit;
import kn.swift.ms.pcip.dto.AuthenticationHeader;
import kn.swift.ms.pcip.dto.PrintParcelRequest;
import kn.swift.ms.pcip.dto.printresponse.PrintParcelResponse;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.soap.*;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;

public class SaajPrintService {

    private static void createSoapEnvelope(SOAPMessage soapMessage, PrintParcelRequest request, AuthenticationHeader authHeader, Audit audit) throws SOAPException, JAXBException {

        SOAPPart soapPart = soapMessage.getSOAPPart();

        String myNamespace = "SOAP-ENV";
        String myNamespaceURI = "http://schemas.xmlsoap.org/soap/envelope/";

        // SOAP Envelope

        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration(myNamespace, myNamespaceURI);
        SOAPHeader soapHeader = envelope.getHeader();
        PCIPLogger.log("added namespace");


        JAXBContext jaxbContext = JAXBContext.newInstance(AuthenticationHeader.class);
        Marshaller marshaller = jaxbContext.createMarshaller();
        marshaller.marshal(authHeader,soapHeader);

        PCIPLogger.log("marshalling authentication element");

        jaxbContext = JAXBContext.newInstance(Audit.class);
        marshaller = jaxbContext.createMarshaller();
        marshaller.marshal(audit,soapHeader);

        PCIPLogger.log("marshalling audit element");

        // SOAP Body
        SOAPBody soapBody = envelope.getBody();
        jaxbContext = JAXBContext.newInstance(PrintParcelRequest.class);
        marshaller = jaxbContext.createMarshaller();

        PCIPLogger.log("marshalling body element");

        marshaller.marshal(request,soapBody);
    }

    public static PrintParcelResponse callSoapWebService(String soapEndpointUrl, String soapAction,PrintParcelRequest request,AuthenticationHeader authHeader,Audit audit) throws JAXBException, SOAPException {

        PCIPLogger.log("entered saaj service");
        SOAPMessage soapResponse = null;

        try {
            soapResponse = sendAndReceive(soapAction,request,authHeader,audit,soapEndpointUrl);
        } catch (Exception e) {
            PCIPLogger.log("problem making connection: "+ e);
        }

        Unmarshaller unmarshaller = JAXBContext.newInstance(PrintParcelResponse.class).createUnmarshaller();
        PCIPLogger.log("returning printresponse");
        PCIPLogger.log("retrieving xml string");
        printOutgoingXml(soapResponse);

        return (PrintParcelResponse) unmarshaller.unmarshal(soapResponse.getSOAPBody().extractContentAsDocument());
    }

    private static SOAPMessage createSOAPRequest(String soapAction, PrintParcelRequest request, AuthenticationHeader authHeader, Audit audit) throws Exception {
        SOAPMessage soapMessage = getSoapMessage(request, soapAction, authHeader, audit);

        return soapMessage;
    }

    private static SOAPMessage getSoapMessage(PrintParcelRequest request, String soapAction, AuthenticationHeader authHeader, Audit audit) throws SOAPException, JAXBException {
        SOAPMessage soapMessage = getSoapMessage();

        createSoapEnvelope(soapMessage,request,authHeader,audit);
        PCIPLogger.log("created SOAP envelope");

        MimeHeaders headers = soapMessage.getMimeHeaders();
        headers.addHeader("SOAPAction", soapAction);

        soapMessage.saveChanges();

        /* Print the request message, just for debugging purposes */
        PCIPLogger.log("SOAP message created: "+ soapMessage.toString());

        printOutgoingXml(soapMessage);
        return soapMessage;
    }

    private static void printOutgoingXml(SOAPMessage soapMessage) {
        final StringWriter sw = new StringWriter();

        try {
            TransformerFactory.newInstance().newTransformer().transform(
                    new DOMSource(soapMessage.getSOAPPart()),
                    new StreamResult(sw));
        } catch (TransformerException e) {
            throw new RuntimeException(e);
        }

        PCIPLogger.log("xml trace is: " + sw.toString());
    }

    private static SOAPMessage getSoapMessage() throws SOAPException {
        MessageFactory messageFactory = MessageFactory.newInstance();
        return messageFactory.createMessage();
    }

    public static SOAPMessage sendAndReceive(String soapAction, PrintParcelRequest request,AuthenticationHeader authHeader, Audit audit, String soapEndpointUrl) throws Exception{
        // Create SOAP Connection
        PCIPLogger.log("creating SOAP connection");
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();

        // Send SOAP Message to SOAP Server
        PCIPLogger.log("calling SOAP connection.call");
        SOAPMessage soapResponse = soapConnection.call(createSOAPRequest(soapAction,request,authHeader,audit), soapEndpointUrl);

        // Print the SOAP Response
        PCIPLogger.log("Response SOAP Message:");
        PCIPLogger.log(soapResponse.toString());

        soapConnection.close();

        return soapResponse;
    }

}
