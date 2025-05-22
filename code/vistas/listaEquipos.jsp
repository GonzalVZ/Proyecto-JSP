<%@ page import="modelos.Equipo" %>
<%@ page import="java.util.*" %>

<h3>Lista de equipos</h3>

<%
    List<Equipo> lista = (List<Equipo>) request.getAttribute("lista");

    if (lista == null) {
        out.println("La lista no se ha pasado correctamente (es null).");
    } else if (lista.isEmpty()) {
        out.println("La lista está vacía.");
    } else {
        for (Equipo e : lista) {


            out.println("ID: " + e.getId_equipo() + "<br>");
            out.println("Nombre: " + e.getNombre() + "<br>");
            out.println("Estadio: " + e.getEstadio() + "<br>");
            out.println("Escudo: <img src='" + e.getImagen_escudo() + "' width='50'><br>");
            out.println("Imagen Estadio: <img src='" + e.getImagen_estadio() + "' width='100'><br>");
            out.println("Camiseta Local: <img src='" + e.getImagen_camiseta_local() + "' width='50'><br>");
            out.println("Camiseta Visitante: <img src='" + e.getImagen_camiseta_visitante() + "' width='50'><br><hr>");
            out.println("<input type='hidden' name='borrar' value="+e.getId_equipo()+">");


            out.println("<a href=index.jsp?accion=eliminarEquipo&id="+e.getId_equipo()+">Borrar</a>");
            out.println("<a href=index.jsp?accion=mostrarEquipoPorId&id="+e.getId_equipo()+">Modificar</a>");

            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
        }
        
        
    }
%>
