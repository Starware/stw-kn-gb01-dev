package kn.swift.pcip.service.closeshipments;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.moca.utils.HeaderGenerator;
import kn.swift.moca.utils.Logger;
import kn.swift.ms.pcip.dto.CloseShipmentsRequest;
import kn.swift.ms.pcip.dto.Header;
import kn.swift.ms.pcip.dto.closeresponse.CloseShipmentsResponse;

import kn.swift.pcip.configuration.properties.EsbProperties;
import kn.swift.pcip.configuration.properties.PcipProperties;
import kn.swift.pcip.exceptions.SoapServiceException;
import kn.swift.pcip.service.saajsoapwebservice.SaajCloseService;
import lombok.Getter;
import lombok.Setter;

import javax.xml.bind.JAXBException;
import javax.xml.soap.SOAPException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Getter
@Setter
public class CloseShipmentsService {

    public CloseShipmentsResponse closeShipments(CloseShipmentsRequest closeShipmentsRequest, Map<String, Object> headers) throws JAXBException, SOAPException {



        Logger.log("sending parcel");

        HeaderGenerator generator = new HeaderGenerator();

        Header header = generator.createHeader();

        CloseShipmentsResponse closeShipmentsResponse = (CloseShipmentsResponse) SaajCloseService.callSoapWebService(EsbProperties.getInstance().getUrl(),"CloseShipments",closeShipmentsRequest,header.getAuthenticationHeader(),header.getAudit());
        return closeShipmentsResponse;
    }



}
