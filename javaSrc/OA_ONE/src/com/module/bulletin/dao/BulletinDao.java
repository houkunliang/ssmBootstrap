package com.module.bulletin.dao;

import java.util.List;
import java.util.Map;


public interface BulletinDao {
	/**
	 * 公告查询
	 * @param map
	 * @return
	 */
	List<Map<String,String>> selectByPrimaryKey(Map<String,String> map);
	
	/**
	 * 新增公告
	 * @param map
	 * @return
	 */
	int insertBulletin(Map<String,String> map);
	
	/**
	 * 修改公告
	 * @param map
	 * @return
	 */
	int updateByBulletin(Map<String,String> map);
	
	/**
	 * 查询刊物表
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> selectByPublication(Map<String,String> map);
	
	/**
	 * 刊物新增
	 * @param map
	 * @return
	 */
	int insertByPublication(Map<String,String> map);
	
	/**
	 * 刊物修改
	 * @param map
	 * @return
	 */
	int updateByPublication(Map<String,String> map);
}