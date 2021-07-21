/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Category_DAO extends DBContext {

    public ArrayList<Category> getListNameCategory() {
        ArrayList<Category> list = new ArrayList();
        try {
            String sql = "select distinct name from tblCategory";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                String name = rs.getString(1);

                list.add(new Category(name));
            }
        } catch (Exception e) {
            System.out.println("Loi getProduct: " + e.getMessage());
        }
        return list;
    }

    public boolean updateCategory(int id, String name) {
        String sql = "update tblCategory set name=? where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error update category: " + e.getMessage());
        }
        return false;
    }

    public int addCategory(String name) {
        String sql = "insert into tblCategory(name) values(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            return ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error add category: " + e.getMessage());
        }
        return 0;
    }
}
