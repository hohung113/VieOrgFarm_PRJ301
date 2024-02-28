/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controll;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Category;
import model.DBDao;
import model.Item;
import model.Product;

/**
 *
 * @author ASUS
 */
public class loaddata extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DBDao dao = new DBDao();
        List<Product> listP = dao.listAllProducts();
        List<Category> listC = dao.listAllCates();
        List<Product> listNew = dao.listLeastProducts();
           int count  =  dao.listAllProducts().size();
                int endPage = count/5;
                  if(count % 5 != 0){
                      endPage++;
                  }
                
        Cookie[] arr = request.getCookies();
        String txt ="";
        if(arr!=null){
            for (Cookie cookie : arr) {
                if(cookie.getName().equals("cart")){
                    txt += cookie.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, listP);
        List<Item> listItem =  cart.getItems();
        int n;
        if(listItem!=null){
            n = listItem.size();
        } else 
            n = 0;
            request.setAttribute("size", n);
            request.setAttribute("listP", listP);
            request.setAttribute("listC", listC);
            request.setAttribute("listNew", listNew);
            request.setAttribute("endP", endPage);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        
        
      
     
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
