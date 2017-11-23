package com.tianjian.util;

import java.sql.Types;

import org.hibernate.dialect.Oracle10gDialect;
import org.hibernate.Hibernate;

public class MyOracleDialect extends Oracle10gDialect{
	public MyOracleDialect(){
	     super();
//	     registerHibernateType(1, "string");     
//	     registerHibernateType(-9, "string");     
//	     registerHibernateType(-16, "string");     
//	     registerHibernateType(3, "double"); 
	     registerHibernateType(Types.CHAR, Hibernate.STRING.getName());     
	     registerHibernateType(Types.NVARCHAR, Hibernate.STRING.getName());     
	     registerHibernateType(Types.LONGNVARCHAR, Hibernate.STRING.getName());     
	     registerHibernateType(Types.DECIMAL, Hibernate.DOUBLE.getName());		
	}
}