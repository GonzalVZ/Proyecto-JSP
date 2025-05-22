<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="modelos.Equipo" %>



<%
List<Equipo> equipoEncontradoPorNombre = (List<Equipo>) request.getAttribute("equipoEncontradoPorNombre");

for (Equipo e : equipoEncontradoPorNombre) {
    
    out.println("ID: " + e.getId_equipo() + "<br>");
    out.println("Nombre: " + e.getNombre() + "<br>");
    out.println("Estadio: " + e.getEstadio() + "<br>");
    out.println("Escudo: <img src='" + e.getImagen_escudo() + "' width='50'><br>");
    out.println("Imagen Estadio: <img src='" + e.getImagen_estadio() + "' width='100'><br>");
    out.println("Camiseta Local: <img src='" + e.getImagen_camiseta_local() + "' width='50'><br>");
    out.println("Camiseta Visitante: <img src='" + e.getImagen_camiseta_visitante() + "' width='50'><br><hr>");
}
%>



