package servlet;

public class Proveedores {
	
	private long nitproveedor;
	private String ciudad_proveedor;
	private String direccion_proveedor;
	private String nombre_proveedore;
	private String telefono_proveedore;
	
	
	@Override
	public String toString() {
		return "Proveedores [nitproveedor=" + nitproveedor + ", ciudad_proveedor=" + ciudad_proveedor
				+ ", direccion_proveedor=" + direccion_proveedor + ", nombre_proveedore=" + nombre_proveedore
				+ ", telefono_proveedore=" + telefono_proveedore + "]";
	}
	public long getNitproveedor() {
		return nitproveedor;
	}
	public void setNitproveedor(long nitproveedor) {
		this.nitproveedor = nitproveedor;
	}
	public String getCiudad_proveedor() {
		return ciudad_proveedor;
	}
	public void setCiudad_proveedor(String ciudad_proveedor) {
		this.ciudad_proveedor = ciudad_proveedor;
	}
	public String getDireccion_proveedor() {
		return direccion_proveedor;
	}
	public void setDireccion_proveedor(String direccion_proveedor) {
		this.direccion_proveedor = direccion_proveedor;
	}
	public String getNombre_proveedore() {
		return nombre_proveedore;
	}
	public void setNombre_proveedore(String nombre_proveedore) {
		this.nombre_proveedore = nombre_proveedore;
	}
	public String getTelefono_proveedore() {
		return telefono_proveedore;
	}
	public void setTelefono_proveedore(String telefono_proveedore) {
		this.telefono_proveedore = telefono_proveedore;
	}
	
	
	

}
