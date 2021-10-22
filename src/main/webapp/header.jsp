<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Online Productos tienda de mascota</title>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap"
	rel="stylesheet">

</head>
<body style="padding: 0">
	<!-- Navbar -->
	<div class="row">
		<div class="col-lg-12 sin_padding">
			<div id="prueba3" class="container-mg">
				<h1 id="titulo_tienda">Tienda Online Productos de Mascota</h1>
			</div>
		</div>

		<div class="col-lg-12">
			<nav class="navbar navbar-expand-lg navbar-light bg-light" id="nav">
				<div class="container-fluid">
					<a class="navbar-brand" id="diseño_link">BIENVENIDOS</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">

							<li class="nav-item"><a class="nav-link"
								href="Controlador?menu=Usuarios&accion=listar">Usuarios</a></li>
							<li class="nav-item"><a class="nav-link active"
								aria-current="page"
								href="Controlador?menu=Clientes&accion=listar"
								>Clientes</a></li>
							<li class="nav-item"><a class="nav-link"
								href="Controlador?menu=Proveedores&accion=listar&usuarioActivo=${usuario.getCedula_usuario()}"">Proveedores</a></li>
							<li class="nav-item"><a class="nav-link "
								href="Controlador?menu=Productos&accion=listar&usuarioActivo=${usuario.getCedula_usuario()}">Productos</a></li>
							<li class="nav-item"><a class="nav-link "
								href="Controlador?menu=Ventas&accion=default&usuarioActivo=${usuario.getCedula_usuario()}""
								>Ventas</a></li>
							<li class="nav-item"><a class="nav-link "
								href="./Reportes.jsp">Reportes</a></li>
							<input type="text" name="UsuarioActivo"
								value="${usuario.getCedula_usuario()}" disabled="disabled">
						</ul>
					</div>
					<div class="dropdown">
					<button class="btn btn-outline-danger dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">${usuario.getCedula_usuario()}</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<a class="dropdown-item" href="#"><img
							src="./imagen/login.png" width="40" alt="40"></a> <a
							class="dropdown-item" href="#">${usuario.getUsuario()}</a> <a
							class="dropdown-item" href="#">${usuario.getEmail_usuario()}</a>
						<div class="dropdown-divider"></div>
						<form class="dropdown-item" method="POST" action="#">
							<button class="btn btn-danger center-block" type="submit"
								name="accion" value="Salir">Cerrar Sesion</button>
						</form>

					</div>
				</div>
				</div>
				
			</nav>
		</div>
		
</body>
</html>