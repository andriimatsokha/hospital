package ua.pp.kaeltas.hospital.service;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.Employee;

public interface EmployeeService {
	
	Employee find(Integer id);
	Employee find(String username);
	List<Employee> findAll();
	void save(Employee employee);
}
