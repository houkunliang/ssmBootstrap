package com.module.messageNotify.service;

import java.util.List;
import java.util.Map;

public interface MessageNotifyService {
	
	// 添加消息通知
	String insertMessageNotify(Map<String, String> map);
	
	// 查询消息通知
	List<Map<String, String>> selectByMessageNotify(Map<String, String> map);
	
	// 修改消息通知
	int updateByMessageNotify(Map<String, String> map);
	
	// 删除消息通知
	int deleteByMessageNotify(Map<String, String> map);
	
	// 查询在线的咨询师
	List<Map<String, String>> selectIsComplete(Map<String, String> map);
	
	// 转分咨询
	String forwardMsg(Map<String, String> map);
	
	// 查看全部消息标记状态为已读
	int updateAllMessageNotify(Map<String, String> map);
	
}
