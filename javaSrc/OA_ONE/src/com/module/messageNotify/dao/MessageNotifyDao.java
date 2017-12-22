package com.module.messageNotify.dao;

import java.util.List;
import java.util.Map;

public interface MessageNotifyDao {

	// 添加通知消息
	int insertMessageNotify(Map<String, String> map); 
	
	// 添加ID到中间表
	int insertMessageUser(Map<String, String> map); 

	// 查询消息通知列表
	List<Map<String, String>> selectByMessageNotify(Map<String, String> map);

	// 修改消息通知
	int updateByMessageNotify(Map<String, String> map);

	// 删除消息通知
	int deleteByMessageNotify(Map<String, String> map);
	
	// 查询在线的咨询师
	List<Map<String, String>> selectIsComplete(Map<String, String> map);
}
