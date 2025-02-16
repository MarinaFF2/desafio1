<%-- 
    Document   : Bitacora
    Created on : 30-oct-2019, 14:07:16
    Author     : daw207
--%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="BBDD.Constantes"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="refresh" content="60;url=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/menus/css_menus.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="../../css/gestion/css_bitacora.css" media="screen" />
    </head>
    <body>
         <form action="../../controlador/controladorGeneral.jsp" method="POST">
            <%
                int n =(Integer) session.getAttribute("rol");
                if(n == 3) {
            %>
            <nav>
                    <ul>
                        <li>
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Administrador General</a><span class="flecha"></span>
                            <ul>
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                                <li><a href="gestionarUsuario.jsp">Gestion Usuario</a></li>
                                <li><a href="gestionarRol.jsp">Gestion Rol</a></li>
                            </ul>
                        </li>
                        <li><input type="submit" id="bitacora" name="bitacora"  value="VerBitacora"></li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>

                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
                <%
                } else if (n == 2) {
                %>
                <nav>
                    <ul>
                        <li>
                            <a href="#"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Administrador Aula</a><span class="flecha"></span>
                            <ul>
                                <li><a href="gestionarAula.jsp">Gestionar Aula</a></li>
                                <li><a href="gestionarFranja.jsp">Gestionar Franja</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
                <%
                } else {
                %>  
                <nav>
                    <ul>
                        <li>
                            <a href="#" id="editarUsuario"><img id="imgUsu" src="../../img/iconos/usu.png" alt="no encontrada"/></a><span class="flecha"></span>
                            <ul>
                                <li><a href="../usuario/editarFoto.jsp">Editar Foto</a></li>
                                <li><a href="../usuario/editarUsuario.jsp">Editar Usuario</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Profesor</a><span class="flecha"></span>
                            <ul>
                                <li><a href="prof.jsp">Reservar Aula</a></li>
                            </ul>
                        </li>
                        <li>
                            <button type="submit" id="cerrarSesion" name="cerrarSesion"  value="CerrarSesion"></button>
                        </li>
                    </ul>
                </nav>
                <%
                    }
                %>
            </form>
        <table>
            <caption><h1>Contenido del archivo Bitacora</h1></caption>
            <thead>
                <tr>
                    <th>Acción</th>
                    <th>Fecha y hora se la acción</th>
                    <th>correo del usuario</th>
                    <th>Rol</th>
                </tr>
            </thead>
            <tbody>
                <% 
                File f =null;
                FileReader fw = null;
                BufferedReader br = null;
                try {
                    f = new File(Constantes.ficheroBitacoras);
                    if(f.exists()){
                        fw = new FileReader(f);
                        br = new BufferedReader(fw);
                        String linea;
                        while((linea = br.readLine())!=null){
                            out.print(linea);
                        }
                    }   
                } catch (Exception ex) {
                    ex.printStackTrace();
                }finally{
                    try{
                        if(null!= fw){
                        fw.close();
                        }
                    }catch (Exception e1) {
                        e1.printStackTrace();
                    }
                }
                    %>
            </tbody>
        </table>
    </body>
</html>
