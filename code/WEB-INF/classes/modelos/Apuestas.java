package modelos;

import java.sql.*;
import java.util.*;

public class Apuestas {

    int id_partido;
    int id_usuario;
    int puntos_apostados;

    public Apuestas(int id_partido, int id_usuario, int puntos_apostados) {
        this.id_partido = id_partido;
        this.id_usuario = id_usuario;
        this.puntos_apostados = puntos_apostados;
    }


    public static void meterApuestas(String[] id_partido, String[] puntosApostados) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");

            String query = "INSERT INTO apuestas (id_partido, id_usuario, puntos_apostados) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(query);

            for (int i = 0; i < id_partido.length; i++) {
                ps.setInt(1, Integer.parseInt(id_partido[i]));
                ps.setInt(2, 1);
                ps.setInt(3, Integer.parseInt(puntosApostados[i]));
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public int getId_partido() {
        return id_partido;
    }

    public void setId_partido(int id_partido) {
        this.id_partido = id_partido;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getPuntos_apostados() {
        return puntos_apostados;
    }

    public void setPuntos_apostados(int puntos_apostados) {
        this.puntos_apostados = puntos_apostados;
    }
}