<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Tienda Online Productos tienda de mascota</title>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="Titulos">Reportes</h1>
			</div>
			<div class="col-lg-4 centrar">
				<img src="./imagenes/reportes.png" width="90%">
			</div>
			<div class="col-lg-8 centrar">
				<div class="col-lg-12 d-grid gap-2 padding_button_bt" >
					<button type="submit" class="btn1 btn btn-primary" value="ListarUsuarios" >
					<a href="./ReporteUsuarios.jsp">Listado de Usuarios</a>
					</button>
				</div>
				<div class="col-lg-12 d-grid gap-2 padding_button_bt ">
					<button type="submit" class="btn1 btn btn-primary" value="ListarClientes">
					<a href="./ReporteClientes.jsp">Listado de Clientes</a></button>
				</div>
				<div class="col-lg-12 d-grid gap-2 padding_button_bt">
					<button type="submit" class="btn1 btn btn-primary" value="VentasClientes">
					<a href="./ReporteVentasCliente.jsp">Ventas por Clientes</a></button>s</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>