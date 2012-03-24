/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pancha
 */
public class DBmanager {

    private String connString;
    private static DBmanager dbManager = null;
    Connection con;
    Statement stmt;

    private DBmanager() {
        dbManager = this;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sigiridb", "root", "");
            stmt = con.createStatement();
            System.out.println("Connection successful");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public ResultSet executeQuery(String query) {
        try {
            return stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBmanager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static DBmanager getInstance() {
        if (dbManager != null) {
            return dbManager;
        } else {
            return new DBmanager();
        }
    }
}
