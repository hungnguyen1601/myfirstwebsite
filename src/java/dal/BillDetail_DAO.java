/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.BillDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class BillDetail_DAO extends DBContext{
    public ArrayList getListProduct(int id) {
       ArrayList<BillDetail> list=new ArrayList<>();

        // get danh sách Pro từ database
        try {
            String sql="select BillID,tblProduct.ProductID as ID, name,Description,Price,Quantity from tblBillDetail inner join tblProduct on tblBillDetail.ProductID=tblProduct.ProductID where BillID=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
              int billId=rs.getInt(1);
              int productId=rs.getInt(2);
              String name=rs.getString(3);
              String des=rs.getString(4);
              double price =rs.getDouble(5);
              int quantity=rs.getInt(6);
              
              list.add(new BillDetail(billId, productId, name, des, price, quantity));
            }
        } catch (Exception e) {
            System.out.println("Loi getListProduct: "+e.getMessage());
        }
        return list;
    }
}
