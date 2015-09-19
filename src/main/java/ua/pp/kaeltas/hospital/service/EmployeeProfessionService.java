package ua.pp.kaeltas.hospital.service;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.Employee;
import ua.pp.kaeltas.hospital.domain.EmployeeProfession;

public interface EmployeeProfessionService {
	
	EmployeeProfession find(Integer id);
	List<EmployeeProfession> findAll();
	void save(EmployeeProfession profession);
}
