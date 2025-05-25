<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="modelos.Equipo" %>


<h3>MODIFICAR EQUIPO</h3>

<form action="index.jsp" method="get">
<%
List<Equipo> equipoEncontradoPorId = (List<Equipo>) request.getAttribute("equipoEncontradoPorId");

Equipo e = equipoEncontradoPorId.get(0);
    out.println("<input type='text' name='datos' value='" + e.getId_equipo() + "' readonly><br>");
    out.println("<input type='text' name='datos' value='" + e.getNombre() + "'><br>");
    out.println("<input type='text' name='datos' value='" + e.getEstadio() + "'><br>");
    out.println("<input type='text' name='datos' value='" + e.getImagen_escudo() + "'><br>");
    out.println("<input type='text' name='datos' value='" + e.getImagen_estadio() + "'><br>");
    out.println("<input type='text' name='datos' value='" + e.getImagen_camiseta_local() + "'><br>");
    out.println("<input type='text' name='datos' value='" + e.getImagen_camiseta_visitante() + "'><br>");

%>

<input type="hidden" name="accion" value="modificarEquipo">
<input type="submit" value="Modificar">

</form>
