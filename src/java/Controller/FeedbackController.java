/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Bill;
import Model.Feedback;
import Model.Product;
import dal.BillDAO;
import dal.Feedback_DAO;
import dal.Product_DAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class FeedbackController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Product_DAO proDao = new Product_DAO();
        Feedback_DAO fbDao = new Feedback_DAO();
        BillDAO billDao = new BillDAO();
        if (request.getParameter("submitFB") != null) {
            String name = request.getParameter("name");
            String subject = request.getParameter("subject");
            String phone = request.getParameter("phone");
            String message = request.getParameter("message");

            System.out.println(message);
            Feedback fb = new Feedback(name, subject, phone, message);
            if (name.equals("") || subject.equals("") || message.equals("")) {
//                Product product = new Product();
//                ArrayList<Product> list = product.getListProduct();

                ArrayList<Product> list = proDao.getListProduct();

                request.setAttribute("product", list);
                request.setAttribute("result", "Send feedback fail!!!");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
            } else if (fbDao.addFb(fb)) {
//                Product product = new Product();
                ArrayList<Product> list = proDao.getListProduct();

                request.setAttribute("product", list);
                request.setAttribute("result", "Thanks for your feedback!!!");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
            } else {
//                Product product = new Product();
                ArrayList<Product> list = proDao.getListProduct();

                request.setAttribute("product", list);
                request.setAttribute("result", "Send feedback fail!!!");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
            }

        }
        if (request.getParameter("action").equals("confirm")) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean display = Boolean.valueOf(request.getParameter("display"));
           
            Feedback fb = new Feedback(id, display);
            if (fbDao.addDisplay(fb)) {

                ArrayList<Bill> list = billDao.getListBillDone();
                ArrayList<Feedback> list1 = fbDao.getListFb();

                request.setAttribute("bill", list);
                request.setAttribute("feedback", list1);
                request.setAttribute("result", "Success!");
                request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
            } else {

                ArrayList<Bill> list = billDao.getListBillDone();
                ArrayList<Feedback> list1 = fbDao.getListFb();

                
                request.setAttribute("bill", list);
                request.setAttribute("feedback", list1);
                request.setAttribute("result", "Fail!");
                request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
