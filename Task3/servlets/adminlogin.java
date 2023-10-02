package com.chandan.servlets;

import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;


public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		PrintWriter out=response.getWriter();
		RequestDispatcher dispatcher=null;
		HttpSession session=request.getSession();
		
		String email,password;
		email=request.getParameter("uemail");
		password=request.getParameter("upassword");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("database_url_will_here");
			System.out.println("Database Connected");
			
			pstmt=con.prepareStatement("select * from accounts where email=? and password=? and role='admin';");
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				session.setAttribute("name",rs.getString("name"));
				session.setAttribute("accno",rs.getString("accno"));
				session.setAttribute("acctype",rs.getString("acctype"));
				session.setAttribute("status",rs.getString("status"));
				session.setAttribute("balance",rs.getString("balance"));
				session.setAttribute("branch",rs.getString("branch"));
				session.setAttribute("email",rs.getString("email"));
				session.setAttribute("mobile",rs.getString("mobile"));
				session.setAttribute("role", rs.getString("role"));
			
				dispatcher=request.getRequestDispatcher("index.jsp");
			}
			else
			{
				request.setAttribute("status","failed");
				dispatcher=request.getRequestDispatcher("adminlogin.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}
