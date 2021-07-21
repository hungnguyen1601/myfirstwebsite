/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customer;
import dal.Customer_DAO;
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
public class CustomerController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        if (request.getParameter("action") != null) {
//            Customer customer = new Customer();

            Customer_DAO cusDao = new Customer_DAO();

            if (request.getParameter("action").equals("view")) {
//                ArrayList<Customer> list = customer.getCustomer();
                ArrayList<Customer> list = cusDao.getCustomer();

                request.setAttribute("customer", list);
                request.getRequestDispatcher("/ManageCustomer.jsp").forward(request, response);

//                for (Customer customer1 : list) {
//                    System.out.println(customer1.getName());
//                }

            } else if (request.getParameter("action").equals("Delete")) {
                int id = Integer.parseInt(request.getParameter("id"));

//                if (customer.deleteCustomer(id)) {
                if (cusDao.deleteCustomer(id)) {
                    request.setAttribute("result", "Delete Customer successfully !");
                    request.getRequestDispatcher("manageCustomer?action=view").forward(request, response);
                } else {
                    request.setAttribute("result", "Delete Customer failed !");
                    request.getRequestDispatcher("manageCustomer?action=view").forward(request, response);
                }

            } else if (request.getParameter("action").equals("search")) {
                String phone = request.getParameter("phone");
                
                Customer cus=cusDao.getCustomerByPhone(phone);
                request.setAttribute("name", cus.getName());
                request.setAttribute("address", cus.getAddress());
                request.setAttribute("phone", phone);
                request.getRequestDispatcher("CartDetail.jsp").forward(request, response);
                
                
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
