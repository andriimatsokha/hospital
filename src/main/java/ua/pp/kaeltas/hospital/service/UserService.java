package ua.pp.kaeltas.hospital.service;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.User;

public interface UserService {
	
	User find(Integer id);
	List<User> findAll();
	void save(User user);
}
