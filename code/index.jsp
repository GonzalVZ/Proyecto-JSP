<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ page import="java.sql.*" %>
    
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link rel="stylesheet" href="css/estilos.css">

            <title>Mi Web</title>
            
        </head>

        <body>
            <h1>Esta es la cabecera</h1>
            <h3>Menú principal</h3>
            <p><a href='index.jsp?accion=mostrarListaEquipos'>Ver equipos</a> | <a href='index.jsp?accion=mostrarListaUsuarios'>Ver usuarios</a> | <a href='index.jsp?accion=mostrarListaPardios'>Ver partidos</a></p>

<%
    // Averiguamos qué hay que hacer ahora
    String accion = request.getParameter("accion");
    if ((accion == "") || (accion == null)) {
        accion = "mostrarListaEquipos";
    }

    switch(accion) {

        case "mostrarListaEquipos":
            List<Equipo> lista = Equipo.getAll();
            Request.setAttribute("lista", lista);  
            %><jsp:include page="vistas/listaEquipos.jsp" /><%
            break;

        case "formEquipoNuevo":
            %><jsp:include page="vistas/formularioEquipoNuevo.jsp" /><%
            break;

        case "mostrarListaUsuarios":

            break;
/*
        case "mostrarListaPartidos":
                out.println("Estoy en mistrarListaPartids");
                // Mostrar la lista de partidos

                // 1. Recuperar los datos de la base de datos (modelo)
                List<Partido> listaPartidos = Partido.getAll();
                // 2. Generar HTML con esos datos (vista)
                include("listaPartidos.jsp");
                break;

        case "procesarApuesta":
                 String goles[] = request.getParameterValues("goles");
                 String[] idPartidoArray = request.getParameterValues("idPartido");
                 Set<String> idPartidoSet = new HashSet<>(Arrays.asList(idPartidoArray));

                String idEquipo[] = request.getParameterValues("idEquipo");
                Partido.guardarApuesta(goles, idPartidoArray, idPartidoSet);

*/
    } // switch


%>


        <div>Esto es el pie de todas las páginas</div>
        </body>

        </html>