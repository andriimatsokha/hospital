package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import ua.pp.kaeltas.hospital.domain.User;

public interface UserRepository {
	User find(Integer id);
	List<User> findAll();
	void persist(User user);
	void update(User user);
}
