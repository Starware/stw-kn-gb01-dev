package kn.swift.pcip.service.saajsoapwebservice;
import kn.swift.ms.pcip.dto.deleteresponse.DeleteParcelResponse;
import kn.swift.ms.pcip.dto.Audit;
import kn.swift.ms.pcip.dto.AuthenticationHeader;
import kn.swift.ms.pcip.dto.DeleteParcelRequest;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.soap.*;

public class SaajDeleteService {

    private static void createSoapEnvelope(SOAPMessage soapMessage, DeleteParcelRequest request, AuthenticationHeader authHeader, Audit audit) throws SOAPException, JAXBException {
        SOAPPart soapPart = soapMessage.getSOAPPart();

        String myNamespace = "SOAP-ENV";
        String myNamespaceURI = "http://schemas.xmlsoap.org/soap/envelope/";

        // SOAP Envelope

        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration(myNamespace, myNamespaceURI);
        SOAPHeader soapHeader = envelope.getHeader();


        JAXBContext jaxbContext = JAXBContext.newInstance(AuthenticationHeader.class);
        Marshaller marshaller = jaxbContext.createMarshaller();
        marshaller.marshal(authHeader,soapHeader);

        jaxbContext = JAXBContext.newInstance(Audit.class);
        marshaller = jaxbContext.createMarshaller();
        marshaller.marshal(audit,soapHeader);


        // SOAP Body
        SOAPBody soapBody = envelope.getBody();
        jaxbContext = JAXBContext.newInstance(DeleteParcelRequest.class);
        marshaller = jaxbContext.createMarshaller();

        marshaller.marshal(request,soapBody);
    }

    public static DeleteParcelResponse callSoapWebService(String soapEndpointUrl, String soapAction,DeleteParcelRequest request,AuthenticationHeader authHeader,Audit audit) throws JAXBException, SOAPException {

        SOAPMessage soapResponse = null;

        try {
            // Create SOAP Connection
            SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
            SOAPConnection soapConnection = soapConnectionFactory.createConnection();

            // Send SOAP Message to SOAP Server
            soapResponse = soapConnection.call(createSOAPRequest(soapAction,request,authHeader
            ,audit), soapEndpointUrl);

            // Print the SOAP Response
            System.out.println("Response SOAP Message:");
            soapResponse.writeTo(System.out);
            System.out.println();

            soapConnection.close();
        } catch (Exception e) {
            System.err.println("\nError occurred while sending SOAP Request to Server!\nMake sure you have the correct endpoint URL and SOAPAction!\n");
            e.printStackTrace();
        }

        Unmarshaller unmarshaller = JAXBContext.newInstance(DeleteParcelResponse.class).createUnmarshaller();


        return (DeleteParcelResponse) unmarshaller.unmarshal(soapResponse.getSOAPBody().extractContentAsDocument());
    }

    private static SOAPMessage createSOAPRequest(String soapAction, DeleteParcelRequest request, AuthenticationHeader authHeader, Audit audit) throws Exception {
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();

        createSoapEnvelope(soapMessage,request,authHeader,audit);

        MimeHeaders headers = soapMessage.getMimeHeaders();
        headers.addHeader("SOAPAction", soapAction);

        soapMessage.saveChanges();

        /* Print the request message, just for debugging purposes */
        System.out.println("Request SOAP Message:");
        soapMessage.writeTo(System.out);
        System.out.println("\n");

        return soapMessage;
    }

}
