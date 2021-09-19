<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous" />
<title>Tienda Online Productos tienda de mascota</title>


</head>
<body>

	<%@ include file="header.jsp"%>
	<div id="prueba" class="container">
		<div class="container-fluid" id="user">
			<div class="row">
				<div class="col-6">
					<form id="prueba2">
						<div class="mb-4">
							<div class="row">
								<div class="col-6">
									<label for="Cedula" class="form-label">Cedula</label> <input
										type="text" class="form-control" id="exampleInputUsuario"
										aria-describedby="Cedula">
								</div>

								<div class="col-2"></div>
							</div>


						</div>
						<div class="mb-3">

							<label for="nombrecompleto" class="form-label">Nombre
								Completo</label> <input type="text" class="form-control"
								id="nombrecompleto">
						</div>

						<div class="mb-3">
							<label for="direccion" class="form-label">Dirección</label> <input
								type="text" class="form-control" id="direccion">
						</div>

						<div class="col-3"></div>
					</form>

				</div>
				<div class="col-6">
					<form id="prueba2">
						<div class="mb-4">
							<label for="telefono" class="form-label">Telefono</label> <input
								type="text" class="form-control" id="telefono"
								aria-describedby="telefono">
						</div>

						<div class="mb-3">
							<label for="correo" class="form-label">Correo Electrónico</label>
							<input type="text" class="form-control" id="correo">
						</div>

						<div class="col-3"></div>
					</form>
				</div>

				<div class="row" id="botonesusuario">
					<div class="col-3">

						<button type="submit" class="btn1">Consultar</button>
					</div>
					<div class="col-3">
						<button type="submit" class="btn1">Crear</button>
					</div>
					<div class="col-3">
						<button type="submit" class="btn1">Actualizar</button>
					</div>
					<div class="col-3">
						<button type="submit" class="btn1">Borrar</button>

					</div>
				</div>
			</div>
		</div>
</body>
</html>