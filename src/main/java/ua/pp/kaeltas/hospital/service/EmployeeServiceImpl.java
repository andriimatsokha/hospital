package ua.pp.kaeltas.hospital.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.pp.kaeltas.hospital.domain.Employee;
import ua.pp.kaeltas.hospital.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Override
	public Employee find(Integer id) {
		return employeeRepository.find(id);
	}

	@Override
	@Transactional
	public void save(Employee employee) {
		if (employee.getId() == null) {
			employeeRepository.persist(employee);
		} else {
			employeeRepository.update(employee);
		}
	}

	@Override
	public List<Employee> findAll() {
		return employeeRepository.findAll();
	}

	@Override
	public Employee find(String username) {
		return employeeRepository.find(username);
	}

}
