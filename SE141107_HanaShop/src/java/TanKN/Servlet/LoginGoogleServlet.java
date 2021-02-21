/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Servlet;

import TanKN.HanaAccount.GooglePojo;
import TanKN.HanaAccount.HanaAccountDAO;
import TanKN.HanaAccount.HanaAccountDTO;
import TanKN.utils.GoogleUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/LoginGoogleServlet"})
public class LoginGoogleServlet extends HttpServlet {
    private final String login="login.html";
    private final String homePage="shopping.jsp";
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
        String url=login;
        try {
            HttpSession session= request.getSession();
            String code=request.getParameter("code");
            if(code ==null || code.isEmpty()){
                url=login;
            }else{
                String accessToken=GoogleUtils.getToken(code);
                GooglePojo googlePojo=GoogleUtils.getUserInfor(accessToken);
                HanaAccountDAO accountDAO= new HanaAccountDAO();
                String clientID=googlePojo.getId();
                boolean isExist=accountDAO.checkExist(clientID);
                if(isExist==false){
                    accountDAO.insertNewClient(googlePojo.getId(), googlePojo.getEmail());
                }
                HanaAccountDTO dto= new HanaAccountDTO();
                dto.setIsAdmin(false);
                dto.setName(googlePojo.getEmail());
                dto.setUserID(googlePojo.getId());
                session.setAttribute("USER", dto);
                url=homePage;
            }
        } catch (SQLException ex) {
            log("SQLEXCEPTION_LoginGoogleServlet "+ex.getMessage());
        } catch (NamingException ex) {
            log("NAMINGEXCEPTION_LoginGoogleServlet "+ex.getMessage());
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
