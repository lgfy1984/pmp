package com.tianjian.pm.struts.comm;

import javax.naming.Binding;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *  ��tomcat ��server.xml������ȫ�ֻ�������ֵ���ڱ�����ȡ��
 *
 */
public class ReadProper {
	private static Log log = LogFactory.getLog(ReadProper.class);
	private static String webAppIpAndPort = "tianjian";
	static {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			webAppIpAndPort = (String)(envContext.lookup("webAppIpAndPort"));
		} catch (NamingException e) {
			log.error(e.getMessage(), e);
			//e.printStackTrace();
			//System.out.println("�޷���conf/server.xml�ж�ȡȫ�ֱ���!");
		}
	}
	public static String getValue(){
		return webAppIpAndPort;
	}
}
