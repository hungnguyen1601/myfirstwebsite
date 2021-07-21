/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.Product;
import Model.ReviewProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Product_DAO extends DBContext {

    public ArrayList<Product> getListProduct() {
        ArrayList<Product> list = new ArrayList();

        // get danh sách Pro từ database
        try {
            PreparedStatement ps = connection.prepareStatement("select * from tblProduct");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                Double price = Double.valueOf(rs.getString(3));
                String des = rs.getString(4);
                String image = rs.getString(5);

                list.add(new Product(id, name, price, des, image));
            }
        } catch (Exception e) {
            System.out.println("Loi getProduct: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<Product> getListProductActive() {
        ArrayList<Product> list = new ArrayList();

        // get danh sách Pro từ database
        try {
            PreparedStatement ps = connection.prepareStatement("select * from tblProduct where status=1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                Double price = Double.valueOf(rs.getString(3));
                String des = rs.getString(4);
                String image = rs.getString(5);

                list.add(new Product(id, name, price, des, image));
            }
        } catch (Exception e) {
            System.out.println("Loi getProduct: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<Product> loadProduct(String detail) {
        ArrayList<Product> list = new ArrayList();

        try {
            String sql = "select * from tblProduct where Name=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail);
            ResultSet rs = ps.executeQuery();
//            rs = stm.executeQuery("select * from tblProduct where Name='" + detail + "'");
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                Double price = Double.valueOf(rs.getString(3));
                String des = rs.getString(4);
                String image = rs.getString(5);

                list.add(new Product(id, name, price, des, image));
            }
        } catch (Exception e) {
            System.out.println("Loi getProduct: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<ReviewProduct> detailProduct(Product pro) {
        ArrayList<ReviewProduct> list = new ArrayList();
        try {
            String sql = "select Message,tblFeedback.Name from tblProduct join tblFeedback\n"
                    + " on tblProduct.Name=tblFeedback.Subject\n"
                    + " where tblProduct.Name=? and tblFeedback.Display=1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pro.getName());
            ResultSet rs = ps.executeQuery();
//            rs = stm.executeQuery("select Message,tblFeedback.Name from tblProduct join tblFeedback\n"
//                    + "on tblProduct.Name=tblFeedback.Subject\n"
//                    + "where tblProduct.Name='" + name + "' and tblFeedback.Display=1");
            while (rs.next()) {
                String feedback = rs.getString(1);
                String name = rs.getString(2);

                list.add(new ReviewProduct(name, feedback));
            }
        } catch (Exception e) {
            System.out.println("Loi detailProduct: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<Product> getListProductAdmin() {
        ArrayList<Product> list = new ArrayList();

        // get danh sách Pro từ database
        try {
            PreparedStatement ps = connection.prepareStatement("select tblProduct.ProductID,tblProduct.Name,Price,"
                    + " Description,Image,tblCategory.Name,tblProduct.status from tblProduct inner join"
                    + " tblCategory on tblProduct.ProductID = tblCategory.ProductID");
            ResultSet rs = ps.executeQuery();
//            rs = stm.executeQuery("select tblProduct.ProductID,tblProduct.Name,Price,"
//                    + " Description,Image,tblCategory.Name from tblProduct inner join"
//                    + " tblCategory on tblProduct.ProductID = tblCategory.ProductID");
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String proName = rs.getString(2);
                Double price = Double.valueOf(rs.getString(3));
                String des = rs.getString(4);
                String image = rs.getString(5);
                String cateName = rs.getString(6);
                boolean status = rs.getBoolean(7);

                list.add(new Product(id, proName, price, des, image, cateName, status));
            }
        } catch (Exception e) {
            System.out.println("Loi getProduct: " + e.getMessage());
        }
        return list;
    }

    public String getIDProductMax() {
        try {
            PreparedStatement ps = connection.prepareStatement("select MAX(ProductId) from tblProduct");
            ResultSet rs = ps.executeQuery();
//            rs = stm.executeQuery("select MAX(ProductId) from tblProduct");

            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Loi getProductIDMax: " + e.getMessage());
        }
        return "";
    }

    public boolean addProduct(String name, Double price, String description, String image, String category) {

        try {
            String sql1 = "insert into tblProduct values (?,?,?,?,1)";
            String sql2 = "insert into tblCategory values (?,?)";

            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setString(4, image);
            ps.executeUpdate();

            ps = connection.prepareStatement(sql2);
            ps.setString(1, category);
            ps.setString(2, getIDProductMax());
            ps.executeUpdate();

//            stm.execute("insert into tblProduct values ('" + name + "','" + price + "','" + description + "','" + image + "')");
//            stm.execute("insert into tblCategory values ('" + category + "','" + getIDProductMax() + "')");
            return true;
        } catch (Exception e) {
            System.out.println("Loi Add Product: " + e.getMessage());
        }
        return false;
    }

    public boolean deleteProduct(int id) {
        try {
            String sql1 = "delete from tblCategory where ProductId=?";
            String sql2 = "delete from tblProduct where ProductId=?";

            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, id);
            ps.executeUpdate();

            ps = connection.prepareStatement(sql2);
            ps.setInt(1, id);
            ps.executeUpdate();
//            
//            stm.execute("delete from tblCategory where ProductId='" + id + "'");
//            stm.execute("delete from tblProduct where ProductId='" + id + "'");

            return true;
        } catch (Exception e) {
            System.out.println("Delete Product fail: " + e.getMessage());
            return false;
        }
    }

    public void activeProduct(int id, boolean status) {
        String sql = "update tblProduct set Status=1 where ProductId=?";
        if (status) {
            sql = "update tblProduct set Status=0 where ProductId=?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error active product: " + e.getMessage());
        }
    }

    public boolean updateProduct(int id, String name, double price, String description, String image, String category) {
        try {
            String sql1 = "UPDATE tblProduct SET Name =?, price =?, description=?,image=? WHERE ProductId = ?";
            String sql2 = "update tblCategory "
                    + "Set Name = ? where ProductId= ?";

            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setString(4, image);
            ps.setInt(5, id);
            ps.executeUpdate();

            ps = connection.prepareStatement(sql2);
            ps.setString(1, category);
            ps.setInt(2, id);
            ps.executeUpdate();

//            stm.execute("UPDATE tblProduct\n"
//                    + " SET Name = '" + name + "', price = " + price + ", description='" + description + "',image='" + image + "'\n"
//                    + " WHERE ProductId = " + id);
//            stm.execute("update tblCategory "
//                    + "Set Name = '" + category + "' where ProductId=" + id);
            return true;
        } catch (Exception e) {
            System.out.println("Update Product fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Product> filterProduct(String cate) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT p.ProductID,p.Name,p.Price,p.Description,p.Image from tblCategory inner join tblProduct p \n"
                + "on tblCategory.ProductID = p.ProductID \n"
                + "where tblCategory.Name=? and status=1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String proName = rs.getString(2);
                Double price = Double.valueOf(rs.getString(3));
                String des = rs.getString(4);
                String image = rs.getString(5);

                list.add(new Product(id, proName, price, des, image));
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error filter product: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<Product> searchByName(String txtSearch) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from tblProduct where status=1 and Name like '%" + txtSearch + "%'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                Double price = Double.valueOf(rs.getString(3));
                String des = rs.getString(4);
                String image = rs.getString(5);

                list.add(new Product(id, name, price, des, image));
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error search Product: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<Product> searchByPrice(double txtSearch) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from tblProduct where Price =? and status=1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, txtSearch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                Double price = Double.valueOf(rs.getString(3));
                String des = rs.getString(4);
                String image = rs.getString(5);

                list.add(new Product(id, name, price, des, image));
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error search Product: " + e.getMessage());
        }
        return null;
    }
}
