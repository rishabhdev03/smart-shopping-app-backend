# 🛒 Smart Shopping App — RESTful Spring Boot Backend API

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-4.1.0-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![JWT](https://img.shields.io/badge/JWT-Stateless-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white)](https://jwt.io/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)

A production-grade, secure, and scalable **RESTful Backend API** designed for a **Smart Shopping Mobile Application** (target frontend: Kotlin & Jetpack Compose for Android).

Built with **Spring Boot**, **Spring Security (JWT)**, **Spring Data JPA**, and **PostgreSQL**.

---

## 🌟 Key Features

### 🔐 1. Authentication & Security
* **Stateless JWT Authentication**: Secure 24-hour token-based authentication using Java JWT (`jjwt`).
* **Password Encryption**: Passwords hashed using **BCrypt** before saving to the database.
* **Role-Based Access Control (RBAC)**: Fine-grained access control separating `USER` and `ADMIN` privileges.
* **CORS Support**: Configured cross-origin support for Android emulators and mobile devices.

### 🛍️ 2. Product Catalog & Search
* **Category Filtering**: Filter products by categories (`ELECTRONICS`, `CLOTHING`, `FOOD`, `BOOKS`, `HOME`, `SPORTS`, etc).
* **Search Engine**: Case-insensitive search by product name with combined category filtering.
* **Admin Catalog Management**: Admin endpoints for creating, updating, and deleting product inventory.

### 🛒 3. Smart Shopping Cart
* **Automatic Quantity Merging**: Duplicate product additions automatically merge into existing cart items instead of creating duplicate entries.
* **Server-Side Subtotal Calculation**: Financial subtotals computed server-side (`price × quantity`) to prevent client-side price tampering.
* **Cart Item Ownership Enforcement**: Strict validation ensuring users can only manage their own cart.

### 📦 4. Order Processing
* **Server-Validated Orders**: Orders link directly to `Product` entities; total price is strictly calculated server-side.
* **Order Status Lifecycle**: Automatic status tracking (`PENDING` → `PROCESSING` → `SHIPPED` → `DELIVERED`).
* **User Order History**: Dedicated endpoint for users to review past purchases.

---

## 🛠️ Technology Stack

| Component | Technology |
|---|---|
| **Framework** | Spring Boot 4.1.0 |
| **Language** | Java 17 |
| **Security** | Spring Security, JJWT (v0.13.0) |
| **Database** | PostgreSQL |
| **ORM / Data Access** | Spring Data JPA / Hibernate |
| **Validation** | Jakarta Bean Validation (`@Valid`, `@NotBlank`, `@Min`) |
| **Boilerplate Reduction** | Lombok |
| **Build Tool** | Apache Maven |

---

## 🏗️ Architecture Overview

The project follows a clean **Layered Architecture** adhering to separation of concerns:

```
📱 Client (Android / Kotlin Jetpack Compose)
       │
       ▼ (HTTP / REST + Bearer JWT)
┌──────────────┐
│  Controllers │  <-- API Routing, Input Validation, HTTP Status Codes
└──────┬───────┘
       │
       ▼
┌──────────────┐
│   Services   │  <-- Business Logic, Transactions, Financial Calculations
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ Repositories │  <-- Spring Data JPA / SQL Queries
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ PostgreSQL DB│  <-- Tables: users, products, orders, cart_items
└──────────────┘
```

---

## 🗄️ Database Schema & Entities

```
+------------------+         +--------------------+
|      users       |         |      products      |
+------------------+         +--------------------+
| PK  id           |         | PK  id             |
|     name         |         |     name           |
|     email (UQ)   |         |     description    |
|     password     |         |     price          |
|     role (ENUM)  |         |     image_url      |
+--------+---------+         |     category (ENUM)|
         |                   |     stock          |
         |                   +---------+----------+
         |                             |
         +-------------+---------------+
                       |
        +--------------+---------------+
        |                              |
        v                              v
+------------------+         +--------------------+
|      orders      |         |     cart_items     |
+------------------+         +--------------------+
| PK  id           |         | PK  id             |
| FK  user_id      |         | FK  user_id        |
| FK  product_id   |         | FK  product_id     |
|     quantity     |         |     quantity       |
|     total_price  |         | UNIQUE(user,prod)  |
|     status (ENUM)|         +--------------------+
|     order_date   |
+------------------+
```

---

## 📡 API Endpoint Reference

### 🔓 Public Endpoints (No Auth Required)
| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/v1/auth/register` | Register a new user (`{name, email, password}`) |
| `POST` | `/api/v1/auth/login` | Authenticate & get JWT (`{email, password}`) |
| `GET` | `/api/v1/products` | Retrieve all products |
| `GET` | `/api/v1/products/{id}` | Get product by ID |
| `GET` | `/api/v1/products/search?query=&category=` | Search products by name/category |

### 👤 User Endpoints (`Authorization: Bearer <token>`)
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/v1/users/me` | Fetch logged-in user profile |
| `PUT` | `/api/v1/users/me` | Update user profile |
| `GET` | `/api/v1/cart` | View items in shopping cart |
| `POST` | `/api/v1/cart` | Add product to cart (`{productId, quantity}`) |
| `PUT` | `/api/v1/cart/{id}?quantity=N` | Update cart item quantity |
| `DELETE` | `/api/v1/cart/{id}` | Remove item from cart |
| `DELETE` | `/api/v1/cart` | Clear entire shopping cart |
| `POST` | `/api/v1/orders` | Place an order (`{productId, quantity}`) |
| `GET` | `/api/v1/orders/my` | View logged-in user's order history |
| `GET` | `/api/v1/orders/my/{id}` | View details of a specific order |

### 🔐 Admin Endpoints (`Authorization: Bearer <admin-token>`)
| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/v1/products` | Create a new product listing |
| `PUT` | `/api/v1/products/{id}` | Update product details |
| `DELETE` | `/api/v1/products/{id}` | Delete a product listing |
| `GET` | `/api/v1/users` | List all registered users |
| `GET` | `/api/v1/users/paginated` | Get paginated & sorted users |
| `GET` | `/api/v1/orders` | View all customer orders |

---

## ⚡ Quick Start & Local Setup

### Prerequisites
* **Java 17** or higher
* **Maven** (or use included `mvnw`)
* **PostgreSQL** running locally or via Docker

### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/smart-shopping-backend.git
cd smart-shopping-backend
```

### 2. Configure Database
Update `src/main/resources/application.properties` with your PostgreSQL credentials:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/shopping_db
spring.datasource.username=postgres
spring.datasource.password=your_password
```

### 3. Build & Run
```bash
./mvnw clean spring-boot:run
```
The server will start at `http://localhost:8080`. Seed data (products and default users) will automatically populate via `data.sql`.

---

## 📱 Kotlin / Android Integration

When building the Android app with **Retrofit** and **Jetpack Compose**:

```kotlin
// Pass JWT Token in header for protected routes
@GET("api/v1/cart")
suspend fun getCart(
    @Header("Authorization") token: String // "Bearer <jwt_token>"
): Response<List<CartItemDto>>
```


Deployment

This Spring Boot backend is deployed on AWS EC2 and is publicly accessible.

Base URL

http://13.60.62.229:8080/api/v1/

All API endpoints should be called using the above base URL.


---

🎉 Happy coding, Rishabh! 🎉

