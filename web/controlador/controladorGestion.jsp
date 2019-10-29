<%-- 
    Document   : controladorGestion
    Created on : 24-oct-2019, 9:58:37
    Author     : daw207
--%>

<%@page import="clase.Usuario"%>
<%@page import="BBDD.BitacorasFichero"%>
<%@page import="java.util.LinkedList"%>
<%@page import="BBDD.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //para ver reservar Aula
    if((request.getParameter("verReservaAula")!=null)){
        //TODO fecha pasada y con letra y no coincide el dia
        String f = request.getParameter("fechaDia");
        session.setAttribute("fecD", f);
        int n = Integer.parseInt(request.getParameter("eligeAula"));
        session.setAttribute("Aula",n);
        ConexionEstatica.nueva();
        LinkedList lF = ConexionEstatica.obtenerFranjaAulaDeterminada(f, n);
        session.setAttribute("lF", lF);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../vista/gestion/reservarAula.jsp");
    }
    //reservar Aula
    if(request.getParameter("reservadoAula")!=null){
        String f = (String) session.getAttribute("fecD");
        int n = (Integer) session.getAttribute("Aula");
        String ini = request.getParameter("iniHora");
        String fin = request.getParameter("finHora");
        String usu = (String) session.getAttribute("usu");//usuario de la sesion
        String re = request.getParameter("reservadoAula");
        int nu = Integer.parseInt(request.getParameter("clave"));
        String usuR = request.getParameter("usuReservar");//usuario de tabla 
        if(re.equals("LIBRE")){
            ConexionEstatica.nueva();
            re="OCUPADO";
            ConexionEstatica.Modificar_Dato_Reservado_CodProfesor(usu ,re, nu, n, f);
            LinkedList lF = ConexionEstatica.obtenerFranjaAulaDeterminada(f, n);
            session.setAttribute("lF", lF);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/reservarAula.jsp");
        }else if(re.equals("OCUPADO") && usuR.equals(usu)){
            ConexionEstatica.nueva();
            re = "LIBRE";
            ConexionEstatica.Modificar_Dato_Reservado_CodProfesor(null, re, nu, n, f);
            LinkedList lF = ConexionEstatica.obtenerFranjaAulaDeterminada(f, n);
            session.setAttribute("lF", lF);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/reservarAula.jsp");
        }
    }
    //boton de gestion usuario
    if(request.getParameter("botUsuario")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botUsuario").equals("X")){
            String usu = request.getParameter("correo");
            Usuario u = ConexionEstatica.existeUsu(usu);
            ConexionEstatica.Borrar_Dato_Usuario(u);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarUsuario.jsp");
        }
        if(request.getParameter("botUsuario").equals("Editar")){
            String u = request.getParameter("correo");
            String nom = request.getParameter("nombre");
            String ape = request.getParameter("apellido");
            int rol = Integer.parseInt(request.getParameter("rol"));
            int edad = Integer.parseInt(request.getParameter("edad"));
            ConexionEstatica.Modificar_Nombre_Apellido_Edad(u, nom, ape, edad);
            ConexionEstatica.Modificar_Dato_IdAsignarRol(u,rol);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarUsuario.jsp");
        }
    }
    //boton de gestion franja
    if(request.getParameter("botFranja")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botFranja").equals("Editar")){
            int u = Integer.parseInt(request.getParameter("franja"));
            int nF = Integer.parseInt(request.getParameter("nFranja"));
            String ini = request.getParameter("iniHora");
            String fin = request.getParameter("finHora");
            ConexionEstatica.Modificar_Dato_Franja_IniHora_FinHora(u, nF, ini, fin);
            LinkedList lFt = ConexionEstatica.obtenerFranjaDeterminada();
            session.setAttribute("lFt", lFt);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarFranja.jsp");
        }
    }
    //boton de gestion aula
    if(request.getParameter("botAula")!=null){
        ConexionEstatica.nueva();
        if(request.getParameter("botAula").equals("Editar")){
            int u = Integer.parseInt(request.getParameter("aula"));
            int aula = Integer.parseInt(request.getParameter("codAula"));
            String des = request.getParameter("descripcionAula");
            ConexionEstatica.Modificar_Dato_CodAula_DescripcionAula(u,aula,des);
            LinkedList lA = ConexionEstatica.obtenerAulas();
            session.setAttribute("lA", lA);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarAula.jsp");
        }
        if(request.getParameter("botAula").equals("X")){
            int u = Integer.parseInt(request.getParameter("aula"));
            ConexionEstatica.Borrar_Dato_Aula(u);
            LinkedList lA = ConexionEstatica.obtenerAulas();
            session.setAttribute("lA", lA);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../vista/gestion/gestionarAula.jsp");
        }
    }
%>
