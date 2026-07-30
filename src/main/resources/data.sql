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
-- PRODUCTS
-- =========================

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Wireless Keyboard', 'Compact wireless keyboard with long battery life', 1299.00,
       'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400', 'ELECTRONICS', 50
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wireless Keyboard');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Optical Mouse', 'Ergonomic optical mouse with 1600 DPI', 599.00,
       'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400', 'ELECTRONICS', 80
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Optical Mouse');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Laptop Stand', 'Aluminium adjustable laptop stand', 899.00,
       'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=400', 'ELECTRONICS', 30
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Laptop Stand');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'USB-C Hub', '7-in-1 USB-C hub with HDMI, USB 3.0, and PD charging', 1799.00,
       'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400', 'ELECTRONICS', 25
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'USB-C Hub');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Running Shoes', 'Lightweight breathable running shoes for all terrains', 2499.00,
       'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400', 'SPORTS', 60
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Running Shoes');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Yoga Mat', 'Non-slip 6mm thick yoga mat with carrying strap', 799.00,
       'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=400', 'SPORTS', 40
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Yoga Mat');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Clean Code', 'A handbook of agile software craftsmanship by Robert C. Martin', 499.00,
       'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=400', 'BOOKS', 100
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Clean Code');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'The Pragmatic Programmer', 'Your journey to mastery by David Thomas and Andrew Hunt', 549.00,
       'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400', 'BOOKS', 75
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'The Pragmatic Programmer');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Desk Lamp', 'LED desk lamp with adjustable brightness and color temperature', 699.00,
       'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=400', 'HOME', 45
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Desk Lamp');

INSERT INTO products (name, description, price, image_url, category, stock)
SELECT 'Cotton T-Shirt', 'Premium 100% cotton unisex t-shirt', 349.00,
       'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400', 'CLOTHING', 200
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Cotton T-Shirt');

-- =========================
-- ORDERS (linked to products)
-- =========================

-- Alice orders Wireless Keyboard
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 1, p.price * 1, 'DELIVERED', NOW() - INTERVAL '10 days'
FROM users u, products p
WHERE u.email = 'alice@example.com' AND p.name = 'Wireless Keyboard'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);

-- Alice orders Optical Mouse
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 2, p.price * 2, 'SHIPPED', NOW() - INTERVAL '3 days'
FROM users u, products p
WHERE u.email = 'alice@example.com' AND p.name = 'Optical Mouse'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);

-- Bob orders Laptop Stand
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 1, p.price * 1, 'DELIVERED', NOW() - INTERVAL '20 days'
FROM users u, products p
WHERE u.email = 'bob@example.com' AND p.name = 'Laptop Stand'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);

-- Bob orders Clean Code
INSERT INTO orders (user_id, product_id, quantity, total_price, status, order_date)
SELECT u.id, p.id, 1, p.price * 1, 'PENDING', NOW() - INTERVAL '1 days'
FROM users u, products p
WHERE u.email = 'bob@example.com' AND p.name = 'Clean Code'
AND NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.product_id = p.id
);