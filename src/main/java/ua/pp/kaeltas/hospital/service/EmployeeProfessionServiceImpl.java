package ua.pp.kaeltas.hospital.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.pp.kaeltas.hospital.domain.EmployeeProfession;
import ua.pp.kaeltas.hospital.repository.EmployeeProfessionRepository;

@Service
public class EmployeeProfessionServiceImpl implements EmployeeProfessionService {

	@Autowired
	private EmployeeProfessionRepository repository;
	
	@Override
	public EmployeeProfession find(Integer id) {
		return repository.find(id);
	}

	@Override
	@Transactional
	public void save(EmployeeProfession profession) {
		if (profession.getId() == null) {
			repository.persist(profession);
		} else {
			repository.update(profession);
		}

	}

	@Override
	public List<EmployeeProfession> findAll() {
		return repository.findAll();
	}

}
