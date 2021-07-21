/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Bill;
import Model.BillDetail;
import Model.Customer;
import dal.BillDAO;
import dal.BillDetail_DAO;
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
public class Bill_Detail_Controller extends HttpServlet {

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

            int billId = Integer.parseInt(request.getParameter("billId"));
            if (request.getParameter("action").equals("Detail")) {

//                BillDetail billDetail=new BillDetail();
//                ArrayList<BillDetail> list=billDetail.getListProduct(billId);
                BillDetail_DAO bdDao = new BillDetail_DAO();
                ArrayList<BillDetail> list = bdDao.getListProduct(billId);

//                Customer cus=new Customer();
                String name = "";
                String phone = "";
                String address = "";

                Customer_DAO cusDao = new Customer_DAO();
//                ArrayList<Customer> list1=cus.getCustomerByBillID(billId);
                ArrayList<Customer> list1 = cusDao.getCustomerByBillID(billId);
                for (Customer customer : list1) {
                    name = customer.getName();
                    phone = customer.getPhone();
                    address = customer.getAddress();
                }

                request.setAttribute("list", list);
                request.setAttribute("customer", "Customer:  " + name + " ---- Address:    " + address + " ----Phone:     " + phone);
                request.getRequestDispatcher("/Bill_Detail.jsp").forward(request, response);

            } else if (request.getParameter("action").equals("Delete")) {

//                Bill bill=new Bill();
//                bill.deleteBill(billId);
                BillDAO billDao = new BillDAO();
                billDao.deleteBill(billId);
                if (request.getParameter("option").equals("1")) {
                    request.getRequestDispatcher("AdminController").forward(request, response);
                } else if (request.getParameter("option").equals("2")) {
                    request.getRequestDispatcher("manageBill?action=view").forward(request, response);
                }
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
