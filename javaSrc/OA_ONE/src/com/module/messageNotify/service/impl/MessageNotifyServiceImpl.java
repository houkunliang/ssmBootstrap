package com.module.messageNotify.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.module.messageNotify.dao.MessageNotifyDao;
import com.module.messageNotify.service.MessageNotifyService;
import com.module.user.dao.UserDao;
import com.utils.DateUtil;
import com.utils.idUtil;

@Service
public class MessageNotifyServiceImpl implements MessageNotifyService {
	@Resource
	MessageNotifyDao messageNotifyDao;

	@Resource
	UserDao userDao;

	public int addMessage(Map<String, String> map) {
		int size = 0;
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("MSG_USER_ID", idUtil.getID());
		maps.put("FK_MSG_ID", map.get("MSG_ID"));
		if (map.get("FK_USER_ID") != null && !map.get("FK_USER_ID").equals("")
				&& !map.get("FK_USER_ID").equals("undefined")) {
			maps.put("FK_USER_ID", map.get("FK_USER_ID"));
		} else {
			maps.put("FK_USER_ID", map.get("DC_ID"));
		}
		maps.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		maps.put("CREATED_BY", map.get("ID"));
		maps.put("IS_DELETED", "N");
		size = messageNotifyDao.insertMessageUser(maps);
		return size;
	}

	// 查询消息通知
	public List<Map<String, String>> selectByMessageNotify(
			Map<String, String> map) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			list = messageNotifyDao.selectByMessageNotify(map);
				return list;
	}

	// 修改消息通知
	public int updateByMessageNotify(Map<String, String> map) {
		map.put("CREATE_DT", DateUtil.SYSDATEFORMATE());
		return messageNotifyDao.updateByMessageNotify(map);
	}

	// 删除消息通知
	public int deleteByMessageNotify(Map<String, String> map) {
		return messageNotifyDao.deleteByMessageNotify(map);
	}

	// 查询在线的咨询师
	public List<Map<String, String>> selectIsComplete(Map<String, String> map) {
		return messageNotifyDao.selectIsComplete(map);
	}

	
	// 查看全部消息标记状态为已读
	public int updateAllMessageNotify(Map<String, String> map) {
		int size = 0;
		// 用户ID不为空
		if (map.get("USER_ID") != null && !"".equals(map.get("USER_ID"))) {
			List<Map<String, String>> list = messageNotifyDao.selectByMessageNotify(map);
			if (!list.isEmpty()) {
				for (Map<String, String> maps : list) {
					if (maps.get("MSG_ID") != null && !"".equals(maps.get("MSG_ID")) && maps.get("MSG_STATUS").equals("NO")) {
						map.put("MSG_ID",maps.get("MSG_ID"));
						map.put("MSG_STATUS", "YES");
						map.put("CREATE_DT", DateUtil.SYSDATEFORMATE());
						size = messageNotifyDao.updateByMessageNotify(map);
					}
				}
			}
		}
		return size;
	}

	@Override
	public String forwardMsg(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertMessageNotify(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
