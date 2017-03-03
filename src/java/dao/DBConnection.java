/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;

/**
 *
 * @author Aleja
 */
public class DBConnection {

    private static DBConnection uniqueConection = null;
    private Connection conection;

    private DBConnection() 
            throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String connectionUrl = "jdbc:mysql://localhost:3306/db_elections";
        conection = DriverManager.getConnection(connectionUrl, "root", "root");
    }

    public synchronized static DBConnection GetConexion()
            throws ClassNotFoundException, SQLException {
        if (uniqueConection == null) {
            uniqueConection = new DBConnection();
        }
        return uniqueConection;
    }

    public Connection GetCon() {
        return conection;
    }

    public void Destroy() throws SQLException {
        conection.close();
    }
}
