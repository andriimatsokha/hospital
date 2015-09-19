package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import ua.pp.kaeltas.hospital.domain.Employee;
import ua.pp.kaeltas.hospital.domain.EmployeeProfession;

@Repository
public class JPAEmployeeProfessionRepository implements EmployeeProfessionRepository {

	@PersistenceContext(unitName = "HibernatePostgreSQL")
	private EntityManager em;
	
	@Override
	public EmployeeProfession find(Integer id) {
		return em.find(EmployeeProfession.class, id);
	}

	@Override
	public void persist(EmployeeProfession profession) {
		em.persist(profession);
	}

	@Override
	public void update(EmployeeProfession profession) {
		em.merge(profession);
	}

	@Override
	public List<EmployeeProfession> findAll() {
		TypedQuery<EmployeeProfession> query = em.createNamedQuery("EmployeeProfession.findAll", EmployeeProfession.class);
		return query.getResultList();
	}

}
