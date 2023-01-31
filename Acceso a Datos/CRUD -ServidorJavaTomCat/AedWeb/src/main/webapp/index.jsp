    
<%@page import="datos.Sesion"%>
<%@page session="true" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        -->
        <link href="css/css.css" rel="stylesheet" contentType="text/css" >

    </head>


    <body>
        <%
            String control = "";
            control = request.getParameter("accion");
            if (control != null && control.equals("naita")) {
                Sesion sesion = new Sesion();
                String name = request.getParameter("name");
                String pass = request.getParameter("pass");
                boolean isAdmin = sesion.connect(name, pass);
                session.setAttribute("miSesion", isAdmin);

                if (session.getAttribute("miSesion") != null && (boolean) session.getAttribute("miSesion")) {
                    response.sendRedirect(getServletContext().getContextPath() + "/principal.jsp");
                }
            }
        %>
<!--
        <form action="index.jsp" method="POST" >
            <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label">Usuario</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="name" >
                </div>         
            </div>
            <div class="form-group row">
                <label for="pass" class="col-sm-2 col-form-label">Contraseña</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" name="pass">
                </div>
            </div>


            <input name="accion" type="hidden" value="naita"></input>

            <button type="submit" class="btn btn-primary">Log in</button>
        </form>

-->
        <div class="form-body">
            <div class="row">
                <div class="form-holder">
                    <div class="form-content">
                        <div class="form-items">
                            <h2>IES El Rincon - Log In </h2>
                            <form action="index.jsp" method="POST" class="requires-validation" novalidate >

                                <div class="col-md-12   ">
                                    <input class="form-control" type="text" name="name" placeholder="Usuario" required>                               
                                </div>

                                <div class="col-md-5">
                                    <input class="form-control" type="password" name="pass" placeholder="Contraseña" required>
                                </div>

                                <input name="accion" type="hidden" value="naita"></input>
                                
                                <div class="form-button mt-3">
                                    <button id="submit" type="submit" class="btn button-37">Log in</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>