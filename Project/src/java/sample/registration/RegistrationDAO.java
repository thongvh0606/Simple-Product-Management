/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.registration;

import java.io.Serializable;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.naming.NamingException;
import sample.utils.DBUtil;

/**
 *
 * @author user
 */
public class RegistrationDAO implements Serializable {

    public boolean checkLogin(String username, String password) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "SELECT* FROM tbl_account "
                        + "WHERE accountID = ? and password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //day.afterday
                rs = stm.executeQuery();
                if (rs.next()) {
                    Date currentDate = new Date();
                    Date userExpiredDate = getUserExpired(username);
                    if (userExpiredDate.before(currentDate)) {
                        return false;
                    }
                    return true;
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
        return false;
    }

    public Date getUserExpired(String username) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "SELECT expired FROM tbl_account "
                        + "WHERE accountID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //day.afterday
                rs = stm.executeQuery();
                Date date = null;
                if (rs.next()) {
                    date = rs.getDate("expired");
                }
                return date;
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

        return null;
    }
}
