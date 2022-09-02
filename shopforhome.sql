
CREATE TABLE users (
  active bit(1) NOT NULL,
  address varchar(255),
  email varchar(255),
  name varchar(255),
  password varchar(255),
  phone varchar(255),
  role varchar(255),
  PRIMARY KEY (id),
  UNIQUE KEY  (email)
);


CREATE TABLE product_category (
  category_id int NOT NULL,
  category_name varchar(255),
  category_type int,
  create_time datetime(6),
  update_time datetime(6),
  PRIMARY KEY (category_id),
  UNIQUE KEY  (category_type)
);



CREATE TABLE product_info (
  product_id varchar(255) NOT NULL,
  category_type int DEFAULT 0,
  create_time datetime(6),
  product_description varchar(255),
  product_icon varchar(255),
  product_name varchar(255) NOT NULL,
  product_price decimal(19,2) NOT NULL,
  product_status int DEFAULT 0,
  product_stock int NOT NULL,
  update_time datetime(6)L,
  PRIMARY KEY (product_id)
);
