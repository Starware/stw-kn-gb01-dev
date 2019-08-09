package kn.swift.moca.utils;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.MocaResults;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.ms.pcip.dto.IResponse;
import kn.swift.ms.pcip.dto.closeresponse.CloseShipmentsResponse;
import kn.swift.ms.pcip.dto.deleteresponse.DeleteParcelResponse;
import kn.swift.ms.pcip.dto.printresponse.PrintParcelResponse;

public class MocaResultsService {

    private PrintUtils printUtils;


    public MocaResultsService(PrintUtils printUtils){

        this.printUtils = printUtils;
    }

    public MocaResults buildMocaResult(PrintParcelResponse response){
        boolean isNull = false;
        MocaResults results = null;
        Logger.log("choosing moca resultSet to return");
        String status = "";
        try{
             status = response.getExitStatus().getStatus();
        }catch(NullPointerException Exception){
            Logger.log("printresponse was Null");
            status = "null";
        }
        if(status.equals("Success")){
            Logger.log("status is Success, building print success message");
            results = printUtils.buildPrintSuccess(response);
        }else if(status.equals("Error")){
            Logger.log("status is Error, building print fail message");
            results = printUtils.buildPrintFail(response);
        }else{
            Logger.log("status is "+status+", returning empty result set");
            results = printUtils.buildPrintNull(status);
        }
        return results;
    }

    public MocaResults buildMocaResult(DeleteParcelResponse response){
        boolean isNull = false;
        MocaResults results = null;
        Logger.log("choosing moca resultSet to return");
        String status = "";
        try{
            status = response.getExitStatus().getStatus();
        }catch(NullPointerException Exception){
            Logger.log("printresponse was Null");
            status = "null";
        }
        if(status.equals("Success")){
            Logger.log("status is success, building print success message");
            results = printUtils.buildPrintSuccess(response);
        }else if(status.equals("Error")){
            Logger.log("status is Error, building print fail message");
            results = printUtils.buildPrintFail(response);
        }else{
            Logger.log("status is "+status+", returning empty result set");
            results = printUtils.buildPrintNull(status);
        }
        return results;
    }

    public MocaResults buildMocaResult(CloseShipmentsResponse response){
        boolean isNull = false;
        MocaResults results = null;
        Logger.log("choosing moca resultSet to return");
        String status = "";
        try{
            status = response.getExitStatus().getStatus();
        }catch(NullPointerException Exception){
            Logger.log("printresponse was Null");
            status = "null";
        }
        if(status.equals("Success")){
            Logger.log("status is success, building print success message");
            results = printUtils.buildPrintSuccess(response);
        }else if(status.equals("Error")){
            Logger.log("status is Error, building print fail message");
            results = printUtils.buildPrintFail(response);
        }else{
            Logger.log("status is "+status+", returning empty result set");
            results = printUtils.buildPrintNull(status);
        }
        return results;
    }
}
