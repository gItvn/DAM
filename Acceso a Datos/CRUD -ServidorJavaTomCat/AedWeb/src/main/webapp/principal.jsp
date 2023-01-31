    
<%@page import="datos.Alumno"%>
<%@page import="datos.GestionAlumnos"%>
<%@page import="java.util.*"%>
<%@page session="true" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alumnos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <%

        if (session.getAttribute("miSesion") != null && (boolean) session.getAttribute("miSesion") != true) {
            response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
        }

        GestionAlumnos ga = new GestionAlumnos();

        String accion = request.getParameter("accion");
        if (accion != null && accion.equals("insertar")) {
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String direccion = request.getParameter("direccion");
            int curso = Integer.parseInt(request.getParameter("curso"));
            String datosFamilia = request.getParameter("datosFamilia");

            int nota = Integer.parseInt(request.getParameter("nota"));

            Alumno alumno = new Alumno(nombre, apellidos, edad, direccion, curso, datosFamilia, nota);

            if (ga.insertarAlumno(alumno)) {%>
    <div class="alert alert-success alert-dismissible fade show" role="alert" class="close">
        Usuario añadido!
        <button type="button" class="btn-close" data-bs-dismiss="alert"/>
    </div>

    <%} else {%>
    <div class="alert alert-danger alert-dismissible fade show" role="alert" class="close">
        Algo fue mal
        <button type="button" class="btn-close" data-bs-dismiss="alert"/>
    </div>
    <%}
    } else {
        if (accion != null && accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (ga.eliminarAlumno(id)) {%>
    <div class="alert alert-success alert-dismissible fade show " role="alert" class="close">
        Usuario Eliminado :(
        <button type="button" class="btn-close" data-bs-dismiss="alert"/>
    </div>
    <%}
    } else {
        if (accion != null && accion.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String direccion = request.getParameter("direccion");
            int curso = Integer.parseInt(request.getParameter("curso"));
            String datosFamilia = request.getParameter("datosFamilia");

            int nota = Integer.parseInt(request.getParameter("nota"));
            Alumno alumno = new Alumno(nombre, apellidos, edad, direccion, curso, datosFamilia, nota);

            if (ga.modificarAlumno(id, alumno)) {%>
    <div class="alert alert-success alert-dismissible fade show" role="alert" class="close">
        Usuario modificado
        <button type="button" class="btn-close" data-bs-dismiss="alert"/>
    </div>
    <%}
                }
            }
        }

        ArrayList<Alumno> alumnos = ga.obtenerAlumnos();
    %>



    <body>
        <div class="container">

            <div class="row">
                <div class="col-11">
                    <h1 class="text-center">Gestion de alumnos - IES El Rincón</h1>
                </div>
                <form action="logOut.jsp" method="POST">
                    <div class="col-1">
                        <button class="btn btn-success"><strong>Log Out</strong></button>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table table-striped">
                        <thead>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Edad</th>
                        <th>Direccion</th>
                        <th>Curso</th>
                        <th>Datos familia</th>
                        <th>Nota Final</th>
                        <th></th>
                        <th></th>
                        </thead>
                        <tbody>
                            <%
                                for (Alumno cada : alumnos) {
                            %>
                            <tr>
                                <td><%=cada.getId()%></td>
                                <td><%=cada.getNombre()%></td>
                                <td><%=cada.getApellidos()%></td>
                                <td><%=cada.getEdad()%></td>
                                <td><%=cada.getDireccion()%></td>
                                <td><%=cada.getCurso()%></td>
                                <td><%=cada.getDatosFamilia()%></td>
                                <%
                                    String notaString="";
                                    int aux = cada.getNota();

                                    if (aux >= 0 && aux < 5) {
                                        notaString = "Suspendido";
                                    }
                                    if (aux >= 5 && aux < 8) {
                                        notaString = "Aprobado";
                                    }
                                    if (aux >= 8 && aux < 10) {
                                        notaString = "Notable";
                                    }
                                    if (aux == 10) {
                                        notaString = "Sobresaliente";
                                    }
                                %>

                                <td><%=notaString%></td>
                                <td>
                                    <form action="formulario.jsp" method="POST">

                                        <!-- Datos de usuario -->
                                        <input type="hidden" name="id" value="<%=cada.getId()%>">
                                        <input type="hidden" name="nombre" value="<%=cada.getNombre()%>">
                                        <input type="hidden" name="apellidos" value="<%=cada.getApellidos()%>">
                                        <input type="hidden" name="edad" value="<%=cada.getEdad()%>">
                                        <input type="hidden" name="direccion" value="<%=cada.getDireccion()%>">
                                        <input type="hidden" name="curso" value="<%=cada.getCurso()%>">
                                        <input type="hidden" name="datosFamilia" value="<%=cada.getDatosFamilia()%>">
                                        <input type="hidden" name="nota" value="<%=cada.getNota()%>">

                                        <!-- Acción -->
                                        <input type="hidden" name="accion" value="editar">

                                        <input type="submit" value="Editar" class="btn btn-warning">
                                    </form>
                                </td>
                                <td>
                                    <form action="principal.jsp" method="POST">
                                        <input type="hidden" name="id" value=<%=cada.getId()%>>
                                        <input type="hidden" name="accion" value="eliminar">
                                        <input type="submit" value="Eliminar" class="btn btn-danger">
                                    </form>
                                </td>
                                <td></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <form action="formulario.jsp" method="POST">
                        <div class="d-grid gap-2">
                            <input type="hidden" name="accion" value="insertar">    
                            <input type="submit" value="Insertar alumno" class="btn btn-success">
                            </form>
                        </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>