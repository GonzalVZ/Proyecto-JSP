<%@ page import="modelos.Equipo" %>
<h3>Aquí saldrá la lista de equipos</h3>

<%
    List<Equipo> lista = (List<Equipo>) request.getAttribute("lista");

    for (int i = 0; i < lista.size(); i++) {
        out.println(lista.get(i).toString() + "<br>");
    }
%>
