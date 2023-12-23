<%-- 
    Document   : verOradores
    Created on : 22 dic 2023, 11:20:03
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Orador"%>
<%@page import="dao.OradoresDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Registro de Oradores</title>
    </head>
    <body>
        <div class="container mt-5">
            <h2>Lista de Oradores</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Tema</th>
                        <th>Fecha Alta</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        
                        //Creamos una instancia de OradoresDAO para acceder a la base de datos
                        OradoresDAO oradoresDAO = new OradoresDAO();
                        
                        //Obtenemos la lista de los oradores desde la base de datos
                        List<Orador> oradores = oradoresDAO.obtenerTodos();
                        
                        if(oradores != null && !oradores.isEmpty()){
                            //Iteramos sobre la lista de oradores y mostramos sus datos en la tabla
                            for(Orador orador: oradores){
                    
                    %>
                    <tr>
                        <td><%= orador.getIdOrador() %></td>
                        <td><%= orador.getNombre() %></td>
                        <td><%= orador.getApellido() %></td>
                        <td><%= orador.getTema() %></td>
                        <td><%= orador.getFechaAlta() %></td>
                    </tr>
                    
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5">No hay oradores registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
                <!-- Botón para volver al índice -->
                <a href="../" class="btn btn-succes">Volver</a>
        </div>
    </body>
</html>
