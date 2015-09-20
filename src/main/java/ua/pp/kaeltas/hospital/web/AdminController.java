package ua.pp.kaeltas.hospital.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ua.pp.kaeltas.hospital.domain.Employee;
import ua.pp.kaeltas.hospital.domain.Role;
import ua.pp.kaeltas.hospital.domain.RoleEnum;
import ua.pp.kaeltas.hospital.domain.User;
import ua.pp.kaeltas.hospital.service.EmployeeProfessionService;
import ua.pp.kaeltas.hospital.service.EmployeeService;
import ua.pp.kaeltas.hospital.service.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserService userService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private EmployeeProfessionService employeeProfessionService;
	
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
	
	@RequestMapping(value = "employees", method = RequestMethod.GET)
	public String viewAllEmployees(Model model) {
		model.addAttribute("employees", employeeService.findAll());
		return "admin/viewEmployees";
	}
	
	@RequestMapping(value = "employee/edit", method = RequestMethod.GET)
	public String editEmployee(Model model, 
			@RequestParam("userid") Integer userId
			) {
		String username = userService.find(userId).getLogin();
		model.addAttribute("username", username);
		
		model.addAttribute("employee", employeeService.find(username));
		model.addAttribute("professions", employeeProfessionService.findAll());
		
		return "admin/editEmployee";
	}
	
	/*@RequestMapping(value = "employee/edit", method = RequestMethod.POST)
	public String editEmployeePost(Model model, @RequestParam("userid") Integer userId,
			@RequestParam String firstName, @RequestParam String lastName,
			@RequestParam String office, @RequestParam Date hireDate,
			@RequestParam("profession") Integer professionId
			) {
		EmployeeProfession profession = employeeProfessionService.find(professionId);  
		
		User user = userService.find(userId);

		Employee employee = employeeService.find(user.getLogin());

		employee.setUser(user);
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setOfficeNumber(office);
		employee.setHireDate(hireDate);
		employee.setProfession(profession);
		
		employeeService.save(employee);
		
		return "redirect:/admin/employee/edit?userid="+userId;
	}*/
	
	@RequestMapping(value = "employee/edit", method = RequestMethod.POST)
	public String editEmployeePost(@RequestParam("userid") Integer userId,
			@Valid Employee employee,
			BindingResult bindingResult, 
			Model model
			) {
		if (bindingResult.hasErrors()) {
//			for(ObjectError err : bindingResult.getAllErrors()) {
//				System.out.println("---ERROR>>" + err.getDefaultMessage());
//			}
			String username = userService.find(userId).getLogin();
			model.addAttribute("username", username);
			model.addAttribute("professions", employeeProfessionService.findAll());
			
			return "admin/editEmployee";
		}
	
		employeeService.save(employee);
		
		return "redirect:/admin/employee/edit?userid="+userId;
	}
	
//	@InitBinder
//    private void employeeBinder(WebDataBinder binder) {
//        binder.registerCustomEditor(Employee.class,
//                new PropertyEditorSupport() {
//                    @Override
//                    public void setAsText(String employeeid) {
//                        Employee employee = null;
//                        if (employeeid != null && !employeeid.trim().isEmpty()) {
//                            Integer idInt = Integer.valueOf(employeeid);
//                            employee = employeeService.find(idInt);
//                        }
//                        setValue(employee);
//                    }
//                }
//        );
//    }
}
