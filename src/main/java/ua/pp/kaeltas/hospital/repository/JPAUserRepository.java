package ua.pp.kaeltas.hospital.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import ua.pp.kaeltas.hospital.domain.User;

@Repository
public class JPAUserRepository implements UserRepository {

	@PersistenceContext(unitName = "HibernatePostgreSQL")
	private EntityManager em;
	
	@Override
	public User find(Integer id) {
		return em.find(User.class, id);
	}

	@Override
	public void persist(User user) {
		em.persist(user);
	}

	@Override
	public void update(User user) {
		em.merge(user);
	}

	@Override
	public List<User> findAll() {
		TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

}
