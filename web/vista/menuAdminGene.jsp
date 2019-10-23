<%-- 
    Document   : menuAdminGene
    Created on : 17-oct-2019, 9:06:21
    Author     : daw207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="./css/css_menuAdminGene.css" media="screen" />
    </head>
    <body>
        <form id="menuAdminGene" action="../controlador/controlador.jsp" method="POST">
            <nav id="menuLoginAdminGene">
                <ul>
                    <li><a href="menuAdminGene.jsp">Administrador General</a></li>
                    <li><a href="prof.jsp">Profesor</a></li>
                    <li><a href="editarUsuario.jsp">Editar Usuario</a></li>
                    <li>
                        <input type="submit" id="cerrarSesion" name="cerrarSesion" value="CerrarSesion">
                    </li>
                </ul>
            </nav>
            <input type="submit" id="gestionarAula" name="gestionarAula" value="Gestionar Aula"><br> 
            <input type="submit" id="gestionarRol" name="gestionarRol" value="Gestionar Rol"><br> 
            <input type="submit" id="gestionarFranja" name="gestionarFranja" value="Gestionar Franja Horaria"><br>
            <input type="submit" id="gestionarUsuario" name="gestionarUsuario" value="Gestionar Usuarios"><br>
        </form>
    </body>
</html>
