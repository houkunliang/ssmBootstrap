package com.module.region.dao;

import java.util.List;
import java.util.Map;


public interface RegionDao {
	/**
	 * 区域匹配通用查询语句
	 * @param map
	 * @return
	 */
	List<Map<String,String>> selectByRegion(Map<String,String> map);
	
	/**
	 * 删除user
	 * @param map
	 * @return
	 */
	int deleteByRegion(Map<String,String> map);
	
	/**
	 * 插入区域
	 * @param map
	 * @return
	 */
	int insertByRegion(Map<String,String> map);
	
	/**
	 * 修改区域
	 * @param map
	 * @return
	 */
	int updateByRegion(Map<String, String> map);
	
	/**
	 * 选择变更所用
	 * @param map
	 * @return
	 */
	List<Map<String,String>> queryMenuSelect(Map<String,String> map);
	/**
	 * 查询所有公司部门和员工
	 * @param map
	 * @return
	 */
	List<Map<String,String>> queryRegionRoleSelect(Map<String,String> map);
	/**
	 * 查询部门下员工人数
	 * @param map
	 * @return
	 */
	List<Map<String,String>> queryRegionRole(Map<String,String> map);
	/**
	 * 查询人数
	 * @param map
	 * @return
	 */
	List<Map<String,String>> queryUser(Map<String,String> map);
	/**
	 * 查询部门人数为空的部门信息
	 * @param map
	 * @return
	 */
	List<Map<String,String>> queryRoleNull(Map<String,String> map);
	/**
	 * 根据登陆角色查询公司
	 * @param map 需要登陆角色id
	 * @return
	 */
	List<Map<String,String>> queryRegionByLogUser(Map<String,String> map);
	
}