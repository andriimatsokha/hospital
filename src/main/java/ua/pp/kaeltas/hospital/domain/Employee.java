package ua.pp.kaeltas.hospital.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(schema = "public")
@NamedQueries({
	@NamedQuery(name = "Employee.findAll", query = "Select e From Employee e"),
	@NamedQuery(name = "Employee.findByUsername", 
		query = "Select e From Employee e Join e.user u Where u.login = :login")
})
public class Employee {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "employee_id")
	private Integer id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "hire_date")
	private Date hireDate;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "office_number")
	private String officeNumber;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "employee_profession_id")
	private EmployeeProfession profession;
	
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getOfficeNumber() {
		return officeNumber;
	}

	public void setOfficeNumber(String officeNumber) {
		this.officeNumber = officeNumber;
	}

	public EmployeeProfession getProfession() {
		return profession;
	}

	public void setProfession(EmployeeProfession profession) {
		this.profession = profession;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", hireDate=" + hireDate + ", firstName="
				+ firstName + ", lastName=" + lastName + ", officeNumber="
				+ officeNumber + ", profession=" + profession + ", user="
				+ user + "]";
	}
	
	
	
}
