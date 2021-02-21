/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Servlet;

import TanKN.Products.ProductsDAO;
import TanKN.Products.UpdateProductError;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author winnh
 */
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

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
        String url="invalid.html";
        try {
            boolean isMultiPart =ServletFileUpload.isMultipartContent(request);
            if(!isMultiPart){
                
            }else{
                FileItemFactory factory= new DiskFileItemFactory();
                ServletFileUpload upload= new ServletFileUpload(factory);
                List item=null;
                try{
                    item=upload.parseRequest(request);
                }catch(FileUploadException e){
                    e.printStackTrace();
                }
                Iterator iter=item.iterator();
                Hashtable params= new Hashtable();
                String filename= null;
                while(iter.hasNext()){
                    FileItem items=(FileItem) iter.next();
                    if(items.isFormField()){
                        params.put(items.getFieldName(), items.getString());
                    }else{
                        try{
                            String itemsName =items.getName();
                            filename=itemsName.substring(itemsName.lastIndexOf("\\")+1);
                            System.out.println("path "+filename);
                            if(!filename.isEmpty()){
                            String realPath= getServletContext().getRealPath("/")+"Image\\" +filename;
                            System.out.println("Rpath "+realPath);
                            File savedFile= new File(realPath);   
                            items.write(savedFile);
                            }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                    }
                }
                boolean foundError=false;
                UpdateProductError errors= new  UpdateProductError();
                String productID=(String) params.get("txtID");
                String name=(String) params.get("txtName");
                String category =(String) params.get("dlCategory");
                String description =(String) params.get("txtDescription");
                boolean isActive=false;
                if(((String)params.get("dlIsActive")).equals("Active")){
                    isActive=true;
                }
                String urlImange="Image\\"+filename;
                if(((String)params.get("txtPrice")).matches(".*[a-zA-Z].*") || ((String)params.get("txtPrice")).matches(".*-{1,}.*")){
                    foundError=true;
                    errors.setPriceWrongformatError("Price is a positive number");
                }
                if(!((String)params.get("txtQuantity")).matches("[0-9]+")){
                    foundError=true;
                    errors.setQuantityWrongformatError("Quantity is a positive Integer");
                }
                String userID=(String)params.get("txtUserID");
                ProductsDAO dao = new ProductsDAO();
                if(filename.isEmpty()){
                    urlImange=dao.getUrlImage(productID);
                }
                if(foundError){
                    String pageNum=(String)params.get("txtPage");
                    url="DispatchServlet?txtSearchName=&dlCategory=&dlPriceMin=&dlPriceMax=&pageNum="+pageNum +"&btAction=Previous&role=isAdmin";
                    HttpSession session=request.getSession();
                    session.setAttribute("UPDATE_ERRORS", errors);
                }else{
                    float price= Float.parseFloat((String)params.get("txtPrice"));
                    int quantity=Integer.parseInt((String)params.get("txtQuantity"));
                    boolean check=dao.updateProduct(productID, name, description, price, category, quantity, isActive, urlImange, userID);
                    if(check){
                        url="DispatchServlet?txtSearchName=&dlCategory=&dlPriceMin=&dlPriceMax=&pageNum=1&btAction=Previous&role=isAdmin";
                    }
                }
            }
        }catch(NamingException ex){
            log("UpdateProductServlet_NamingException "+ex.getMessage());
        }catch(SQLException ex){
            log("UpdateProductServlet_SQLException "+ex.getMessage());
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
