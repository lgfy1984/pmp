package com.tianjian.comm.struts.servlet;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;
/**
 * COMM_CONFIG_LOCATION_TOWN
 * @author Dzenall
 * @since 2008-9-17
 */
public class CommConfigLocationTownInit {
	private static HashMap<String, String> tjProperty;

	public static HashMap<String, String> getTjProperty() {
		return tjProperty;
	}

	public static void setTjProperty(HashMap<String, String> tjProperty) {
		CommConfigLocationTownInit.tjProperty = tjProperty;
	}

	public CommConfigLocationTownInit() {
		 setTjProperty(tjProperty);;
	}

	static {
		try{
			reloadAll();
		} catch(Exception e) {	
			throw new RuntimeException(e.toString());
		}
	}

	private static void reloadAll() {
		if(tjProperty == null)	tjProperty = new HashMap<String, String>();
		strageMsg();
	}

	private static void strageMsg() {
		HashMap<String, String> map = new HashMap<String, String>();
		Properties p = new Properties();
		try {
			p.load((com.tianjian.comm.struts.servlet.CommConfigLocationTownInit.class).getClassLoader().getResourceAsStream("conf/basecomm/CommInit.properties"));

			String key;
			String value;
			for(Enumeration<?> enu = p.propertyNames(); enu.hasMoreElements(); map.put(key, value))
			{
				key = (String)enu.nextElement();
				value = p.getProperty(key);
			}
		} catch(FileNotFoundException e) {
			throw new RuntimeException(e.toString());
		} catch(IOException io){
			throw new RuntimeException(io.toString());
		}
		tjProperty = map;
	}

	public static int getPageSize(String key) {
		int str = 10;
		if(tjProperty != null) {
			if(tjProperty.containsKey(key)){
				str = Integer.valueOf((String)tjProperty.get(key)).intValue();            	
			}

		}
		return str;
	}
	public static String getProperty(String key) {
		String str = "";
		if(tjProperty != null) {
			if(tjProperty.containsKey(key)){
				str = (String)tjProperty.get(key);            	
			}

		}
		return str;
	}
}
