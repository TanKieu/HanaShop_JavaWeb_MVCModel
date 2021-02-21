/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Servlet;

import TanKN.Cart.CartObj;
import TanKN.OrderDetail.OrderDetailDAO;
import TanKN.Products.ProductsDAO;
import TanKN.Products.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "AddProductToCartServlet", urlPatterns = {"/AddProductToCartServlet"})
public class AddProductToCartServlet extends HttpServlet {
    private final String SHOPPING="shopping.jsp";
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
        String pageNum=request.getParameter("pageNum");
        String category=request.getParameter("category");
        String maxPrice=request.getParameter("Max");
        String minPrice=request.getParameter("Min");
        String nameSearch=request.getParameter("nameSearch");
        //String urlRewriting="DispatchServlet?txtSearchName="+nameSearch +"&dlCategory="+category +"&dlPriceMin="+minPrice +"&dlPriceMax="+ maxPrice+"&pageNum="+ pageNum+"&btAction=Search&role=notAdmin";
        String url=SHOPPING;
        try  {
            //1.Cust goes to cart place
            HttpSession session=request.getSession();
            //2.Cust take cart
            CartObj cart=(CartObj) (session.getAttribute("CUSTCART"));
            if(cart==null){
                cart= new CartObj();
            }
            //3.Cust chon mon hang
             
            String productID= request.getParameter("productID");
            ProductsDAO dao =new ProductsDAO();
            ProductsDTO product=dao.getProductbyID(productID);
            cart.addProducttoCart(product);
            cart.calculateAmount();
            session.setAttribute("CUSTCART", cart);
            
            //get suggetion
            List<ProductsDTO> suggestList= new ArrayList<>();
            List<String> suggestOrderList = new ArrayList<>();
            OrderDetailDAO odDetailDAO= new OrderDetailDAO();
            suggestOrderList= odDetailDAO.getOrderDetailByProduct(productID);
            for (String orderID : suggestOrderList) {
                List<String> suggetproIDList= odDetailDAO.suggestProductIdByOrderID(orderID);
                if(suggetproIDList != null){
                    for (String proID : suggetproIDList) {
                    boolean checkExist=false;                    
                        for (ProductsDTO suggetPro : suggestList) {
                            if(suggetPro.getID().equals(proID))
                                checkExist=true;
                        }
                        if(checkExist==false){
                        ProductsDTO dto=dao.getProductbyID(proID);
                        suggestList.add(dto);
                        }
                    }
                }
            }
            session.setAttribute("SUGGESTION", suggestList);
            
            /* TODO output your page here. You may use following sample code. */
        } catch(SQLException ex){
            log("AddProductToCartServlet_SQLException "+ex.getMessage());
        } catch (NamingException ex) {
            log("AddProductToCartServlet_NamingException "+ex.getMessage());
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
