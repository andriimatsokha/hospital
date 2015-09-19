package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.EmployeeProfession;

public interface EmployeeProfessionRepository {
	
	EmployeeProfession find(Integer id);
	List<EmployeeProfession> findAll();
	void persist(EmployeeProfession employeeProfession);
	void update(EmployeeProfession employeeProfession);
	
}
