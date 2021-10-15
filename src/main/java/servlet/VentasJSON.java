package servlet;
import java.io.IOException;


public class VentasJSON {
	private static URL url;
	private static String sitio = "http://localhost:5000/";
	
	public static int postJSON(Ventas ventas) throws IOException {

		url = new URL(sitio + "ventas/guardar");
		HttpURLConnection http;
		http = (HttpURLConnection) url.openConnection();

		try {
			http.setRequestMethod("POST");
		} catch (ProtocolException e) {
			e.printStackTrace();
		}

		http.setDoOutput(true);
		http.setRequestProperty("Accept", "application/json");
		http.setRequestProperty("Content-Type", "application/json");

		String data = "{" 
				+ "\"codigo_venta\":\"" + String.valueOf(ventas.getCodigo_venta())
				+ "\",\"cedula_cliente\": \"" + String.valueOf(ventas.getCedula_cliente())
				+ "\",\"cedula_usuario\": \"" + String.valueOf(ventas.getCedula_usuario())
				+ "\",\"iva_venta\": \"" + String.valueOf(ventas.getIva_venta()) 
				+ "\",\"total_venta\": \"" + String.valueOf(ventas.getTotal_venta()) 
				+ "\",\"valor_venta\":\"" 	+ String.valueOf(ventas.getValor_venta()) 
				+ "\"}";
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);

		int respuesta = http.getResponseCode();
		http.disconnect();
		return respuesta;
	}
	
	public static ArrayList<Ventas> getJSON() throws IOException, ParseException { // devolver un listado JSON

		url = new URL(sitio + "ventas/listar"); // trae el metodo de Ventas.API
		HttpURLConnection http = (HttpURLConnection) url.openConnection();

		http.setRequestMethod("GET");
		http.setRequestProperty("Accept", "application/json");

		InputStream respuesta = http.getInputStream();
		byte[] inp = respuesta.readAllBytes();
		String json = "";

		for (int i = 0; i < inp.length; i++) {
			json += (char) inp[i];
		}

		ArrayList<Ventas> lista = new ArrayList<Ventas>();
		lista = parsingVentas(json);
		http.disconnect();
		return lista;
	}

	// agregar informacion a la tabla cliente

	// agregar informacion a la tabla venta

		public static ArrayList<Ventas> parsingVentas(String json) throws ParseException {// devulve un arraylist
			JSONParser jsonParser = new JSONParser();
			ArrayList<Ventas> lista = new ArrayList<Ventas>();
			JSONArray ventas = (JSONArray) jsonParser.parse(json);
			Iterator i = ventas.iterator(); // recorrer la tabla venta
			while (i.hasNext()) {
				JSONObject innerObj = (JSONObject) i.next();
				Ventas venta = new Ventas();
				venta.setCodigo_venta(Long.parseLong(innerObj.get("numerofactura").toString())); // convertir de String // a Long
				venta.setCedula_cliente(Long.parseLong(innerObj.get("direccion_venta").toString()));
				venta.setCedula_usuario(Long.parseLong(innerObj.get("email_venta").toString()));
				venta.setIva_venta(Long.parseLong(innerObj.get("nombre_venta").toString()));
				venta.setTotal_venta(Long.parseLong(innerObj.get("telefono_venta").toString()));
				venta.setValor_venta(Long.parseLong(innerObj.get("telefono_venta").toString()));
				lista.add(venta);
			}
			return lista;
		}

}
