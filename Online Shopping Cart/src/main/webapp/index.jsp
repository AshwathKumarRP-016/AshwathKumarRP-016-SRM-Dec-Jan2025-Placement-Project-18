<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Shopping</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .menu {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .cart-btn {
            background-color: #008CBA;
        }
        .cart-btn:hover {
            background-color: #007B9A;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🛒 Online Shopping Cart</h1>
        <p>Welcome to our online store! Browse products and add them to your cart.</p>
        
        <div class="menu">
            <a href="products.jsp" class="btn">Browse Products</a>
            <a href="cart.jsp" class="btn cart-btn">View Cart</a>
        </div>
        
        <%-- Display cart item count if available --%>
        <%
            if (session != null) {
                java.util.List<String> cart = (java.util.List<String>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
        %>
            <div style="text-align: center; margin-top: 20px; color: #4CAF50;">
                <strong>Currently you have <%= cart.size() %> item(s) in your cart</strong>
            </div>
        <%
                }
            }
        %>
    </div>
</body>
</html>