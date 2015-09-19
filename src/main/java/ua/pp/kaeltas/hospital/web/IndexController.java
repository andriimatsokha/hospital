package ua.pp.kaeltas.hospital.web;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ua.pp.kaeltas.hospital.domain.Role;
import ua.pp.kaeltas.hospital.service.RoleService;

@Controller
public class IndexController {
	
	private Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		
		return "index";
	}

	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	public String viewAllRoles(Model model) {
		logger.debug("View all roles ");
		model.addAttribute("roles", roleService.findAll());
		
		return "roles";
	}
	
	@RequestMapping(value = "/roles/add", method = RequestMethod.GET)
	public String addRole(Model model) {
		
		return "addRole";
	}
	
	@RequestMapping(value = "/roles/add", method = RequestMethod.POST)
	public String addRolePost(@RequestParam String name, Model model) {
		
		Role role = new Role();
		role.setName(name);
		logger.debug("Add role: " + role);
		roleService.save(role);
		
		return "redirect:/roles";
		//return viewAllRoles(model);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
}
