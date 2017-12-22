package com.module.menu.dao;

import java.util.List;
import java.util.Map;


public interface MenuDao {
	/**
	 * 菜单匹配通用查询语句
	 * @param map
	 * @return
	 */
	List<Map<String,String>> selectMenuByPrimaryKey(Map<String,String> map);
	
	
	/**
	 * 查询当前菜单下面所有的按钮权限
	 * @param map
	 * @return
	 */
	List<Map<String,String>> buttonList(Map<String,String> map);
	
	/**
	 * button表单查
	 * @param map
	 * @return
	 */
	List<Map<String,String>> buttonSelect(Map<String,String> map);
	
	/**
	 * 角色对应按钮查询
	 * @param map
	 * @return
	 */
	List<Map<String,String>> roleToButtonList(Map<String,String> map);
	
	/**
	 * 用户对应操作权限
	 * @param map
	 * @return
	 */
	List<Map<String,String>> userToRooleButton(Map<String,String> map);
	
	/**
	 * 删除中间表
	 * @param map
	 * @return
	 */
	int deleteButtonRole(Map<String,String> map);
	
	int insertButtonRole(Map<String,String> map);
	
	/**
	 * 插入button权限
	 * @param map
	 * @return
	 */
	int insertButton(Map<String,String> map);
	
	int updateByButton(Map<String,String> map);
	
	/**
	 * 删除user
	 * @param map
	 * @return
	 */
	int deleteByPrimaryKey(Map<String,String> map);
	
	/**
	 * 插入菜单
	 * @param map
	 * @return
	 */
	int insertSelective(Map<String,String> map);
	
	/**
	 * 修改菜单
	 * @param map
	 * @return
	 */
	int updateByPrimaryKeySelective(Map<String, String> map);
	
}