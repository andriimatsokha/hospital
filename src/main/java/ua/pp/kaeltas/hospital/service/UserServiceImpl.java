package ua.pp.kaeltas.hospital.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.pp.kaeltas.hospital.domain.User;
import ua.pp.kaeltas.hospital.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public User find(Integer id) {
		return userRepository.find(id);
	}

	@Override
	@Transactional
	public void save(User user) {
		if (user.getId() == null) {
			userRepository.persist(user);
		} else {
			userRepository.update(user);
		}

	}

	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

}
