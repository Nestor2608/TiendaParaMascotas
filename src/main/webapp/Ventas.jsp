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
	<!--  <div id="prueba" class="container">
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
-->

<div class="row">
		<div class="col-md-5 seccion1">
			<form method="get" action="Controlador">
				<div class="card">
					<div class="card-body">
						<div class="form-group">
							<label> Datos Clientes</label>
						</div>
						<input type="hidden" name="menu" value="ventas"> <input
							type="hidden" name="UsuarioActivo" value="">
						<div class="form-group d-flex">
							<div class="col-sm-6 d-flex">
								<input type="number" name="cedulacliente" class="form-control"
									placeholder="cedula cliente" value=""> <input
									type="submit" name="accion" value="BuscarCliente"
									class="btn btn-outline-info">
							</div>
							<div class="col-sm-6">
								<input type="text" name="nombrecliente" class="form-control"
									placeholder="Nombre Cliente" value="">
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="form-group">
							<label> Datos Productos </label>
						</div>
						<div class="form-group d-flex">
							<div class="col-sm-6 d-flex">
								<input type="number" name="codigoproducto" class="form-control"
									placeholder="cod producto" value=""> <input
									type="submit" name="accion" value="BuscarProducto"
									class="btn btn-outline-info">
							</div>
							<div class="col-sm-6">
								<input type="text" name="nombreproducto" class="form-control"
									placeholder="Nombre producto" value="">
							</div>
						</div>
						<div class="form-group d-flex">
							<div class="col-sm-6 d-flex">
								<input type="text" name="precioproducto" class="form-control"
									placeholder="$  0000.00" value="">

							</div>
							<div class="col-sm-3">
								<input type="text" name="cantidadproducto" class="form-control"
									placeholder="Cantidad" value="">
							</div>
							<div class="col-sm-3">
								<input type="text" name="ivaproducto" class="form-control"
									placeholder="Valor Iva" value="">
							</div>
						</div>
						<div class="form-group d-flex">
							<input type="submit" name="accion" value="AgregarProducto"
								class="btn btn-outline-primary">
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-7 seccion2">
			<div class="card">
				<div class="card-header">
					<div class="form-group row">
						<label class="col-sm-3 col form label"> Numero Factura </label>
						<input type="text" name="numerofactura" class="form-control col-md-4" value="">
			    </div>
			</div>
	<div class="card-body"> 
	<table class="table"> 
		<thead class="thead-dark">
			<tr>
			<th>#</th>
			<th>Código</th>
			<th>Producto</th>
			<th>Precio</th>
			<th>Cantidad</th>
			<th>IVA</th>
			<th>Total</th>
			</tr>
		
		</thead>
		<tbody>
		    <tr>
		    <th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			</tr>
		</tbody>
	</table>	
	</div>
	</div>
	<div class="card-footer d-flex">
		<div class="col-mod-4">
			<label>Subtotal</label></br> </br>
			<label>IVA</label></br> </br>
			<label>Total a Cancelar</label></br>		
		</div>
		 <div class="col-mod-4">
				<input type= "text" name="txtSubtotal" class="form-control" placeholder="$000.000" disabled="disabled" value="">
		 		<input type= "text" name="txttotalIVA" class="form-control" placeholder="$000.000" disabled="disabled" value="">
		 		<input type= "text" name="SubtotalaCancelar" class="form-control" placeholder="$000.000" disabled="disabled" value="">
	</div>
	</div>
	<div class="card-footer d-flex">
		<div class="col-mod-8">
			<a class="btn btn-success" onclick="print()" href="Controlador?menu=ventas&accion=GenerarVenta">Generar Venta</a>
			<a class="btn btn-danger"  href="Controlador?menu=ventas&accion=GenerarVenta">Nueva Venta</a>
		</div>
	</div>			
</body>
</html>