package modelos;

import java.sql.*;
import java.util.*;

public class Equipo {
    private int id_equipo;
    private String nombre;
    private String estadio;
    private String imagen_escudo;
    private String imagen_estadio;
    private String imagen_camiseta_local;
    private String imagen_camiseta_visitante;

    public Equipo() {

    }

    public Equipo(int id_equipo, String nombre, String estadio, String imagen_escudo, String imagen_estadio,
            String imagen_camiseta_local, String imagen_camiseta_visitante) {
        this.id_equipo = id_equipo;
        this.nombre = nombre;
        this.estadio = estadio;
        this.imagen_escudo = imagen_escudo;
        this.imagen_estadio = imagen_estadio;
        this.imagen_camiseta_local = imagen_camiseta_local;
        this.imagen_camiseta_visitante = imagen_camiseta_visitante;
    }

    public static List<Equipo> getAll() {
        List<Equipo> equipos = new ArrayList<>();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");

            String query = "SELECT * FROM equipos";
            st = conn.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                Equipo equipo = new Equipo(
                        rs.getInt("id_equipo"),
                        rs.getString("nombre"),
                        rs.getString("estadio"),
                        rs.getString("imagen_escudo"),
                        rs.getString("imagen_estadio"),
                        rs.getString("imagen_camiseta_local"),
                        rs.getString("imagen_camiseta_visitante"));
                equipos.add(equipo);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (st != null)
                    st.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return equipos;
    }

    public static void meterEquipo(String datos[]) {

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");

            String query = ("INSERT INTO equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES (?, ?, ?, ?, ?, ?)");
            ps = conn.prepareStatement(query);
            for (int i = 0; i < 6; i++)
                ps.setString(i + 1, datos[i]);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public int getId_equipo() {
        return id_equipo;
    }

    public void setId_equipo(int id_equipo) {
        this.id_equipo = id_equipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstadio() {
        return estadio;
    }

    public void setEstadio(String estadio) {
        this.estadio = estadio;
    }

    public String getImagen_escudo() {
        return imagen_escudo;
    }

    public void setImagen_escudo(String imagen_escudo) {
        this.imagen_escudo = imagen_escudo;
    }

    public String getImagen_estadio() {
        return imagen_estadio;
    }

    public void setImagen_estadio(String imagen_estadio) {
        this.imagen_estadio = imagen_estadio;
    }

    public String getImagen_camiseta_local() {
        return imagen_camiseta_local;
    }

    public void setImagen_camiseta_local(String imagen_camiseta_local) {
        this.imagen_camiseta_local = imagen_camiseta_local;
    }

    public String getImagen_camiseta_visitante() {
        return imagen_camiseta_visitante;
    }

    public void setImagen_camiseta_visitante(String imagen_camiseta_visitante) {
        this.imagen_camiseta_visitante = imagen_camiseta_visitante;
    }

}