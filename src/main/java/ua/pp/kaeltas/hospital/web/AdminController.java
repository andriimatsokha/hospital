package ua.pp.kaeltas.hospital.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/hashpass", method = RequestMethod.GET)
	@ResponseBody
	public String adminPass(@RequestParam String pass) {
		String hashedPass = passwordEncoder.encode(pass);
		System.out.println(hashedPass);
		
		return hashedPass;
	}
	
}
