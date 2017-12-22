package com.module.role.service;

import java.util.List;
import java.util.Map;



public interface RoleService {
	/**
	 * 角色匹配通用查询语句
	 * @param map
	 * @return
	 */
	List<Map<String,String>> selectByRole(Map<String,String> map);
	
	/**
	 * 删除user
	 * @param map
	 * @return
	 */
	int deleteByRole(Map<String,String> map);
	
	/**
	 * 插入角色
	 * @param map
	 * @return
	 */
	int insertByRole(Map<String,String> map);
	/**
	 * 修改角色对应部门
	 * @param map
	 * @return
	 */
	int updateRTD(Map<String,String> map);
	/**
	 * 修改角色
	 * @param map
	 * @return
	 */
	int updateByRole(Map<String, String> map);
	/**
	 * 在修改Role时删除中间表
	 * @param map
	 * @return
	 */
	int deleteRRTable(Map<String, String> map);
	
	int insertByRoleOpt(Map<String, String> map);
	
	int deleteByRoleOpt(Map<String, String> map);

	int insertRoleRegion(Map<String, String> map);
	/**
	 * 当前角色下有哪些可操作菜单
	 * @param map
	 * @return
	 */
	List<Map<String,String>> selectByRoleToMenu(Map<String,String> map);
}
