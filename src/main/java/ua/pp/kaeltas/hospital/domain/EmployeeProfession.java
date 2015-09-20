package ua.pp.kaeltas.hospital.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "employee_profession", schema = "public")
@NamedQueries({
	@NamedQuery(name = "EmployeeProfession.findAll", query = "Select ep From EmployeeProfession ep")
})
public class EmployeeProfession {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "employee_profession_id")
	private Integer id;
	
	private String name;

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public String toString() {
		return "EmployeeProfession [id=" + id + ", name=" + name + "]";
	}
	
}
