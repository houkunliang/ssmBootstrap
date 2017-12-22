package com.module.menu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.module.menu.dao.MenuDao;
import com.module.menu.service.MenuService;
import com.utils.DateUtil;
import com.utils.JsonUtils;
import com.utils.idUtil;


@Service("menuService")
public class MenuServiceImpl implements MenuService {
	@Resource
	private MenuDao dao;

	@Override
	public int deleteByPrimaryKey(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKey(map);
	}

	@Override
	public int insertSelective(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("MENU_ID",idUtil.getID());
		map.put("CREATED_DT",DateUtil.SYSDATEFORMATE());
		return dao.insertSelective(map);
	}

	@Override
	public int updateByPrimaryKeySelective(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("UPDATE_DT",DateUtil.SYSDATEFORMATE());
		return dao.updateByPrimaryKeySelective(map);
	}

	@Override
	public List<Map<String, String>> selectMenuByPrimaryKey(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectMenuByPrimaryKey(map);
	}

	@Override
	public List<Map<String, String>> queryMenuSelect(Map<String, String> map) {
		// TODO Auto-generated method stub
		Map<String,String> map2=new HashMap<String, String>();
		List<Map<String,String>> list=dao.selectMenuByPrimaryKey(map2);
		String idArr[]={map.get("MENU_ID_RE")};
		if(list!=null&&list.size()>0){
			List<Map<String,String>> resuleList=recursion(list,idArr);
			for (int  i = resuleList.size() - 1; i >= 0; i--) {
				if(resuleList.get(i).get("MENU_ID").equals(map.get("MENU_ID_RE"))){
					resuleList.remove(resuleList.get(i));
				}
	        }
			return resuleList;
		}
		return null;
	}
	
	private List<Map<String, String>> recursion(List<Map<String,String>> list,String[] id) {
		List<Map<String,String>> comList=list;
		StringBuffer sb=new StringBuffer();
		boolean falg=false;
		for (int  i = comList.size() - 1; i >= 0; i--) {
        	for(int s=0;s<id.length;s++){
				if(comList.get(i).get("PARENT_ID").equals(id[s])){
					sb.append(comList.get(i).get("MENU_ID")+",");
					//System.out.println(comList.get(i));
					comList.remove(comList.get(i));
					falg=true;
				}
			}
        }
		if(falg){
			String str = sb.toString();
			return recursion(comList,str.substring(0, str.length()-1).split(","));	
		}
		return comList;
	}

	@Override
	public List<Map<String, String>> MenuAndButtonList(Map<String, String> map) {
		// TODO Auto-generated method stub
		List<Map<String,String>> menuList=new ArrayList<Map<String,String>>();
		menuList.addAll(dao.selectMenuByPrimaryKey(map));
		List<Map<String,String>> buttonList=dao.buttonList(map);
		if(buttonList != null && buttonList.size()>0){
			for(Map<String,String> itro:buttonList){
				menuList.add(itro);
			}
		}
		return menuList;
	}

	@Override
	public int insertButton(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("ID", idUtil.getID());
		map.put("CREATED_DT",DateUtil.SYSDATEFORMATE());
		map.put("CREATED_BY",JsonUtils.jsonToMap(map.get("token")).get("ID"));
		return dao.insertButton(map);
	}

	@Override
	public int updateByButton(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("UPDATED_DT",DateUtil.SYSDATEFORMATE());
		map.put("UPDATED_BY",JsonUtils.jsonToMap(map.get("token")).get("ID"));
		return dao.updateByButton(map);
	}

	@Override
	public List<Map<String, String>> buttonSelect(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.buttonSelect(map);
	}

	@Override
	public List<Map<String, String>> roleToButtonList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.roleToButtonList(map);
	}

	@Override
	public int deleteButtonRole(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteButtonRole(map);
	}

	@Override
	public int insertButtonRole(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("ID", idUtil.getID());
		return dao.insertButtonRole(map);
	}

	@Override
	public List<Map<String, String>> userToRooleButton(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.userToRooleButton(map);
	}

}
