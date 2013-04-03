package com.apollo89.mybatis_sample;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionFactory;

import com.apollo89.mybatis_sample.SqlSessionFactoryManager;

public class ItemDao {
	
	SqlSessionFactory sqlMapper = SqlSessionFactoryManager.getSqlSessionFactory();
	
	public ItemDao() {
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<HashMap<String, String>> getItemAll(){ 
		return (ArrayList)sqlMapper.openSession().selectList("mybatis_sample.getItemAll");
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<HashMap<String, String>> getItems(HashMap<String, String> map){ 
		return (ArrayList)sqlMapper.openSession().selectList("mybatis_sample.getItems",map);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<HashMap<String, String>> getItems2(HashMap<String, String> map){ 
		return (ArrayList)sqlMapper.openSession().selectList("mybatis_sample.getItems2",map);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<HashMap<String, String>> getItem(HashMap<String, String> map){ 
		return (ArrayList)sqlMapper.openSession().selectList("mybatis_sample.getItem",map);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<HashMap<String, String>> getItem2(HashMap<String, String> map){ 
		return (ArrayList)sqlMapper.openSession().selectList("mybatis_sample.getItem2",map);
	}
	
}
