package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// ***********variables generales dentro de la clase contralador
		// *****************
		long subtotal = 0, totalapagar = 0;
		long codProducto = 0, precio = 0, valor_iva = 0, iva = 0, subtotaliva = 0, acusubtotal = 0;
		long numfac = 0;
		int cantidad = 0, item = 0;
		String descripcion, cedulaCliente;
		List<Detalle_Venta> listaVentas = new ArrayList<>();
		Usuarios usuarios = new Usuarios();
		Detalle_Venta detalle_venta = new Detalle_Venta();
	
		public Controlador() {
		super();

	}
		// ***********Metodos locales para buscar clientes y productos *****************
		public void buscarCliente(Long id, HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			try {
				ArrayList<Clientes> listac = ClienteJSON.getJSON();
				for (Clientes clientes : listac) {
					if (clientes.getCedula_cliente() == (id)) {
						request.setAttribute("clienteSeleccionado", clientes);//temporal
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		

		public void buscarFactura(String numFact, HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			if (numFact == null) {
				numfac = Long.parseLong(numFact) + 1; // variable declarada arriba con valor 0
				//
			} else {
				numfac = Long.parseLong(numFact) + 1; // variable declarada arriba con valor 0
			}
			request.setAttribute("numerofactura", numfac);

		}
		public void grabarDetalle(Long numFact, HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			for (int i = 0; i < listaVentas.size(); i++) {
				detalle_venta = new Detalle_Venta();
				detalle_venta.setCodigo_detalle_venta(String.valueOf(i + 1));
				detalle_venta.setCodigo_venta(numFact);
				detalle_venta.setCodigo_producto(listaVentas.get(i).getCodigo_producto());
				detalle_venta.setCantidad_producto(listaVentas.get(i).getCantidad_producto());
				detalle_venta.setValor_total(listaVentas.get(i).getValor_total());
				detalle_venta.setValor_venta(listaVentas.get(i).getValor_venta());
				detalle_venta.setValor_iva(listaVentas.get(i).getValor_iva());

				int respuesta = 0;
				try {
					respuesta = DetalleVentaJSON.postJSON(detalle_venta);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Ventas&accion=default").forward(request, response);
						// linea de codigo para que vuelva a cargar la venta
						System.out.println("Registros Grabados detalle ventas");
					} else {
						write.println("Error Detalle venta" + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

				listaVentas.clear();
				item = 0;
				totalapagar = 0;
				subtotal = 0;
				valor_iva = 0;
				acusubtotal = 0;
				subtotaliva = 0;
				totalapagar = 0;

			}
		}
		

				
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");
		switch (menu) {

		case "Login":
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
			break;
		case "Usuarios":
			if (accion.equals("listar")) {
				try {
					ArrayList<Usuarios> lista = TestJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (accion.equals("Agregar")) {
				Usuarios usuario = new Usuarios();
				usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula_usuario")));
				usuario.setNombre_usuario(request.getParameter("nombre_usuario"));
				usuario.setEmail_usuario(request.getParameter("email_usuario"));
				usuario.setUsuario(request.getParameter("usuario"));
				usuario.setPassword(request.getParameter("password"));

				int respuesta = 0;
				try {
					respuesta = TestJSON.postJSON(usuario);

					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Usuarios&accion=listar").forward(request,
								response);

					} else {

						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (accion.equals("Actualizar")) {
				System.out.println("entro");
				Usuarios usuario = new Usuarios();
				usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula_usuario")));
				usuario.setNombre_usuario(request.getParameter("nombre_usuario"));
				usuario.setEmail_usuario(request.getParameter("email_usuario"));
				usuario.setUsuario(request.getParameter("usuario"));
				usuario.setPassword(request.getParameter("password"));

				int respuesta = 0;
				try {
					respuesta = TestJSON.putJSON(usuario, usuario.getCedula_usuario());
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Usuarios&accion=listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Cargar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				try {
					ArrayList<Usuarios> lista1 = TestJSON.getJSON();
					for (Usuarios usuarios : lista1) {
						if (usuarios.getCedula_usuario() == id) {
							request.setAttribute("usuarioSeleccionado", usuarios);
							request.getRequestDispatcher("Controlador?menu=Usuarios&accion=listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				int respuesta = 0;
				try {
					respuesta = TestJSON.deleteJSON(id);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Usuarios&accion=listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			request.getRequestDispatcher("/Usuarios.jsp").forward(request, response);
			break;
		case "Clientes":
			if (accion.equals("listar")) {
				try {
					ArrayList<Clientes> lista = ClienteJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (accion.equals("Agregar")) {
				Clientes cliente = new Clientes();
				cliente.setCedula_cliente(Long.parseLong(request.getParameter("cedula_cliente")));
				cliente.setDireccion_cliente(request.getParameter("direccion_cliente"));
				cliente.setEmail_cliente(request.getParameter("email_cliente"));
				cliente.setNombre_cliente(request.getParameter("nombre_cliente"));
				cliente.setTelefono_cliente(request.getParameter("telefono_cliente"));

				int respuesta = 0;
				try {
					respuesta = ClienteJSON.postJSON(cliente);

					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Clientes&accion=listar").forward(request,
								response);

					} else {

						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (accion.equals("Actualizar")) {
				Clientes cliente = new Clientes();
				cliente.setCedula_cliente(Long.parseLong(request.getParameter("cedula_cliente")));
				cliente.setDireccion_cliente(request.getParameter("direccion_cliente"));
				cliente.setEmail_cliente(request.getParameter("email_cliente"));
				cliente.setNombre_cliente(request.getParameter("nombre_cliente"));
				cliente.setTelefono_cliente(request.getParameter("telefono_cliente"));

				int respuesta = 0;
				try {
					respuesta = ClienteJSON.putJSON(cliente, cliente.getCedula_cliente());
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Clientes&accion=listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Cargar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				try {
					ArrayList<Clientes> lista1 = ClienteJSON.getJSON();
					for (Clientes clientes : lista1) {
						if (clientes.getCedula_cliente() == id) {
							request.setAttribute("clienteSeleccionado", clientes);
							request.getRequestDispatcher("Controlador?menu=Clientes&accion=listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				int respuesta = 0;
				try {
					respuesta = ClienteJSON.deleteJSON(id);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Clientes&accion=listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			request.getRequestDispatcher("/Clientes.jsp").forward(request, response);
			break;
		case "Proveedores":
			System.out.println(accion+"**proveedores***************");

			if (accion.equals("listar")) {
				try {
					ArrayList<Proveedores> lista = ProveedoresJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (accion.equals("Agregar")) {
				if (accion.equals("listar")) {
					try {
						ArrayList<Proveedores> lista = ProveedoresJSON.getJSON();
						request.setAttribute("lista", lista);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			if (accion.equals("Agregar")) {
				Proveedores proveedor = new Proveedores();
				proveedor.setNitproveedor(Long.parseLong(request.getParameter("nitproveedor")));
				proveedor.setCiudad_proveedor(request.getParameter("ciudad_proveedor"));
				proveedor.setDireccion_proveedor(request.getParameter("direccion_proveedor"));
				proveedor.setNombre_proveedore(request.getParameter("nombre_proveedore"));
				proveedor.setTelefono_proveedore(request.getParameter("telefono_proveedore"));

				int respuesta = 0;
				try {
					respuesta = ProveedoresJSON.postJSON(proveedor);

					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Proveedores&accion=listar").forward(request,
								response);

					} else {

						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (accion.equals("Actualizar")) {
				Proveedores proveedor = new Proveedores();
				proveedor.setNitproveedor(Long.parseLong(request.getParameter("nitproveedor")));
				proveedor.setCiudad_proveedor(request.getParameter("ciudad_proveedor"));
				proveedor.setDireccion_proveedor(request.getParameter("direccion_proveedor"));
				proveedor.setNombre_proveedore(request.getParameter("nombre_proveedore"));
				proveedor.setTelefono_proveedore(request.getParameter("telefono_proveedore"));

				int respuesta = 0;
				try {
					respuesta = ProveedoresJSON.putJSON(proveedor, proveedor.getNitproveedor());
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Proveedores&accion=listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Cargar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				try {
					ArrayList<Proveedores> lista1 = ProveedoresJSON.getJSON();
					for (Proveedores proveedores : lista1) {
						if (proveedores.getNitproveedor() == id) {
							request.setAttribute("proveedorSeleccionado", proveedores);
							request.getRequestDispatcher("Controlador?menu=Proveedores&accion=listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				int respuesta = 0;
				try {
					respuesta = ProveedoresJSON.deleteJSON(id);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Proveedores&accion=listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			request.getRequestDispatcher("/Proveedores.jsp").forward(request, response);
			break;
		
		case "Ventas":
			request.getRequestDispatcher("/Ventas.jsp").forward(request, response);
			// ******************** enviaremos la cedula del usuario al formulario ventas
			request.setAttribute("usuarioSeleccionado", usuarios);
						// ***********************************************************************

						// ******************** enviaremos la Numero de Factura ******************
						request.setAttribute("numerofactura", numfac);
						// ***********************************************************************
						if (accion.equals("BuscarCliente")) {
							String id = request.getParameter("cedulacliente");// como esta en ventas
							this.buscarCliente(Long.parseLong(id), request, response);
						} else if (accion.equals("BuscarProducto")) {
							String id = request.getParameter("cedulacliente");// como esta en ventas y lo repite
							this.buscarCliente(Long.parseLong(id), request, response);

							String cod = request.getParameter("codigoproducto");// como esta en ventas
							this.buscarProducto(Long.parseLong(cod), request, response);

						} else if (accion.equals("AgregarProducto")) {
							String id = request.getParameter("cedulacliente");// como esta en ventas y lo repite
							this.buscarCliente(Long.parseLong(id), request, response);

							detalle_venta = new Detalle_Venta();
							item++; // contador
							acusubtotal = 0;
							subtotaliva = 0;
							totalapagar = 0;
							codProducto = Long.parseLong(request.getParameter("codigoproducto"));
							descripcion = request.getParameter("nombreproducto");
							precio = Long.parseLong(request.getParameter("precioproducto"));
							cantidad = Integer.parseInt(request.getParameter("cantidadproducto"));
							iva = Long.parseLong(request.getParameter("ivaproducto"));

							subtotal = (precio * cantidad);
							valor_iva = subtotal * iva / 100;
							// almacena temporalmente cada producto
							detalle_venta.setCodigo_detalle_venta(String.valueOf(item));
							detalle_venta.setCodigo_producto(codProducto);
							detalle_venta.setDescripcion_producto(descripcion);
							detalle_venta.setPrecio_producto(precio);
							detalle_venta.setCantidad_producto(cantidad);
							detalle_venta.setCodigo_venta(numfac);
							detalle_venta.setValor_iva(valor_iva);
							detalle_venta.setValor_venta(subtotal);
							listaVentas.add(detalle_venta);

							for (int i = 0; i < listaVentas.size(); i++) {
								acusubtotal += listaVentas.get(i).getValor_venta();
								subtotaliva += listaVentas.get(i).getValor_iva();
							}
							totalapagar = acusubtotal + subtotaliva;
							detalle_venta.setValor_total(totalapagar);
							// una vez hecho todos los calculos ahora hacemos el envio de la info al
							// formulario ventas seccion2
							request.setAttribute("listaventas", listaVentas); //temporal
							request.setAttribute("totalsubtotal", acusubtotal);
							request.setAttribute("totaliva", subtotaliva);
							request.setAttribute("totalapagar", totalapagar);

						} else if (accion.equals("GenerarVenta")) {
							cedulaCliente = request.getParameter("cedulacliente");
							String numFact = request.getParameter("numerofactura");
							Ventas ventas = new Ventas();
							ventas.setCodigo_venta(Long.parseLong(numFact));
							ventas.setCedula_cliente(Long.parseLong(cedulaCliente));
							ventas.setCedula_usuario(usuarios.getCedula_usuario());
							ventas.setIva_venta(subtotaliva);
							ventas.setValor_venta(acusubtotal);
							ventas.setTotal_venta(totalapagar);

							int respuesta = 0;
							try {
								respuesta = VentasJSON.postJSON(ventas);
								PrintWriter write = response.getWriter();
								if (respuesta == 200) {
									System.out.println("Grabacion Exitosa " + respuesta);
									this.grabarDetalle(ventas.getCodigo_venta(), request, response);
								} else {
									write.println("error ventas");
								}
								write.close();
							} catch (Exception e) {
								e.printStackTrace();
							}

						} else {
							String factura = request.getParameter("numerofactura");
							if (factura == null) {
								factura = "1";
								this.buscarFactura(factura, request, response);
							}

						}

						request.getRequestDispatcher("/Ventas.jsp").forward(request, response);
						break;
		case "Productos":
			System.out.println("**prodfffg***************");

			request.getRequestDispatcher("/Productos.jsp").forward(request, response);
			break;
		case "Reporte_Usuarios":

			if (accion.equals("listar")) {
				try {
					ArrayList<Usuarios> lista = TestJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			request.getRequestDispatcher("/ReporteUsuarios.jsp").forward(request, response);
			break;
		case "Reporte_Clientes":

			if (accion.equals("listar")) {
				try {
					ArrayList<Clientes> lista = ClienteJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			request.getRequestDispatcher("/ReporteClientes.jsp").forward(request, response);
			break;
		}

	}
}
	