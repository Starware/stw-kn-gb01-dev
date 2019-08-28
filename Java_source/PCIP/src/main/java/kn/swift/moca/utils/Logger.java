package kn.swift.moca.utils;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;
import java.io.FileWriter;  
import java.text.SimpleDateFormat;
import java.util.*;  
import java.io.File;

public class Logger {

    public static void log(String message){
        MocaContext moca = MocaUtils.currentContext();
        moca.trace(message);
		PCIPlog(message);
    }
	
	public static void PCIPlog(String message) {
		
        MocaContext moca = MocaUtils.currentContext();
        
		try {
			File OutFile = new File("log/PCIP_comms.log");
			String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
			
			if (!OutFile.exists()) {
				moca.trace("Creating new log file: " + OutFile.getAbsolutePath());
				OutFile.createNewFile();
			}
			FileWriter fr = new FileWriter(OutFile, true);
			fr.write(timeStamp + " : " + message + "\n");
			fr.close();		
		
		}
		catch (Exception e) {
			moca.trace("Failed to write PCIP_Comms.log, Error: " + e.getMessage());
		}
	}

}
