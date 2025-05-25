<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="modelos.*" %>

<%
    String accion = request.getParameter("accion");
    if (accion == null || accion.equals("")) {
        accion = "mostrarListaEquipos";
    }
    String claseCss = accion.equals("verPartidos") ? "verPartidos" : "modoGeneral";
%>

<!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link rel="stylesheet" href="css/estilos.css?<%= System.currentTimeMillis() %>">

            <title>Futbol</title>

        </head>

        <body class="<%= claseCss %>">


           <section class="layout">
            <header class="menu">
            <a href='index.jsp?accion=mostrarListaEquipos'>Ver equipos</a>  
            <a href='index.jsp?accion=formEquipoNuevo'>Nuevo Equipo</a>
            <a href='index.jsp?accion=verPartidos'>Ver Partidos</a> 
 
           
            <form action="index.jsp" method="get">

            <input type="text" name="nombreEquipo" >
            <input type="hidden" name="accion" value="mostrarEquipoPorNombre">

            <input type="submit" value="Buscar">
            </form>

             </header>

             <main class="contenido">
<%


    

    switch(accion) {

        // ------------------ Listado de todos los equipos ------------------------
        case "mostrarListaEquipos":
            List<Equipo> lista = Equipo.getAll();
            request.setAttribute("lista", lista);
            %><jsp:include page="vistas/listaEquipos.jsp" /><%
            break;

        // ------------------ Formulario para crear equipo nuevo -------------------
        case "formEquipoNuevo":
            %><jsp:include page="vistas/equipoNuevo.jsp" /><%
            break;

        case "insertarEquipo":
            String datos[] = request.getParameterValues("datos");
            Equipo.meterEquipo(datos);
            response.sendRedirect("index.jsp?accion=mostrarListaEquipos");
            break;

        case "eliminarEquipo":
            String id = request.getParameter("id");
            Equipo.eliminarEquipo(id);
            response.sendRedirect("index.jsp?accion=mostrarListaEquipos");
            break;

        case "mostrarEquipoPorId":
            id = request.getParameter("id");
            List<Equipo> equipoEncontradoPorId = Equipo.mostrarEquipoPorId(id);
            request.setAttribute("equipoEncontradoPorId", equipoEncontradoPorId);
            %><jsp:include page="vistas/mostrarEquipoPorId.jsp" /><%
            break;

        case "modificarEquipo":
            String[] recogerDatos = request.getParameterValues("datos");
            Equipo.modificarEquipo(recogerDatos);
            response.sendRedirect("index.jsp?accion=mostrarListaEquipos");
            break;

        case "mostrarEquipoPorNombre":
            String nombreEquipo = request.getParameter("nombreEquipo");
            List<Equipo> equipoEncontradoPorNombre = Equipo.mostrarEquipoPorNombre(nombreEquipo);
            request.setAttribute("lista", equipoEncontradoPorNombre);
            %><jsp:include page="vistas/listaEquipos.jsp" /><%
            break;

        case "verPartidos":

            List<Juegan> listaPartidos = Juegan.getPartidos();
            request.setAttribute("lista", listaPartidos);
            %><jsp:include page="vistas/listaPartidos.jsp" /><%

        break;

        case "guardarApuestas":

            String[] id_partido = request.getParameterValues("id_partido");
            String[] puntosApostados = request.getParameterValues("puntosApostados");
            Apuestas.meterApuestas(id_partido,puntosApostados);


            String[] id_equipo1 = request.getParameterValues("id_equipo1");

            String[] golesApostadosEquipo1 = request.getParameterValues("golesApostadosEquipo1");

            String[] id_equipo2 = request.getParameterValues("id_equipo2");

            String[] golesApostadosEquipo2 = request.getParameterValues("golesApostadosEquipo2");

            ApuestasDetalle.meterApuestasDetalle(id_partido,id_equipo1,golesApostadosEquipo1,id_equipo2,golesApostadosEquipo2);




            response.sendRedirect("index.jsp?accion=verPartidos");

            break;






    }


%>
</main>


        <footer class="footer"><p>&copy; 2025 Mi Sitio Web. Todos los derechos reservados.</p></footer>
        </section>
        </body>

        </html>