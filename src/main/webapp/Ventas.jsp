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
		<div class="row">
			<div class="col-lg-12">
				<h1 class="Titulos">Ventas</h1>
			</div>
			<div class="col-lg-4">
				<img src="./imagenes/ventas.png" width="90%">
			</div>
			<div class="col-lg-8">
				<div class="row centrar_row">
					<div class="col-lg-6">
						<label for="Cedula" class="form-label texto">Cédula</label> <input
							type="number" class="form-control" id="exampleInputUsuario"
							aria-describedby="Cedula" name="cedula" style="margin-bottom: 20px">
							<button type="submit" class="btn1 btn btn-primary"
								value="Consultar">Consultar</button>
					</div>


					<div class="col-lg-6">
						<label for="Cedula" class="form-label texto">Cliente</label> <input
							type="number" class="form-control" id="exampleInputUsuario"
							aria-describedby="Cedula" name="cliente"><label
							for="Cedula" class="form-label texto">Consecutivo</label> <input
							type="number" class="form-control" id="exampleInputUsuario"
							aria-describedby="Cedula" name="consecutivo">
					</div>
					<div class="col-lg-12">
						<table class="table table_marginh">
							<thead>
								<tr>
									<th scope="col">Cod.Producto</th>
									<th scope="col"></th>
									<th scope="col">Nombre Producto</th>
									<th scope="col">Cant</th>
									<th scope="col">Vlr. Total</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row"><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="codigo_producto1"></th>
									<td><button type="submit" class="btn1 btn btn-primary"
											value="Consultar">Consultar</button></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="nombre_producto1"></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="cantidad1"></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="valor_total1"></td>
								</tr>
								<tr>
									<th scope="row"><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="codigo_producto2"></th>
									<td><button type="submit" class="btn1 btn btn-primary"
											value="Consultar">Consultar</button></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="nombre_producto2"></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="cantidad2"></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="valor_total2"></td>

								</tr>
								<tr>
									<th scope="row"><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="codigo_producto3"></th>
									<td><button type="submit" class="btn1 btn btn-primary"
											value="Consultar">Consultar</button></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="nombre_producto3"></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="cantidad3"></td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="valor_total3"></td>
								</tr>

								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td>Valor Venta</td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="valor_venta"></td>
									</td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td>Valor IVA</td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="valor_iva"></td>
									</td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td></td>
									<td><button type="submit" class="btn1 btn btn-primary"
											value="consfirmar">Confirmar</button></td>
									<td>Valor con IVA</td>
									<td><input type="number" class="form-control"
										id="exampleInputUsuario" aria-describedby="Cedula"
										name="valor_con_iva"></td>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>