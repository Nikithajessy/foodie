CREATE TABLE category (
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	CONSTRAINT pk_category_id PRIMARY KEY (id) 

);
INSERT INTO category (name, description,image_url,is_active) VALUES ('PIZZA', 'This is PIZZA!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('BURGER', 'This is BURGER!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('SANDWICH', 'This is SANDWICH!', 'CAT_3.png', true);


CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Niki', 'Ammu', 'ADMIN', true, 'admin', 'na@gmail.com', '8888888888');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Ravindra', 'Raj', 'SUPPLIER', true, '12345', 'rj@gmail.com', '9999999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Jessy', 'Aro', 'SUPPLIER', true, '123', 'ja@gmail.com', '7777777777');

CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	
);	
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'Veg pizza', 'This is one of the best pizza with veg topings', 200, 5, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'chicken pizza', 'This is one of the best pizza with chicken topings', 350, 2, true, 1, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'veg burger','This is one of the best veg burger', 120, 5, true, 2, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', 'chicken burger','This is one of the best chicken burger', 159, 3, true, 2, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'cheese sandwich','This is one of the best sandwich with more and more cheese', 56, 5, true,3, 3, 0, 0 );
