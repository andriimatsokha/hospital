package ua.pp.kaeltas.hospital.service;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.Role;

public interface RoleService {
	
	Role find(Integer id);
	List<Role> findAll();
	void save(Role role);
}
