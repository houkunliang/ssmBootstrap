package com.module.msg.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.module.msg.dao.MsgDao;
import com.module.msg.service.MsgService;
import com.utils.DateUtil;
import com.utils.JsonUtils;
import com.utils.idUtil;

@Service("msgService")
public class MsgServiceImpl implements MsgService {
	@Resource
	private MsgDao dao;

	@Override
	public List<Map<String, Object>> selectByMsg(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByMsg(map);
	}

	@Override
	public int insertTmsg(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		map.put("ID", idUtil.getID());
		map.put("SUB_DATE", DateUtil.date2TimeStamp(map.get("SUB_DATE"), "yyyy-MM-dd HH:mm:ss"));
		map.put("CREATED_BY", userId);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.insertTmsg(map);
	}

	@Override
	public int updateByTmsg(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		if(map.get("SUB_DATE") != null && !("").equals(map.get("SUB_DATE"))){
			map.put("SUB_DATE", DateUtil.date2TimeStamp(map.get("SUB_DATE"), "yyyy-MM-dd HH:mm:ss"));
		}
		map.put("UPDATED_BY", userId);
		map.put("UPDATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.updateByTmsg(map);
	}

	@Override
	public List<Map<String, Object>> selectByMsgInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByMsgInfo(map);
	}

	@Override
	public List<Map<String, Object>> selectHomeDpMsg(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectHomeDpMsg(map);
	}

	@Override
	public List<Map<String, Object>> selectHomeDpMsgInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectHomeDpMsgInfo(map);
	}

	@Override
	public List<Map<String, Object>> selectBannerList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectBannerList(map);
	}

	@Override
	public int updateByMsgBanner(Map<String, String> map) {
		// TODO Auto-generated method stub
		String msgs = map.get("msgs");
		if(msgs != null && !("").equals(msgs)){
			String[] msgArr = msgs.split(",");
			dao.updateByMsgBanner(map);
			for(int i = 0 ;i < msgArr.length ;i++){
				Map<String, String> setMap = new HashMap<String, String>();
				setMap.put("ID", msgArr[i]);
				setMap.put("BANNER",(i+1)+"");
				dao.updateByTmsg(setMap);
			}
		}else{
			return 0;
		}
		return 1;
	}

	@Override
	public int insertFroDiv(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		map.put("ID", idUtil.getID());
		map.put("CREATED_BY", userId);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.insertFroDiv(map);
	}

	@Override
	public int updateFroDiv(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.updateFroDiv(map);
	}

	@Override
	public List<Map<String, Object>> selectFroDiv(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectFroDiv(map);
	}

	@Override
	public List<Map<String, Object>> selectMsgToforDiv(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectMsgToforDiv(map);
	}
	
	@Override
	@Transactional(readOnly = false, rollbackFor = RuntimeException.class)
	public int setMsgs(Map<String, String> map) {
		// TODO Auto-generated method stub
		String msgIds = map.get("msgIds");
		dao.delFroDivMsg(map.get("FD_ID"));
		if(msgIds != null && !("").equals(msgIds)){
			String[] arrQ = msgIds.split(",");
			for(int s = 0 ; s < arrQ.length;s++){
				Map<String, String> addMap = new HashMap<String, String>();
				addMap.put("FOR_DIV_ID", map.get("FD_ID"));
				addMap.put("MSG_ID", arrQ[s]);
				if(dao.insertFroDivMsg(addMap) <= 0){
					throw new RuntimeException("设置异常请稍后再试！");
				}
			}
		}
		return 1;
	}

	@Override
	public List<Map<String, Object>> selectMsgToforDivInfor(
			Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectMsgToforDivInfor(map);
	}

}
