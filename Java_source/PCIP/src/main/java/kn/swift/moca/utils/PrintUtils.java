package kn.swift.moca.utils;

import com.redprairie.moca.EditableResults;
import com.redprairie.moca.MocaContext;
import com.redprairie.moca.MocaResults;
import com.redprairie.moca.MocaType;
import com.redprairie.moca.util.MocaUtils;


import kn.swift.ms.pcip.dto.*;
import kn.swift.ms.pcip.dto.closeresponse.CloseShipmentsResponse;
import kn.swift.ms.pcip.dto.deleteresponse.DeleteParcelResponse;
import kn.swift.ms.pcip.dto.printresponse.PrintParcelResponse;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class PrintUtils {

    public static final String STATUS_CODE = "Status_Code";
    public static final String STATUS = "Message";
    MocaContext moca;

    public PrintUtils(MocaContext moca){
        this.moca = moca;
    }

    public PrintUtils(){

        this.moca = MocaUtils.currentContext();
    }


    public MocaResults buildPrintSuccess(PrintParcelResponse response) {

        EditableResults results = moca.newResults();

        PCIPLogger.log("building Print Success Message ");

        if(response.getExitStatus().getStatusDetails().getStatusDetail().size() != 0){

            for(PrintParcelResponse.ExitStatus.StatusDetails.StatusDetail detail : response.getExitStatus().getStatusDetails().getStatusDetail()){
                PCIPLogger.log("Exit Status message-> Status: "+ detail.getStatus() + " | Message: "+detail.getMessage());
            }
        }

        List<PrintParcelResponse.OutputParameters.ShippingParameter> parameterList = response.getOutputParameters().getShippingParameter();

        results.addColumn(STATUS_CODE, MocaType.STRING);

        for (PrintParcelResponse.OutputParameters.ShippingParameter nameValuePair : parameterList) {
            PCIPLogger.log("adding column: "+ nameValuePair.getName().replace('.','_'));
            results.addColumn(nameValuePair.getName().replace('.', '_'), MocaType.STRING);
        }

        /* loop over the results copying SOME stuff */
        results.addRow();
        results.setStringValue(STATUS_CODE,"Success");
        for (PrintParcelResponse.OutputParameters.ShippingParameter nameValuePair : parameterList) {
            PCIPLogger.log("adding values to columns: " + nameValuePair.getName().replace('.', '_') + "|" + nameValuePair.getValue());

            results.setStringValue(nameValuePair.getName().replace('.', '_'), nameValuePair.getValue());
        }

        return results;

    }

    public MocaResults buildPrintSuccess(DeleteParcelResponse response) {

        EditableResults results = moca.newResults();

        PCIPLogger.log("building Print Success Message ");

        if(response.getExitStatus().getStatusDetails().getStatusDetail().size() != 0){

            for(DeleteParcelResponse.ExitStatus.StatusDetails.StatusDetail detail : response.getExitStatus().getStatusDetails().getStatusDetail()){
                PCIPLogger.log("Exit Status message-> Status: "+ detail.getStatus() + " | Message: "+detail.getMessage());
            }
        }

        List<DeleteParcelResponse.OutputParameters.ShippingParameter> parameterList = response.getOutputParameters().getShippingParameter();

        results.addColumn(STATUS_CODE, MocaType.STRING);

        for (DeleteParcelResponse.OutputParameters.ShippingParameter nameValuePair : parameterList) {
            PCIPLogger.log("adding column: "+ nameValuePair.getName().replace('.','_'));
            results.addColumn(nameValuePair.getName().replace('.', '_'), MocaType.STRING);
        }


        /* loop over the results copying SOME stuff */
        results.addRow();
        results.setStringValue(STATUS_CODE,"Success");
        for (DeleteParcelResponse.OutputParameters.ShippingParameter nameValuePair : parameterList) {
            PCIPLogger.log("adding values to columns: " + nameValuePair.getName().replace('.', '_') + "|" + nameValuePair.getValue());

            results.setStringValue(nameValuePair.getName().replace('.', '_'), nameValuePair.getValue());
        }

        return results;

    }

    public MocaResults buildPrintSuccess(CloseShipmentsResponse response) {

        EditableResults results = moca.newResults();

        PCIPLogger.log("building Print Success Message ");

        if(response.getExitStatus().getStatusDetails().getStatusDetail().size() != 0){

            for(CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail detail : response.getExitStatus().getStatusDetails().getStatusDetail()){
                PCIPLogger.log("Exit Status message-> Status: "+ detail.getStatus() + " | Message: "+detail.getMessage());
            }
        }

        List<CloseShipmentsResponse.OutputParameters.ShippingParameter> parameterList = response.getOutputParameters().getShippingParameter();

        results.addColumn(STATUS_CODE, MocaType.STRING);

        for (CloseShipmentsResponse.OutputParameters.ShippingParameter nameValuePair : parameterList) {
            PCIPLogger.log("adding column: "+ nameValuePair.getName().replace('.','_'));
            results.addColumn(nameValuePair.getName().replace('.', '_'), MocaType.STRING);
        }

        /* loop over the results copying SOME stuff */
        results.addRow();
        results.setStringValue(STATUS_CODE,"Success");
        for (CloseShipmentsResponse.OutputParameters.ShippingParameter nameValuePair : parameterList) {
            PCIPLogger.log("adding values to columns: " + nameValuePair.getName().replace('.', '_') + "|" + nameValuePair.getValue());

            results.setStringValue(nameValuePair.getName().replace('.', '_'), nameValuePair.getValue());
        }

        return results;

    }

    public MocaResults buildPrintFail(PrintParcelResponse response){

        MocaContext moca = MocaUtils.currentContext();


        PCIPLogger.log("building print failure message");

        EditableResults results = moca.newResults();
        String message = response.getExitStatus().getStatus();
        results.addColumn(STATUS_CODE, MocaType.STRING);
        results.addColumn(STATUS, MocaType.STRING);
        results.addRow();
        for(PrintParcelResponse.ExitStatus.StatusDetails.StatusDetail parameter : response.getExitStatus().getStatusDetails().getStatusDetail())
        {
            PCIPLogger.log("status: " + parameter.getStatus() + " | " + parameter.getMessage());
            if(parameter.getStatus().equals("Error")) {
                results.setStringValue(STATUS_CODE, parameter.getStatus());
                results.setStringValue(STATUS, parameter.getMessage());
            }
        }


        PCIPLogger.log("fail message: "+ message);


        return results;

    }

    public MocaResults buildPrintFail(DeleteParcelResponse response){

        MocaContext moca = MocaUtils.currentContext();


        PCIPLogger.log("building print failure message");

        EditableResults results = moca.newResults();
        String message = response.getExitStatus().getStatus();
        results.addColumn(STATUS_CODE, MocaType.STRING);
        results.addColumn(STATUS, MocaType.STRING);
        results.addRow();
        for(DeleteParcelResponse.ExitStatus.StatusDetails.StatusDetail parameter : response.getExitStatus().getStatusDetails().getStatusDetail())
        {
            PCIPLogger.log("status: " + parameter.getStatus() + " | " + parameter.getMessage());
            if(parameter.getStatus().equals("Error")) {
                results.setStringValue(STATUS_CODE, parameter.getStatus());
                results.setStringValue(STATUS, parameter.getMessage());
            }
        }


        PCIPLogger.log("fail message: "+ message);


        return results;

    }

    public MocaResults buildPrintFail(CloseShipmentsResponse response){

        MocaContext moca = MocaUtils.currentContext();


        PCIPLogger.log("building print failure message");

        EditableResults results = moca.newResults();
        String message = response.getExitStatus().getStatus();
        results.addColumn(STATUS_CODE, MocaType.STRING);
        results.addColumn(STATUS, MocaType.STRING);
        results.addRow();
        for(CloseShipmentsResponse.ExitStatus.StatusDetails.StatusDetail parameter : response.getExitStatus().getStatusDetails().getStatusDetail())
        {
            PCIPLogger.log("status: " + parameter.getStatus() + " | " + parameter.getMessage());
            if(parameter.getStatus().equals("Error")) {
                results.setStringValue(STATUS_CODE, parameter.getStatus());
                results.setStringValue(STATUS, parameter.getMessage());
            }
        }


        PCIPLogger.log("fail message: "+ message);


        return results;

    }

    public IRequest createRequest(LinkedHashMap<String,String> requestMap, String requestType){
        ObjectFactory factory = new ObjectFactory();
        IRequest request = null;
        if(requestType.equals("Print")) {
            request = new PrintParcelRequest();
        }else if(requestType.equals("Reprint")){
            request = new PrintParcelRequest();
        }else if(requestType.equals("Delete")){
            request = new DeleteParcelRequest();
        }else if(requestType.equals("Close")){
            request = new CloseShipmentsRequest();
        }
        PCIPLogger.log("creating request shipping parameter");
        InputParameters ShippingCollection = factory.createShippingParameterCollection();
        request.setInputParameters(factory.createShippingParameterCollection(ShippingCollection));


        for (Map.Entry<String,String> entry:requestMap.entrySet()
        ) {
            ShippingParameter parameter = new ShippingParameter();
            parameter.setName(entry.getKey());

            parameter.setValue(factory.createShippingParameterValue(entry.getValue()));

            PCIPLogger.log("creating parameter and adding to request: name= "+parameter.getName()+"value="+parameter.getValue().getValue());

            request.getInputParameters().getValue().getShippingParameter().add(parameter);
        }


        return request;
    }

    public MocaResults buildPrintNull(String status) {

        MocaContext moca = MocaUtils.currentContext();


        PCIPLogger.log("building print null message");

        EditableResults results = moca.newResults();
        String message = "Could not communicate with PCIP";
        results.addColumn(STATUS_CODE, MocaType.STRING);
        results.addColumn(STATUS, MocaType.STRING);
        results.addRow();
        results.setStringValue(STATUS_CODE, "Fail");
        results.setStringValue(STATUS,message);

        PCIPLogger.log("fail message: "+ message);

        return results;

    }
}
