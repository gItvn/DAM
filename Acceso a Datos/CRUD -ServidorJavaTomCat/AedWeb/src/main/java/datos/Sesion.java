/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import Conexiones.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ymir
 */
public class Sesion {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String name, pass;

    public Sesion() {
        Conexion conDB = new Conexion();
        this.con = conDB.getConnection();
    }

    public Sesion(String name, String pass) {
        Conexion conDB = new Conexion();
        this.con = conDB.getConnection();

    }

    public boolean connect(String n, String p) {
        try {
            ps = null;
            ps = con.prepareStatement("select * from administradores where name=? and password=?");
            ps.setString(1, n);
            ps.setString(2, p);
            
            rs = ps.executeQuery();
            
            // añadido para descartar errores
            //ps.close();

            return rs.next();

        } catch (SQLException ex) {
            Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
