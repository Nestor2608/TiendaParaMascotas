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
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;




/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	long  totalapagar = 0;
	long codProducto = 0,  subtotaliva = 0, acusubtotal = 0, cantidad = 0;
	long numfac = 0;
	double  subtotal = 0, valor_iva = 0;
	int item = 0;
	double precio = 0,iva = 0;
	String descripcion, cedulaCliente;
	List<DetallesVentas> listaVentas = new ArrayList<>();
	Usuarios usuarios = new Usuarios();
	DetallesVentas detalle_venta = new DetallesVentas();

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
					request.setAttribute("clienteSeleccionado", clientes);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void buscarProducto(Long cod, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			
			ArrayList<Productos> listap = ProductosJSON.getJSON();
			for (Productos productos : listap) {
				if (productos.getCodigo_producto() == (cod)) {
					request.setAttribute("productoSeleccionado", productos); // envio a ventas
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void buscarFactura(String numFact, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (numFact == null) {
			numfac = Integer.parseInt(numFact) + 1; // variable declarada arriba con valor 0
		} else {
			numfac = Integer.parseInt(numFact) + 1; // cuando ya tiene valor la variable
		}
		request.setAttribute("numerofactura", numfac);

	}
	
	 //Buscar producto por código--------------------------------------------------------------------------
    public void buscarFactura(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //buscar ultimo registro de ventas y sumar 1 para mostrar consecutivo-------------
            ArrayList<Ventas> listaventas = VentasJSON.getJSON();
            Ventas last = listaventas.get(listaventas.size() - 1);
            Long proxima = last.getCodigo_venta() + 1;
            request.setAttribute("consecutivofactura", proxima);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 


	public void grabarDetalle(Long numFact, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		for (int i = 0; i < listaVentas.size(); i++) {
			System.out.println("grabar ventas");
			detalle_venta = new DetallesVentas();
			// Revisar abajo
			detalle_venta.setCodigo_detalle_venta(Long.valueOf(i + 1));
			detalle_venta.setCodigo_venta(numFact);
			detalle_venta.setCodigo_producto(listaVentas.get(i).getCodigo_producto());
			detalle_venta.setCantidad_productos(listaVentas.get(i).getCantidad_productos());
			detalle_venta.setVenta_total(listaVentas.get(i).getVenta_total());
			detalle_venta.setValor_venta(listaVentas.get(i).getValor_venta());
			detalle_venta.setValoriva(listaVentas.get(i).getValoriva());
			

			int respuesta = 0;
			try {
				respuesta = DetalleVentasJSON.postJSON(detalle_venta);
				PrintWriter write = response.getWriter();
				if (respuesta == 200) {
					System.out.println("Registros Grabados detalle ventas");
				} else {
					write.println("Error Detall venta" + respuesta);
				}
				write.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
	// *******************************************************************************

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");
	
		//**********************variable para recibir la cedula del usuario********************
	/*	String cedula_usuario_activo = request.getParameter("usuarioActivo");
		 usuarios.setCedula_usuario(Long.parseLong(cedula_usuario_activo));
		System.out.println("USUARIO ACTIVO: "+ cedula_usuario_activo);*/
		//request.setAttribute("usuarioActivo", usuarios); //se envia a ventas
		//*************************************************************************************	
		
		 //buscar ususario actvo por libreria session -------------
       /* HttpSession Session = (HttpSession) request.getSession();
        Usuarios usuarioactivo = (Usuarios) Session.getAttribute("usuarioActivo");
        System.out.println("USUARIO ACTIVO: "+ usuarioactivo);
        request.setAttribute("usuarioActivo", usuarioactivo);*/

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

		
			//******************** enviaremos la cedula del usuario al formulario ventas
			//request.setAttribute("usuarioActivo", usuarios);
		
			// ******************** enviaremos la Numero de Factura ******************
			request.setAttribute("numerofactura", numfac);
			// ***********************************************************************
			if (accion.equals("BuscarClientes")) {				
				String id = request.getParameter("cedula_cliente");// como esta en ventas
				this.buscarCliente(Long.parseLong(id), request, response);
			} else if (accion.equals("BuscarProducto")) {
				
				String id = request.getParameter("cedula_cliente");// como esta en ventas y lo repite
				this.buscarCliente(Long.parseLong(id), request, response);

				String cod = request.getParameter("codigoproducto");// como esta en ventas
				this.buscarProducto(Long.parseLong(cod), request, response);

			} else if (accion.equals("AgregarProducto")) {
				String id = request.getParameter("cedula_cliente");// como esta en ventas y lo repite
				this.buscarCliente(Long.parseLong(id), request, response);

				detalle_venta = new DetallesVentas();
				item++; // contador
				acusubtotal = 0;
				subtotaliva = 0;
				totalapagar = 0;
				codProducto = Long.parseLong(request.getParameter("codigoproducto"));
				descripcion = request.getParameter("nombreproducto");
				precio = Double.parseDouble(request.getParameter("precioproducto"));
	
				cantidad = Long.parseLong(request.getParameter("cantidadproducto"));
				iva = Double.parseDouble(request.getParameter("ivaproducto"));

				subtotal = (precio * cantidad);
				valor_iva = subtotal * iva / 100;

				// almacena temporalmente cada producto
				detalle_venta.setCodigo_detalle_venta(Long.valueOf(item));
				detalle_venta.setCantidad_productos(cantidad);
				detalle_venta.setCodigo_producto(codProducto);
				detalle_venta.setCodigo_venta(numfac);
				detalle_venta.setVenta_total(precio);
				detalle_venta.setValor_venta(subtotal);
				detalle_venta.setValoriva(valor_iva);
				listaVentas.add(detalle_venta);

				for (int i = 0; i < listaVentas.size(); i++) {
					acusubtotal += listaVentas.get(i).getValor_venta();
					subtotaliva += listaVentas.get(i).getValoriva();
				}
				totalapagar = acusubtotal + subtotaliva;
				detalle_venta.setVenta_total(totalapagar);
				// una vez hecho todos los calculos ahora hacemos el envio de la info al
				// formulario ventas seccion2
				request.setAttribute("listaventas", listaVentas); // temporal
				request.setAttribute("totalsubtotal", acusubtotal);
				request.setAttribute("totaliva", subtotaliva);
				request.setAttribute("totalapagar", totalapagar);

			} else if (accion.equals("GenerarVenta")) {
				cedulaCliente = request.getParameter("cedulacliente");				
				String numFact = request.getParameter("numerofactura");
				long usuario = (long) 12345;
				Ventas ventas = new Ventas();
				ventas.setCodigo_venta(Long.parseLong(numFact));
				ventas.setCedula_cliente(Long.parseLong(cedulaCliente));
				ventas.setCedula_usuario(usuario);
				ventas.setIvaventa(subtotaliva);				
				ventas.setTotal_venta(totalapagar);
				ventas.setValor_venta(acusubtotal);
				
				System.out.println("___________________ " );
				System.out.println("codigo venta: "+ numFact);
				System.out.println("Cedula_cliente: "+ cedulaCliente);
				System.out.println("Cedula_usuario: "+ usuario);
				System.out.println("Iva_venta:"+ subtotaliva);
				System.out.println("Total_venta: "+ totalapagar);
				System.out.println("Valor_venta: "+ acusubtotal);
				System.out.println("___________________ " );

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
