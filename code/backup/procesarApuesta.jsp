<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mi Web</title>
</head>
<body>

<%

    String goles[] = request.getParameterValues("goles");
    String[] idPartidoArray = request.getParameterValues("idPartido");
    Set<String> idPartidoSet = new HashSet<>(Arrays.asList(idPartidoArray));

    String idEquipo[] = request.getParameterValues("idEquipo");

    if (goles == null || idPartidoArray == null || idEquipo == null ||
            goles.length != idPartidoArray.length || goles.length != idEquipo.length) {
        out.println("<p style='color:red;'>Error: Los datos recibidos son inválidos o incompletos.</p>");
    } else {
        for (int i = 0; i < goles.length; i++) {
            out.println("Goles: " + goles[i] + "<br>");
            out.println("Partido: " + idPartidoArray[i] + "<br>");
            out.println("Equipo: " + idEquipo[i] + "<br><br>");
        } // ← cierre del for (int i...)

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");

            String sql = "INSERT INTO apuestas_detalle (id_partido, id_usuario, id_equipo, goles_apostados) VALUES (?, ?, ?, ?)";
            String sql1 = "INSERT INTO apuestas (id_partido, id_usuario, puntos_apostados) VALUES (?, ?, ?)";

            ps = conn.prepareStatement(sql1);

            for (String a : idPartidoSet) {
                ps.setInt(1, Integer.parseInt(a));
                ps.setInt(2, 1);
                ps.setInt(3, 1); // puntos_apostados
                ps.executeUpdate();
            }
            ps = conn.prepareStatement(sql);

            for (int i = 0; i < idEquipo.length; i++) {
                ps.setInt(1, Integer.parseInt(idPartidoArray[i]));
                ps.setInt(2, 1);
                ps.setInt(3, Integer.parseInt(idEquipo[i]));
                ps.setInt(4, Integer.parseInt(goles[i]));
                ps.executeUpdate();
            }

            out.println("<p style='color:green;'>Datos insertados correctamente.</p>");

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error al insertar datos: " + e.getMessage() + "</p>");
            e.printStackTrace(); // Esto es útil para depurar en entorno de desarrollo
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    } // ← cierre del else
%> <!-- cierre del bloque JSP -->

</body>
</html>
