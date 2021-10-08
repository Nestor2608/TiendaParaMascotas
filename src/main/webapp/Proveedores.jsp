<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Tienda Online Productos tienda de mascota</title>
<%@page import="servlet.Proveedores"%>
<%@page import="java.util.ArrayList"%>
</head>
<body>
	<body>
		<%@ include file="header.jsp"%>
		<div id="prueba" class="container">
			<div class="container-fluid" id="user">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="Titulos">Proveedores</h1>
					</div>
					<div class="col-lg-4 centrar">
						<img src="./imagenes/proveedores.png" width="90%">
					</div>
					<div class="col-lg-8 centrar">
						 <form class="form-sign" method="get" action="Controlador">
						<div class="form-group">
							<input type="hidden" name="menu" value="Proveedores"> <label
								class="texto">NIT</label> <input type="number"
								name="nitproveedor" class="form-control" required
								value="${proveedorSeleccionado.getNitproveedor()}">
						</div>
						<div class="form-group">
							<label class="texto">Nombre</label> <input type="text"
								name="nombre_proveedore" class="form-control" required
								value="${proveedorSeleccionado.getNombre_proveedore()}">
						</div>
						<div class="form-group">
							<label class="texto">Dirección</label> <input type="text"
								name="direccion_proveedor" class="form-control" required
								value="${proveedorSeleccionado.getDireccion_proveedor()}">
						</div>
						<div class="form-group">
							<label class="texto">Teléfono</label> <input type="number"
								name="telefono_proveedore" class="form-control" required
								value="${proveedorSeleccionado.getTelefono_proveedore()}">
						</div>
						<div class="form-group">
							<label class="texto">Ciudad</label> <input type="text"
								name="ciudad_proveedor" class="form-control" required
								value="${proveedorSeleccionado.getCiudad_proveedor()}">
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
				<h2 class="Titulos">Proveedores</h2>
				<div class="col-md-12 col-lg-12">
					<table class="table tabla">
						<thead class="thead-dark">
							<tr>
								<th scope="col">NIT</th>
								<th scope="col">Ciudad</th>
								<th scope="col">Dirección</th>
								<th scope="col">Nombre</th>
								<th scope="col">Teléfono</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody>
							<%
							ArrayList<Proveedores> lista = (ArrayList<Proveedores>) request.getAttribute("lista");
							for (Proveedores proveedor : lista) {
							%>
							<tr>
								<td><%=proveedor.getNitproveedor()%></td>
								<td><%=proveedor.getCiudad_proveedor()%></td>
								<td><%=proveedor.getDireccion_proveedor()%></td>
								<td><%=proveedor.getNombre_proveedore()%></td>
								<td><%=proveedor.getTelefono_proveedore()%></td>
								<td><a class="btn btn-warning boton"
									href="Controlador?menu=Proveedores&accion=Cargar&id=<%=proveedor.getNitproveedor()%>">Editar</a>
									<a class="btn btn-danger boton"
									href="Controlador?menu=Proveedores&accion=Eliminar&id=<%=proveedor.getNitproveedor()%>">Eliminar</a>
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
</body>
