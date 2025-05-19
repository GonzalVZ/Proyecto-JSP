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

                <%
                    String goles[] = request.getParameterValues("goles");
                    String idPartido[] = request.getParameterValues("idPartido");
                    response.sendRedirect("index.jsp?do=user/getAll");
                %>        

        </body>

     </html>