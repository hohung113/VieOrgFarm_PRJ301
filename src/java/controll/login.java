/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controll;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DBDao;
import model.Users;

/**
 *
 * @author ASUS
 */
public class login extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for (Cookie cooky : cookies) {
                if(cooky.getName().equals("cuser")) {
                    request.setAttribute("username", cooky.getValue());
                }
                if(cooky.getName().equals("cpass")){
                    request.setAttribute("password", cooky.getValue());
                }
            }
            // cookie luon duoc tao san 
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            
        }
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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String rememberme = request.getParameter("remember");
        
        Users us_account = new Users();
        DBDao dao = new DBDao();
        us_account = dao.checkLogin(username, password);
            if(us_account == null){
                // neu ten dang nhap dung
                if(dao.checkLoginExits(username) != null){
                    String  ms = "Wrong password please enter password again!";
                    request.setAttribute("ms", ms);
                    request.setAttribute("userN", username);
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }else{
                    // neu ten dang nhap sai
                    request.setAttribute("messWarning", "Non Existent Account!");
                    
                }
               // neu no ma null 
               request.getRequestDispatcher("Login.jsp").forward(request, response);
                
                
            }
         // neu account != null tuc la co gia tri
        else {
            
            HttpSession session = request.getSession();
            // set account
            session.setAttribute("account", us_account);
            // đẩy dữ liệu lên đám mây
            // và xử lý cookie
            Cookie cuser = new Cookie("cuser", username);
            Cookie cpass = new Cookie("cpass", password);
//              Cookie crem = new Cookie("crem", rememberme);
            
            cuser.setMaxAge(60 * 60 * 24);
            if (rememberme != null) {
                cpass.setMaxAge(60*10);
            } else {
                cpass.setMaxAge(0);
            }
            
            response.addCookie(cuser);
            response.addCookie(cpass);
            
           response.sendRedirect("loaddata");
            
        }
        
       
        
       
        
        
        
        
        
        
        
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
