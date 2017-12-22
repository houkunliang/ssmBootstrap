package com.module.department.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.module.department.dao.DepartmentDao;
import com.module.department.service.DepartmentService;
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService{
	@Resource
	private DepartmentDao dao;

	@Override
	public List<Map<String, String>> selectByDepartment(Map<String, String> map) {
		return dao.selectByDepartment(map);
	}

	@Override
	public int deleteByDepartment(Map<String, String> map) {
		return dao.deleteByDepartment(map);
	}

	@Override
	public int insertByDepartment(Map<String, String> map) {
		
		return dao.insertByDepartment(map);
	}

	@Override
	public int updateByDepartment(Map<String, String> map) {
	
		return dao.updateByDepartment(map);
	}

	@Override
	public List<Map<String, String>> queryRegionSelect(Map<String, String> map) {
		return dao.queryRegionSelect(map);
	}
	
	
}
