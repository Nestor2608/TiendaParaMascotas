package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DemoServlet")
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DemoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void validarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Usuarios> lista = TestJSON.getJSON();
			request.setAttribute("lista", lista);
			String usua = request.getParameter("txtusuario");
			String pass = request.getParameter("txtpassword");
			int respuesta = 0;
			for (Usuarios usuario : lista) {
				if (usuario.getUsuario().equals(usua) && usuario.getPassword().equals(pass)) {
					request.setAttribute("usuario", usuario);
					request.getRequestDispatcher("/Usuarios.jsp").forward(request, response);
					respuesta = 1;
				}

			}

			if (respuesta == 0) {
				request.getRequestDispatcher("/Login.jsp").forward(request, response);				
				System.out.println("No se encontraron datos");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void agregarUsuario(HttpServletRequest request, HttpServletResponse response) {

		Usuarios usuarios = new Usuarios();
		usuarios.setNombre_usuario(request.getParameter("nombre_usuario"));
		usuarios.setCedula_usuario(Long.parseLong(request.getParameter("cedula_usuario")));
		usuarios.setEmail_usuario(request.getParameter("email_usuario"));
		usuarios.setUsuario(request.getParameter("usuario"));
		usuarios.setPassword(request.getParameter("password"));
		int respuesta = 0;

		try {
			respuesta = TestJSON.postJSON(usuarios);
			PrintWriter write = response.getWriter();

			if (respuesta == 200) {
				write.println("Usuario agregado correctamente!");
			} else {
				write.println("Error " + respuesta);
			}
			write.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.getWriter().append("Served at: ").append(request.getContextPath());
		String agregar = request.getParameter("guardar");
		String consultar = request.getParameter("consultar");
		String ingresar = request.getParameter("Ingresar");

		String accion = request.getParameter("accion");
		
		if (ingresar != null) {
			this.validarUsuarios(request, response);
		}

		if (accion.equals("Ingresar")) {
			this.validarUsuarios(request, response);
		}
		
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		doGet(request, response);

	}

}