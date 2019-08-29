package kn.swift.moca.utils;


import java.util.HashMap;

public class MapCreator {

    public static final String KN_CLIENT_ID = "KN.ClientID";
    public static final String KN_DEPOT = "KN.Depot";
    public static final String KN_CARRIER_ID = "KN.CarrierID";
    public static final String KN_SERVICE_LEVEL = "KN.ServiceLevel";
    public static final String KN_SSCC = "KN.SSCC";
    public static final String KN_OUTPUT_QUEUE = "KN.OutputQueue";
    public static final String KN_REPRINT = "KN.Reprint";
    public static final String KN_CLIENT_ORDER_NO = "KN.ClientOrderNo";
    public static final String KN_WAREHOUSE = "KN.Warehouse";
    public static final String RECEIVER_NAME_1 = "Receiver.Name1";
    public static final String RECEIVER_NAME_2 = "Receiver.Name2";
    public static final String RECEIVER_NAME_3 = "Receiver.Name3";
    public static final String RECEIVER_STREET = "Receiver.Street";
    public static final String RECEIVER_CITY = "Receiver.City";
    public static final String RECEIVER_POST_CODE = "Receiver.PostCode";
    public static final String RECEIVER_COUNTRY = "Receiver.Country";
    public static final String RECEIVER_TELEPHONE = "Receiver.Telephone";
    public static final String RECEIVER_EMAIL = "KN.Email";
    public static final String KN_TOTAL_PARCEL_NO = "KN.TotalParcelNo";
    public static final String PARCEL_WIDTH = "Parcel.Width";
    public static final String PARCEL_HEIGHT = "Parcel.Height";
    public static final String PARCEL_WEIGHT = "Parcel.Weight";
    public static final String PARCEL_VOLUME = "Parcel.Volume";
    public static final String PARCEL_LENGTH = "Parcel.Length";
    public static final String KN_DANGEROUS = "KN.Dangerous";
    public static final String KN_PACKAGE_TYPE_ID = "KN.PackageTypeID";
    public static final String KN_PARCEL_NUMBER = "KN.ParcelNumber";
    public static final String KN_GOODS_CONTENT = "KN.GoodsContent";
    public static final String PARCEL_REF_NO = "Parcel.RefNo";
    public static final String KN_ARTICLE_CODE = "KN.ArticleCode";

    //hardcoded values
    public static final String CTN = "CTN";

    public HashMap<String, String> createCloseMap(String client_id,
                                                  String depot,
                                                  String carcod,
                                                  String invtid) {
        HashMap<String,String> returnSet = new HashMap<>();

        returnSet.put(KN_CLIENT_ID,client_id);
        returnSet.put(KN_DEPOT,depot);
        returnSet.put(KN_CARRIER_ID,carcod);
        returnSet.put(KN_SSCC,invtid);

        return returnSet;


    }


    public HashMap<String, String> createDeleteRequestMap(String client_id,
                                                           String depot,
                                                           String carcod,
                                                           String output_queue,
                                                           String operation) {

        HashMap<String,String> returnSet = new HashMap<>();

        returnSet.put(KN_CLIENT_ID,client_id);
        returnSet.put(KN_DEPOT,depot);
        returnSet.put(KN_CARRIER_ID,carcod);
        returnSet.put(KN_OUTPUT_QUEUE, output_queue);
        returnSet.put(KN_REPRINT, operation);

        return returnSet;
    }


    public HashMap<String,String> createPrintRequestMap(String ordnum,
                                                         String wh_id,
                                                         String depot,
                                                         String client_id,
                                                         String carcod,
                                                         String cur_pkg,
                                                         String tot_pkg_count,
                                                         String weight,
                                                         String height,
                                                         String width,
                                                         String length,
                                                         String volume,
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
														 String stemail){

        HashMap<String,String> printRequestMap = new HashMap<String, String>();

        printRequestMap.put(KN_CLIENT_ORDER_NO,ordnum);
        printRequestMap.put(KN_WAREHOUSE,wh_id);
        printRequestMap.put(KN_DEPOT,depot);
        printRequestMap.put(RECEIVER_NAME_1,stname);
        printRequestMap.put(RECEIVER_NAME_2,stadd1);
        printRequestMap.put(RECEIVER_NAME_3,stadd2);
        printRequestMap.put(RECEIVER_STREET,stadd3);
        printRequestMap.put(RECEIVER_CITY,stcity);
        printRequestMap.put(RECEIVER_POST_CODE,stposc);
        printRequestMap.put(RECEIVER_COUNTRY,stcnty);
        printRequestMap.put(RECEIVER_TELEPHONE,stphon);
        printRequestMap.put(RECEIVER_EMAIL,stemail);
        printRequestMap.put(KN_CLIENT_ID,client_id);
        printRequestMap.put(KN_CARRIER_ID,carcod);
        printRequestMap.put(KN_TOTAL_PARCEL_NO,tot_pkg_count);
        printRequestMap.put(KN_SSCC,invtid);
        printRequestMap.put(PARCEL_WIDTH,width);
        printRequestMap.put(PARCEL_HEIGHT,height);
        printRequestMap.put(PARCEL_WEIGHT,weight);
        printRequestMap.put(PARCEL_VOLUME,volume);
        printRequestMap.put(PARCEL_LENGTH,length);
        printRequestMap.put(KN_REPRINT,"");//set to blank
        printRequestMap.put(KN_DANGEROUS,dg_dsc);
        printRequestMap.put(KN_PACKAGE_TYPE_ID, CTN);//need? might need to import
        printRequestMap.put(KN_PARCEL_NUMBER,cur_pkg);//need?
        printRequestMap.put(KN_GOODS_CONTENT,goods_content);//need? new parameter
        printRequestMap.put(PARCEL_REF_NO,client_id+invtid);//KN.clientID+KN.SSCC? concat
        printRequestMap.put(KN_ARTICLE_CODE,prtnum);
		printRequestMap.put(KN_OUTPUT_QUEUE, output_queue);
		printRequestMap.put(KN_SERVICE_LEVEL, srvlvl);

        return printRequestMap;

    }

    public HashMap<String,String> createReprintRequestMap(String client_id,
                                                           String depot,
                                                           String carcod,
                                                           String invtid,
                                                           String output_queue,
                                                           String operation){

        HashMap<String,String> returnSet = new HashMap<>();

        returnSet.put(KN_CLIENT_ID,client_id);
        returnSet.put(KN_DEPOT,depot);
        returnSet.put(KN_CARRIER_ID,carcod);
        returnSet.put(KN_SSCC,invtid);
        returnSet.put(KN_OUTPUT_QUEUE, output_queue);
        returnSet.put(KN_REPRINT, operation);

        return returnSet;
    }

}
