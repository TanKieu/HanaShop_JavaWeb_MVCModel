/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Servlet;

import TanKN.Cart.CartObj;
import TanKN.HanaAccount.HanaAccountDTO;
import TanKN.OrderDetail.OrderDetailDAO;
import TanKN.OrderDetail.OrderDetailError;
import TanKN.OrderList.OrderListDAO;
import TanKN.Products.ProductsDAO;
import TanKN.Products.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {
private final String Success="orderSuccess.html";
private final String outStockError="OrderFail.jsp";
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
            throws ServletException, IOException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url=Success;
        try {
            
            HttpSession session=  request.getSession();
            CartObj cart= (CartObj) session.getAttribute("CUSTCART");
            HashMap<ProductsDTO, Integer> productList = (HashMap<ProductsDTO, Integer>) cart.getItemList();
            HanaAccountDTO userDTO=(HanaAccountDTO) session.getAttribute("USER");
            Date currentTime= new  Date();
            Date orderDate= new java.sql.Date(System.currentTimeMillis());
            String orderID=userDTO.getUserID()+currentTime.toString();
            OrderListDAO orderListDAO= new OrderListDAO();
            orderListDAO.insertNewOrder(orderID, userDTO.getUserID(), orderDate, cart.getAmount());
            boolean IsOutStockError=false;
            List<String> stockErrorList=null;
            for(ProductsDTO pro: productList.keySet()){
                if(productList.get(pro)>pro.getQuantity()){
                    IsOutStockError =true;
                    stockErrorList = new ArrayList<>();
                    stockErrorList.add("Product "+pro.getName() +" is out of stock");                   
                }
            }
            if(IsOutStockError){
                url=outStockError;
                OrderDetailError StockError= new OrderDetailError(stockErrorList);
                session.setAttribute("STOCKERROR", StockError);
            }else{
                for(ProductsDTO pro: productList.keySet()){
                    String proID=pro.getID();
                    OrderDetailDAO orderDAO=new OrderDetailDAO();
                    orderDAO.insertNewOrder(orderID, proID, productList.get(pro));
                    ProductsDAO proDAO= new ProductsDAO();
                    proDAO.updateQuantity(proID, pro.getQuantity()-(int)(productList.get(pro)));
                }
                session.setAttribute("CUSTCART", null);
            }
        }catch(SQLException ex){
            log("ORDERSERVLET_SQLEXCEPTION "+ex.getMessage());
        }catch(NamingException ex){
            log("ORDERSERVLET_NAMINGEXCEPTION "+ex.getMessage());
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
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (NamingException ex) {
        Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
    } catch (SQLException ex) {
        Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (NamingException ex) {
        Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
