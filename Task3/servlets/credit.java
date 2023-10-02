package com.chandan.servlets;

import java.util.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class credit extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar cal=Calendar.getInstance();
		String time=cal.getTime().toString();
		Connection con;
		PreparedStatement pstmt1,pstmt2;
		PreparedStatement stmt;
		ResultSet rs;
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		String amount,password,accno;
		amount=request.getParameter("camount");
		password=request.getParameter("upassword");
		accno=(String) session.getAttribute("accno");
		try {

            Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("database_url_will_here");
			
			//query 1
			pstmt1=con.prepareStatement("update accounts set balance=balance+? where password=? and accno=?;");
			pstmt1.setString(1, amount);
			pstmt1.setString(2, password);
			pstmt1.setString(3, accno);
			
			int i=pstmt1.executeUpdate();
	
			stmt=con.prepareStatement("select balance from accounts where accno=?");
			stmt.setString(1, accno);
			rs=stmt.executeQuery();
			
			if(i>0 && rs.next())
			{
				session.setAttribute("balance", rs.getString("balance"));
				request.setAttribute("status", "complete");
				
				//query 2
				String name,balance;
				name=(String)session.getAttribute("name");
				balance=rs.getString("balance");
				
				pstmt2=con.prepareStatement("insert into transaction (name,accno,type,status,amount,balance,date_time) values (?,?,'credit',?,?,?,?);");
				pstmt2.setString(1, name);
				pstmt2.setString(2, accno);
				pstmt2.setString(4, amount);
				pstmt2.setString(5, balance);
				pstmt2.setString(6, time);
				if(i>0)
				{
					pstmt2.setString(3, "Complete");
				}
				else
				{
					pstmt2.setString(3,"Failed");
				}
				int j=pstmt2.executeUpdate();
				request.setAttribute("status", "success");
				dispatcher=request.getRequestDispatcher("credit.jsp");
			}
			else
			{
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("credit.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
