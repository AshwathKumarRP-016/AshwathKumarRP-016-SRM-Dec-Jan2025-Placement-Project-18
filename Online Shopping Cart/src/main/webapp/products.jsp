<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products - Online Shopping</title>
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
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            background: #f9f9f9;
            transition: transform 0.2s;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .product-image {
            width: 100%;
            height: 150px;
            background-color: #e0e0e0;
            margin-bottom: 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
        }
        .product-name {
            font-weight: bold;
            font-size: 18px;
            margin: 10px 0;
        }
        .product-price {
            color: #4CAF50;
            font-size: 16px;
            margin: 10px 0;
        }
        .add-to-cart {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 10px;
            width: 100%;
        }
        .add-to-cart:hover {
            background-color: #45a049;
        }
        .message {
            padding: 10px;
            background-color: #dff0d8;
            border: 1px solid #d6e9c6;
            border-radius: 5px;
            margin: 20px 0;
            color: #3c763d;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-links">
            <a href="index.jsp">Home</a>
            <a href="cart.jsp">View Cart</a>
        </div>
        
        <h1>📦 Our Products</h1>
        
        <%-- Display success message if item was added --%>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="message">
                ✅ <%= message %>
            </div>
        <%
            }
        %>
        
        <div class="product-grid">
            <%-- Product 1 --%>
            <div class="product-card">
                <div class="product-image">💻</div>
                <div class="product-name">Laptop</div>
                <div class="product-price">₹999.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="1">
                    <input type="hidden" name="productName" value="Laptop">
                    <input type="hidden" name="price" value="999.99">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
            
            <%-- Product 2 --%>
            <div class="product-card">
                <div class="product-image">📱</div>
                <div class="product-name">Smartphone</div>
                <div class="product-price">₹699.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="2">
                    <input type="hidden" name="productName" value="Smartphone">
                    <input type="hidden" name="price" value="699.99">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
            
            <%-- Product 3 --%>
            <div class="product-card">
                <div class="product-image">🎧</div>
                <div class="product-name">Headphones</div>
                <div class="product-price">₹149.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="3">
                    <input type="hidden" name="productName" value="Headphones">
                    <input type="hidden" name="price" value="149.99">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
            
            <%-- Product 4 --%>
            <div class="product-card">
                <div class="product-image">⌚</div>
                <div class="product-name">Smart Watch</div>
                <div class="product-price">₹249.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="4">
                    <input type="hidden" name="productName" value="Smart Watch">
                    <input type="hidden" name="price" value="249.99">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
            
            <%-- Product 5 --%>
            <div class="product-card">
                <div class="product-image">📚</div>
                <div class="product-name">E-Book Reader</div>
                <div class="product-price">₹129.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="5">
                    <input type="hidden" name="productName" value="E-Book Reader">
                    <input type="hidden" name="price" value="129.99">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
            
            <%-- Product 6 --%>
            <div class="product-card">
                <div class="product-image">🎮</div>
                <div class="product-name">Gaming Console</div>
                <div class="product-price">₹499.99</div>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="6">
                    <input type="hidden" name="productName" value="Gaming Console">
                    <input type="hidden" name="price" value="499.99">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="cart.jsp" class="add-to-cart" style="width: auto; display: inline-block; padding: 12px 30px;">
                🛒 Proceed to Cart
            </a>
        </div>
    </div>
</body>
</html>