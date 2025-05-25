package modelos;

import java.sql.*;
import java.util.*;

public class ApuestasDetalle {
    private int idPartido;
    private int idUsuario;
    private int idEquipo;
    private int golesApostados;

    public ApuestasDetalle(int idPartido, int idUsuario, int idEquipo, int golesApostados) {
        this.idPartido = idPartido;
        this.idUsuario = idUsuario;
        this.idEquipo = idEquipo;
        this.golesApostados = golesApostados;
    }

    public static void meterApuestasDetalle(String[] id_partido, String[] id_equipo1, String[] golesApostadosEquipo1,
                                            String[] id_equipo2, String[] golesApostadosEquipo2) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");

            String query = "INSERT INTO apuestas_detalle (id_partido, id_usuario, id_equipo, goles_apostados) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(query);

            for (int i = 0; i < id_partido.length; i++) {
                // Primer equipo
                ps.setInt(1, Integer.parseInt(id_partido[i]));
                ps.setInt(2, 1);
                ps.setInt(3, Integer.parseInt(id_equipo1[i]));
                ps.setInt(4, Integer.parseInt(golesApostadosEquipo1[i]));
                ps.executeUpdate();

                // Segundo equipo
                ps.setInt(1, Integer.parseInt(id_partido[i]));
                ps.setInt(2, 1);
                ps.setInt(3, Integer.parseInt(id_equipo2[i]));
                ps.setInt(4, Integer.parseInt(golesApostadosEquipo2[i]));
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


    public int getIdPartido() {
        return idPartido;
    }

    public void setIdPartido(int idPartido) {
        this.idPartido = idPartido;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public int getGolesApostados() {
        return golesApostados;
    }

    public void setGolesApostados(int golesApostados) {
        this.golesApostados = golesApostados;
    }
}
