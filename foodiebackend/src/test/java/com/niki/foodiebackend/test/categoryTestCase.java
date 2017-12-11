package com.niki.foodiebackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niki.foodiebackend.dao.categoryDAO;
import com.niki.foodiebackend.dto.category;

public class categoryTestCase {

	private static AnnotationConfigApplicationContext context;
	
	private static categoryDAO categoryDAO;
	
	private category category;
	
	@BeforeClass
	public static void init() {
		
		context=new AnnotationConfigApplicationContext();
		context.scan("com.niki.foodiebackend");
		context.refresh();
		categoryDAO = (categoryDAO)context.getBean("categoryDAO");
			
	}
	
	/* @Test
	public void testAddcategory() {
		
		category = new category();
		
		category.setName("pizza");
		category.setDescription("this is pizza ");
		category.setImageURL("ca.png");

		assertEquals("successfully added a category inside the table",true,categoryDAO.add(category));
	}
	*/
	
	/* @Test
	public void testGetCategory() {
		
		category = categoryDAO.get(1);
		
		
		assertEquals("Successfully fetched a single category from the table!","pizza",category.getName());
		
		
	}
	*/
	
/*	@Test
	public void testUpdateCategory() {
		
		category = categoryDAO.get(1);
		
		category.setName("PIzZa");
		
		assertEquals("Successfully updated a single category in the table!",true,categoryDAO.update(category));
		
		
	}
	*/
	
	/*@Test
	public void testDeleteCategory() {
		
		category = categoryDAO.get(1);		
		assertEquals("Successfully deleted a single category in the table!",true,categoryDAO.delete(category));
		
		
	}
	*/
/*	@Test
	public void testListCategory() {
					
		assertEquals("Successfully fetched the list of categories from the table!",0,categoryDAO.list().size());
		
		
	}
	*/
	@Test
	public void testCRUDCategory() {
		
		// add operation
		category = new category();
		
		category.setName("Burger");
		category.setDescription("This is some description for laptop!");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Successfully added a category inside the table!",true,categoryDAO.add(category));
		
		
		category = new category();
		
		category.setName("pizza");
		category.setDescription("This is some description for television!");
		category.setImageURL("CAT_2.png");
		
		assertEquals("Successfully added a category inside the table!",true,categoryDAO.add(category));

		
		// fetching and updating the category
		category = categoryDAO.get(2);
		
		category.setName("PiZzA");
		
		assertEquals("Successfully updated a single category in the table!",true,categoryDAO.update(category));
		
		
		// delete the category
		assertEquals("Successfully deleted a single category in the table!",true,categoryDAO.delete(category));
		
		
		//fetching the list
		assertEquals("Successfully fetched the list of categories from the table!",1,categoryDAO.list().size());		
				
		
	}
	
	
}