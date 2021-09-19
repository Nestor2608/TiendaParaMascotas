<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
<title>Usuarios - Tienda Online Productos tienda de mascota</title>

<div id="prueba3" class="container-mg">
	<div class="row" >
		<div class="col-8"><h1>Tienda Online Productos de Mascota </h1><br> </div>
		<div class="col-4"><div align="right"><img src="../imagenes/carrito.png" width="50"></div></div>
		
		<div class="col-4"></div>
	</div>
		
</div>	 
	
	

</head>
<body>
	<!-- Bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>	

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">MENU DE LA TIENDA </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Usuarios</a>
        </li>
        <li class="nav-item"><a class="nav-link" href="./Clientes.jsp">Clientes</a>
        </li>
        <li class="nav-item"><a class="nav-link" href="./Proveedores.jsp">Proveedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#">Productos</a>
        </li>
         <li class="nav-item">
          <a class="nav-link " href="#">Ventas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#">Reportes</a>
        </li>
      </ul>
    </div>
  </div>
</nav>	
	
	<div id="prueba">
	<div class="container-fluid" id="user">
			<div class="row">
				<div class="col-6">
					<form id="prueba2">
						<div class="mb-4">
							<div class="row">
								<div class="col-6">
									<label for="Cedula" class="form-label">Cedula</label> 
									<input type="text" class="form-control" id="exampleInputUsuario" aria-describedby="Cedula">
								</div>

								<div class="col-2"></div>
							</div>


						</div>
						<div class="mb-3">

							<label for="nombrecompleto" class="form-label">Nombre Completo</label> 
							<input type="text" class="form-control" id="nombrecompleto">
						</div>

						<div class="mb-3">
							<label for="correo" class="form-label">Correo Electronico</label>
							<input type="text" class="form-control" id="correo">
						</div>

						<div class="col-3"></div>
					</form>

				</div>
				<div class="col-6">
					<form id="prueba2">
						<div class="mb-4">
							<label for="exampleInputUsuario1" class="form-label">Usuario</label>
							<input type="text" class="form-control" id="exampleInputUsuario1"
								aria-describedby="Usuario">
						</div>

						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Contraseña</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1">
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