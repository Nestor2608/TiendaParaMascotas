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
	<div class="container">
		<div class="row">
				<h1 class="Titulos">
					reporte Lista de Usuarios
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