<%@ page import="modelos.Juegan" %>
<%@ page import="java.util.*" %>

<h3>JORNADA 1</h3>
<form action='index.jsp' method='get' class="fomularioPartidos">
<%
    List<Juegan> lista = (List<Juegan>) request.getAttribute("lista");


    for (int i = 0; i < lista.size(); i += 2) {
            Juegan equipo1 = lista.get(i);
            Juegan equipo2 = lista.get(i + 1);

            out.println("<div class='partido'>");

            out.println("<div class='equipo'>");
        out.println("<div class='fondo' style=\"background-image: url('" + equipo1.getEquipo().getImagen_estadio() + "');\">");
        out.println("<img src='" + equipo1.getEquipo().getImagen_escudo() + "' width='150'>");
        out.println("</div>");



            out.println("</div>");



            out.println("<div class='equipo'>");
        out.println("<div class='fondo' style=\"background-image: url('" + equipo2.getEquipo().getImagen_estadio() + "');\">");
        out.println("<img src='" + equipo2.getEquipo().getImagen_escudo() + "' width='150'>");
        out.println("</div>");



        out.println("</div>");


            out.println("<input type='hidden' name='id_partido'  value='" + equipo1.getPartido().getId_partido() + "'>");
            out.println("<input type='hidden' name='id_equipo1' value='" + equipo1.getEquipo().getId_equipo() + "'>");
            out.println("<input type='hidden' name='id_equipo2' value='" + equipo2.getEquipo().getId_equipo() + "'>");
            out.println("<input type='hidden' name='accion' value='guardarApuestas'>");

        out.println("<div class='puntosygoles'>");
        out.println("<input type='number' name='golesApostadosEquipo1' placeholder='Goles' >");
        out.println("<input type='number' name='puntosApostados' placeholder='Puntos' >");
        out.println("<input type='number' name='golesApostadosEquipo2' placeholder='Goles' >");

        out.println("</div>");

        out.println("</div>");
        }





%>
    <div class='apuestas'>

    <input type='submit' value='Apostar'>
    </div>

</form>
