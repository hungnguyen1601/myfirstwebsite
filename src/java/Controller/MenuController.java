/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Category;
import Model.Product;
import dal.Category_DAO;
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
public class MenuController extends HttpServlet {

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
        Category_DAO cateDao = new Category_DAO();
        if (request.getParameter("action") == null) {
            ArrayList<Product> list = proDao.getListProductActive();
            ArrayList<Category> list1 = cateDao.getListNameCategory();

            request.setAttribute("category", list1);
            request.setAttribute("product", list);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } else if (request.getParameter("action") != null) {
            if (request.getParameter("action").equals("filter")) {

                String category = request.getParameter("category");

                ArrayList<Category> list1 = cateDao.getListNameCategory();

                request.setAttribute("category", list1);

                request.setAttribute("product", proDao.filterProduct(category));

                request.getRequestDispatcher("menu.jsp").forward(request, response);

            } else if (request.getParameter("action").equals("Search")) {
                String txtSearch = request.getParameter("txtSearch");
                if (txtSearch.equals("")) {
                    response.sendRedirect("MenuController");
                } else {

                    try {
                        double price = Double.parseDouble(txtSearch);
                        request.setAttribute("product", proDao.searchByPrice(price));
                    } catch (Exception e) {
                        request.setAttribute("product", proDao.searchByName(txtSearch));
                    }

                    request.setAttribute("category", cateDao.getListNameCategory());
                    request.setAttribute("txtSearch", txtSearch);

                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                }
            } else {
                ArrayList<Product> list = proDao.getListProductAdmin();
                ArrayList<Category> list1 = cateDao.getListNameCategory();

                request.setAttribute("product", list);
                request.setAttribute("category", list1);
                request.getRequestDispatcher("/ManageProduct.jsp").forward(request, response);
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
