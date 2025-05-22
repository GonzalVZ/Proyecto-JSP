<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<h3>Formulario equipo</h3>

<form action="index.jsp" method="get">
<%
for(int i = 0; i<6;i++){
    out.println("<input type='text' name='datos' ><br>");
}


%>

    <input type="hidden" name="accion" value="insertarEquipo">

    <input type="submit" value="Enviar" >
 

</form>

