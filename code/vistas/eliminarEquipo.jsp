<%@ page import="modelos.Equipo" %>

<%
    String id = request.getParameter("id");


    Equipo.eliminarEquipo(id);
    


    %>

