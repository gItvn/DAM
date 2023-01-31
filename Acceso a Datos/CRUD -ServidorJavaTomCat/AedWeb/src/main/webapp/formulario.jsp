<%--
    Document   : formulario
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Formulario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            body {
                background-image: url('/')
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <%
                        String accion = request.getParameter("accion");

                        String id = "";
                        String nombre = "";
                        String apellidos = "";
                        String edad = "";
                        String direccion = "";
                        String curso = "";
                        String datosFamilia = "";
                        String nota = "";

                        if (accion.equals("editar")) {
                            id = request.getParameter("id");
                            nombre = request.getParameter("nombre");
                            apellidos = request.getParameter("apellidos");
                            edad = request.getParameter("edad");
                            direccion = request.getParameter("direccion");
                            curso = request.getParameter("curso");
                            datosFamilia = request.getParameter("datosFamilia");
                            nota = request.getParameter("nota");

                        }
                    %>    



                    <h2 class="text-center">
                        <%if (accion.equals("insertar")) {%>
                        Insertar
                        <%} else {%>
                        Editar
                        <%}%>
                        Alumno
                    </h2>

                    <form action="principal.jsp" method="GET">
                        <%
                            if (accion.equals("editar")) {
                        %>    
                        <input type="hidden" name="id" value="<%=id%>">
                        <%
                            }
                        %>

                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del alumno</label>
                            <input type="text" name="nombre" class="form-control" value="<%=nombre%>">
                        </div>
                        <div class="mb-3">
                            <label for="apellidos" class="form-label">Apellidos del alumno</label>
                            <input type="text" name="apellidos" class="form-control" value="<%=apellidos%>">
                        </div>
                        <div class="mb-3">
                            <label for="edad" class="form-label">Edad del alumno</label>
                            <input type="text" name="edad" class="form-control" value="<%=edad%>">
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Direccion del alumno</label>
                            <input type="text" name="direccion" class="form-control" value="<%=direccion%>">
                        </div>
                        <div class="mb-3">
                            <label for="curso" class="form-label">Curso del alumno</label>
                            <input type="text" name="curso" class="form-control" value="<%=curso%>">
                        </div>
                        <div class="mb-3">
                            <label for="datosFamilia" class="form-label">Datos de la Familia </label>
                            <input type="text" name="datosFamilia" class="form-control" value="<%=datosFamilia%>">
                        </div>

                        <!--   Funciona con input, no se inicializa con select
                        <div class="mb-3">
                            <label for="nota" class="form-label">NotaFinal</label>
                            <input type="text" name="nota" class="form-control" value="<%=nota%>">
                        </div>

                        -->


                        <div class="mb-3">
                            <label for="nota" class="form-label">Nota Final</label>
                            <select class="form-select" aria-label="Default select example" name="nota" type="text" >
                                <option selected><%=nota%></option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select>
                        </div>



                        <input type="hidden" name="accion" value=
                               <%if (accion.equals("insertar")) {%>
                               "insertar"
                               <%} else {%>
                               "editar"
                               <%}%>    
                               >

                        <div class="d-grid gap-2">
                            <%if (accion.equals("insertar")) {%>
                            <input type="submit" value="Insertar" class="btn btn-primary">
                            <%} else {%>
                            <input type="submit" value="Editar" class="btn btn-warning">
                            <%}%>
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>

