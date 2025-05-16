
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>

<!-- Este script muestra la lista de usuarios guardada en la tabla Users. 
     Es una versión monolítica que no usa la arquitectura MVC -->

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Futbol</title>
</head>
<body>

    <h2>Futbol</h2>

<%
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        // Cambio la IP de del servidor MySQL "mysql" porque así está configurado en mi docker-compose
        conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "root");
        String query = "SELECT * FROM Equipos";
        st = conn.createStatement();
        rs = st.executeQuery(query);
%>
<table border='1'>
    <thead>
        <tr>
            <th>id_equipo</th>
            <th>nombre</th>
            <th>estadio</th>
            <th>imagen_escudo</th>
            <th>imagen_estadio</th>
            <th>imagen_plantilla</th>
            <th>imagen_camiseta_local</th>
            <th>imagen_camiseta_visitante</th>
        </tr>
    </thead>
    <tbody>
        <%
        // Procesar los resultados
        while (rs.next()) {
            int id_equipo = rs.getInt("id_equipo");
            String nombre = rs.getString("nombre");
            String estadio = rs.getString("estadio");
            String imagen_escudo = rs.getString("imagen_escudo");
            String imagen_estadio = rs.getString("imagen_estadio");
            String imagen_plantilla = rs.getString("imagen_plantilla");
            String imagen_camiseta_local = rs.getString("imagen_camiseta_local");
            String imagen_camiseta_visitante = rs.getString("imagen_camiseta_visitante");
    
            out.println("<tr>" +
                "<td>" + id_equipo + "</td>" +
                "<td>" + nombre + "</td>" +
                "<td>" + estadio + "</td>" +
                "<td><img src='" + imagen_escudo + "' width='50'></td>" +
                "<td><img src='" + imagen_estadio + "' width='100'></td>" +
                "<td><img src='" + imagen_plantilla + "' width='100'></td>" +
                "<td><img src='" + imagen_camiseta_local + "' width='50'></td>" +
                "<td><img src='" + imagen_camiseta_visitante + "' width='50'></td>" +
                "<td><a href='verEquipo.jsp?id=" + id_equipo + "'>Ver detalles</a></td>" +
                "</tr>");
        }
    %>
    
    </tbody>
</table>
<p><a href="/3/newUser.jsp">Add New User</a></p>

<%
    } catch (Exception e) {
        out.println("Error al acceder a la BD: " + e.toString());
    } 
%>

</body>
</html>
