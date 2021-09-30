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
	<div id="prueba" class="container">
		<div class="container-fluid" id="user">
			<form method="get" action="./DemoServlet">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="Titulos">Usuarios</h1>
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
							<label for="exampleInputPassword1" class="form-label texto">Contraseņa</label>
							<input type="password" class="form-control" name="password"
								id="exampleInputPassword1">
						</div>
					</div>

					<div class="row" id="botonesusuario">
						<div class="col-lg-3 d-grid gap-2">
							<button type="submit" class="btn1 btn btn-primary"
								name="consultar">Consultar</button>
						</div>
						<div class="col-lg-3 d-grid gap-2">
							<button type="submit" class=" btn1 btn btn-primary"
								value="guardar" name="guardar">Crear</button>
						</div>
						<div class="col-lg-3 d-grid gap-2">
							<button type="submit" class="btn1 btn btn-primary">Actualizar</button>
						</div>
						<div class="col-lg-3 d-grid gap-2">
							<button type="submit" class="btn1 btn btn-primary">Borrar</button>
						</div>
					</div>
				</div>
			</form>
		</div>
</body>
</html>