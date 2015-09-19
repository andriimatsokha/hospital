package ua.pp.kaeltas.hospital.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ua.pp.kaeltas.hospital.domain.Role;
import ua.pp.kaeltas.hospital.domain.RoleEnum;
import ua.pp.kaeltas.hospital.domain.User;
import ua.pp.kaeltas.hospital.service.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "hashpass", method = RequestMethod.GET)
	@ResponseBody
	public String adminPass(@RequestParam String pass) {
		String hashedPass = passwordEncoder.encode(pass);
		System.out.println(hashedPass);
		
		return hashedPass;
	}
	
	@RequestMapping(value = "adduser", method = RequestMethod.GET)
	public String addUser(Model model) {
		model.addAttribute("roles", RoleEnum.values());
		return "admin/addUser";
	}
	
	@RequestMapping(value = "adduser", method = RequestMethod.POST)
	public String addUserPost(Model model, @RequestParam String login, 
			@RequestParam String password, @RequestParam RoleEnum roleName) {
		
		if (!login.isEmpty() && !password.isEmpty()) {
			User newUser = new User();
			newUser.setLogin(login);
			newUser.setPassword_hash(passwordEncoder.encode(password));
			Role role = new Role();
			role.setName(roleName);
			newUser.add(role);
			userService.save(newUser);
			return "redirect:/admin/users";
		}
		
		model.addAttribute("roles", RoleEnum.values());
		return "admin/addUser";
	}
	
	@RequestMapping(value = "users", method = RequestMethod.GET)
	public String viewAllUsers(Model model) {
		model.addAttribute("users", userService.findAll());
		return "admin/viewUsers";
	}
}
