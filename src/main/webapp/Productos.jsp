<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Online Productos tienda de mascota</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="prueba" class="container">
		<div class="container-fluid" id="user">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="Titulos">productos</h1>
				</div>

				<div class="col-lg-4 centrar">
					<img src="./imagenes/productos.png" width="90%">
				</div>
				<div class="col-lg-8 centrar">
					<form>
						<div class="mb-4">
							<div class="row">
								<div class="col-lg-12">
									 <label
										for="formFile texto" class="form-label texto">Nombre del archivo
										</label> <input class="form-control" type="file" id="archivo">
								</div>
							</div>
						</div>
					</form>

				</div>
				<div class="row" id="botonesusuario" style="justify-content: center;">
					<div class="col-lg-6  d-grid gap-2" >
						<button type="submit" class="btn1 btn btn-primary">Cargar</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>