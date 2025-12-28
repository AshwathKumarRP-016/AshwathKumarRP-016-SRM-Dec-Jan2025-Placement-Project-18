<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.cart.Product" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart - Online Shopping</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .header-links {
            text-align: right;
            margin-bottom: 20px;
        }
        .header-links a {
            margin-left: 15px;
            color: #008CBA;
            text-decoration: none;
            font-weight: bold;
        }
        .cart-empty {
            text-align: center;
            padding: 50px;
            color: #666;
            font-size: 18px;
        }
        .cart-items {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .cart-items th {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: left;
        }
        .cart-items td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }
        .cart-items tr:hover {
            background-color: #f5f5f5;
        }
        .cart-items tr:last-child td {
            border-bottom: none;
        }
        .remove-btn {
            background-color: #ff4444;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .remove-btn:hover {
            background-color: #cc0000;
        }
        .cart-summary {
            margin-top: 30px;
            padding: 25px;
            background-color: #f9f9f9;
            border-radius: 8px;
            text-align: right;
            border: 1px solid #ddd;
        }
        .cart-summary h2 {
            margin-top: 0;
            color: #333;
        }
        .cart-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            font-size: 16px;
            display: inline-block;
            text-align: center;
            transition: all 0.3s;
        }
        .continue-shopping {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
        }
        .continue-shopping:hover {
            background-color: #5a6268;
            text-decoration: none;
            color: white;
        }
        .checkout-btn {
            background-color: #4CAF50;
            color: white;
        }
        .checkout-btn:hover {
            background-color: #45a049;
        }
        .clear-cart {
            background-color: #ffc107;
            color: black;
        }
        .clear-cart:hover {
            background-color: #e0a800;
        }
        .total-price {
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50;
            margin: 10px 0;
        }
        .item-count {
            color: #666;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .empty-cart-icon {
            font-size: 60px;
            margin-bottom: 20px;
            color: #ddd;
        }
        .cart-icon {
            margin-right: 10px;
        }
        .product-image-small {
            width: 50px;
            height: 50px;
            background-color: #e0e0e0;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 24px;
        }
        .product-info {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-links">
            <a href="index.jsp">🏠 Home</a>
            <a href="products.jsp">🛍️ Continue Shopping</a>
        </div>
        
        <h1><span class="cart-icon">🛒</span> Your Shopping Cart</h1>
        
        <%
            
            List<Product> cart = null;
            Object cartObj = session.getAttribute("cart");
            
            if (cartObj instanceof List) {
                try {
                   
                    cart = (List<Product>) cartObj;
                } catch (ClassCastException e) {
                    
                    cart = new ArrayList<>();
                    session.setAttribute("cart", cart);
                }
            } else {
                
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }
            
            
            if (cart == null || cart.isEmpty()) {
        %>
            <div class="cart-empty">
                <div class="empty-cart-icon">🛒</div>
                <h2>Your cart is empty 😔</h2>
                <p>Looks like you haven't added any products to your cart yet.</p>
                <p>Browse our products and add some items!</p>
                <a href="products.jsp" class="btn continue-shopping" style="margin-top: 25px;">
                    🛍️ Browse Products
                </a>
            </div>
        <%
            } else {
                
                double total = 0;
                for (Product product : cart) {
                    total += product.getPrice();
                }
        %>
            <div class="item-count">
                <strong><%= cart.size() %> item(s) in your cart</strong>
            </div>
            
            <table class="cart-items">
                <thead>
                    <tr>
                        <th style="width: 50px;"></th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                       
                        java.util.Map<String, String> emojiMap = new java.util.HashMap<>();
                        emojiMap.put("Laptop", "💻");
                        emojiMap.put("Smartphone", "📱");
                        emojiMap.put("Headphones", "🎧");
                        emojiMap.put("Smart Watch", "⌚");
                        emojiMap.put("E-Book Reader", "📚");
                        emojiMap.put("Gaming Console", "🎮");
                        
                        for (Product product : cart) {
                            String emoji = emojiMap.getOrDefault(product.getName(), "📦");
                    %>
                    <tr>
                        <td>
                            <div class="product-image-small">
                                <%= emoji %>
                            </div>
                        </td>
                        <td>
                            <div class="product-info">
                                <strong><%= product.getName() %></strong><br>
                                <small>ID: <%= product.getId() %></small>
                            </div>
                        </td>
                        <td style="font-weight: bold; color: #4CAF50;">
                            ₹<%= String.format("%.2f", product.getPrice()) %>
                        </td>
                        <td>
                            <form action="cart" method="post" style="display: inline;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button type="submit" class="remove-btn" 
                                        onclick="return confirm('Remove <%= product.getName() %> from cart?')">
                                    ✕ Remove
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            
            <div class="cart-summary">
                <h2>Order Summary</h2>
                <p>Subtotal (<%= cart.size() %> items): <strong>₹<%= String.format("%.2f", total) %></strong></p>
                <p>Shipping: <strong>FREE</strong></p>
                <p>Tax (10%): <strong>₹<%= String.format("%.2f", total * 0.10) %></strong></p>
                <hr style="margin: 15px 0;">
                <p class="total-price">Total: ₹<%= String.format("%.2f", total * 1.10) %></p>
            </div>
            
            <div class="cart-actions">
                <a href="products.jsp" class="btn continue-shopping">
                    ← Continue Shopping
                </a>
                
                <div>
                    <form action="cart" method="post" style="display: inline-block; margin-right: 10px;">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" class="btn clear-cart" 
                                onclick="return confirm('Are you sure you want to clear your entire cart?')">
                            🗑️ Clear Cart
                        </button>
                    </form>
                    
                    <button class="btn checkout-btn" 
                            onclick="showCheckoutMessage(<%= cart.size() %>, <%= total * 1.10 %>)">
                        Proceed to Checkout →
                    </button>
                </div>
            </div>
        <%
            }
        %>
    </div>
    
    <script>
        function showCheckoutMessage(itemCount, total) {
            alert('Checkout feature is not implemented in this basic version.\n\n' +
                  'Items in cart: ' + itemCount + '\n' +
                  'Total amount: ₹' + total.toFixed(2) + '\n\n' +
                  'In a real application, this would redirect to payment processing.');
        }
        
        
        setTimeout(function() {
            var message = document.querySelector('.message');
            if (message) {
                message.style.transition = 'opacity 0.5s';
                message.style.opacity = '0';
                setTimeout(function() {
                    message.style.display = 'none';
                }, 500);
            }
        }, 3000);
    </script>
</body>
</html>