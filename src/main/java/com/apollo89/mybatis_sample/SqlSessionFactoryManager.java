package com.apollo89.mybatis_sample;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;


public class SqlSessionFactoryManager {

	private static Logger log = Logger.getLogger(SqlSessionFactoryManager.class);
	private static final SqlSessionFactory sqlMapper;
	
	static{
		String resource = "SqlMapConfig.xml";
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlMapper = new SqlSessionFactoryBuilder().build(reader);
	}
	
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlMapper;   
	}

	
}

