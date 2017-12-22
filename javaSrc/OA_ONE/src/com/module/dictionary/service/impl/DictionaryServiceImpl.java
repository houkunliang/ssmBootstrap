package com.module.dictionary.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.module.dictionary.dao.DictionaryDao;
import com.module.dictionary.service.DictionaryService;
import com.utils.DateUtil;
import com.utils.idUtil;

@Service("dictionaryService")
public class DictionaryServiceImpl implements DictionaryService {

	@Resource
	DictionaryDao dictionaryDao;

	@Override
	public int addDictionary(Map<String, String> map) throws Exception {
		List<Map<String, String>> list = dictionaryDao.selectByCondition(map);
		if (list.isEmpty() && list.size() == 0) {
			map.put("SD_ID", idUtil.getID());
			map.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
			return dictionaryDao.insertDictionary(map);
		}
		return 0;
	}

	@Override
	public List<Map<String, String>> findDictionary(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dictionaryDao.selectByDictionary(map);
	}

	@Override
	public int updateByDictionary(Map<String, String> map) {
		List<Map<String, String>> list1 = dictionaryDao.selectByDictionary(map);
		if (list1.size() > 0
				&& !list1.get(0).get("CODE").equals(map.get("CODE"))
				&& map.get("CODE") != null) {
			map.put("TYPE_CODE", list1.get(0).get("TYPE_CODE"));
			List<Map<String, String>> list = dictionaryDao
					.selectByCondition(map);
			if (list.isEmpty() && list.size() == 0) {
				map.put("UPDATED_DT", DateUtil.SYSDATEFORMATE());
				return dictionaryDao.updateByDictionary(map);
			}
		} else {
			map.put("UPDATED_DT", DateUtil.SYSDATEFORMATE());
			return dictionaryDao.updateByDictionary(map);
		}
		return 0;
	}

	@Override
	public int deleteByDictionary(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dictionaryDao.deleteByDictionary(map);
	}

}
