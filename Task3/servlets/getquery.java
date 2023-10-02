package com.chandan.servlets;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*; 
import java.io.IOException;

public class getquery extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		String email,qtype,desc;
		email=request.getParameter("qemail");
		qtype=request.getParameter("qtype");
		desc=request.getParameter("qdesc");
		String name=(String)session.getAttribute("name");
		String accno=(String)session.getAttribute("accno");
		
		Connection con;
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("database_url_will_here");
			System.out.println("Database Connected");
			
			pstmt=con.prepareStatement("insert into bank_query(email,qtype,descri,name,accno) values(?,?,?,?,?);");
			pstmt.setString(1, email);
			pstmt.setString(2, qtype);
			pstmt.setString(3,desc);
			pstmt.setString(4,name);
			pstmt.setString(5,accno);
			int i=pstmt.executeUpdate();
							
			if(i>0)
			{
				request.setAttribute("status", "success");
				dispatcher=request.getRequestDispatcher("generatequery.jsp");
			}
			else
			{
					request.setAttribute("status", "failed");
					dispatcher=request.getRequestDispatcher("generatequery.jsp");
			}		
			
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
