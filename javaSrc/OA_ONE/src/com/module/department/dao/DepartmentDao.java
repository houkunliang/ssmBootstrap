package com.module.department.dao;

import java.util.List;
import java.util.Map;

public interface DepartmentDao {
	/**
	 * department匹配通用查询语句
	 * @param map
	 * @return
	 */
	List<Map<String,String>> selectByDepartment(Map<String,String> map);
	
	/**
	 * 删除department
	 * @param map
	 * @return
	 */
	int deleteByDepartment(Map<String,String> map);
	
	/**
	 * 插入department
	 * @param map
	 * @return
	 */
	int insertByDepartment(Map<String,String> map);
	
	/**
	 * 修改department
	 * @param map
	 * @return
	 */
	int updateByDepartment(Map<String, String> map);
	/**
	 * 查询region列表
	 * @param map
	 * @return
	 */
	List<Map<String,String>> queryRegionSelect(Map<String, String> map);

}
