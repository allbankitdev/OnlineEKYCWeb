/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author vgponciano
 */
public class DBConnection {

    public static String setURL = "jdbc:sqlserver://10.232.236.51;databaseName=ALBOnlineBankingSandbox";
    public static String setUSERNAME = "sa";
    public static String setPASSWORD = "@rvin1120";
    //public static String setPASSWORD = "sql";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(setURL, setUSERNAME, setPASSWORD);
    }
}
