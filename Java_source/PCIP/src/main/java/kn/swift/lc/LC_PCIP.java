package kn.swift.lc;


import com.redprairie.moca.*;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.moca.utils.*;
import kn.swift.ms.pcip.dto.CloseShipmentsRequest;
import kn.swift.ms.pcip.dto.DeleteParcelRequest;
import kn.swift.ms.pcip.dto.PrintParcelRequest;
import kn.swift.ms.pcip.dto.closeresponse.CloseShipmentsResponse;
import kn.swift.ms.pcip.dto.deleteresponse.DeleteParcelResponse;
import kn.swift.ms.pcip.dto.printresponse.PrintParcelResponse;
import kn.swift.pcip.service.PcipHandler;
import kn.swift.pcip.service.closeshipments.CloseShipmentsService;
import kn.swift.pcip.service.deleteparcel.DeleteParcelService;
import kn.swift.pcip.service.printparcel.PrintParcelService;

import java.util.*;


public class LC_PCIP {

    private final MapCreator mapCreator = new MapCreator();
    private final PropertyUpdater propertyUpdater = new PropertyUpdater();

    public MocaResults createLcPcipConsignment(String url,
                                             String culture,
                                             String user_id,
                                             String password,
                                             String applicationid,
                                             String businesskey1,
                                             String businesskey2,
                                             String businesskey3,
                                             String businesskey4,
                                             String ordnum,
                                             String wh_id,
                                             String depot,
                                             String client_id,
                                             String carcod,
                                             int cur_pkg,
                                             int tot_pkg_count,
                                             double weight,
                                             double height,
                                             double width,
                                             double length,
                                             double volume,
                                             String stname,
                                             String stadd1,
                                             String stadd2,
                                             String stadd3,
                                             String stcity,
                                             String stposc,
                                             String stcnty,
                                             String stphon,
                                             String invtid,
                                             String prtnum,
                                             String dg_dsc,
                                             String goods_content,
                                             String output_queue,
											 String srvlvl,
											 String stemail) throws MocaException {





        Logger.log("entered printParcel");
        Logger.log("updating properties");
        propertyUpdater.updatePcipProperties(url,
                culture,
                user_id,
                password,
                applicationid,
                businesskey1,
                businesskey2,
                businesskey3,
                businesskey4);
        Logger.log("creating printRequest Map");
        HashMap<String,String> requestMap = mapCreator.createPrintRequestMap(
                ordnum,
                wh_id,
                depot,
                client_id,
                carcod,
                Integer.toString(cur_pkg),
                Integer.toString(tot_pkg_count),
                Double.toString(weight),
                Double.toString(height),
                Double.toString(width),
                Double.toString(length),
                Double.toString(volume),
                stname,
                stadd1,
                stadd2,
                stadd3,
                stcity,
                stposc,
                stcnty,
                stphon,
                invtid,
                prtnum,
                dg_dsc,
                goods_content,
                output_queue,
				srvlvl,
				stemail);

        PrintUtils utils = new PrintUtils();
        Logger.log("creating request");
        PrintParcelRequest request = (PrintParcelRequest) utils.createRequest(requestMap, "Print");

        PrintParcelService service = new PrintParcelService();

        PcipHandler handler = new PcipHandler(service);
        Logger.log("sending message to api");
        PrintParcelResponse response = handler.handle(request);


        MocaResultsService returnService = new MocaResultsService(utils);

        Logger.log("returning printresponse to WMS");
        return returnService.buildMocaResult(response);
    }

    public MocaResults reprintPCIPConsignment(String url,
                                          String culture,
                                          String user_id,
                                          String password,
                                          String applicationid,
                                          String businesskey1,
                                          String businesskey2,
                                          String businesskey3,
                                          String businesskey4,
                                          String client_id,
                                          String depot,
                                          String carcod,
                                          String invtid,
                                          String output_queue,
                                          String operation) throws MocaException{



        Logger.log("entered reprintParcel");

        Logger.log("updating properties");
        propertyUpdater.updatePcipProperties(url,
                culture,
                user_id,
                password,
                applicationid,
                businesskey1,
                businesskey2,
                businesskey3,
                businesskey4);


        Logger.log("creating reprint Map");
        HashMap<String,String> reprintMap = mapCreator.createReprintRequestMap(client_id,
                depot,
                carcod,
                invtid,
                output_queue,
                operation);

        PrintUtils utils = new PrintUtils();

        Logger.log("creating request");
        PrintParcelRequest request = (PrintParcelRequest) utils.createRequest(reprintMap,"Reprint");

        PrintParcelService service = new PrintParcelService();

        PcipHandler handler = new PcipHandler(service);
        Logger.log("sending request");
        PrintParcelResponse response = handler.handle(request);

        MocaResultsService returnService = new MocaResultsService(utils);
        Logger.log("returning printresponse to WMS");
        return returnService.buildMocaResult(response);
    }

    public MocaResults cancelPCIPConsignment(String url,
                                             String culture,
                                             String user_id,
                                             String password,
                                             String applicationid,
                                             String businesskey1,
                                             String businesskey2,
                                             String businesskey3,
                                             String businesskey4,
                                             String client_id,
                                             String depot,
                                             String carcod,
                                             String output_queue,
                                             String operation) throws MocaException{



        Logger.log("entered cancel Parcel");

        Logger.log("setting properties");
        propertyUpdater.updatePcipProperties(url,
                culture,
                user_id,
                password,
                applicationid,
                businesskey1,
                businesskey2,
                businesskey3,
                businesskey4);

        Logger.log("creating cancel Map");
        HashMap<String,String> deleteMap = mapCreator.createDeleteRequestMap(client_id,
                depot,
                carcod,
                output_queue,
                operation);

        PrintUtils utils = new PrintUtils();

        Logger.log("creating cancel request");
        DeleteParcelRequest request = (DeleteParcelRequest) utils.createRequest(deleteMap, "Delete");

        DeleteParcelService service = new DeleteParcelService();

        PcipHandler handler = new PcipHandler(service);

        Logger.log("sending cancel request to api");
        DeleteParcelResponse response = handler.handle(request);

        MocaResultsService returnService = new MocaResultsService(utils);


        Logger.log("returning printresponse to WMS");
        return returnService.buildMocaResult(response);
    }

    public MocaResults closePCIPManifest(String url,
                                         String culture,
                                         String user_id,
                                         String password,
                                         String applicationid,
                                         String businesskey1,
                                         String businesskey2,
                                         String businesskey3,
                                         String businesskey4,
                                         String client_id,
                                         String depot,
                                         String carcod,
                                         String invtid) throws MocaException {

        MocaContext moca = MocaUtils.currentContext();

        Logger.log("entered close consignment");

        Logger.log("updating properties");
        propertyUpdater.updatePcipProperties(url,
                culture,
                user_id,
                password,
                applicationid,
                businesskey1,
                businesskey2,
                businesskey3,
                businesskey4);

        Logger.log("creating close Map");
        HashMap<String,String> closeMap = mapCreator.createCloseMap(client_id,
                depot,
                carcod,
                invtid);

        PrintUtils utils = new PrintUtils();

        Logger.log("creating request");
        CloseShipmentsRequest request = (CloseShipmentsRequest) utils.createRequest(closeMap, "Close");

        CloseShipmentsService service = new CloseShipmentsService();

        PcipHandler handler = new PcipHandler(service);

        Logger.log("sending printresponse to api");
        CloseShipmentsResponse response = handler.handle(request);

        MocaResultsService returnService = new MocaResultsService(utils);

        Logger.log("returning printresponse to WMS");
        return returnService.buildMocaResult(response);


    }
}
