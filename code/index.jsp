<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ page import="java.sql.*" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Mi Web</title>
            <link rel="stylesheet" href="css/estilos.css">

        </head>

        <body>

            <section class="layout">
                <header class="menu"></header>

                <main class="contenido">
                    <form action="procesarApuesta.jsp" method="get" >
                        <%
                            Connection conn = null;
                            Statement st = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/web_futbol", "root", "");

                                String query = "SELECT partidos.id_partido, equipos.imagen_escudo, equipos.id_equipo " +
                                        "FROM equipos " +
                                        "INNER JOIN juegan ON equipos.id_equipo = juegan.id_equipo " +
                                        "INNER JOIN partidos ON juegan.id_partido = partidos.id_partido " +
                                        "ORDER BY partidos.fecha ASC";
                                st = conn.createStatement();
                                rs = st.executeQuery(query);

                                while (rs.next()) {
                                    String imagen_escudo = rs.getString("imagen_escudo");
                                    String id_partido = rs.getString("id_partido");
                                    String id_equipo = rs.getString("id_equipo");
                        %>
                        <div>
                            <img src="<%= imagen_escudo %>" alt="escudo" width="100px" />
                            <input type="hidden" name="idPartido" value="<%= id_partido %>"/>
                            <input type="hidden" name="idEquipo" value="<%= id_equipo %>"/>
                            <input type="number" name="goles" class="goles" >
                        </div>
                        <%
                            }
                        %>
                        <div class="boton">
                        <input type="submit" value="Enviar" >
                        </div>
                        <%
                            } catch (Exception e) {
                                out.println("Error al acceder a la BD: " + e.toString());
                            } finally {
                                if (rs != null) rs.close();
                                if (st != null) st.close();
                                if (conn != null) conn.close();
                            }
                        %>
                    </form>
                </main>


                <footer class=" footer">
                            <p>&copy; 2025 Jesus. Todos los derechos reservados.</p>
                            </footer>
            </section>
        </body>

        </html>