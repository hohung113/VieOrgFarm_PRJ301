/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class DBDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
        
    private static final String CHECKACCOUNT = "select *\n"
            + "	from [dbo].[tblUsers]\n"
            + "	where  [userName] = ? and [password] = ?";
    private static final String CHECKACCOUNTEXITS = "select *\n"
            + "	from [dbo].[tblUsers]\n"
            + "	where  [userName] = ?";
    private static final String GETALLPRODUCTS = "select *\n"
            + "from  [dbo].[tblProduct]"
            + "order by productName "    ;
    private static final String GETALLCATES = "select *\n"
            + "from [dbo].[tblCategory]";
    private static final String GETPRODUCTCATEID = "select *\n"
            + "from tblProduct\n"
            + "where categoryID = ?";
    
    // QUERY Load 3 san pham moi nhat
    private static final String LOAD3LEASTEDPRODUCGT = "SELECT TOP 3 *\n"
            + "FROM tblProduct\n"
            + "ORDER BY [importDate] DESC";

    private static final String SEARCHPRODUCTS = "select *\n"
            + "from tblProduct\n"
            + "where productName like ?";
    
    //  QUERY TO MANAGER PRODUCT
    private static final String LOADTOMANAGEPRODUCT = "select [categoryID],[productName],[price],[quantity],[importDate],[usingDate],[productID],[image]\n"
            + "from tblProduct";

    private static final String GETPRODUCTBYID = "select *\n"
            + "from tblProduct\n"
            + "where productID = ?";

    private static final String UPDATEPRODUCTNOTIMG = "update tblProduct\n"
            + "set productName =  ?,\n"
            + "	price = ?,\n"
            + "	[quantity] = ?,\n"
            + "	[categoryID] = ?,\n"
            + "	[importDate] = ?,\n"
            + "	[usingDate] = ?\n"
            + "	where [productID] = ?";
    /// PHÂN TRANG CHO SẢN PHẨM
    private static final String GETTOTALPRODUCT = "SELECT COUNT(*) \n"
            + "FROM [dbo].[tblProduct]";
    private static final String PAGINGPRODUCTNAME = "SELECT * FROM [dbo].[tblProduct]\n"
            + "ORDER BY productName\n"
            + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
    
    // XỬ LÝ Đăng kí
    
    private static final String SIGNUPACCOUNT = "insert into Account\n"
            + "values(?,?,0,0)";
    
    
    
    // CRUD
    private static final String CREATEPRODUCT = "INSERT INTO tblProduct(productName,[image],price,quantity,categoryID,importDate,usingDate)\n"
            + "values(\n"
            + "	?,\n"
            + "	?,\n"
            + "	?,\n"
            + "	?,\n"
            + "	?,\n"
            + "	?,\n"
            + "	?\n"
            + ")";

    private static final String DELETEPRODUCT = "DELETE FROM tblProduct\n"
            + "WHERE productID = ?";

    
    
    
    public Product insertProduct (String name,String img,String price,String quantity,String cateId, String importDate,String usingDate)
    {
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(UPDATEPRODUCTNOTIMG);
            ps.setString(1, name);
            ps.setString(2, img);
            ps.setString(3, price);
            ps.setString(4, quantity);
            ps.setString(5, cateId);
            ps.setString(6, importDate);
            ps.setString(7, usingDate);
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    
    
    

    
    // Login
    public Users checkLogin(String user, String pass) {
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(CHECKACCOUNT);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                Users us = new  Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),rs.getString(6), rs.getDate(7), rs.getString(8));

                return us;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Users checkLoginExits(String user) {
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(CHECKACCOUNTEXITS);
            ps.setString(1, user);
            rs = ps.executeQuery();

            if (rs.next()) {
                 Users us = new  Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),rs.getString(6), rs.getDate(7), rs.getString(8));
                return us;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> listAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(GETALLPRODUCTS);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getDate(8));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
        public List<Category> listAllCates() {
        List<Category> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(GETALLCATES);
            rs = ps.executeQuery();
            while (rs.next()) {
              Category ct = new Category(rs.getInt(1), rs.getString(2));
              list.add(ct);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsByCateId(String cid) {
        List<Product> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(GETPRODUCTCATEID);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getDate(8));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    
      public List<Product> searchProduct(String productName) {
        List<Product> list = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(SEARCHPRODUCTS);
            ps.setString(1, "%" + productName + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
               Product pd = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getDate(8));
                list.add(pd);

            }
        } catch (Exception e) {
        }

        return list;

    }
      
      public List<Product> loadProductManager(){
          List<Product> listM   = new ArrayList<>();
          try {
              conn = DBContext.getConnection();
              ps = conn.prepareStatement(LOADTOMANAGEPRODUCT);
              rs = ps.executeQuery();
              while(rs.next()){
                  Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getDate(5), rs.getDate(6),rs.getInt(7),rs.getString(8));
                  listM.add(p);
              }
              
          } catch (Exception e) {
              e.printStackTrace();
          }
          return listM;
      }
        public Product loadProductById(String id){
            try {   
                conn = DBContext.getConnection();
                ps = conn.prepareStatement(GETPRODUCTBYID);
                ps.setString(1, id);
                rs = ps.executeQuery();
                if(rs.next()){
                    Product pd = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getDate(8));
                    return pd;
                }
                
            } catch (Exception e) {
                    e.printStackTrace();
            }
            return null;
        }
       
    public void updatenoimg(String name, String price, String quantity, String cateID, String importdate, String usingdate,String productID) {
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(UPDATEPRODUCTNOTIMG);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, quantity);
            ps.setString(4, cateID);
            ps.setString(5, importdate);
            ps.setString(6, usingdate);
            ps.setString(7, productID);
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public List<Product> listLeastProducts() {
        List<Product> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(LOAD3LEASTEDPRODUCGT);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getDate(8));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
     
    public int getTotalProduct() {
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(GETTOTALPRODUCT);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(PAGINGPRODUCTNAME);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getDate(8));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
        
    public void deleteProduct(int id){
        try {
            conn =  DBContext.getConnection();
            ps = conn.prepareStatement(DELETEPRODUCT);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        e.printStackTrace();
        }
    }
        

      
    public static void main(String[] args) {
        int tongcong = 0;
        tongcong = new DBDao().getTotalProduct();
        System.out.println(tongcong);
        
        List<Product> list = new DBDao().pagingProduct(8);
        for (Product product : list) {
            System.out.println(product);
        }
        
        
    }
        
    
//    public static void main(String[] args) {
//        String us = "tom";
//        String pass = "123";
//        DBDao dao = new DBDao();
//        Users s = dao.checkLogin(us, pass);
//        System.out.println(s);
//    }

}
