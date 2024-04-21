package com.shoppingcart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingcart.dto.Admin;
import com.shoppingcart.dto.Customers;
import com.shoppingcart.dto.Merchant;

@WebServlet("/loginvalidate")
public class LoginValidate extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	String choice=req.getParameter("choice");
	
	if(choice.equals("Customer")) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("shopping");
		EntityManager em = emf.createEntityManager();
		Query query=em.createQuery("select b from Customers b where b.email=?1 and b.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<Customers> customers=query.getResultList();
		
		if(customers.size()>0)
		{
			HttpSession httpSession=req.getSession();
			httpSession.setAttribute("customer", customers.get(0));
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("customeroption.html");
			dispatcher.forward(req, resp);
		}
		else
		{
			PrintWriter printWriter=resp.getWriter();
			printWriter.write("Invalid Credential");
			RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
			dispatcher.include(req, resp);
			resp.setContentType("text/html");
			
		}
	}
	else if(choice.equals("Merchant"))
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("shopping");
		EntityManager em = emf.createEntityManager();
		Query query=em.createQuery("select b from Merchant b where b.email=?1 and b.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<Merchant> merchants=query.getResultList();
		
		if(merchants.size()>0)
		{
			if(merchants.size()>0)
			{
				Merchant m=merchants.get(0);
				if(m.getStatus().equals("active"))
				{
					HttpSession httpSession=req.getSession();
					httpSession.setAttribute("merchant", m);
					
					RequestDispatcher dispatcher=req.getRequestDispatcher("merchantoption.html");
					dispatcher.forward(req, resp);
					
				}
				else if(m.getStatus().equals("inactive"))
				{
					PrintWriter printWriter=resp.getWriter();
					printWriter.write("Your account is not active");
					RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
					dispatcher.include(req, resp);
					resp.setContentType("text/html");
				}
				else if(m.getStatus().equals("blocked"))
				{
					PrintWriter printWriter=resp.getWriter();
					printWriter.write("Your Account is Blocked");
					RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
					dispatcher.include(req, resp);
					resp.setContentType("text/html");
					
				}
				
			}
			
		}
		else
		{
			PrintWriter printWriter=resp.getWriter();
			printWriter.write("Invalid Credential");
			RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
			dispatcher.include(req, resp);
			resp.setContentType("text/html");
			
		}
	}
	else if(choice.equals("Admin"))
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("shopping");
		EntityManager em = emf.createEntityManager();
		Query query=em.createQuery("select b from Admin b where b.email=?1 and b.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<Admin> admins=query.getResultList();
		
		if(admins.size()>0)
		{
			Admin admin=admins.get(0);
			
			HttpSession httpSession=req.getSession();
			
			httpSession.setAttribute("admin",admin);
			
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("adminoption.html");
			dispatcher.forward(req, resp);
		}
		else
		{
			PrintWriter printWriter=resp.getWriter();
			printWriter.write("Invalid Credential");
			RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
			dispatcher.include(req, resp);
			resp.setContentType("text/html");
			
		}
	}
}
	
}
