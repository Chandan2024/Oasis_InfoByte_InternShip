package com.chandan.servlets;

import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;


public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con;
		PreparedStatement pstmt,check;
		ResultSet rs;
		response.setContentType("text/html");
		RequestDispatcher dispatcher=null;
		PrintWriter out=response.getWriter();

		String name,email,mobile,type,branch,password,question,answer;
		name=request.getParameter("uname");
		password=request.getParameter("upassword");
		type=request.getParameter("utype");
		branch=request.getParameter("ubranch");
		email=request.getParameter("uemail");
		question=request.getParameter("uquestion");
		answer=request.getParameter("uanswer");
		mobile=request.getParameter("umobile");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("database_url_will_here");
			System.out.println("Database Connected\nApllication running");
			
			pstmt=con.prepareStatement("insert into accounts (accno,name,password,acctype,status,balance,branch,email,question,answer,mobile,role) values(accno,?,?,?,'Active',0,?,?,?,?,?,'user');");
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, type);
			pstmt.setString(4, branch);
			pstmt.setString(5, email);
			pstmt.setString(6, question);
			pstmt.setString(7, answer);
			pstmt.setString(8, mobile);
			
			
			check=con.prepareStatement("select * from accounts where email=? and mobile=? and acctype=?;");
			check.setString(1, email);
			check.setString(2,mobile);
			check.setString(3,type);
			rs=check.executeQuery();
			
			if(rs.next())
			{
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("register.jsp");
			}
			else
			{
				int i=pstmt.executeUpdate();
				if(i>0)
				{
					request.setAttribute("status", "success");
					dispatcher=request.getRequestDispatcher("register.jsp");
				}
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}
