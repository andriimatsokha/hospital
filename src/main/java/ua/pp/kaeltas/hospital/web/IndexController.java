package ua.pp.kaeltas.hospital.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	
}
