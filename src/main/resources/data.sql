-- =========================
-- USERS (with password + role)
-- =========================

INSERT INTO users (name, email, password, role)
SELECT 'Alice', 'alice@example.com',
       '$2a$10$jrxJoOmSOfdriB3tCk4jw.hSXOAvNkH5NBwg805K5uM9/.KaLlow.',
       'USER'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'alice@example.com'
);

INSERT INTO users (name, email, password, role)
SELECT 'Bob', 'bob@example.com',
       '$2a$10$jrxJoOmSOfdriB3tCk4jw.hSXOAvNkH5NBwg805K5uM9/.KaLlow.',
       'USER'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'bob@example.com'
);

INSERT INTO users (name, email, password, role)
SELECT 'Charlie', 'charlie@example.com',
       '$2a$10$jrxJoOmSOfdriB3tCk4jw.hSXOAvNkH5NBwg805K5uM9/.KaLlow.',
       'USER'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'charlie@example.com'
);

-- =========================
-- ADMIN USER
-- =========================

INSERT INTO users (name, email, password, role)
SELECT 'Admin', 'admin@gmail.com',
       '$2a$10$/iOBxlsEBpWTQB6u6mzt3uvIb.BDA8bRpfsxg72pW8YOeYGiN.0om',
       'ADMIN'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'admin@gmail.com'
);


-- =========================
-- PRODUCTS (EXACTLY 100 ITEMS ACROSS 10 CATEGORIES)
-- =========================

-- ELECTRONICS (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Wireless Mechanical Keyboard', 'RGB backlight tactile mechanical switches with Bluetooth 5.1 & Type-C connection', 3499.00,
       'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500', 'ELECTRONICS', 45
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wireless Mechanical Keyboard');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Ergonomic Wireless Mouse', 'Precision 4000 DPI sensor with silent click buttons and rechargeable battery', 1299.00,
       'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500', 'ELECTRONICS', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Ergonomic Wireless Mouse');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Aluminium Laptop Stand', 'Foldable 6-level height adjustable desktop laptop riser for cooling', 999.00,
       'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=500', 'ELECTRONICS', 60
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Aluminium Laptop Stand');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT '7-in-1 USB-C Hub Adapter', 'Multi-port USB Type C hub with 4K HDMI, 100W PD charging & SD card reader', 1899.00,
       'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=500', 'ELECTRONICS', 35
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = '7-in-1 USB-C Hub Adapter');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Noise Cancelling Headphones', 'Over-ear active noise isolation headphones with 40-hour playtime', 4999.00,
       'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500', 'ELECTRONICS', 25
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Noise Cancelling Headphones');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Smartwatch Fitness Tracker', 'HD AMOLED display with heart rate monitoring, SPO2 and 50+ sport modes', 2799.00,
       'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500', 'ELECTRONICS', 50
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smartwatch Fitness Tracker');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Portable Bluetooth Speaker', 'Deep bass IPX7 waterproof outdoor wireless speaker with TWS stereo pairing', 2199.00,
       'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=500', 'ELECTRONICS', 40
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Portable Bluetooth Speaker');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Full HD Web Camera 1080p', 'Autofocus streaming webcam with dual microphones and privacy shutter', 1599.00,
       'https://images.unsplash.com/photo-1588702547923-7093a6c3ba33?w=500', 'ELECTRONICS', 30
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Full HD Web Camera 1080p');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Magnetic Wireless Power Bank', '10000mAh mag-safe fast charging power bank for smartphones', 1999.00,
       'https://images.unsplash.com/photo-1609592424109-dd9892f1b177?w=500', 'ELECTRONICS', 65
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Magnetic Wireless Power Bank');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Gaming Monitor Desk Mount', 'Single monitor gas spring arm for 17 to 32 inch screens with cable management', 2499.00,
       'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500', 'ELECTRONICS', 20
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Gaming Monitor Desk Mount');


-- CLOTHING (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Premium Cotton Unisex T-Shirt', '100% combed organic cotton classic crewneck regular fit t-shirt', 599.00,
       'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500', 'CLOTHING', 150
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Premium Cotton Unisex T-Shirt');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Slim Fit Denim Jacket', 'Classic vintage blue washed denim jacket with button closure', 1999.00,
       'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=500', 'CLOTHING', 40
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Slim Fit Denim Jacket');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Fleece Pullover Hoodie', 'Heavyweight cozy fleece hoodie with kangaroo pocket and drawstring', 1499.00,
       'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=500', 'CLOTHING', 70
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Fleece Pullover Hoodie');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Casual Stretch Chino Pants', 'Versatile flat-front stretch cotton trousers for work and weekend', 1299.00,
       'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500', 'CLOTHING', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Casual Stretch Chino Pants');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Floral Print Summer Dress', 'Lightweight breathable rayon maxi dress with adjustable waist belt', 1799.00,
       'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=500', 'CLOTHING', 35
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Floral Print Summer Dress');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Leather Bomber Jacket', 'Premium leather bomber jacket with zip closure', 11999.00,
       'https://images.unsplash.com/photo-1588008144702-1f7e89df6e31?w=500', 'CLOTHING', 25
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Leather Bomber Jacket');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Slim Fit Chinos', 'Stretch cotton slim fit chinos in charcoal', 3499.00,
       'https://images.unsplash.com/photo-1513258495709-6f6feaf5c6c5?w=500', 'CLOTHING', 70
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Slim Fit Chinos');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Wool Cashmere Scarf', 'Soft wool-cashmere blend scarf', 1999.00,
       'https://images.unsplash.com/photo-1520961821695-3877c0b27915?w=500', 'CLOTHING', 150
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wool Cashmere Scarf');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Waterproof Winter Parka', 'Insulated hooded parka with water-resistant shell', 4599.00,
       'https://images.unsplash.com/photo-1544923246-77307dd654cb?w=500', 'CLOTHING', 45
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Waterproof Winter Parka');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Athletic Running Shorts', 'Quick-dry lightweight mesh training shorts', 799.00,
       'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500', 'CLOTHING', 110
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Athletic Running Shorts');


-- FOOD (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Dark Chocolate Almond Bar 100g', '70% cocoa single-origin dark chocolate with roasted California almonds', 249.00,
       'https://images.unsplash.com/photo-1549007994-cb92caebd54b?w=500', 'FOOD', 200
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Dark Chocolate Almond Bar 100g');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Organic Whole Bean Coffee 500g', 'Medium roast Arabica coffee beans harvested from high-altitude estates', 799.00,
       'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=500', 'FOOD', 100
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Organic Whole Bean Coffee 500g');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Matcha Green Tea Powder 100g', 'Ceremonial grade Japanese green tea powder rich in antioxidants', 999.00,
       'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=500', 'FOOD', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Matcha Green Tea Powder 100g');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Extra Virgin Olive Oil 1L', 'Cold-pressed Mediterranean olive oil for cooking and salad dressing', 1199.00,
       'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=500', 'FOOD', 60
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Extra Virgin Olive Oil 1L');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Raw Wildflower Honey 500g', 'Unfiltered pure honey sourced from natural wildflower meadows', 449.00,
       'https://images.unsplash.com/photo-1587049352847-4a222e784d38?w=500', 'FOOD', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Raw Wildflower Honey 500g');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Artisan Olive Oil 500ml', 'Extra virgin olive oil from Italian farms', 1299.00,
       'https://images.unsplash.com/photo-1589187155028-3a1c15b6a1c2?w=500', 'FOOD', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Artisan Olive Oil 500ml');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Gourmet Cheese Board', 'Selection of fine cheeses, crackers and nuts', 2599.00,
       'https://images.unsplash.com/photo-1586339948944-f665f0732c8f?w=500', 'FOOD', 40
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Gourmet Cheese Board');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Organic Green Tea Pack', 'Premium organic green tea bags (100 count)', 899.00,
       'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=500', 'FOOD', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Organic Green Tea Pack');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Roasted Pistachios 250g', 'Lightly salted oven-roasted premium pistachios', 499.00,
       'https://images.unsplash.com/photo-1528751014936-863e6e7a319c?w=500', 'FOOD', 150
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Roasted Pistachios 250g');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Organic Granola Pack 400g', 'Honey-baked oats with dried cranberries and almonds', 399.00,
       'https://images.unsplash.com/photo-1517093728432-a0440f8d45af?w=500', 'FOOD', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Organic Granola Pack 400g');


-- BOOKS (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Clean Code: Handbook of Agile Craftsmanship', 'A handbook of agile software craftsmanship by Robert C. Martin', 899.00,
       'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=500', 'BOOKS', 100
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Clean Code: Handbook of Agile Craftsmanship');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Designing Data-Intensive Applications', 'The big ideas behind reliable, scalable, and maintainable systems by Martin Kleppmann', 1299.00,
       'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500', 'BOOKS', 75
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Designing Data-Intensive Applications');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Atomic Habits by James Clear', 'An easy & proven way to build good habits & break bad ones', 499.00,
       'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500', 'BOOKS', 150
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Atomic Habits by James Clear');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'The Pragmatic Programmer', 'Your journey to mastery 20th anniversary edition by David Thomas & Andrew Hunt', 999.00,
       'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=500', 'BOOKS', 60
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'The Pragmatic Programmer');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'System Design Interview Guide', 'An insider guide to passing system design interviews in tech companies', 799.00,
       'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=500', 'BOOKS', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'System Design Interview Guide');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'The Mythical Man-Month', 'Classic software engineering book by Fred Brooks', 699.00,
       'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?w=500', 'BOOKS', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'The Mythical Man-Month');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Sapiens: A Brief History of Humankind', 'Exploration of human history by Yuval Noah Harari', 899.00,
       'https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=500', 'BOOKS', 70
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Sapiens: A Brief History of Humankind');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'The Lean Startup', 'Entrepreneurship methodology by Eric Ries', 599.00,
       'https://images.unsplash.com/photo-1492724441997-5dc865305c10?w=500', 'BOOKS', 95
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'The Lean Startup');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Deep Work by Cal Newport', 'Rules for focused success in a distracted world', 549.00,
       'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=500', 'BOOKS', 110
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Deep Work by Cal Newport');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Zero to One by Peter Thiel', 'Notes on startups, or how to build the future', 449.00,
       'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=500', 'BOOKS', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Zero to One by Peter Thiel');


-- HOME (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Ceramic Coffee Mug 350ml', 'Handcrafted minimalist ceramic mug with comfortable grip handle', 349.00,
       'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500', 'HOME', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Ceramic Coffee Mug 350ml');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Smart LED Desk Lamp', 'Dimmable eye-caring desk lamp with wireless phone charger base', 1599.00,
       'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=500', 'HOME', 55
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smart LED Desk Lamp');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Memory Foam Pillow', 'Ergonomic cervical pillow for neck support and side sleepers', 1199.00,
       'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=500', 'HOME', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Memory Foam Pillow');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Stainless Steel Water Bottle 1L', 'Double-wall vacuum insulated flask keeps drinks cold for 24 hours', 799.00,
       'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=500', 'HOME', 150
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Stainless Steel Water Bottle 1L');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Air Purifier for Bedroom', 'HEPA filter air purifier removing 99.97% dust, pollen and smoke', 3999.00,
       'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=500', 'HOME', 30
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Air Purifier for Bedroom');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Robot Vacuum Cleaner', 'Smart robot vacuum with mapping technology', 14999.00,
       'https://images.unsplash.com/photo-1580932464894-79b5d45b8771?w=500', 'HOME', 40
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Robot Vacuum Cleaner');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Smart Wi-Fi Plug', 'Remote controlled Wi-Fi power plug', 1999.00,
       'https://images.unsplash.com/photo-1582193886225-0d459e22d8fb?w=500', 'HOME', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smart Wi-Fi Plug');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Adjustable Standing Desk', 'Electric height-adjustable standing desk', 34999.00,
       'https://images.unsplash.com/photo-1579547621706-1a9c79d5d1f4?w=500', 'HOME', 20
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Adjustable Standing Desk');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Diffuser & Essential Oil Set', 'Ultrasonic aromatherapy diffuser with 6 organic essential oils', 1299.00,
       'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=500', 'HOME', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Diffuser & Essential Oil Set');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Non-Stick Cookware Set 5-Piece', 'Durable aluminum non-stick pots and pans with glass lids', 3299.00,
       'https://images.unsplash.com/photo-1584992236310-6edddc08acff?w=500', 'HOME', 45
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Non-Stick Cookware Set 5-Piece');


-- SPORTS (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Non-Slip TPE Yoga Mat', '6mm extra thick eco-friendly yoga mat with carrying strap', 899.00,
       'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=500', 'SPORTS', 110
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Non-Slip TPE Yoga Mat');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Resistance Loop Bands Set', '5 fitness exercise bands with different resistance levels for workout', 399.00,
       'https://images.unsplash.com/photo-1598289431512-b97b0917affc?w=500', 'SPORTS', 180
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Resistance Loop Bands Set');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Stainless Steel Shaker Bottle', '750ml leak-proof protein shaker bottle with wire whisk ball', 599.00,
       'https://images.unsplash.com/photo-1574680096145-d05b474e2155?w=500', 'SPORTS', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Stainless Steel Shaker Bottle');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Adjustable Jump Rope', 'Speed cable skipping rope with ball bearings and anti-slip handles', 299.00,
       'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=500', 'SPORTS', 200
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Adjustable Jump Rope');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Bicycle Helmet with Safety Light', 'Lightweight breathable cycling helmet with rear LED safety light', 1499.00,
       'https://images.unsplash.com/photo-1559348349-86f1f65817fe?w=500', 'SPORTS', 40
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Bicycle Helmet with Safety Light');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Fitness Tracker Band', 'Slim fitness tracker with heart rate monitoring', 2999.00,
       'https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?w=500', 'SPORTS', 110
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Fitness Tracker Band');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Yoga Wheel', 'Supportive yoga wheel for stretching and balance', 1999.00,
       'https://images.unsplash.com/photo-1583268905146-35a2d27c5c71?w=500', 'SPORTS', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Yoga Wheel');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Kettlebell Set 5-20kg', 'Adjustable kettlebell set for strength training', 3999.00,
       'https://images.unsplash.com/photo-1572654999859-9ef50b5e0139?w=500', 'SPORTS', 45
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Kettlebell Set 5-20kg');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Foam Roller for Muscle Massage', 'High-density deep tissue muscle foam roller', 699.00,
       'https://images.unsplash.com/photo-1518310383802-640c2de311b2?w=500', 'SPORTS', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Foam Roller for Muscle Massage');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Badminton Racket Twin Set', 'Lightweight carbon fiber badminton rackets with carrying bag', 1299.00,
       'https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?w=500', 'SPORTS', 75
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Badminton Racket Twin Set');


-- BEAUTY (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Organic Rose Face Oil', 'Hydrating facial oil with rose extracts', 1499.00,
       'https://images.unsplash.com/photo-1586082858015-5c2a09999e5b?w=500', 'BEAUTY', 70
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Organic Rose Face Oil');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Silk Pillowcase', 'Mulberry silk pillowcase for hair and skin care', 899.00,
       'https://images.unsplash.com/photo-1559493314-3e6aa6ec2b3d?w=500', 'BEAUTY', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Silk Pillowcase');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Electric Toothbrush', 'Rechargeable electric toothbrush with multiple modes', 3999.00,
       'https://images.unsplash.com/photo-1580840639281-71d0d5c7e29b?w=500', 'BEAUTY', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Electric Toothbrush');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Vitamin C Serum 30ml', 'Brightening facial serum with hyaluronic acid', 799.00,
       'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500', 'BEAUTY', 140
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Vitamin C Serum 30ml');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Hydrating Lip Balm Set', 'Pack of 4 natural moisturizing lip balms', 399.00,
       'https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?w=500', 'BEAUTY', 220
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Hydrating Lip Balm Set');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Jade Roller & Gua Sha Set', 'Natural facial massage tool set for skin tightening', 599.00,
       'https://images.unsplash.com/photo-1608248597260-6578616b30f2?w=500', 'BEAUTY', 160
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Jade Roller & Gua Sha Set');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Argan Hair Oil 100ml', 'Nourishing cold-pressed argan oil for shiny hair', 899.00,
       'https://images.unsplash.com/photo-1526947425960-945c6e72858f?w=500', 'BEAUTY', 110
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Argan Hair Oil 100ml');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Aloe Vera Soothing Gel', '99% pure organic aloe vera gel for face and body', 349.00,
       'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=500', 'BEAUTY', 190
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Aloe Vera Soothing Gel');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Volcanic Clay Face Mask', 'Deep cleansing pore-minimizing clay mask', 699.00,
       'https://images.unsplash.com/photo-1567928257065-f14977977d24?w=500', 'BEAUTY', 95
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Volcanic Clay Face Mask');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Rosewater Facial Mist', 'Refreshing hydrating toner spray for skin glow', 449.00,
       'https://images.unsplash.com/photo-1617897903246-719242758050?w=500', 'BEAUTY', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Rosewater Facial Mist');


-- GARDEN (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Solar Garden Lights', 'Solar powered LED lights for pathways and garden', 1999.00,
       'https://images.unsplash.com/photo-1563861404675-7d6991e32971?w=500', 'GARDEN', 150
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Solar Garden Lights');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Automatic Watering System', 'Smart automatic watering system with moisture sensor', 7499.00,
       'https://images.unsplash.com/photo-1517085038980-5dd5a2ae468c?w=500', 'GARDEN', 70
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Automatic Watering System');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Heavy Duty Garden Shovel', 'Sturdy metal garden shovel for digging', 1199.00,
       'https://images.unsplash.com/photo-1564170773994-8de3459740e1?w=500', 'GARDEN', 200
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Heavy Duty Garden Shovel');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Premium Compost Bin', 'Large compost bin with carbon filter', 2599.00,
       'https://images.unsplash.com/photo-1552820720-ec82bfe10ca9?w=500', 'GARDEN', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Premium Compost Bin');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Outdoor Patio Umbrella', 'UV-protective patio umbrella with stand', 3499.00,
       'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?w=500', 'GARDEN', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Outdoor Patio Umbrella');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Bonsai Tree Starter Kit', 'Complete growing kit with seeds, pots and tools', 899.00,
       'https://images.unsplash.com/photo-1512428559087-560fa5ceab42?w=500', 'GARDEN', 100
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Bonsai Tree Starter Kit');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Garden Pruning Shears', 'Ergonomic titanium-coated bypass pruners', 699.00,
       'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=500', 'GARDEN', 160
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Garden Pruning Shears');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Expandable Hose Pipe 50ft', 'Lightweight non-kink garden hose with spray nozzle', 1499.00,
       'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?w=500', 'GARDEN', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Expandable Hose Pipe 50ft');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Hanging Plant Baskets 2-Pack', 'Handwoven coconut fiber planter baskets', 799.00,
       'https://images.unsplash.com/photo-1485955900006-10f4d324d411?w=500', 'GARDEN', 140
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Hanging Plant Baskets 2-Pack');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Plant Moisture Meter', 'Soil pH and moisture meter for potted plants', 499.00,
       'https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?w=500', 'GARDEN', 170
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Plant Moisture Meter');


-- AUTOMOTIVE & TOYS (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Bluetooth Car Adapter', 'Plug-in Bluetooth adapter for hands-free calls', 1499.00,
       'https://images.unsplash.com/photo-1521317827510-5d640e9bda79?w=500', 'AUTOMOTIVE', 250
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Bluetooth Car Adapter');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'All-Season Car Floor Mats', 'Durable rubber floor mats for all weather', 1999.00,
       'https://images.unsplash.com/photo-1575936123452-b67c3203c357?w=500', 'AUTOMOTIVE', 180
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'All-Season Car Floor Mats');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Portable Tire Inflator', '12V portable tire inflator with digital display', 2999.00,
       'https://images.unsplash.com/photo-1474447244734-8e010776b60c?w=500', 'AUTOMOTIVE', 220
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Portable Tire Inflator');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Car Phone Mount', 'Adjustable magnetic phone mount for dashboard', 1199.00,
       'https://images.unsplash.com/photo-1519661390365-bae336bd1fd7?w=500', 'AUTOMOTIVE', 210
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Car Phone Mount');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Car Vacuum Cleaner', 'High power portable cordless handheld vacuum', 1899.00,
       'https://images.unsplash.com/photo-1558317374-067fb5f30001?w=500', 'AUTOMOTIVE', 140
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Car Vacuum Cleaner');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'STEM Robotics Kit', 'Educational robotics kit for ages 8+', 5499.00,
       'https://images.unsplash.com/photo-1581091220679-3f9e8b28a819?w=500', 'TOYS', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'STEM Robotics Kit');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Wooden Puzzle Set', 'Handcrafted wooden puzzles for kids', 1199.00,
       'https://images.unsplash.com/photo-1590656981320-66792761a6ec?w=500', 'TOYS', 300
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wooden Puzzle Set');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Remote Control Car', 'Fast 2.4GHz remote control car with LED lights', 2599.00,
       'https://images.unsplash.com/photo-1589196596874-b607f003ef39?w=500', 'TOYS', 190
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Remote Control Car');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Building Blocks Deluxe', '1000-piece deluxe building block set', 3499.00,
       'https://images.unsplash.com/photo-1556527906-5c585b836c2e?w=500', 'TOYS', 140
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Building Blocks Deluxe');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Educational Science Kit', 'Science experiments kit for budding scientists', 3999.00,
       'https://images.unsplash.com/photo-1556104576-4cbd82e4a7b5?w=500', 'TOYS', 110
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Educational Science Kit');


-- PET SUPPLIES & GADGETS (10 items)
INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Premium Dog Food 5kg', 'High-protein dog food, grain-free', 2999.00,
       'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500', 'PET_SUPPLIES', 250
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Premium Dog Food 5kg');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Cat Scratching Post', 'Eco-friendly cat scratching post with toy', 1499.00,
       'https://images.unsplash.com/photo-1518852364565-3f201a6af0b1?w=500', 'PET_SUPPLIES', 200
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Cat Scratching Post');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Pet Grooming Brush', 'Soft bristle brush for pet grooming', 799.00,
       'https://images.unsplash.com/photo-1567041379043-0c5e459ad0e2?w=500', 'PET_SUPPLIES', 300
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Pet Grooming Brush');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Aquarium Starter Kit', 'Complete starter kit with tank, filter, and lights', 6999.00,
       'https://images.unsplash.com/photo-1588339496426-bffa12943c64?w=500', 'PET_SUPPLIES', 90
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Aquarium Starter Kit');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Automatic Pet Feeder', 'Programmable timed pet food dispenser', 3499.00,
       'https://images.unsplash.com/photo-1548767797-d8c844163c4c?w=500', 'PET_SUPPLIES', 85
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Automatic Pet Feeder');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Smart Home Hub', 'Central hub to control all smart devices', 7999.00,
       'https://images.unsplash.com/photo-1586868213710-1ab973c2c8c2?w=500', 'GADGETS', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smart Home Hub');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Portable Mini Projector', 'Mini projector with HDMI and USB support', 14999.00,
       'https://images.unsplash.com/photo-1523755231516-0ba2e9c11e9f?w=500', 'GADGETS', 60
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Portable Mini Projector');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Digital Blood Pressure Monitor', 'Automatic arm cuff monitor with memory', 6499.00,
       'https://images.unsplash.com/photo-1581081789001-fc5eb54d6ec2?w=500', 'HEALTH', 130
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Digital Blood Pressure Monitor');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Percussive Massage Gun', 'Deep muscle massage gun with 6 speed levels', 7999.00,
       'https://images.unsplash.com/photo-1586399467218-23c0c49c1f57?w=500', 'HEALTH', 95
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Percussive Massage Gun');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Acoustic Guitar', 'Full-size dreadnought acoustic guitar', 8999.00,
       'https://images.unsplash.com/photo-1511356774005-5c2a71b9ddc3?w=500', 'MUSIC', 120
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Acoustic Guitar');


-- =========================
-- ORDERS (linked to products)
-- =========================

-- Alice orders Wireless Mechanical Keyboard
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 1, p.price * 1, 'DELIVERED', NOW() - INTERVAL '10 days'
FROM users u, products p
WHERE u.email = 'alice@example.com' AND p.name = 'Wireless Mechanical Keyboard'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);

-- Alice orders Ergonomic Wireless Mouse
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 2, p.price * 2, 'SHIPPED', NOW() - INTERVAL '3 days'
FROM users u, products p
WHERE u.email = 'alice@example.com' AND p.name = 'Ergonomic Wireless Mouse'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);

-- Bob orders Aluminium Laptop Stand
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 1, p.price * 1, 'DELIVERED', NOW() - INTERVAL '20 days'
FROM users u, products p
WHERE u.email = 'bob@example.com' AND p.name = 'Aluminium Laptop Stand'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);

-- Bob orders Clean Code
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 1, p.price * 1, 'PENDING', NOW() - INTERVAL '1 days'
FROM users u, products p
WHERE u.email = 'bob@example.com' AND p.name = 'Clean Code: Handbook of Agile Craftsmanship'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);