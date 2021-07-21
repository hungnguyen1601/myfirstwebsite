/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.Bill;
import Model.Customer;
import Model.ProductOrder;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BillDAO extends DBContext {

    public ArrayList<Bill> getListBillDone() {
        ArrayList<Bill> list = new ArrayList();
        String sql = "select * from tblBill where status = 3";
        // get danh sách Pro từ database
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                Date date = Date.valueOf(rs.getString(2));
                Double total = Double.valueOf(rs.getString(3));

                list.add(new Bill(id, date, total));
            }
        } catch (Exception e) {
            System.out.println("Loi getBill: " + e.getMessage());
        }
        return list;
    }

    public boolean deleteBill(int id) {
        String sql1 = "delete from tblBillDetail where BillId=?";
        String sql2 = "delete from tblBill where BillId=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps = connection.prepareStatement(sql2);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Delete Bill fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Bill> getListBillById(int id) {
        ArrayList<Bill> list = new ArrayList();
        String sql = "select BillId,date,total,status from tblBill where status =?";
        // get danh sách Pro từ database
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int billId = Integer.parseInt(rs.getString(1));
                Date date = Date.valueOf(rs.getString(2));
                Double total = Double.valueOf(rs.getString(3));
                int status = rs.getInt(4);

                list.add(new Bill(billId, date, total));
            }
        } catch (Exception e) {
            System.out.println("Loi getBill: " + e.getMessage());
        }
        return list;
    }

    public boolean updateBill(int id, int status) {

        try {
            String sql = "UPDATE tblBill SET status =? WHERE BillId =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Update Bill fail: " + e.getMessage());
            return false;
        }
    }

    // thêm bill với khách hàng mới
    public boolean addBill(String name, String address, String phone, List<ProductOrder> proOrder) throws Exception {

        try {
            String sql = "insert into tblCustomer(Name,Phone,Address) values (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.executeUpdate();

//            Customer cus = new Customer();
//            String customerIdMax = cus.getIDCustomertMax();
            Customer_DAO cusDao = new Customer_DAO();
            String customerIdMax = cusDao.getIDCustomertMax();

            double total = 0.0;
            for (ProductOrder productOrder : proOrder) {
                total += (productOrder.getPrice() * productOrder.getQuantity());
            }

            ps = connection.prepareStatement("insert into tblBill(date,total,customerId,status) values(CURRENT_TIMESTAMP,?,?,1)");
            ps.setDouble(1, total);
            ps.setString(2, customerIdMax);
            ps.executeUpdate();

            String billIDMax = getIDBillMax();

            for (ProductOrder productOrder : proOrder) {
                ps = connection.prepareStatement("insert into tblBillDetail values(?,?,?)");
                ps.setString(1, billIDMax);
                ps.setInt(2, productOrder.getId());
                ps.setInt(3, productOrder.getQuantity());
                ps.executeUpdate();
            }

            return true;
        } catch (SQLException e) {
            System.out.println("Loi Add Bill: " + e.getMessage());
        }
        return false;
    }

    // thêm bill với khách hàng cũ
    public boolean addBill2(String name, String address, String phone, List<ProductOrder> proOrder) {
        Customer_DAO cusDao = new Customer_DAO();
        int customerId = cusDao.getIdCustomerByPhone(phone);

        try {
            String sql = "update tblCustomer set Name=?, Address=? where CustomerId=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(3, customerId);
            ps.setString(2, address);
            ps.executeUpdate();
            
            
//            Customer cus = new Customer();
//            String customerIdMax = cus.getIDCustomertMax();
            double total = 0.0;
            for (ProductOrder productOrder : proOrder) {
                total += (productOrder.getPrice() * productOrder.getQuantity());
            }

            ps = connection.prepareStatement("insert into tblBill(date,total,customerId,status) values(CURRENT_TIMESTAMP,?,?,1)");
            ps.setDouble(1, total);
            ps.setInt(2, customerId);
            ps.executeUpdate();

            String billIDMax = getIDBillMax();

            for (ProductOrder productOrder : proOrder) {
                ps = connection.prepareStatement("insert into tblBillDetail values(?,?,?)");
                ps.setString(1, billIDMax);
                ps.setInt(2, productOrder.getId());
                ps.setInt(3, productOrder.getQuantity());
                ps.executeUpdate();
            }

            return true;
        } catch (SQLException e) {
            System.out.println("Loi Add Bill: " + e.getMessage());
        }
        return false;
    }

    public String getIDBillMax() {
        try {
            String sql = "select MAX(BillId) from tblBill";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Loi getBillIDMax: " + e.getMessage());
        }
        return "";
    }
}
