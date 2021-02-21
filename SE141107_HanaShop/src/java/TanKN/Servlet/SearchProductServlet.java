/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Servlet;

import TanKN.Products.ProductsDAO;
import TanKN.Products.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author winnh
 */
@WebServlet(name = "SearchProductServlet", urlPatterns = {"/SearchProductServlet"})
public class SearchProductServlet extends HttpServlet {

    private final String SEARCHPAGE = "search.jsp";
    private final String ADMINPAGE = "HanaShopManagement.jsp";
    private final String CLIENTPAGE = "shopping.jsp";

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
        PrintWriter out = response.getWriter();
        String url = SEARCHPAGE;
        String nameSearch = request.getParameter("txtSearchName");
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int newPage;
        String role = null;
        if (!(request.getParameter("pageNum")).isEmpty()) {

            String page = request.getParameter("pageNum");

            if (request.getParameter("btAction").equals("Next")) {
                newPage = pageNum + 1;
            } else if (request.getParameter("btAction").equals("Previous")) {
                newPage = pageNum - 1;

                if (newPage <= 0) {
                    newPage = 1;
                }
                pageNum -= 2;
                if (pageNum <= 0) {
                    pageNum = 0;
                }
            } else {
                newPage=  1;
                pageNum=0;
                
            }
            HttpSession session = request.getSession();
            session.setAttribute("pageNum", newPage);
        }
        float priceMin = 0;
        if (!(request.getParameter("dlPriceMin")).isEmpty()) {
            priceMin = Float.valueOf(request.getParameter("dlPriceMin"));
        }
        float priceMax = 999999999;
        if (!(request.getParameter("dlPriceMax")).isEmpty()) {
            priceMax = Float.valueOf(request.getParameter("dlPriceMax"));
        }
        String category = request.getParameter("dlCategory");
        String categorySearch;
        if (category.equals("All")) {
            categorySearch = "";
        } else {
            categorySearch = category;
        }
        try {
            HttpSession session = request.getSession();
            ProductsDAO dao = new ProductsDAO();
            List<ProductsDTO> list = new ArrayList<>();
            dao.searchProduct(nameSearch, categorySearch, priceMin, priceMax, pageNum * 20);
            list = dao.getProductList();
            session.setAttribute("SEARCHRESULT", list);
            role = request.getParameter("role");
            if (role != null) {
                if (role.equals("isAdmin")) {
                    url = ADMINPAGE;
                } else if (!role.equals("isAdmin")) {
                    url = CLIENTPAGE;
                }
            }
        } catch (SQLException ex) {
            log("SearchProductServlet_SQlException " + ex.getMessage());
        } catch (NamingException ex) {
            log("SearchProductServlet_NamingException " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
