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
		
		try {
			
			String timeStamp = new SimpleDateFormat("yyyy.MM.dd - HH.mm.ss (z)").format(new Date());
			String Filename = "log/HTTP_Request_" + timeStamp.substring(0,10) + ".log";
			File OutFile = new File(Filename);
			
			if (!OutFile.exists()) {
				moca.trace("Creating new log file: " + OutFile.getAbsolutePath());
				OutFile.createNewFile();
			}
			FileWriter fr = new FileWriter(OutFile, true);
			fr.write(timeStamp + " : " + message + "\n");
			fr.close();	
		
		}
		catch (Exception e) {
			moca.trace("Failed to write log message, Error: " + e.getMessage());
		}
	}

}
