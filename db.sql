CREATE TABLE countries (
  country_id INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(255) NOT NULL
);

CREATE TABLE addresses (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  street_number VARCHAR(10) NOT NULL,
  street_name VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL,
  state VARCHAR(100) NOT NULL,
  postal_code VARCHAR(20) NOT NULL,
  country_id INT,
  FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(255) NOT NULL, 
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  address_id INT,
  FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);

CREATE TABLE manufacturers (
  manufacturer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  manufacturer_name VARCHAR(255) NOT NULL
);

CREATE TABLE watches (
  watch_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  model VARCHAR(50) NOT NULL,
  material VARCHAR(50) NOT NULL,
  movement VARCHAR(50) NOT NULL,
  complications VARCHAR(50) not null,
  size FLOAT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) NOT NULL,
  manufacturer_id INT NOT NULL,
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

CREATE TABLE sale_orders (
  order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  sale_date DATE NOT NULL,
  payment_status VARCHAR(20) NOT NULL,
  authorization_num VARCHAR(50) not null,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
  orderdetail_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  watch_id INT NOT NULL,
  sale_price DECIMAL(10,2) NOT NULL,
  qty INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES sale_orders(order_id),
  FOREIGN KEY (watch_id) REFERENCES watches(watch_id)
);

CREATE TABLE reviews (
  review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  watch_id INT NOT NULL,
  reviewdate DATE NOT NULL,
  comments VARCHAR(500) NOT NULL,
  rating INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (watch_id) REFERENCES watches(watch_id)
);

INSERT INTO countries (country_name) VALUES
  ('United States'),
  ('United Kingdom'),
  ('Japan'),
  ('Switzerland'),
  ('Germany');

INSERT INTO manufacturers (manufacturer_name)
VALUES 
("Rolex"),
("Omega"),
("Cartier"),
("Patek Philippe"),
("Breitling");


INSERT INTO watches (model, material, movement, complications, size, price, status, manufacturer_id)
VALUES 
("Submariner", "Stainless Steel", "Automatic", "Date", 41, 8500.00, "In Stock", 1),
("Tank Solo", "18k Yellow Gold", "Quartz", "Date", 31, 25000.00, "In Stock", 2),
("Royal Oak", "18k Rose Gold", "Automatic", "Date", 41, 38000.00, "Out of Stock", 3),
("Portofino", "Stainless Steel", "Automatic", "Moon Phase", 42, 4500.00, "In Stock", 4),
("Nautilus", "Stainless Steel", "Automatic", "Date", 40, 30000.00, "In Stock", 5);

INSERT INTO addresses (street_number, street_name, city, state, postal_code, country_id) VALUES 
("123", "Main Street", "New York", "NY", "10001", 1), 
("456", "Oak Street", "Los Angeles", "CA", "90001", 1), 
("789", "Maple Avenue", "Toronto", "ON", "M4C 1X9", 2), 
("555", "King Street", "Vancouver", "BC", "V6B 2K9", 2), 
("111", "Granville Road", "Hong Kong", "AC", "999077", 3);

INSERT INTO customers (first_name, last_name, email, phone, username, password, address_id)
VALUES ('John', 'Doe', 'johndoe@example.com', '123-456-7890', 'johndoe', 'password123', 1);

INSERT INTO customers (first_name, last_name, email, phone, username, password, address_id)
VALUES ('Jane', 'Smith', 'janesmith@example.com', '456-789-0123', 'janesmith', 'password456', 2);

INSERT INTO customers (first_name, last_name, email, phone, username, password, address_id)
VALUES ('Bob', 'Johnson', 'bobjohnson@example.com', '789-012-3456', 'bobjohnson', 'password789', 3);

INSERT INTO customers (first_name, last_name, email, phone, username, password, address_id)
VALUES ('Sarah', 'Lee', 'sarahlee@example.com', '012-345-6789', 'sarahlee', 'passwordabc', 4);

INSERT INTO customers (first_name, last_name, email, phone, username, password, address_id)
VALUES ('David', 'Chen', 'davidchen@example.com', '345-678-9012', 'davidchen', 'passworddef', 5);

INSERT INTO sale_orders (customer_id, sale_date, payment_status, authorization_num)
VALUES (1, '2022-01-01', 'PAID', '123456');

INSERT INTO sale_orders (customer_id, sale_date, payment_status, authorization_num)
VALUES (2, '2022-02-15', 'PAID', '654321');

INSERT INTO sale_orders (customer_id, sale_date, payment_status, authorization_num)
VALUES (3, '2022-03-30', 'PENDING', '789456');

INSERT INTO sale_orders (customer_id, sale_date, payment_status, authorization_num)
VALUES (4, '2022-04-22', 'PAID', '321654');

INSERT INTO sale_orders (customer_id, sale_date, payment_status, authorization_num)
VALUES (5, '2022-05-10', 'PAID', '654789');


INSERT INTO order_details (order_id, watch_id, sale_price, qty) VALUES (1, 1, 199.99, 1);
INSERT INTO order_details (order_id, watch_id, sale_price, qty) VALUES (1, 2, 299.99, 2);
INSERT INTO order_details (order_id, watch_id, sale_price, qty) VALUES (2, 3, 149.99, 1);
INSERT INTO order_details (order_id, watch_id, sale_price, qty) VALUES (3, 4, 449.99, 1);
INSERT INTO order_details (order_id, watch_id, sale_price, qty) VALUES (4, 5, 99.99, 3);

INSERT INTO reviews (customer_id, watch_id, reviewdate, comments, rating) VALUES (1, 1, '2022-01-01', 'Great watch, very stylish and comfortable!', 5);
INSERT INTO reviews (customer_id, watch_id, reviewdate, comments, rating) VALUES (2, 2, '2022-02-01', 'This watch is amazing, I love the features and design.', 4);
INSERT INTO reviews (customer_id, watch_id, reviewdate, comments, rating) VALUES (3, 3, '2022-03-01', 'Disappointed with this watch, the quality is not what I expected.', 2);
INSERT INTO reviews (customer_id, watch_id, reviewdate, comments, rating) VALUES (4, 4, '2022-04-01', 'Really happy with this purchase, the watch exceeded my expectations.', 5);
INSERT INTO reviews (customer_id, watch_id, reviewdate, comments, rating) VALUES (5, 5, '2022-05-01', 'Decent watch for the price, but not the best quality.', 3);
