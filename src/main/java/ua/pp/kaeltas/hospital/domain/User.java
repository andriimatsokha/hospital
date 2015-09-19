package ua.pp.kaeltas.hospital.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@NamedQueries({
	@NamedQuery(name = "User.findAll", query = "Select u From User u")
})
@Table(schema="public")
public class User {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Integer id;
	
	private String login;
	
	private String password_hash;
	
	@OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL}, mappedBy="user")
	//@JoinColumn( name = "user_id")
	private List<Role> roles = new ArrayList<Role>();

	public Integer getId() {
		return id;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword_hash() {
		return password_hash;
	}

	public void setPassword_hash(String password_hash) {
		this.password_hash = password_hash;
	}
	
	public void add(Role role) {
		role.setUser(this);
		roles.add(role);
	}
	
	

}
