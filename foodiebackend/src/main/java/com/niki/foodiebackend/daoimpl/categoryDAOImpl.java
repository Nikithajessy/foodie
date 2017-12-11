package com.niki.foodiebackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niki.foodiebackend.dao.categoryDAO;
import com.niki.foodiebackend.dto.category;

@Repository("categoryDAO")
@Transactional
public class categoryDAOImpl implements categoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	

	@Override
	public List<category> list() {

		String selectActiveCategory = "FROM category WHERE active = :active";
		
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
				
		query.setParameter("active", true);
						
		return query.getResultList();
	
	}

	/*
	 * Getting single category based on id
	 */
	@Override
	public category get(int id) {

		return sessionFactory.getCurrentSession().get(category.class, Integer.valueOf(id));

	}

	@Override
	public boolean add(category category) {

		try{
			
			//add the category to the database table
			sessionFactory.getCurrentSession().persist(category);		
			return true;

		}
	catch(Exception ex) {
		ex.printStackTrace();
		return false;
		
	}
	}

	/*
	 * Updating a single category
	 */
	@Override
	public boolean update(category category) {

		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(category category) {
		
		category.setActive(false);
		
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
