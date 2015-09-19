package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.Employee;

public interface EmployeeRepository {
	
	Employee find(Integer id);
	Employee find(String username);
	List<Employee> findAll();
	void persist(Employee employee);
	void update(Employee employee);
	
}
