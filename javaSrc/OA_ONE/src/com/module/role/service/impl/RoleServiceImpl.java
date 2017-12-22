package com.module.role.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.module.role.dao.RoleDao;
import com.module.role.service.RoleService;
import com.utils.DateUtil;
import com.utils.idUtil;


@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao dao;

	@Override
	public int deleteByRole(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteByRole(map);
	}

	@Override
	public int insertByRole(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.insertByRole(map);
	}

	@Override
	public int updateByRole(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("UPDATE_DT",DateUtil.SYSDATEFORMATE());
		return dao.updateByRole(map);
	}

	@Override
	public List<Map<String, String>> selectByRole(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByRole(map);
	}

	@Override
	public int insertByRoleOpt(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("ROLE_OPT_ID",idUtil.getID());
		return dao.insertByRoleOpt(map);
	}

	@Override
	public int deleteByRoleOpt(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteByRoleOpt(map);
	}

	@Override
	public List<Map<String, String>> selectByRoleToMenu(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByRoleToMenu(map);
	}

	@Override
	public int updateRTD(Map<String, String> map) {
		return dao.updateRTD(map);
	}

	@Override
	public int insertRoleRegion(Map<String, String> map) {
		return dao.insertRoleRegion(map);
	}

	@Override
	public int deleteRRTable(Map<String, String> map) {
		return dao.deleteRRTable(map);
	}

}
