/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Bill;
import dal.BillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ManageBill extends HttpServlet {

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

        BillDAO billDao = new BillDAO();
        if (request.getParameter("action") != null) {
//            Bill bill = new Bill();
            if (request.getParameter("action").equals("view")) {
//                ArrayList<Bill> list1 = bill.getListBillById(1);
//                ArrayList<Bill> list2 = bill.getListBillById(2);

                ArrayList<Bill> list1 = billDao.getListBillById(1);
                ArrayList<Bill> list2 = billDao.getListBillById(2);

                request.setAttribute("wait", list1);
                request.setAttribute("process", list2);
                request.getRequestDispatcher("/ManageBill.jsp").forward(request, response);

            } else if (request.getParameter("action").equals("Delete")) {
                int id = Integer.parseInt(request.getParameter("id"));

                if (billDao.deleteBill(id)) {
                    request.setAttribute("result", "Delete Bill successfully !");
                    request.getRequestDispatcher("manageBill?action=view").forward(request, response);
                } else {
                    request.setAttribute("result", "Delete Bill failed !");
                    request.getRequestDispatcher("manageBill?action=view").forward(request, response);
                }

            } else if (request.getParameter("action").equals("Update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                int status = Integer.parseInt(request.getParameter("status"));

                if (billDao.updateBill(id, status)) {
                    request.setAttribute("result", "Update Bill successfully !");
                    request.getRequestDispatcher("manageBill?action=view").forward(request, response);
                } else {
                    request.setAttribute("result", "Update Bill failed !");
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
