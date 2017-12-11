package com.niki.foodiebackend.dao;

import java.util.List;

import com.niki.foodiebackend.dto.category;

public interface categoryDAO {

	category get(int id);
	List<category> list();
	boolean add(category category);
	boolean update(category category);
	boolean delete(category category);
	
}
