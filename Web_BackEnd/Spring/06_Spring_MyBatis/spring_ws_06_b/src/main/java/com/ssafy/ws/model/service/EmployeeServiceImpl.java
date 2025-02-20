package com.ssafy.ws.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ws.model.dao.EmployeeDao;
import com.ssafy.ws.model.dto.EmployeeDto;

/*
 * EmployeeServiceImpl은 EmployeeService를 구현하는 클래스입니다.
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao dao;

	@Override
	public EmployeeDto getEmployeeById(int id) throws SQLException {
		return dao.selectOne(id);
	}

	@Override
	public List<EmployeeDto> getAllEmployees() throws SQLException {
		return dao.selectAll();
	}

	@Override
	public void insert(EmployeeDto employee) throws SQLException {
        dao.insert(employee);
	}

	@Override
	public void update(EmployeeDto employee) throws SQLException {
		dao.update(employee);
	}

	@Override
	public void delete(int id) throws SQLException {
		dao.delete(id);
	}
}
