package ua.pp.kaeltas.hospital.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.pp.kaeltas.hospital.domain.Role;
import ua.pp.kaeltas.hospital.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public Role find(Integer id) {
		return roleRepository.find(id);
	}

	@Override
	@Transactional
	public void save(Role role) {
		if (role.getId() == null) {
			roleRepository.persist(role);
		} else {
			roleRepository.update(role);
		}

	}

	@Override
	public List<Role> findAll() {
		return roleRepository.findAll();
	}

}
