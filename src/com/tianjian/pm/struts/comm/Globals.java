package com.tianjian.pm.struts.comm;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;


public class Globals {

	public static final String CONTEXT_PATH = "path";
	public static final String CONTEXT_ABSOLUTEPATH="abpath";
	public static final String NOW_TIME = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
	public static final int PAGESIZE = 12;

	private static Globals constants = new Globals();
	public static Globals getInstance() {
        return constants;
    	}

	//本服务器集群中的别名，在群中要唯一性
	private static String clusterServerName;
	public void setClusterServerName(String clusterServerName){
		this.clusterServerName = clusterServerName;
	}
	public static String getClusterServerName(){
		return clusterServerName;
	}


	public static String getWebAppIpAndPort(){
		return ReadProper.getValue();
	}

}
