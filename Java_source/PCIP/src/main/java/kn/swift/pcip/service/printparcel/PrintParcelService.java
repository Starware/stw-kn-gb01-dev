package kn.swift.pcip.service.printparcel;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.moca.utils.HeaderGenerator;

import kn.swift.moca.utils.Logger;
import kn.swift.ms.pcip.dto.Header;
import kn.swift.ms.pcip.dto.PrintParcelRequest;
import kn.swift.ms.pcip.dto.printresponse.PrintParcelResponse;
import kn.swift.pcip.configuration.properties.EsbProperties;
import kn.swift.pcip.configuration.properties.PcipProperties;
import kn.swift.pcip.service.saajsoapwebservice.SaajPrintService;

import lombok.Getter;
import lombok.Setter;

import javax.xml.bind.JAXBException;
import javax.xml.soap.SOAPException;
import java.util.Map;
import java.util.UUID;

@Getter
@Setter
public class PrintParcelService {


    public static final String PRINT_PARCEL = "http://xlogics.eu/blackbox/BlackBoxContract/PrintParcel";

    public PrintParcelResponse printParcel(PrintParcelRequest printParcelRequest, Map<String, Object> headers) throws JAXBException, SOAPException {


        Logger.log("sending parcel");

        HeaderGenerator generator = new HeaderGenerator();

        Header header = generator.createHeader();

        PrintParcelResponse printParcelResponse = (PrintParcelResponse) SaajPrintService.callSoapWebService(EsbProperties.getInstance().getUrl(), PRINT_PARCEL,printParcelRequest,header.getAuthenticationHeader(),header.getAudit());

        return printParcelResponse;
    }






}