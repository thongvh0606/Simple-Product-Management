/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtil;

/**
 *
 * @author user
 */
public class ProductDAO {

    List<ProductDTO> listProducts;

    public List<ProductDTO> getListProducts() {
        return listProducts;
    }

    public ProductDAO() {
    }

    public boolean loadProductsFromDatabase() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "SELECT* FROM tbl_product";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (listProducts == null) {
                    listProducts = new ArrayList<ProductDTO>();
                }
                while (rs.next()) {
                    String productId = rs.getString("product_id");
                    String productName = rs.getString("product_name");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String unit = rs.getString("unit");
                    ProductDTO dto = new ProductDTO(productId, productName, price, quantity, unit);
                    listProducts.add(dto);
                }
                return true;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean insertProduct(String id, String name, String unit) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tbl_product"
                        + "(product_id,product_name,price,quantity,unit) "
                        + "VALUES(?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                stm.setString(2, name);
                stm.setFloat(3, 0);
                stm.setInt(4, 0);
                stm.setString(5, unit);
                int rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateProductInfo(String id, String price, String unit)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "UPDATE tbl_product SET price = ?,unit=? WHERE product_id =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, price);
                stm.setString(2, unit);
                stm.setString(3, id);
                int rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteProductFromImportTable(String id)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "DELETE FROM tbl_import WHERE product_id =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                int rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteProductFromDatabase(String id)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                deleteProductFromImportTable(id);
                String sql = "DELETE FROM tbl_product WHERE product_id =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                int rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public int getQuantityOfProduct(String id)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "SELECT quantity FROM tbl_product WHERE product_id =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int quantity = rs.getInt("quantity");
                    return quantity;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }

    public boolean importProduct(String id, float price, int quantity)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tbl_import(importDate,price,quantity,product_id) VALUES(?,?,?,?)";
                stm = con.prepareStatement(sql);
                Calendar cal = Calendar.getInstance();
                java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
                stm.setTimestamp(1, timestamp);
                stm.setFloat(2, price);
                stm.setInt(3, quantity);
                stm.setString(4, id);
                int rs = stm.executeUpdate();
                if (rs > 0) {
                    updateToProductTable(id, price, quantity);
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateToProductTable(String id, float price, int quantity)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                int curQuantity = getQuantityOfProduct(id);
                String sql = "UPDATE tbl_product SET price = ?,quantity=? WHERE product_id =?";
                stm = con.prepareStatement(sql);
                stm.setFloat(1, price);
                stm.setInt(2, curQuantity + quantity);
                stm.setString(3, id);
                int rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
