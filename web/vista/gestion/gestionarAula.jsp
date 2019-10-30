<%-- 
    Document   : gestionarAula
    Created on : 18-oct-2019, 12:42:31
    Author     : daw207
--%>

<%@page import="BBDD.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="clase.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/css_gestionarAula.css" media="screen" />
        
    </head>
    <body>
        <form  name="tablaGestionarAula" action="../controlador/controladorGeneral.jsp" method="POST">
        <%
            ConexionEstatica.nueva();
            LinkedList <Aula> v = ConexionEstatica.obtenerAulas();
            ConexionEstatica.cerrarBD();
            int n = (Integer)session.getAttribute("rol");
            if(n==3){
        %>
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="menuLoginAdminGene">
                    <ul>
                        <li><a href="#">Administrador General</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="../gestion/gestionarUsuario.jsp">Gestion Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Ver Bitacora</a></li>
                        <li><a href="#">Profesor</a>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a><span class="flecha"></span></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="editarUsuario" name="editarUsuario"  value="EditarUsuario"></button>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
            </header>
        <%  
            }else if(n==2){
        %>
            <header>
                <a href="#" id="menu_on">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <nav id="menuLoginAdminAula">
                    <ul>
                        <li><a href="#">Administrador Aula</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="../gestion/gestionarFranja.jsp">Gestionar Franja</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="../gestion/prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="editarUsuario" name="editarUsuario"  value="EditarUsuario"></button>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
            </header>
        <% 
            }
        %>
        </form>
        <table name="gestionarAula" >
            <caption>LISTA AULAS</caption>
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>DESCRIPCION</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < v.size(); i++) {
            %>
                <form  name="tablaGestionarAula" action="../../controlador/controladorGestion.jsp" method="POST">
                    <tr>
                        <td>
                            <input type="text" name="codAula" value="<%out.print(v.get(i).getCodAula());%>">
                        </td>   
                        <td>
                            <input type="text" name="descripcionAula" value="<%out.print(v.get(i).getDescripcion());%>">
                        </td>    
                        <td>
                            <input type="submit" name="botAula" value="X">
                        </td>
                        <td>
                            <input type="submit" name="botAula" value="Editar">
                            <input type="hidden" id="clave" name="aula" value="<%out.print(v.get(i).getCodAula());%>">
                        </td>
                    </tr>
                </form>
            <%
                }
            %>
            </tbody>
        </table>
    </body>
</html>
