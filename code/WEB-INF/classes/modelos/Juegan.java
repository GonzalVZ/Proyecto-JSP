package modelos;

import java.sql.*;
import java.util.*;

public class Juegan {

    private Partido partido;
    private Equipo equipo;
    private int goles;

    public Juegan() {
    }

    public Juegan(Partido partido, Equipo equipo, int goles) {
        this.partido = partido;
        this.equipo = equipo;
        this.goles = goles;
    }

    public static List<Juegan> getPartidos() {
        List<Juegan> lista = new ArrayList<>();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");

            String query = "SELECT partidos.*, equipos.*, juegan.goles " +
                    "FROM equipos " +
                    "INNER JOIN juegan ON equipos.id_equipo = juegan.id_equipo " +
                    "INNER JOIN partidos ON juegan.id_partido = partidos.id_partido " +
                    "ORDER BY partidos.fecha ASC";
            st = conn.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                Partido partido = new Partido(
                        rs.getInt("id_partido"),
                        rs.getString("fecha"));

                Equipo equipo = new Equipo(
                        rs.getInt("id_equipo"),
                        rs.getString("nombre"),
                        rs.getString("estadio"),
                        rs.getString("imagen_escudo"),
                        rs.getString("imagen_estadio"),
                        rs.getString("imagen_camiseta_local"),
                        rs.getString("imagen_camiseta_visitante"));

                Juegan juegan = new Juegan(partido, equipo, rs.getInt("goles"));
                lista.add(juegan);
            }

        } catch (Exception e) {
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

        return lista;
    }

    public Partido getPartido() {
        return partido;
    }

    public void setPartido(Partido partido) {
        this.partido = partido;
    }

    public Equipo getEquipo() {
        return equipo;
    }

    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
}
