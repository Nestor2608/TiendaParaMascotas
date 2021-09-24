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
<title>Tienda de Mascotas</title>

</head>
<body>
	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

	<div id="" class="container-mg">
		<h1 style="font-weight: bold; padding: 0px">Bienvenidos a la Tienda de Mascotas</h1>
		<br>
	</div>
	<div class="container-fluid" id="user">
		<div class="row">
			<div class="col-lg-6">
				<div align="center">
					<img src="../imagenes/bienvenidos.png" width="90%">
				</div>
				<br>
			</div>
			<div class="col-lg-6 centrar">
				<form method="get" action="./DemoServlet">
					<div class="mb-4">
						<h3>
							<label for="exampleInputUsuario" class="form-label">Usuario</label>
						</h3>
						<input type="text" class="form-control" id="name" name="usuario"
							aria-describedby="Usuario">
					</div>

					<div class="mb-3">
						<h3>
							<label for="exampleInputPassword1" class="form-label" name="password">Contraseña</label>
						</h3>
						<input type="password" class="form-control"
							id="exampleInputPassword1">
					</div>

					<div class="row">
						<div class="col-lg-6">
							<button type="submit" class="btn1">
								<h4>Aceptar</h4>
							</button>
						</div>
						<div class="col-lg-6">
							<button type="submit" class="btn1">
								<h4>Cancelar</h4>
							</button>
						</div>
					</div>

					<div class="col-3"></div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>