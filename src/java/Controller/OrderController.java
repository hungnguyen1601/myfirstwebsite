/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Bill;
import Model.CusOrder;
import Model.ProductOrder;
import com.google.gson.Gson;
import dal.BillDAO;
import dal.Customer_DAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import java.files.JSONObject;
/**
 *
 * @author Admin
 */
public class OrderController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        BufferedReader br
                = new BufferedReader(new InputStreamReader(request.getInputStream()));

        String json = br.readLine();
        //System.out.println(json);

        Gson g = new Gson();
        CusOrder cus = g.fromJson(json, CusOrder.class);

        BillDAO billDao = new BillDAO();
        Customer_DAO cusDao = new Customer_DAO();

        if (cusDao.getIdCustomerByPhone(cus.getPhone()) != 0) {
            billDao.addBill2(cus.getName(), cus.getAddress(), cus.getPhone(), cus.getOrder());
        } else {
            billDao.addBill(cus.getName(), cus.getAddress(), cus.getPhone(), cus.getOrder());
        }
//        billDao.addBill(URLDecoder.decode(cus.getName(), "UTF-8"), URLDecoder.decode(cus.getAddress(), "UTF-8"),cus.getPhone(), cus.getOrder());

//        System.out.println("hihi: " + cus.getName());
//        System.out.println("hihi: " + URLDecoder.decode(cus.getAddress(), "UTF-8"));
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
