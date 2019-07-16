package com.servlet;
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.department_formDao;
import com.dao.department_formDaoImpl;
import com.entity.department_form;
public class departmentaddServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("1");
		String did = request.getParameter("deptNumber");
		int Did = Integer.parseInt(did);
		String dname = request.getParameter("deptName");
		String dduty = request.getParameter("deptLeader");
		String edid = request.getParameter("deptUdep");
		int Edid = Integer.parseInt(edid);
		String sdid = request.getParameter("deptDdep");
		int Sdid = Integer.parseInt(sdid);
		System.out.println(Did+dname+dduty+Edid+Sdid);
		
		department_form t = new department_form();
		t.setAptId(Did);
		t.setAptName(dname);
		t.setDduty(dduty);
		t.setUpaptId(Edid);
		t.setDownaptId(Sdid);
		department_formDao td = new department_formDaoImpl();
		System.out.println("1");
		if(td.register(t)){
			request.setAttribute("deptNumber", Did);
			request.getRequestDispatcher("/departmentPage.jsp").forward(request, response);
		}else{
			
			response.sendRedirect("main.jsp");
			return;
		}
	}

}
