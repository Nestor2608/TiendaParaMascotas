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
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="Titulos">Reporte Clientes</h1>
			</div></div>
			<div class="col-lg-12">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">listado de Usuarios</th>
							<th scope="col">Nombre</th>
							<th scope="col">Correo Electrónico</th>
							<th scope="col">Usuario</th>
							<th scope="col">Password</th>
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
								
							</tr>
							<%
							}
							%>
						</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>