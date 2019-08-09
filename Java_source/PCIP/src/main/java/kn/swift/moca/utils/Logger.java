package kn.swift.moca.utils;

import com.redprairie.moca.MocaContext;
import com.redprairie.moca.util.MocaUtils;

public class Logger {

    public static void log(String message){
        MocaContext moca = MocaUtils.currentContext();
        moca.trace(message);
    }

}
