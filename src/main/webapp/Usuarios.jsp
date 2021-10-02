<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Tienda Online Productos tienda de mascota</title>
<%@page import="servlet.Usuarios"%>
<%@page import="java.util.ArrayList"%>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="prueba" class="container">
		<div id="user" class="row">
			<div class="col-lg-5 col-md-12 centrar">
				<img src="./imagenes/users.png" width="90%">
			</div>
			<div class="col-md-12 col-lg-7">
				<div class="col-lg-12">
					<h1 class="Titulos">Usuarios</h1>
					<input type="hidden" name="menu" value="Usuarios">
				</div>
				<div>
					<form class="form-sign" method="get" action="Controlador">
						<div class="form-group">
							<input type="hidden" name="menu" value="Usuarios"> <label
								class="texto">Cedula</label> <input type="number"
								name="cedula_usuario" class="form-control" required
								value="${usuarioSeleccionado.getCedula_usuario()}">
						</div>
						<div class="form-group">
							<label class="texto">Nombre</label> <input type="text"
								name="nombre_usuario" class="form-control" required
								value="${usuarioSeleccionado.getNombre_usuario()}">
						</div>
						<div class="form-group">
							<label class="texto">Email</label> <input type="text"
								name="email_usuario" class="form-control" required
								value="${usuarioSeleccionado.getEmail_usuario()}">
						</div>
						<div class="form-group">
							<label class="texto">Usuario</label> <input type="text"
								name="usuario" class="form-control" required
								value="${usuarioSeleccionado.getUsuario()}">
						</div>
						<div class="form-group">
							<label class="texto">Password</label> <input type="password"
								name="password" class="form-control" required
								value="${usuarioSeleccionado.getPassword()}">
						</div>
						<div class="row" style="margin-top: 30px">
							<div class="col-lg-6 centrar">
								<input type="submit" class="btn btn-warning" name="accion"
									value="Agregar">
							</div>
							<div class="col-lg-6 centrar">
								<input type="submit" class="btn btn-success" name="accion"
									value="Actualizar"> </input>
							</div>
						</div>
					</form>
					
				</div>
			</div>

			<!-- <form method="get" action="Controlador">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="Titulos">Usuarios</h1>
						<input type="hidden" name="menu" value="Usuarios">
					</div>
					<div class="col-lg-4 centrar">
						<img src="./imagenes/users.png" width="90%">
					</div>

					<div class="col-lg-4 centrar">
						<div class="mb-4">
							<div class="row">
								<div class="col-lg-12">
									<label for="Cedula" class="form-label texto">Cedula</label> <input
										type="number" class="form-control" id="exampleInputUsuario"
										aria-describedby="Cedula" name="cedula_usuario">
								</div>
							</div>
						</div>
						<div class="mb-3">
							<label for="nombrecompleto" class="form-label texto">Nombre
								Completo</label> <input type="text" class="form-control"
								id="nombrecompleto" name="nombre_usuario">
						</div>
						<div class="mb-3">
							<label for="correo" class="form-label texto">Correo
								Electronico</label> <input type="text" class="form-control" id="correo"
								name="email_usuario">
						</div>
					</div>
					<div class="col-lg-4 centrar">
						<div class="mb-4">
							<label for="exampleInputUsuario1" class="form-label texto">Usuario</label>
							<input type="text" class="form-control" id="exampleInputUsuario1"
								aria-describedby="Usuario" name="usuario">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label texto">Contraseña</label>
							<input type="password" class="form-control" name="password"
								id="exampleInputPassword1">
						</div>
					</div>
				</div>
			</form>-->
			<div class="row">
				<h2 class="Titulos">
					Todos los usuarios
					</h1>
					<div class="col-md-12 col-lg-12">
						<table class="table tabla">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Cedula</th>
									<th scope="col">Nombre</th>
									<th scope="col">Email</th>
									<th scope="col">Usuario</th>
									<th scope="col">Password</th>
									<th scope="col">Acciones</th>
								</tr>
							</thead>
							<tbody>
								<%
								ArrayList<Usuarios> lista = (ArrayList<Usuarios>) request.getAttribute("lista");	
								for (Usuarios us : lista) {
								%>
								<tr>
									<td><%=us.getCedula_usuario()%></td>
									<td><%=us.getNombre_usuario()%></td>
									<td><%=us.getEmail_usuario()%></td>
									<td><%=us.getUsuario()%></td>
									<td><%=us.getPassword()%></td>
									<td><a class="btn btn-warning boton"
										href="Controlador?menu=Usuarios&accion=Cargar&id=<%=us.getCedula_usuario()%>">Editar</a>
										<a class="btn btn-danger boton"
										href="Controlador?menu=Usuarios&accion=Eliminar&id=<%=us.getCedula_usuario()%>">Eliminar</a>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>

						</table>
					</div>
			</div>
</body>
</html>
<script>
	
</script>