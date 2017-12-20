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
INSERT INTO category (name, description,image_url,is_active) VALUES ('BBQ', 'This is BBQ!', 'CAT_4.png', true);


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
VALUES ('Niki', 'Ammu', 'ADMIN', true, '$2y$10$Yf5gqAtEPp1UfmmbZGcEJ.hJ4hGDab5HJ71TSlGdbI/iiRP2zkm4.', 'na@gmail.com', '8888888888');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Archana', 'Achu', 'SUPPLIER', true, '$2b$10$cPfSoT3jkGLmTfZbO.yHpugw1Z2D9r99DIql/cUOZ0YAp2oTlQBHK', 'aa@gmail.com', '9999999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Jessy', 'Aro', 'SUPPLIER', true, '$2b$10$TvZPwFSHfts9JRGW0.khwOvL0hdAFYxWMjFy.EYUNAfHNNo4YJkuq', 'ja@gmail.com', '7777777777');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('sneha', 'Anto', 'USER', true, '$2b$10$2Ql2SYHon/EJbrKLvtIzXOZsfWAScjE247QE1oud5VCeRWCS3xpqu', 'sa@gmail.com', '7777777777');

INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('nik', 'Aro', 'ADMIN', true, '$2y$10$GLuEBb4862/ewbwS806vEe8cEJF3RJYcTsFwT2lW7Tm8KawjtA0fK', 'np@gmail.com', '8888888888');

INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('aro', 'nithin', 'ADMIN', true, '$2a$04$DA35FFO0kJ1Ipbs/Uj10/uiJtasNBAHBJTEr9xZyZT.rq2SR8rCXm', 'ani@gmail.com', '8888888888');



CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
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
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'Veg pizza','pizza hut', 'This is one of the best pizza with veg topings', 200, 5, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'chicken pizza','dominos', 'This is one of the best pizza with chicken topings', 350, 2, true, 1, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'veg burger','mcd','This is one of the best veg burger', 120, 5, true, 2, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', 'chicken burger','mcd','This is one of the best chicken burger', 159, 3, true, 2, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'cheese sandwich','me','This is one of the best sandwich with more and more cheese', 56, 5, true,3, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRD119BC35DEA', 'panner pizza','pizza hut', 'This is one of the best pizza with panner topings', 250, 5, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDE4FBF6C6D1', 'Veg bbq','bbq', 'This is one of the best bbq ', 250, 5, true, 4, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRD82E3B5DC60', 'chicken bbq','coal bbq', 'This is one of the best chicken bbq', 250, 5, true, 4, 2, 0, 0 );


-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);
INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (4, '102 Sabarmati Society, Mahatma Gandhi Road', 'Near Salt Lake, Gandhi Nagar', 'Chennai', 'Tamilnadu', 'India', '600031', true, false );
-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);
INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 0, 0);

-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);


-- the order detail table to store the order

CREATE TABLE order_detail (
	id IDENTITY,
	user_id int,
	order_total DECIMAL(10,2),
	order_count int,
	shipping_id int,
	billing_id int,
	order_date date,
	CONSTRAINT fk_order_detail_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT fk_order_detail_shipping_id FOREIGN KEY (shipping_id) REFERENCES address (id),
	CONSTRAINT fk_order_detail_billing_id FOREIGN KEY (billing_id) REFERENCES address (id),
	CONSTRAINT pk_order_detail_id PRIMARY KEY (id)
);

-- the order item table to store order items

CREATE TABLE order_item (
	id IDENTITY,
	order_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES product (id),
	CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES order_detail (id),
	CONSTRAINT pk_order_item_id PRIMARY KEY (id)
);
