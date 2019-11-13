package kn.swift.lc;


import com.redprairie.moca.*;
import com.redprairie.moca.util.MocaUtils;
import kn.swift.moca.utils.*;
import java.io.IOException;
import java.net.URL;
import java.net.HttpURLConnection;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.BufferedReader;
import java.io.DataOutputStream;


import java.util.*;


public class LC_HTTPRequest {
		
	public MocaResults createLcXMLData(String prolog,
										String root_node) throws MocaException {
											
		String XMLData = "";
		
        MocaContext moca = MocaUtils.currentContext();
		Logger.log("Creating new XML data");

        XMLData = prolog.trim();
		XMLData = XMLData + "<" + root_node.trim() + "></" + root_node.trim() + ">";
		
        EditableResults results = moca.newResults();
		results.addColumn("XML_DataString", MocaType.STRING);
		results.addRow();
        results.setStringValue("XML_DataString", XMLData);
        return results;
    }

	public MocaResults sendhttpRequest(String url,
										String xmldata) throws Exception {
				

		MocaContext moca = MocaUtils.currentContext();
		Logger.log("SendHTTPRequest function START");
		Logger.log("URL: [" + url + "]");
		Logger.log("XML Data: [" + xmldata + "]");
		
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/xml");
        con.setRequestProperty("Accept", "text/xml");
        con.setDoOutput(true);

        Logger.log("Writing XML data to endpoint");
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(xmldata);
        wr.flush();
        wr.close();

        Logger.log("Getting response from endpoint");
        int responseStatus = con.getResponseCode();
        Logger.log("Response status: [" + Integer.toString(responseStatus) + "]");
        
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        Logger.log("Response string: [" + response.toString() + "]");
	
		
        EditableResults results = moca.newResults();
        results.addColumn("http_status", MocaType.INTEGER);
        results.addColumn("http_response", MocaType.STRING);
        
        results.addRow();
        results.setIntValue("http_status", responseStatus);
        results.setStringValue("http_response", response.toString());
        return results;

}

	public MocaResults addLcXMLSegment(String XML_DataString,
										String parent_node,
										String segment_name) throws MocaException {
											
		String parent_close = "</" + parent_node + ">";		
		String XMLData = "";
		int parent_close_point = 0;
		
        XML_DataString = XML_DataString.trim();
        parent_node = parent_node.trim();
        segment_name = segment_name.trim();
        
        MocaContext moca = MocaUtils.currentContext();
		Logger.log("Searching for closure of " + parent_close);
		
		parent_close_point = XML_DataString.indexOf(parent_close);
		if (parent_close_point == -1 ) {
			Logger.log("Cannot find parent node [" + parent_close + "] in [" + XML_DataString + "]");
			XMLData = XML_DataString;
		}
		else {
			XMLData = XML_DataString.substring(0, parent_close_point);
			XMLData = XMLData + "<" + segment_name + "></" + segment_name + ">" + XML_DataString.substring(parent_close_point);			
		}
		
        EditableResults results = moca.newResults();
		results.addColumn("XML_DataString", MocaType.STRING);
		results.addRow();
		results.setStringValue("XML_DataString", XMLData);
        return results;
    }

	public MocaResults addLcXMLtag(String XML_DataString,
			String parent_node,
			String tag_name,
			String value) throws MocaException {
				
		String parent_close = "</" + parent_node.trim() + ">";		
		String XMLData = "";
		int parent_close_point = 0;
		
		XML_DataString = XML_DataString.trim();
		parent_node = parent_node.trim();
		tag_name = tag_name.trim();
		
		MocaContext moca = MocaUtils.currentContext();
		Logger.log("Searching for closure of " + parent_close);
		
		parent_close_point = XML_DataString.indexOf(parent_close);
		if (parent_close_point < 0 ) {
			Logger.log("Cannot find parent node [" + parent_close + "] in [" + XML_DataString + "]");
			XMLData = XML_DataString;
		}
		else {
			XMLData = XML_DataString.substring(0, parent_close_point);
			XMLData = XMLData + "<" + tag_name + ">" + value + "</" + tag_name + ">" + XML_DataString.substring(parent_close_point);			
		}
		
		EditableResults results = moca.newResults();
		results.addColumn("XML_DataString", MocaType.STRING);
		results.addRow();
		results.setStringValue("XML_DataString", XMLData);
		return results;
	}

	public MocaResults renameXMLSegment(String XML_DataString,
										String segment_name,
										String new_segment_name,
										String new_segment_close_name) throws MocaException {
				
		String segment_open = "<" + segment_name.trim() + ">";		
		String XMLData = "";
		int segment_open_point = 0;
		
		XML_DataString = XML_DataString.trim();
		segment_name = segment_name.trim();
		new_segment_name = new_segment_name.trim();
		
		MocaContext moca = MocaUtils.currentContext();
		Logger.log("Searching for opening tag " + segment_open);
		
		segment_open_point = XML_DataString.indexOf(segment_open);
		if (segment_open_point < 0 ) {
			Logger.log("Cannot find segment [" + segment_open + "] in [" + XML_DataString + "]");
			XMLData = XML_DataString;
		}
		else {
			XMLData = XML_DataString.substring(0, segment_open_point);
			XMLData = XMLData + "<" + new_segment_name + ">"  + XML_DataString.substring(segment_open_point + segment_open.length());
			
	        if (new_segment_close_name != null && new_segment_close_name.trim().length() > 0) {
	            
	        	XML_DataString = XMLData;
	        	String segment_close = "</" + segment_name.trim() + ">";
	        	XMLData = "";
	    		int segment_close_point = 0;
	    		
	    		Logger.log("Searching for closing tag " + segment_close);
	        	
	    		segment_close_point = XML_DataString.indexOf(segment_close);
	    		if (segment_close_point > -1) {
	    			XMLData = XML_DataString.substring(0, segment_close_point);
	    			XMLData = XMLData + "</" + new_segment_close_name + ">"  + XML_DataString.substring(segment_close_point + segment_close.length());
	    		}
	    		
	        }		
		}
		
		EditableResults results = moca.newResults();
		results.addColumn("XML_DataString", MocaType.STRING);
		results.addRow();
		results.setStringValue("XML_DataString", XMLData);
		return results;
	}
	
	public MocaResults extractXMLData(String XML_DataString,
										String tag_list) throws MocaException {
		
		int StartTag = 0;
		int EndTag = 0;
		String ColNames[]= tag_list.split(",");
		String CleanedString;
		boolean StartNewRow;
		
		MocaContext moca = MocaUtils.currentContext();
		Logger.log("Extracting XML data as MOCA variables");
		
		EditableResults results = moca.newResults();
		for (String colname: ColNames){
			CleanedString = CleanString(colname);
			Logger.log("Adding column to data: [" + CleanedString + "] for column [" + colname + "]" );
			results.addColumn(CleanedString, MocaType.STRING);
		}
		
		do {
			StartNewRow = true;
			for (String colname: ColNames){
				int StartData;
				
				CleanedString = CleanString(colname);
				StartTag = XML_DataString.indexOf("<" + colname + ">");
				if (StartTag > -1) {
					Logger.log("Found <" + colname + "> at " + StartTag);
					StartData = StartTag + colname.length() + 2;
					EndTag = XML_DataString.indexOf("</" + colname + ">", StartTag + 1);	
					
					XML_DataString = XML_DataString.substring(0,StartTag) + "_" + colname + "_" + XML_DataString.substring(StartData);
				
					if (StartTag > -1 && EndTag > -1) {
						Logger.log("Matching data for [" + CleanedString + "/" + colname + "] at " + StartData + " - " + EndTag);			
		
						if (StartNewRow) { 
							Logger.log("Adding new row to result set");
							results.addRow(); 
							StartNewRow = false; 
						}
						Logger.log("Adding data for [" + CleanedString + "/" + colname + "], value [" + XML_DataString.substring(StartData, EndTag) + "]");
						results.setStringValue(CleanedString, XML_DataString.substring(StartData, EndTag));
					}
				}
			}
			
		} while (!StartNewRow);
		
		return results;
				
	}
	
	public MocaResults getAllXMLDataParemeters(String XML_DataString,
												String repeating_segment_name,
												String col_name_tag,
												String value_tag) throws MocaException {
		
		int SegStart = 0, SegEnd = -1;
		String Segment;
		String XML_DataStringCopy = XML_DataString;
		
		MocaContext moca = MocaUtils.currentContext();
		Logger.log("Extracting repeating name/value pairs as MOCA variables");
		
		EditableResults results = moca.newResults();
		
		Logger.log("GETTING DATA COLUMNS");
		do {
			String Colnam;
			
			Logger.log("Search string: [" + XML_DataString + "]");
			SegStart = XML_DataString.indexOf("<" + repeating_segment_name + ">");
			SegEnd = XML_DataString.indexOf("</" + repeating_segment_name + ">", SegStart) + repeating_segment_name.length() + 3;
			Logger.log("SegStart/SegEnd = " + SegStart + "/" + SegEnd);
			if (SegStart == -1 || SegEnd == -1) { break; }
			
			Segment = XML_DataString.substring(SegStart,SegEnd);
			XML_DataString = XML_DataString.substring(SegEnd);
			
			if (Segment.length() == 0) { break; }
			
			Colnam = GetDataVal(Segment,col_name_tag);
			Logger.log("Adding column to result set: [" + Colnam + "]");
			results.addColumn(CleanString(Colnam), MocaType.STRING);
			
		} while (XML_DataString.indexOf(repeating_segment_name) > -1);
		
		XML_DataString = XML_DataStringCopy;
		results.addRow(); 
		SegEnd = 0;
		SegStart = -1;
		
		Logger.log("GETTING DATA VALUES");
		do {
			String DataVal;
			String Colnam;
			
			SegStart = XML_DataString.indexOf("<" + repeating_segment_name + ">");
			SegEnd = XML_DataString.indexOf("</" + repeating_segment_name + ">", SegStart) + repeating_segment_name.length() + 3;
			if (SegStart == -1 || SegEnd == -1) { break; }
			
			Segment = XML_DataString.substring(SegStart,SegEnd);
			XML_DataString = XML_DataString.substring(SegEnd);
			Logger.log("FOUND segment (" + SegStart + "/" + SegEnd + ") : [" + Segment + "]");
			
			Colnam = GetDataVal(Segment,col_name_tag);;
			DataVal = GetDataVal(Segment,value_tag);
			if (Colnam.length() > 0 && DataVal.length() > 0) {
				Logger.log("Adding value to column [" + Colnam + "], value [" + DataVal + "]");
				results.setStringValue(CleanString(Colnam), DataVal);
			}
			
			
		} while (XML_DataString.indexOf(repeating_segment_name) > -1);
		Logger.log("COMPLETED");
		
		return results;	
	}

	private String GetDataVal(String XMLData,
								String Tag_name) {
		
		int StartData, EndData;
		String RetString = "";
		
		Logger.log("Getting data val for tag [" + Tag_name + "] from " + XMLData);
		StartData = XMLData.indexOf("<" + Tag_name + ">") + Tag_name.length() + 2;
		EndData = XMLData.indexOf("</" + Tag_name + ">");
		
		if (StartData > -1 && EndData > -1) {
			RetString = XMLData.substring(StartData, EndData);
			Logger.log("Data value returned for [" + Tag_name + "] is [" + RetString + "]");
		}
		
		return RetString;
	}

	
	private String CleanString(String DirtyString) {
		String CleanString;
		CleanString = DirtyString.replace(":", "_");
		CleanString = CleanString.replace(".", "_");
		if (!DirtyString.equals(CleanString)) {
			Logger.log("String [" + DirtyString + "] cleaned to [" + CleanString + "]");
		}
		return CleanString;
	}
}
