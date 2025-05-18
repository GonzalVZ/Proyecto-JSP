<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ page import="java.sql.*" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Mi Web</title>
            <link rel="stylesheet" href="css/estilos.css" />
        </head>

        <body>
            <section class="layout">
                <header class="menu"></header>

                <main class="contenido">
                    <% Connection conn=null; Statement st=null; ResultSet rs=null; try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn=DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root" , "" ); String
                        query="SELECT Equipos.imagen_escudo " + "FROM Equipos "
                        + "INNER JOIN Juegan ON Equipos.id_equipo = Juegan.id_equipo "
                        + "INNER JOIN Partidos ON Juegan.id_partido = Partidos.id_partido" ; st=conn.createStatement();
                        rs=st.executeQuery(query); while (rs.next()) { String
                        imagen_escudo=rs.getString("imagen_escudo"); %>
                        <div>
                            <img src="<%= imagen_escudo %>" alt="Escudo" />
                        </div>
                        <% } } catch (Exception e) { out.println("Error al acceder a la BD: " +
        e.toString()); } finally { if (rs != null) rs.close(); if (st != null)
        st.close(); if (conn != null) conn.close(); } %>
      </main>

      <footer class=" footer">
                            <p>&copy; 2025 Jesus. Todos los derechos reservados.</p>
                            </footer>
            </section>
        </body>

        </html>