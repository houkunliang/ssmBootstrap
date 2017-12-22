package com.module.user.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.module.user.dao.UserDao;
import com.module.user.service.UserService;
import com.utils.ChineseCharacterUtil;
import com.utils.DateUtil;
import com.utils.JsonUtils;
import com.utils.idUtil;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao dao;

	/*@Override
	@Transactional(readOnly = false, rollbackFor = RuntimeException.class)*/
	
	@Override
	public int deleteByPrimaryKey(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKey(map);
	}

	@Override
	public int insertSelective(Map<String, String> map) {
		// TODO Auto-generated method stub
		String strId = idUtil.getID();
		map.put("ID", strId);
		map.put("CREATE_DATE", DateUtil.SYSDATE("yyyy-MM-dd HH:mm:ss"));
		if (map.get("ROLE_ID") != null && !map.get("ROLE_ID").equals("")) {
			JSONArray jsonarry = JSONArray.fromObject(map.get("ROLE_ID"));
			Object[] array = jsonarry.toArray();
			for (int i = 0; i < array.length; i++) {
				Map<String, String> hsMap = new HashMap<String, String>();
				hsMap.put("USER_ID", strId);
				hsMap.put("ROLE_ID", array[i] + "");
				hsMap.put("ID", idUtil.getID());
				dao.insertSRU(hsMap);
				map.put("ROLE_ID", array[i] + "");
				List<Map<String, String>> list = dao.queryByRoleName(map);
				if (!list.isEmpty()
						&& list.get(0).get("ROLE_NAME").equals("咨询师")) {
					Map<String, String> ordMap = new HashMap<String, String>(); // 排序中间表
					ordMap.put("ORD_USER_ID", idUtil.getID());
					ordMap.put("FK_USER_ID", strId);
					ordMap.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
					dao.insertOrdUser(ordMap);
				}
			}
		}
		return dao.insertSelective(map);
	}

	@Override
	@Transactional(readOnly = false, rollbackFor = RuntimeException.class)
	public int updateByPrimaryKeySelective(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("UPDATE_DATE", DateUtil.SYSDATE("yyyy-MM-dd HH:mm:ss"));
		Map<String, String> delMap = new HashMap<String, String>();
		delMap.put("USER_ID", map.get("ID"));
		dao.deleteBySRU(delMap);
		if (map.get("ROLE_ID") != null && !map.get("ROLE_ID").equals("")
				&& !map.get("ROLE_ID").equals("null")) {
			/*JSONArray jsonarry = JSONArray.fromObject(map.get("ROLE_ID"));
			Object[] array = jsonarry.toArray();
			for (int i = 0; i < array.length; i++) {
				Map<String, String> hsMap = new HashMap<String, String>();
				hsMap.put("USER_ID", map.get("ID"));
				hsMap.put("ROLE_ID", array[i] + "");
				hsMap.put("ID", idUtil.getID());
				dao.insertSRU(hsMap);
			}*/
			Map<String, String> hsMap = new HashMap<String, String>();
			hsMap.put("USER_ID", map.get("ID"));
			hsMap.put("ROLE_ID", map.get("ROLE_ID"));
			hsMap.put("ID", idUtil.getID());
			dao.insertSRU(hsMap);
		}
		return dao.updateByPrimaryKeySelective(map);
	}

	@Override
	public List<Map<String, String>> selectByPrimaryKey(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(map);
	}

	@Override
	public List<Map<String, String>> querValidate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.querValidate(map);
	}

	@Override
	public int deleteByValidate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteByValidate(map);
	}

	@Override
	public int insertValidate(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("ID", idUtil.getID());
		map.put("CHARE_DT", DateUtil.SYSDATEFORMATE());
		return dao.insertValidate(map);
	}

	@Override
	public int updateByValidate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.updateByValidate(map);
	}

	@Override
	public List<Map<String, String>> userRootToMenu(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.userRootToMenu(map);
	}

	@Override
	public List<Map<String, String>> Login(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.Login(map);
	}
	
	/**
	 * updateBy:侯
	 */
	@Override
	public List<Map<String, String>> Logins(Map<String, String> map) {
		// TODO Auto-generated method stub
		List<Map<String,String>> list =dao.Login(map);
		if(list !=null && list.size() > 0){
			if(list.get(0).get("IS_SUPER") != null && !("").equals(list.get(0).get("IS_SUPER"))){
				if(("1").equals(list.get(0).get("IS_SUPER"))){
					return  list;
				}else{
					return dao.Logins(map);
				}
			}
		}
		return null;
	}

	@Override
	public List<Map<String, String>> userToRoleInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.userToRoleInfo(map);
	}

	@Override
	public int insertSRU(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.insertSRU(map);
	}

	@Override
	public int deleteBySRU(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteBySRU(map);
	}

	/**
	 * 修改当前用户在线状态
	 */
	@Override
	public int updateByOnLine(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.updateByOnLine(map);
	}

	@Override
	public List<Map<String, String>> queryByNotOnLine(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.queryByNotOnLine(map);
	}

	@Override
	public int insertOrdUser(Map<String, String> map) {
		map.put("ORD_USER_ID", idUtil.getID());
		// map.put("FK_USER_ID", strId);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.insertOrdUser(map);
	}

	@Override
	public List<Map<String, String>> queryByNotOnLine1(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.queryByNotOnLine1(map);
	}

	@Override
	public int updateObj(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("UPDATE_DATE", DateUtil.SYSDATE("yyyy-MM-dd HH:mm:ss"));
		return dao.updateByPrimaryKeySelective(map);
	}

	/**
	 * 根据角色查询菜单(左边菜单栏)
	 * @param map
	 * @return
	 */
	public List<Map<String, String>> switchByMenu(Map<String, String> map) {
		
		return dao.switchByMenu(map);
	}

	@Override
	public List<Map<String, String>> selectByRegionUser(Map<String, String> map) {
		return dao.selectByRegionUser(map);
	}

	
	public List<Map<String, String>> selectAllDp(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectAllDp(map);
	}

	/**
	 * 查询所有咨询师
	 */
	public List<Map<String, String>> selectAllConsult(Map<String, String> map) {
		
		return dao.selectAllConsult(map);
	}

	@Override
	public List<Map<String, String>> queryByUserObj(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.queryByUserObj(map);
	}

	@Override
	public List<Map<String, String>> partyMemberSearch(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.partyMemberSearch(map);
	}

	@Override
	public int insertUserLog(String type, String optionName,String pkId,String FRACTION,String userId) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("ID", idUtil.getID());
		map.put("TYPE", type);
		if(pkId != null && !pkId.equals("")){
			map.put("PK_ID", pkId);
		}
		map.put("OPTION_NAME", optionName);
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		map.put("CREATED_BY", userId);
		return dao.insertUserLog(map);
	}

	@Override
	public List<Map<String, String>> achievementToMonth(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		map.put("USER_ID", userId);
		return dao.achievementToMonth(map);
	}

	@Override
	public List<Map<String, String>> achievementToMonthInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = JsonUtils.jsonToMap(map.get("token")).get("ID");
		map.put("USER_ID", userId);
		return dao.achievementToMonthInfo(map);
	}

	@Override
	public boolean queryLogUtil(String PK_ID,String USER_ID) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("PK_ID", PK_ID);
		map.put("USER_ID", USER_ID);
		List<Map<String, String>> list = dao.queryLogUtil(map);
		return (list != null && list.size() > 0) ? true:false;
	}

	@Override
	public boolean queryLogLogin(String USER_ID) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("USER_ID", USER_ID);
		List<Map<String, String>> list = dao.queryLogLogin(map);
		return (list != null && list.size() > 0) ? true:false;
	}

	@Override
	public int insertProcessNode(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("ID", idUtil.getID());
		map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		return dao.insertProcessNode(map);
	}

	@Override
	public List<Map<String, String>> selectProcessNode(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectProcessNode(map);
	}
}
