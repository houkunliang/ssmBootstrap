package com.module.region.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.module.region.dao.RegionDao;
import com.module.region.service.RegionService;
import com.utils.DateUtil;
import com.utils.idUtil;


@Service("regionService")
public class RegionServiceImpl implements RegionService {
	@Resource
	private RegionDao dao;

	@Override
	public int deleteByRegion(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteByRegion(map);
	}

	@Override
	public int insertByRegion(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("REGION_ID",idUtil.getID());
		map.put("CREATED_DT",DateUtil.SYSDATEFORMATE());
		return dao.insertByRegion(map);
	}

	@Override
	public int updateByRegion(Map<String, String> map) {
		// TODO Auto-generated method stub
		map.put("UPDATE_DT",DateUtil.SYSDATEFORMATE());
		return dao.updateByRegion(map);
	}

	@Override
	public List<Map<String, String>> selectByRegion(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectByRegion(map);
	}

	@Override
	public List<Map<String, String>> queryMenuSelect(Map<String, String> map) {
		// TODO Auto-generated method stub
		Map<String,String> map2=new HashMap<String, String>();
		List<Map<String,String>> list=dao.selectByRegion(map2);
		String idArr[]={map.get("REGION_ID_RE")};
		if(list!=null&&list.size()>0){
			List<Map<String,String>> resuleList=recursion(list,idArr);
			for (int  i = resuleList.size() - 1; i >= 0; i--) {
				if(resuleList.get(i).get("REGION_ID").equals(map.get("REGION_ID_RE"))){
					resuleList.remove(resuleList.get(i));
				}
	        }
			//System.out.println("+++++++++++++++++++++++++++++++++++:"+resuleList);
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
	public List<Map<String, String>> queryRegionRoleSelect(Map<String, String> map) {
		List<Map<String, String>> list = dao.queryRegionRoleSelect(map);
		for (Map<String, String> map2 : list) {
			if (map2.get("TYPE") != null && !"".equals(map2.get("TYPE"))) {
				if (map2.get("TYPE").equals("0")) {
					map2.put("icon", "fa fa-home");//增加公司图标
				}else{
					//if (map2.get("NAME").indexOf("开发部")!= -1) {
					//	map2.put("icon", "glyphicon glyphicon-heart");
					//}else {
					map2.put("icon", "fa fa-handshake-o");//增加部门图标
					//}
				}
			}else {
				map2.put("icon", "fa fa-user");//增加员工图标
				//map2.put("tags", "['0']");
			}
		}
		return list;
	}

	@Override
	public List<Map<String, String>> queryRegionRole(Map<String, String> map) {
		return dao.queryRegionRole(map);
	}

	@Override
	public List<Map<String, String>> queryUser(Map<String, String> map) {
		return dao.queryUser(map);
	}

	@Override
	public List<Map<String, String>> queryRoleNull(Map<String, String> map) {
		return dao.queryRoleNull(map);
	}

	@Override
	public List<Map<String, String>> queryRegionByLogUser(
			Map<String, String> map) {
		/*List<Map<String, String>> list = dao.queryRegionByLogUser(map);
		for (Map<String, String> map2 : list) {
			map2.put("NAME", "<><html:option><img src='"+map2.get("REGION_HEADIMG")+"' alt='Cloud Admin Logo' class='img-responsive' height='30' width='120' id='reg_img'>");
			map2.put("NAME", map2.get("REGION_HEADIMG"));
		}*/
		return dao.queryRegionByLogUser(map);
	}


}
