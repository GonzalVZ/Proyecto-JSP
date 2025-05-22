<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="modelos.Equipo" %>



<!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link rel="stylesheet" href="css/estilos.css?v=1">

            <title>Futbol</title>

        </head>

        <body>

            <section class="layout"> 
            <header class="menu">
            <a href='index.jsp?accion=mostrarListaEquipos'>Ver equipos</a>  
            <a href='index.jsp?accion=formEquipoNuevo'>Nuevo Equipo</a>
            <a href='index.jsp?accion=verPartidos&apuestas=true'>Ver Partidos</a> 
 
           
            <form action="index.jsp" method="get">

            <input type="text" name="nombreEquipo" >
            <input type="hidden" name="accion" value="mostrarEquipoPorNombre">

            <input type="submit" value="Buscar">
            </form>

             </header>

             <main class="contenido">
<%
    // Averiguamos qué hay que hacer ahora
    String accion = request.getParameter("accion");
    if ((accion == "") || (accion == null)) {
        accion = "mostrarListaEquipos";
    }

    

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

             lista = Equipo.getPartidos();
            request.setAttribute("lista", lista);
            %><jsp:include page="vistas/listaEquipos.jsp" /><%

        break;

    }


%>
</main>


        <footer class="footer"><p>&copy; 2025 Mi Sitio Web. Todos los derechos reservados.</p></footer>
        </section>
        </body>

        </html>