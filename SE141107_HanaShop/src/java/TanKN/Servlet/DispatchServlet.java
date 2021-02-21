/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author winnh
 */
public class DispatchServlet extends HttpServlet {
    private final String loginPage="login.html";
    private final String login="LoginServlet";
    private final String homePage="GetProductServlet";
    private final String search="SearchProductServlet";
    private final String upFile="UploadFileServlet";
    private final String logout="LogoutServlet";
    private final String lastModified="GetupdateHistoryServlet";
    private final String confirmDelProduct="CofirmDeleteServlet";
    private final String deleteProduct="DeleteProcductServlet";
    private final String adminPage="HanaShopManagement.jsp";
    private final String addProducttoCart="AddProductToCartServlet";
    private final String increaseQuantity="IncreaseQuantityServlet";
    private final String decreaseQuantity="DecreaseQuantityServlet";
    private final String removeProdcutfromCart="RemoveProductServlet";
    private final String confirmOrder="OrderServlet";
    private final String viewOrderhistory="GetUserHistoryServlet";
    private final String viewHistoryDetail="GetHistoryDetailServlet";
    private final String searchHistory="SearchOrderServlet";
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
        String url=homePage;        
        try{
            String button =request.getParameter("btAction");
            if(button==null){  
                
            }else if(button.equals("Login")){
                url=login;
            }else if(button.equals("Search")||button.equals("Previous")||button.equals("Next")){
                url=search;
            }else if(button.equals("Up")){
                url=upFile;
            }else if(button.equals("Log out")){
                url=logout;
            }else if(button.equals("View last modified")){
                url=lastModified;
            }else if(button.equals("Delete")){
                url=confirmDelProduct;
            }else if(button.equals("Confirm")){
                url=deleteProduct;
            }else if(button.equals("No")){
                url=adminPage;
            }else if(button.equals("Add to Cart")){
                url=addProducttoCart;
            }else if(button.equals("+")){
                url=increaseQuantity;
            }else if(button.equals("-")){
                url=decreaseQuantity;
            }else if(button.equals("Remove this poduct")){
                url=removeProdcutfromCart;
            }else if(button.equals("Cofirm Order")){
                url=confirmOrder;
            }else if(button.equals("Order History")){
                url=viewOrderhistory;
            }else if(button.equals("View")){
                url=viewHistoryDetail;
            }else if(button.equals("Search History")){
                url=searchHistory;
            }
        }finally{
            RequestDispatcher rd= request.getRequestDispatcher(url);
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
