package com.example.cart;

import java.io.*;
import java.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        
       
        List<Product> cart = getCartFromSession(session);
        
        if ("add".equals(action)) {
            
            String productId = request.getParameter("productId");
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            
            
            Product product = new Product(productId, productName, price);
            cart.add(product);
            
           
            session.setAttribute("cart", cart);
            
            
            request.setAttribute("message", productName + " added to cart successfully!");
            
           
            request.getRequestDispatcher("products.jsp").forward(request, response);
            
        } else if ("remove".equals(action)) {
            
            String productId = request.getParameter("productId");
            
            
            cart.removeIf(product -> product.getId().equals(productId));
            
            
            session.setAttribute("cart", cart);
            
           
            response.sendRedirect("cart.jsp");
            
        } else if ("clear".equals(action)) {
            
            cart.clear();
            
            
            session.setAttribute("cart", cart);
            
            response.sendRedirect("cart.jsp");
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       
        response.sendRedirect("cart.jsp");
    }
    
   
    @SuppressWarnings("unchecked")
    private List<Product> getCartFromSession(HttpSession session) {
        Object cartObj = session.getAttribute("cart");
        
        if (cartObj instanceof List) {
            try {
                
                return (List<Product>) cartObj;
            } catch (ClassCastException e) {
               
                List<Product> newCart = new ArrayList<>();
                session.setAttribute("cart", newCart);
                return newCart;
            }
        } else {
            
            List<Product> newCart = new ArrayList<>();
            session.setAttribute("cart", newCart);
            return newCart;
        }
    }
}