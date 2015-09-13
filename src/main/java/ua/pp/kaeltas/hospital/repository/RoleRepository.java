package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.Role;

public interface RoleRepository {
	
	Role find(Integer id);
	List<Role> findAll();
	void persist(Role role);
	void update(Role role);
	
}
