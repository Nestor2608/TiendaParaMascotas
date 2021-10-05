<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Tienda Online Productos tienda de mascota</title>
<%@page import="servlet.Clientes"%>
<%@page import="java.util.ArrayList"%>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="prueba" class="container">
		<div class="container-fluid" id="user">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="Titulos">Clientes</h1>
				</div>
				<div class="col-lg-4 centrar">
					<img src="./imagenes/Bookshop-bro.png" width="90%">
				</div>
				<div class="col-lg-8 centrar">
					<form class="form-sign" method="get" action="Controlador">
						<div class="form-group">
							<input type="hidden" name="menu" value="Clientes"> <label
								class="texto">Cedula</label> <input type="number"
								name="cedula_cliente" class="form-control" required
								value="${clienteSeleccionado.getCedula_cliente()}">
						</div>
						<div class="form-group">
							<label class="texto">Nombre Completo</label> <input type="text"
								name="nombre_cliente" class="form-control" required
								value="${clienteSeleccionado.getNombre_cliente()}">
						</div>
						<div class="form-group">
							<label class="texto">Dirección</label> <input type="text"
								name="direccion_cliente" class="form-control" required
								value="${clienteSeleccionado.getDireccion_cliente()}">
						</div>
						<div class="form-group">
							<label class="texto">Teléfono</label> <input type="number"
								name="telefono_cliente" class="form-control" required
								value="${clienteSeleccionado.getTelefono_cliente()}">
						</div>
						<div class="form-group">
							<label class="texto">Email</label> <input type="email"
								name="email_cliente" class="form-control" required
								value="${clienteSeleccionado.getEmail_cliente()}">
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
		</div>
		<div class="row">
			<h2 class="Titulos">
				Todos los Clientes
				</h2>
				<div class="col-md-12 col-lg-12">
					<table class="table tabla">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Cedula</th>
								<th scope="col">Dirección</th>
								<th scope="col">Email</th>
								<th scope="col">Nombre</th>
								<th scope="col">Teléfono</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody>
							<%
							ArrayList<Clientes> lista = (ArrayList<Clientes>) request.getAttribute("lista");
							for (Clientes cl : lista) {
							%>
							<tr>
								<td><%=cl.getCedula_cliente()%></td>
								<td><%=cl.getDireccion_cliente()%></td>
								<td><%=cl.getEmail_cliente()%></td>
								<td><%=cl.getNombre_cliente()%></td>
								<td><%=cl.getTelefono_cliente()%></td>
								<td><a class="btn btn-warning boton"
									href="Controlador?menu=Clientes&accion=Cargar&id=<%=cl.getCedula_cliente()%>">Editar</a>
									<a class="btn btn-danger boton"
									href="Controlador?menu=Clientes&accion=Eliminar&id=<%=cl.getCedula_cliente()%>">Eliminar</a>
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