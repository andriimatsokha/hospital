package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ua.pp.kaeltas.hospital.domain.Role;

@Repository
public class JPARoleRepository implements RoleRepository {

	@PersistenceContext(unitName = "HibernatePostgreSQL")
	private EntityManager em;
	
	@Override
	public Role find(Integer id) {
		return em.find(Role.class, id);
	}

	@Override
	public void persist(Role role) {
		em.persist(role);
	}

	@Override
	public void update(Role role) {
		em.merge(role);
	}

	@Override
	public List<Role> findAll() {
		TypedQuery<Role> query = em.createNamedQuery("Role.findAll", Role.class);
		return query.getResultList();
	}

}
