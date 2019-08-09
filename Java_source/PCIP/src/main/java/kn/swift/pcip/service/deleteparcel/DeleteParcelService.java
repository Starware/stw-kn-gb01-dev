package kn.swift.pcip.service.deleteparcel;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.moca.utils.HeaderGenerator;
import kn.swift.moca.utils.Logger;
import kn.swift.ms.pcip.dto.DeleteParcelRequest;
import kn.swift.ms.pcip.dto.Header;
import kn.swift.ms.pcip.dto.deleteresponse.DeleteParcelResponse;

import kn.swift.pcip.configuration.properties.EsbProperties;
import kn.swift.pcip.configuration.properties.PcipProperties;
import kn.swift.pcip.exceptions.SoapServiceException;
import kn.swift.pcip.service.saajsoapwebservice.SaajDeleteService;
import lombok.Getter;
import lombok.Setter;

import javax.xml.bind.JAXBException;
import javax.xml.soap.SOAPException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Getter
@Setter
public class DeleteParcelService {





    private PcipProperties pcipProperties;

    public DeleteParcelResponse deleteParcel(DeleteParcelRequest deleteParcelRequest, Map<String, Object> headers) throws JAXBException, SOAPException {




        Logger.log("sending parcel");

        HeaderGenerator generator = new HeaderGenerator();

        Header header = generator.createHeader();

        DeleteParcelResponse deleteParcelResponse = (DeleteParcelResponse) SaajDeleteService.callSoapWebService(EsbProperties.getInstance().getUrl(),"DeleteParcel",deleteParcelRequest,header.getAuthenticationHeader(),header.getAudit());

        return deleteParcelResponse;
    }


}
