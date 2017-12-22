package com.module.msg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


public interface MsgDao {
	/**
	 * msg列表
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> selectByMsg(Map<String,String> map);
	
	List<Map<String,Object>> selectByMsgInfo(Map<String,String> map);
	
	/**
	 * 新增msgdao
	 * @param map
	 * @return
	 */
	int insertTmsg(Map<String,String> map);
	
	/**
	 * 修改dao
	 * @param map
	 * @return
	 */
	int updateByTmsg(Map<String,String> map);
	
	/**
	 * 首页中部组织机构信息发布展示栏
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> selectHomeDpMsg(Map<String,String> map);
	
	/**
	 * 组织机构信息发布展示栏 点击进入 详情列表
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> selectHomeDpMsgInfo(Map<String,String> map);
	
	/**
	 * banner图列表接口
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> selectBannerList(Map<String,String> map);
	
	int updateByMsgBanner(Map<String,String> map);
	
	int insertFroDiv(Map<String,String> map);
	int updateFroDiv(Map<String,String> map);
	int insertFroDivMsg(Map<String,String> map);
	int delFroDivMsg(@Param("FOR_DIV_ID")String FOR_DIV_ID);
	
	List<Map<String,Object>> selectFroDiv(Map<String,String> map);
	
	List<Map<String,Object>> selectMsgToforDiv(Map<String,String> map);
	
	List<Map<String,Object>> selectMsgToforDivInfor(Map<String,String> map);
}