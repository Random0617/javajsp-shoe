package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Account;

/**
 * Servlet implementation class ManagerAccountControl
 */
@WebServlet(name = "managerAccount", urlPatterns = { "/managerAccount" })
public class ManagerAccountControl extends HttpServlet {
	
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        DAO dao = new DAO();
	        List<Account> listA = dao.getAllAccount();
	        request.setAttribute("listA", listA);
	        request.getRequestDispatcher("/WEB-INF/views/ManagerAccount.jsp").forward(request, response);
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

}
