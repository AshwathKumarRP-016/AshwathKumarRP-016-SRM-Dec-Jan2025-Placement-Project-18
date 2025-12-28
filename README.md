# 🛒 Online Shopping Cart - Basic Version

## 📋 Project Overview
A lightweight JSP + Servlet-based web application simulating an online shopping cart system. This project demonstrates core web development concepts including session management, servlet handling, and dynamic content rendering without external dependencies.

## 🎯 Features
- **Product Listing Page** (`products.jsp`) - Displays 6 sample products with add-to-cart functionality
- **Shopping Cart** (`cart.jsp`) - Real-time cart management with add/remove/clear operations
- **Session Management** - Persistent cart storage using HTTP sessions
- **Type-Safe Implementation** - Proper Java generics and exception handling
- **Responsive UI** - Clean, modern interface with visual feedback

## 📁 Project Structure
```
OnlineShoppingCart/
├── src/
│   └── main/
│       ├── java/com/example/cart/
│       │   ├── CartServlet.java    # Main servlet controller
│       │   └── Product.java        # Product model class
│       ├── webapp/
│       │   ├── WEB-INF/web.xml     # Deployment descriptor
│       │   ├── index.jsp           # Home page
│       │   ├── products.jsp        # Product listing
│       │   └── cart.jsp            # Shopping cart
│       └── resources/
```

## 🔧 Key Components

### 1. CartServlet.java
- Handles all cart operations (add/remove/clear)
- Manages session-based cart storage
- Provides type-safe cart retrieval with error handling

### 2. Product.java
- Serializable POJO class representing product data
- Encapsulates product ID, name, and price
- Enables proper object-oriented design

### 3. products.jsp
- Displays product catalog with add-to-cart buttons
- Shows success/error messages
- Provides navigation to cart

### 4. cart.jsp
- Displays cart contents with real-time updates
- Shows order summary with tax calculation
- Implements cart manipulation actions

### 5. web.xml
- Servlet mapping configuration
- Welcome file setup
- Session configuration

## 🎨 UI Features
- **Product Grid**: Responsive card-based layout
- **Visual Feedback**: Success/error messages with auto-hide
- **Cart Summary**: Real-time total calculation with tax
- **Confirmation Dialogs**: For destructive actions (remove/clear)
- **Emoji Integration**: Visual product representation

## 📊 Data Flow
1. User browses products on `products.jsp`
2. Clicking "Add to Cart" submits to `CartServlet`
3. Servlet processes request and updates session
4. User views/updates cart on `cart.jsp`
5. All changes persist via session until cleared or expired
