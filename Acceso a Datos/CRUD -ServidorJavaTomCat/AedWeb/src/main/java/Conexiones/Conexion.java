/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {

    static Connection con = null;
    static String URL = "jdbc:mysql://localhost:3306/AED";
    static String USER = "ivan";
    static String PASSWORD = "ivanPass";

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM GestionAlumnos");
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                System.out.println(rs.getInt("ID"));
            }
        } catch (ClassNotFoundException cnfe) {
            System.out.println("No se ha encontrado el driver de JDBC " + cnfe);
        } catch (SQLException sqle) {
            System.out.println("Error al conectarse con la base de datos: " + sqle);
        }

    }

    public Connection getConnection() {
        return con;
    }
}
