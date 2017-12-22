package com.module.bulletin.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.module.bulletin.dao.BulletinDao;
import com.module.bulletin.service.BulletinService;
import com.utils.DateUtil;
import com.utils.JsonUtils;
import com.utils.idUtil;

@Service("bulletinService")
public class BulletinServiceImpl implements BulletinService {
	@Resource
	private BulletinDao dao;

	/*@Override
	@Transactional(readOnly = false, rollbackFor = RuntimeException.class)*/

	@Override
	public List<Map<String, String>> selectByPrimaryKey(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(map);
	}

	@Override
	public int insertBulletin(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		map.put("ID", idUtil.getID());
		map.put("SUB_DATE", DateUtil.date2TimeStamp(map.get("SUB_DATE"), "yyyy-MM-dd HH:mm:ss"));
		map.put("CREATED_BY", userId);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.insertBulletin(map);
	}

	@Override
	public int updateByBulletin(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		if(map.get("SUB_DATE") != null && !("").equals(map.get("SUB_DATE"))){
			map.put("SUB_DATE", DateUtil.date2TimeStamp(map.get("SUB_DATE"), "yyyy-MM-dd HH:mm:ss"));
		}
		map.put("CREATED_BY", userId);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.updateByBulletin(map);
	}

	@Override
	public List<Map<String, Object>> selectByPublication(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByPublication(map);
	}

	@Override
	public int insertByPublication(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		map.put("ID", idUtil.getID());
		map.put("CREATED_BY", userId);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.insertByPublication(map);
	}

	@Override
	public int updateByPublication(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		map.put("CREATED_BY", userId);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.updateByPublication(map);
	}

}
