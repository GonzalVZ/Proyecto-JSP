<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*"%>
<%@ page import="modelos.Equipo" %>



<!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />

            <title>Mi Web</title>

        </head>

        <body>
            <h1>Esta es la cabecera</h1>
            <h3>Menú principal</h3>
            <p><a href='index.jsp?accion=mostrarListaEquipos'>Ver equipos</a> | <a href='index.jsp?accion=formEquipoNuevo'>Nuevo Equipo</a> </p>
            <p>Buscar Equipo</p>
            <form action="index.jsp" method="get">

            <input type="text" name="nombreEquipo" >
            <input type="hidden" name="accion" value="mostrarEquipoPorNombre">

            <input type="submit" value="Buscar">
            </form>
<%
    // Averiguamos qué hay que hacer ahora
    String accion = request.getParameter("accion");
    if ((accion == "") || (accion == null)) {
        accion = "mostrarListaEquipos";
    }else if(accion.equals("insertarEquipo")){
      accion = "insertarEquipo";
    }else if (accion.equals("modificarEquipo")){
        accion = "modificarEquipo";    
}
    

    switch(accion) {

        case "mostrarListaEquipos":
            List<Equipo> lista = Equipo.getAll();
            request.setAttribute("lista", lista);
           %><jsp:include page="vistas/listaEquipos.jsp" /><%
            break;

        case "formEquipoNuevo":

            %><jsp:include page="vistas/equipoNuevo.jsp" /><%

            break;

        case "insertarEquipo":

        String datos[] = request.getParameterValues("datos");

            Equipo.meterEquipo(datos);
            
        response.sendRedirect("index.jsp?accion=mostrarListaEquipos");



            break;

        case "eliminarEquipo":

        %><jsp:include page="vistas/eliminarEquipo.jsp" /><%

        response.sendRedirect("index.jsp?accion=mostrarListaEquipos");


        case "mostrarEquipoPorId":

        String id = request.getParameter("id");

       List<Equipo> equipoEncontradoPorId = Equipo.mostrarEquipoPorId(id);

        request.setAttribute("equipoEncontradoPorId", equipoEncontradoPorId);



        %><jsp:include page="vistas/mostrarEquipoPorId.jsp" /><%

        break;

        case "modificarEquipo":

        String[] recogerDatos = request.getParameterValues("datos");

        Equipo.modificarEquipo(recogerDatos);


        response.sendRedirect("index.jsp?accion=mostrarListaEquipos");

        case "mostrarEquipoPorNombre":

          String nombreEquipo =  request.getParameter("nombreEquipo");

         List<Equipo> equipoEncontradoPorNombre = Equipo.mostrarEquipoPorNombre(nombreEquipo);

        request.setAttribute("equipoEncontradoPorNombre", equipoEncontradoPorNombre);

        %><jsp:include page="vistas/mostrarEquipoPorNombre.jsp" /><%

    }


%>


        <div>Esto es el pie de todas las páginas</div>
        </body>

        </html>