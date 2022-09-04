use eshop;


CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `active` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`email`)
);

INSERT INTO `users` VALUES (1,_binary '','varanasi','saurabh@gmail.com','Saurabh Kumar','$2a$10$RCUOqs517fCLFSawleXw/ubjBaS5lVrBY3inY8IYe0zyJ4klu5Hpm','+918736861208','ROLE_MANAGER');  --Admin email: saurabh@gmail.com, Password: aaaa





CREATE TABLE `cart` (
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);



CREATE TABLE `discount` (
  `id` varchar(255) NOT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
);





CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
);



CREATE TABLE `order_main` (
  `order_id` bigint NOT NULL,
  `buyer_address` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `order_amount` decimal(19,2) NOT NULL,
  `order_status` int NOT NULL DEFAULT '0',
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
);






CREATE TABLE `product_category` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_type` int DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY  (`category_type`)
);


INSERT INTO `product_category` (`category_id`, `category_name`, `category_type`, `create_time`, `update_time`) VALUES
(1001, 'Shop Living Room', 0, '2022-03-09 23:03:26', '2022-03-10 00:15:27'),
(1002, 'Shop Bed Room', 1, '2022-03-10 00:26:05', '2022-03-10 00:26:05'),
(1003, 'Shop Dining Room', 2, '2022-03-10 00:15:02', '2022-03-10 00:15:21'),
(1004, 'Shop Study Room', 3, '2022-03-10 01:01:09', '2022-03-10 01:01:09'),
(1005, 'Home Electronics', 4, '2022-03-10 00:26:05', '2022-03-10 00:26:05');




CREATE TABLE `product_in_order` (
  `id` bigint NOT NULL,
  `category_type` int NOT NULL,
  `count` int DEFAULT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_stock` int DEFAULT NULL,
  `cart_user_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`cart_user_id`) REFERENCES `cart` (`user_id`),
  FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`)
); 





CREATE TABLE `product_info` (
  `product_id` varchar(255) NOT NULL,
  `category_type` int DEFAULT '0',
  `create_time` datetime(6) DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_status` int DEFAULT '0',
  `product_stock` int NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
);


INSERT INTO `product_info` (`product_id`, `category_type`, `create_time`, `product_description`, `product_icon`, `product_name`, `product_price`, `product_status`, `product_stock`, `update_time`) VALUES
('SLR01', 0, '2022-03-10 10:37:39', 'Cherish each moment in comfort', 'https://www.ikea.com/global/assets/navigation/images/two-seat-sofas-10668.jpeg?imwidth=500', 'Two-seat sofas', '20000.00', 1, 200, '2022-03-10 19:42:02'),
('SLR02', 0, '2022-03-10 12:12:46', 'Tables That Do More Than Serve!', 'https://www.ikea.com/in/en/navigation/images/coffee-tables-10716.jpeg?imwidth=400', 'Coffee tables', '5000.00', 0, 300, '2022-03-10 12:12:46'),
('SLR03', 0, '2022-03-10 06:51:03', 'Bring the cinema home', 'https://www.ikea.com/in/en/images/products/brimnes-tv-storage-combination-black__0464267_pe609346_s5.jpg?f=xxs', 'TV & media storage', '15000.00', 0, 100, '2018-03-10 12:04:13'),
('SLR04', 0, '2022-03-10 10:35:43', 'Curtains to help you sleep better', 'https://www.ikea.com/in/en/images/products/hilja-curtains-1-pair-grey__0889629_pe671128_s5.jpg?f=xxs', 'Curtains', '2000.00', 0, 194, '2022-07-10 13:50:11'),
('SLR05', 0, '2022-03-10 12:09:41', 'Decorative lighting', 'https://www.ikea.com/in/en/images/products/storhaga-led-table-lamp-dimmable-outdoor-black__0763156_pe752472_s5.jpg?f=xxs', 'LED lanterns', '10.00', 0, 109, '2022-03-10 12:09:41'),
('SBR01', 1, '2022-03-10 12:11:51', 'Adolph Bed With Side Storage', 'https://m.media-amazon.com/images/I/41tCT+QZpIL.jpg', 'Bed', '12000.00', 0, 108, '2022-07-09 14:36:20'),
('SBR02', 1, '2022-03-10 06:44:25', 'Wakefit Orthopaedic Memory Foam Mattress (78*72*6inch) / (198.1*182.9*15.2cm)', 'https://thumbs.dreamstime.com/b/bed-mattress-pad-37603271.jpg', 'Mattress', '9999.00', 0, 6, '2022-07-10 13:43:23'),
('SBR03', 1, '2022-03-10 10:39:29', 'cotton check silk bedsheet ,6ft x 6ft', 'https://5.imimg.com/data5/TU/MN/IJ/SELLER-96709932/cotton-check-bedsheet-500x500.png', 'Bed Sheets', '999.00', 0, 199, '2022-03-10 10:39:32'),
('SDR01', 2, '2022-03-10 10:40:35', 'Wooden table 3/4', 'https://www.bassettfurniture.com/dining/harvest_tables.jpg', 'Dining table', '899.00', 0, 199, '2022-03-10 10:40:35'),
('SDR02', 2, '2022-03-10 12:08:17', 'floral prited cloth', 'https://5.imimg.com/data5/PV/FB/MY-32572973/dining-table-cloth-500x500.jpg', 'Table cloth', '566.00', 0, 200, '2022-07-10 13:43:23'),
('SDR03', 2, '2022-03-10 12:15:05', '2 inches thick mat with hot pot holder', 'https://n2.sdlcdn.com/imgs/j/n/x/Sunjuh-Silicone-Hot-Pot-Holder-SDL849435794-1-e8a72.jpg', 'Dining table mat', '399.00', 0, 57, '2022-03-10 12:15:10'),
('SSR01', 3, '2022-03-10 12:16:44', 'Acer Aspire 5 Thin & Light Laptop Intel Core i5 11th Gen (Windows 11 Home/MS Office /8GB/512GB SSD) A514-54 with 35.5cm (14") Full HD Display with Backlit Keyboard/1.45 kgs', 'https://m.media-amazon.com/images/I/61jUWj0AcXL._SX679_.jpg', 'Laptop', '52999.00', 0, 22, '2022-03-10 12:16:44'),
('SSR02', 3, '2022-03-10 10:37:39', 'Twain Free Standing Engineered Wood Study Table In Cherry Melamine Finish', 'https://www.ulcdn.net/images/products/223893/product/Twain_Study_Table_LP.jpg?1544673336', 'Study Table', '799.00', 1, 200, '2022-03-10 19:42:02'),
('SSR03', 3, '2022-03-10 10:37:39', 'Linsay Ergonomic Chair', 'https://www.ulcdn.net/images/taxon_images/taxon/1509/taxon_col_2/Office-chairs.jpg', 'Study Chair', '20099.00', 1, 200, '2022-03-10 19:42:02'),
('SSR04', 3, '2022-03-10 10:37:39', 'Solid wooden book shelf', 'https://www.ulcdn.net/images/taxon_images/taxon/1698/taxon_col_2/Bookshelf.jpg', 'Bookshelves', '10000.00', 1, 200, '2022-03-10 19:42:02'),
('HE01', 4, '2022-03-10 10:37:39', 'Longway Creta 1200mm/48 inch with remote High Speed Anti-dust Decorative 5 Star Rated Ceiling Fan 400 RPM', 'https://images-eu.ssl-images-amazon.com/images/I/511Xl6tJUyL._AC._SR360,460.jpg', 'Fan', '1299.00', 1, 200, '2022-03-10 19:42:02'),
('HE02', 4, '2022-03-10 10:37:39', 'Samsungs new fridge 674 Litre Side-by-Side Refrigerator, Matt Black GC-X257CQES', 'https://cdn.vox-cdn.com/thumbor/Atvpj5tUuIgLq55pPrG2-A-MHF8=/0x389:8426x7181/1200x800/filters:focal(3671x2467:5117x3913)/cdn.vox-cdn.com/uploads/chorus_image/image/62795169/samsung_fridge.0.jpg', 'Fridge', '122500.00', 1, 200, '2022-03-10 19:42:02'),
('HE03', 4, '2022-03-10 10:37:39', 'Big Capacity(12kg) Energy Efficiency (A+++-40%) ,6 Motion Direct Drive, Inverter Direct Drive, (Less noise andvibration, 10-Year MotorWarranty, 22-Year VDE Certification),TrueSteam™,Smart Diagnosis™', 'https://www.lgnewsroom.com/wp-content/uploads/2013/09/LG_12KG_WASHING_MACHINE_021.jpg', 'Washing machine', '41000', 1, 200, '2022-03-10 19:42:02');






CREATE TABLE `wishlist` (
  `id` bigint NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
); 

