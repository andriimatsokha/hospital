package ua.pp.kaeltas.hospital.infrastructure;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import ua.pp.kaeltas.hospital.domain.EmployeeProfession;
import ua.pp.kaeltas.hospital.repository.EmployeeProfessionRepository;


public class StringToEmployeeProfessionConverter implements Converter<String, EmployeeProfession> {

	@Autowired
	private EmployeeProfessionRepository professionRepository;
	
	@Override
	public EmployeeProfession convert(String profId) {
		return professionRepository.find(Integer.parseInt(profId));
	}

}
