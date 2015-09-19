package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import ua.pp.kaeltas.hospital.domain.Employee;

@Repository
public class JPAEmployeeRepository implements EmployeeRepository {

	@PersistenceContext(unitName = "HibernatePostgreSQL")
	private EntityManager em;
	
	@Override
	public Employee find(Integer id) {
		return em.find(Employee.class, id);
	}

	@Override
	public void persist(Employee employee) {
		em.persist(employee);
	}

	@Override
	public void update(Employee employee) {
		em.merge(employee);
	}

	@Override
	public List<Employee> findAll() {
		TypedQuery<Employee> query = em.createNamedQuery("Employee.findAll", Employee.class);
		return query.getResultList();
	}

	@Override
	public Employee find(String username) {
		TypedQuery<Employee> query = em.createNamedQuery("Employee.findByUsername", Employee.class);
		query.setParameter("login", username);
		Employee employee = null;
		try {
			employee = query.getSingleResult();
		} catch (NoResultException e) {
			employee = new Employee();
		}
		return employee;
	}

}
