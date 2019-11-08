package kn.swift.moca.utils;
import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import com.redprairie.moca.MocaResults;
import com.redprairie.moca.MocaException;

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

    public static final String PRODUCT_CODE = "Product.Code.1.";
    public static final String PRODUCT_DESCRIPTION = "Product.Description.1.";
    public static final String PRODUCT_HARMONISATION_CODE = "Product.TypeDescription2.1.";
    public static final String PRODUCT_TYPE_DESCRIPTION = "Product.TypeDescription1.1.";
    public static final String PRODUCT_QUANTITY = "Product.Quantity.1.";
    public static final String PRODUCT_MANUFACTURE_DATE = "Product.Date1.1.";
    public static final String PRODUCT_EXPIRY_DATE = "Product.Date2.1.";
    public static final String PRODUCT_VALUE = "Product.Value.1."; 

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

        int ProductCount = 0;
		
		PCIPLogger.log("Adding main shipping parameters");
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
		PCIPLogger.log("Shipping parameters added");
		
		// get the item info
		MocaContext moca = MocaUtils.currentContext();
		
		MocaResults res = null;
		String MocaCommand = "[select prtmst.prtnum, "
					+				"prtdsc.lngdsc description, "
        			+				"inventory_view.untqty, "
        			+				"nvl(prtmst.comcod,' ') harmonisation_code, "
        			+				"nvl(prtmst.prtfam,' ') product_type, "
        			+				"nvl(TO_CHAR(inventory_view.mandte, 'YYYY-MM-DD HH24:MI'),' ') manufacture_date, "
        			+				"nvl(TO_CHAR(inventory_view.expire_dte, 'YYYY-MM-DD HH24:MI'),' ') expiry_date, "
        			+				"prtmst.untcst product_value "
					+		"from inventory_view, "
        			+				"prtmst, "
        			+				"prtdsc "
					+		"where (lodnum = '" + invtid + "' or subnum = '" + invtid + "')"
					+			"and prtmst.prtnum = inventory_view.prtnum "
    				+			"and prtmst.wh_id_tmpl = inventory_view.wh_id "
    				+			"and prtmst.prt_client_id = inventory_view.prt_client_id "
    				+			"and prtdsc.colnam = 'prtnum|prt_client_id|wh_id_tmpl' "
    				+			"and prtdsc.colval = prtmst.prtnum || '|' || prtmst.prt_client_id || '|' || prtmst.wh_id_tmpl "
    				+			"and prtdsc.locale_id = nvl(@locale_id, @@locale_id)] catch(-1403) ";
						
        try {
                PCIPLogger.log("Getting item info");
				PCIPLogger.log(MocaCommand);
				res = moca.executeInline(MocaCommand);

        }
		catch (MocaException e) {
				PCIPLogger.log("*** COMMAND FAILED ***");
		}		
			// reset the pointer to the first record 
			res.reset();

			PCIPLogger.log("About to add article information");
			// loop over the results copying SOME stuff
			while(res.next()) {
				PCIPLogger.log("Adding article information");
				ProductCount++;

				printRequestMap.put(PRODUCT_CODE + Integer.toString(ProductCount), res.getString("prtnum").trim());
				printRequestMap.put(PRODUCT_DESCRIPTION + Integer.toString(ProductCount), res.getString("description").trim());
				printRequestMap.put(PRODUCT_HARMONISATION_CODE + Integer.toString(ProductCount), res.getString("harmonisation_code").trim());
				printRequestMap.put(PRODUCT_TYPE_DESCRIPTION + Integer.toString(ProductCount), res.getString("product_type").trim());
				printRequestMap.put(PRODUCT_QUANTITY + Integer.toString(ProductCount), Integer.toString(res.getInt("untqty")));
				printRequestMap.put(PRODUCT_MANUFACTURE_DATE + Integer.toString(ProductCount), res.getString("manufacture_date").trim());
				printRequestMap.put(PRODUCT_EXPIRY_DATE + Integer.toString(ProductCount), res.getString("expiry_date").trim());
				printRequestMap.put(PRODUCT_VALUE + Integer.toString(ProductCount), Double.toString(res.getDouble("product_value")));

			}
		
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
