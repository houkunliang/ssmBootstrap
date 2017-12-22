package com.module.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;



public interface UserService {
	/**
	 * 用户匹配通用查询语句
	 * @param map
	 * @return
	 */
	List<Map<String,String>> selectByPrimaryKey(Map<String,String> map);
	
	/**
	 * 用户对应的权限
	 * @param map
	 * @return
	 */
	List<Map<String,String>> userRootToMenu(Map<String,String> map);
	
	/**
	 * 根据ID查询当前用户下对应哪些角色
	 * @param map
	 * @return
	 */
	List<Map<String,String>> userToRoleInfo(Map<String,String> map);
	
	List<Map<String,String>> Login(Map<String,String> map);
	/**
	 * 重写登录接口，得到公司
	 * @param map
	 * @return
	 */
	List<Map<String,String>> Logins(Map<String,String> map);
	/**
	 * 删除user
	 * @param map
	 * @return
	 */
	int deleteByPrimaryKey(Map<String,String> map);
	
	/**
	 * 插入用户
	 * @param map
	 * @return
	 */
	int insertSelective(Map<String,String> map);
	
	/**
	 * 单一用户信息修改
	 * @param map
	 * @return
	 */
	int updateObj(Map<String, String> map);
	
	/**
	 * 修改用户(角色参数)
	 * @param map
	 * @return
	 */
	int updateByPrimaryKeySelective(Map<String, String> map);
	
	
	
	/**
	 * 用户验证
	 * @param map
	 * @return
	 */
	List<Map<String,String>> querValidate(Map<String,String> map);
	
	
	int insertSRU(Map<String,String> map);
	
	int deleteBySRU(Map<String,String> map);
	
	int deleteByValidate(Map<String,String> map);
	
	int insertValidate(Map<String,String> map);
	
	int updateByValidate(Map<String,String> map);
	
	int updateByOnLine(Map<String, String> map); // 修改当前用户的在线状态
	
	List<Map<String, String>> queryByNotOnLine(Map<String, String> map); // 查询在线的咨询师
	
	List<Map<String, String>> queryByNotOnLine1(Map<String, String> map);
	
	int insertOrdUser(Map<String, String> map); // 添加咨询师中间表
	
	/**
	 * 根据角色查询菜单(左边菜单栏)
	 * @param map
	 * @return
	 */
	List<Map<String, String>> switchByMenu(Map<String, String> map);
	/**
	 * 根据公司查询角色
	 * @param map
	 * @return
	 */
	List<Map<String, String>> selectByRegionUser(Map<String, String> map);
	
	// 查询部门角色
	List<Map<String, String>> selectAllDp(Map<String, String> map);
	
	/**
	 * 查询所有咨询师
	 * @param map
	 * @return
	 */
	List<Map<String, String>> selectAllConsult(Map<String, String> map);

	/**
	 * 微信号验证用户
	 * @param map
	 * @return
	 */
	List<Map<String, String>> queryByUserObj(Map<String, String> map);
	
	/**
	 * 党员检索
	 * @param map
	 * @return
	 */
	List<Map<String, String>> partyMemberSearch(Map<String, String> map);
	
	/**
	 * 党员追踪管理时间轴新增操作
	 * @param map
	 * @return
	 */
	int insertUserLog(String type,String optionName,String pkId,String FRACTION,String userId);
	
	/**
	 * 根据年月来统计当前用户得分状况
	 * @param map
	 * @return
	 */
	List<Map<String, String>> achievementToMonth(Map<String, String> map);
	
	/**
	 * 当月得分详情（计分管理与展示）
	 * @param map
	 * @return
	 */
	List<Map<String, String>> achievementToMonthInfo(Map<String, String> map);
	
	/**
	 * 查询该选项是否得分
	 * @param map
	 * @return
	 */
	boolean queryLogUtil(String PK_ID,String USER_ID);
	
	/**
	 * 查询当天登陆情况
	 * @param USER_ID
	 * @return
	 */
	boolean queryLogLogin(String USER_ID);
	
	/**
	 * 插入节点
	 * @param map
	 * @return
	 */
	int insertProcessNode(Map<String, String> map);
	
	/**
	 * 返回预备党员流程情况
	 * @param map
	 * @return
	 */
	List<Map<String, String>> selectProcessNode(Map<String, String> map);
}
