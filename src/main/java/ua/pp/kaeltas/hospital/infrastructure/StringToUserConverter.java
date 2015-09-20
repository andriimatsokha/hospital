package ua.pp.kaeltas.hospital.infrastructure;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import ua.pp.kaeltas.hospital.domain.User;
import ua.pp.kaeltas.hospital.repository.UserRepository;


public class StringToUserConverter implements Converter<String, User> {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public User convert(String userId) {
		return userRepository.find(Integer.parseInt(userId));
	}

}
