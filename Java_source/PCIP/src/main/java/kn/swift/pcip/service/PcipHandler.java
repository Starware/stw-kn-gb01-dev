package kn.swift.pcip.service;


import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;

import kn.swift.ms.pcip.dto.printresponse.PrintParcelResponse;
import kn.swift.ms.pcip.dto.deleteresponse.DeleteParcelResponse;
import kn.swift.ms.pcip.dto.closeresponse.CloseShipmentsResponse;

import kn.swift.ms.pcip.dto.CloseShipmentsRequest;
import kn.swift.ms.pcip.dto.DeleteParcelRequest;
import kn.swift.ms.pcip.dto.PrintParcelRequest;
import kn.swift.pcip.service.closeshipments.CloseShipmentsService;
import kn.swift.pcip.service.deleteparcel.DeleteParcelService;
import kn.swift.pcip.service.printparcel.PrintParcelService;

import java.util.HashMap;
import java.util.Map;



public class PcipHandler {

    private static final String CTRL_SEG_UUID = "//*[name()='CTRL_SEG']/*[name()='UUID']/text()";
    private PrintParcelService printParcelService;
    private CloseShipmentsService closeShipmentsService;
    private DeleteParcelService deleteParcelService;


    public PcipHandler(PrintParcelService printParcelService){
        this.printParcelService = printParcelService;
    }


    public PcipHandler(CloseShipmentsService closeShipmentsService){
        this.closeShipmentsService = closeShipmentsService;
    }

    public PcipHandler(DeleteParcelService deleteParcelService){
        this.deleteParcelService = deleteParcelService;
    }

    public PrintParcelResponse handle(PrintParcelRequest request){
        Map<String, Object> headers = new HashMap<>();

        String uuid = null;

        headers.put("X_KN_SWIFT_WMS_UUID", uuid);
        PrintParcelResponse response = null;

        MocaContext moca = MocaUtils.currentContext();

        moca.trace("trying to send parcel");
        try {

            moca.trace("entered try block");

            response =  printParcelService.printParcel(request, headers);

        } catch (Exception e) {
            moca.trace("Issue with interface "+ e);
        }

        moca.trace("returning printresponse to LC_PCIP");

        return response;
    }

    public CloseShipmentsResponse handle(CloseShipmentsRequest request){
        Map<String, Object> headers = new HashMap<>();
        MocaContext moca = MocaUtils.currentContext();
        String uuid = null;

        headers.put("X_KN_SWIFT_WMS_UUID", uuid);
        CloseShipmentsResponse response = null;
        try {
            response = closeShipmentsService.closeShipments((CloseShipmentsRequest) request, headers);

        } catch (Exception e) {
            moca.trace("problem with interface: "+ e.getMessage());
        }
        return response;
    }

    public DeleteParcelResponse handle(DeleteParcelRequest request){

        Map<String, Object> headers = new HashMap<>();
        MocaContext moca = MocaUtils.currentContext();
        String uuid = null;

        headers.put("X_KN_SWIFT_WMS_UUID", uuid);
        DeleteParcelResponse response = null;
        try {
            response = deleteParcelService.deleteParcel((DeleteParcelRequest) request, headers);

        } catch (Exception e) {
            moca.trace("Issue with interface"+ e.getMessage());
        }
        return response;

    }

}
