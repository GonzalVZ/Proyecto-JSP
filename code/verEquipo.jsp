<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <h2>Futbol</h2>

<div class="grid1">
    <%
      Connection conn = null;
      Statement st = null;
      ResultSet rs = null;

      try {
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");
          String query = "SELECT Equipos.imagen_escudo " +
                         "FROM Equipos " +
                         "INNER JOIN Juegan ON Equipos.id_equipo = Juegan.id_equipo " +
                         "INNER JOIN Partidos ON Juegan.id_partido = Partidos.id_partido";
          st = conn.createStatement();
          rs = st.executeQuery(query);

          while (rs.next()) {
              String imagen_escudo = rs.getString("imagen_escudo");
    
            <div>
                <img src="<%= imagen_escudo %>" >
                
            </div>
            
        } catch (Exception e) {
            out.println("Error al acceder a la BD: " + e.toString());
            } 
    %>

</body>
</html>