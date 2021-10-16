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
<body>
	<div class="row">
		<div class="col-md-5 seccion1">
			<form method="get" action="Controlador">
				<div class="card">
					<div class="card-body">
						<div class="form-group">
							<label> Datos Clientes</label>
						</div>
						<input type="hidden" name="menu" value="Ventas"> 
						<input type="hidden" name="UsuarioActivo" value="${usuarioSeleccionado.getCedula_usuario()}" >
						<div class="form-group d-flex">
							<div class="col-sm-6 d-flex">
								<input type="number" name="cedula_cliente" class="form-control"
									placeholder="cedula cliente" value="${clienteSeleccionado.getCedula_cliente()}"> 
								<input type="submit" name="accion" value="BuscarCliente"
									class="btn btn-outline-info">
							</div>
							<div class="col-sm-6">
								<input type="text" name="nombrecliente" class="form-control"
									placeholder="Nombre Cliente" value="${clienteSeleccionado.getNombre_cliente()}">
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
									placeholder="codigo producto" value="${productoSeleccionado.getCodigo_producto()}"> 
								<input type="submit" name="accion" value="BuscarProducto"
									class="btn btn-outline-info">
							</div>
							<div class="col-sm-6">
								<input type="text" name="nombreproducto" class="form-control"
									placeholder="Nombre producto" value="${productoSeleccionado.getNombre_producto()}">
							</div>
						</div>
						<div class="form-group d-flex">
							<div class="col-sm-6 d-flex">
								<input type="text" name="precioproducto" class="form-control"
									placeholder="$  0000.00" value="${productoSeleccionado.getPrecio_venta()}">

							</div>
							<div class="col-sm-3">
								<input type="number" name="cantidadproducto" class="form-control"
									placeholder="Cantidad" value="">
							</div>
							<div class="col-sm-3">
								<input type="text" name="ivaproducto" class="form-control"
									placeholder="Valor Iva" value="${productoSeleccionado.getIva_compra()}">
							</div>
						</div>
						<div class="form-group d-flex">
							<input type="submit" name="accion" value="AgregarProducto"
								class="btn btn-outline-dark">
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<div class="col-md-7 seccion2">
			<div class="card">
				<div class="card-header">
					<div class="form-group row">
					<label class="col-sm-3 col-form-label">Numero Factura</label>
					<input class="form-control col-md-4" type="text" name="numerofactura" value="${numerofactura}">			
					</div>				
				</div>
				<div class="card-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>codigo</th>
								<th>producto</th>
								<th>precio</th>
								<th>cantidad</th>
								<th>iva</th>
								<th>total</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="lista" items="${listaventas}">
							<tr>
								<th>${lista.getCodigo_detalle_venta()}</th>
								<th>${lista.getCodigo_producto()}</th>
								<!-- <th>${lista.getDescripcion_producto()}</th> -->
								<!-- <th>${lista.getPrecio_producto()}</th> -->
								<!-- <th>${lista.getCantidad_producto()}</th> -->
								<th>${lista.getValoriva()}</th>
								<th>${lista.getValor_venta()}</th>
							</tr>
						</c:forEach>
						</tbody>
					</table>				
				</div>
				<div class="card-footer d-flex">
					<div class="col-md-4">
						<label>Subtotal</label></br> </br>
						<label>iva</label></br> </br>
						<label>total a pagar</label></br> </br>
					</div>
					<div class="col-md-4">
						<input type="text" name="txtsubtotal" class="form-control" placeholder="$ 00.000.00" disabled="disabled" value="${totalsubtotal}">
						<input type="text" name="txttotaliva" class="form-control" placeholder="$ 00.000.00" disabled="disabled" value="${totaliva}">
						<input type="text" name="txttotalapagar" class="form-control" placeholder="$ 00.000.00" disabled="disabled" value="${totalapagar}">
					</div>									
				</div>							
			</div>	
			
			<div class="card-footer" d-flex>
				<div class="col-md-8">
				 <!-- enviamos los tres valores al controlador --> 
					<a class="btn btn-success" onclick="print()" href="Controlador?menu=Ventas&accion=GenerarVenta&cedulacliente=${clienteSeleccionado.getCedula_cliente()}&UsuarioActivo=${usuarioSeleccionado.getCedula_usuario()}&numerofactura=${numerofactura}">Generar Venta</a>
					<a class="btn btn-danger" href="Controlador?menu=Ventas&accion=NuevaVenta">Nueva Venta</a>
				</div>
			</div>				
		</div>
		
		
		
		
		
	</div>
</body>
</html>