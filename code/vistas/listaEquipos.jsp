<%@ page import="modelos.Equipo" %>
<%@ page import="java.util.*" %>

<h3>Jornada 1</h3>

<%
    List<Equipo> lista = (List<Equipo>) request.getAttribute("lista");
    String apuestas = request.getParameter("apuestas");

    if (lista == null) {
        out.println("La lista no se ha pasado correctamente (es null).");
    } else if (lista.isEmpty()) {
        out.println("La lista está vacía.");
    } else if(apuestas == "apuestas"){
        for (Equipo e : lista) {

            out.println("<div class='equipo'>");
            out.println("  <div class='fondo' style=\"background-image: url('" + e.getImagen_estadio() + "'); background-size: cover; background-position: center; background-repeat: no-repeat; grid-column: 1 / 3; grid-row: 1 / 3;\"></div>");
            out.println("  <img src='" + e.getImagen_escudo() + "' width='150'>");
            out.println("  <input type='hidden' name='borrar' value=" + e.getId_equipo() + ">");
            out.println("  <a href='index.jsp?accion=eliminarEquipo&id=" + e.getId_equipo() + "'>Borrar</a>");
            out.println("  <a href='index.jsp?accion=mostrarEquipoPorId&id=" + e.getId_equipo() + "'>Modificar</a>");
            out.println();
            out.println("</div>");



    
        }
        
        
    }
%>
