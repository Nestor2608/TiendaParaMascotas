package servlet;

public class DetallesVentas {
	
	private long codigo_detalle_venta;
	private double cantidad_productos;
	private long codigo_producto;
	private long codigo_venta;
	private double venta_total;
	private double valor_venta;
	private double valoriva;
	
	
	
	@Override
	public String toString() {
		return "DetallesVentas [codigo_detalle_venta=" + codigo_detalle_venta + ", cantidad_productos="
				+ cantidad_productos + ", codigo_producto=" + codigo_producto + ", codigo_venta=" + codigo_venta
				+ ", venta_total=" + venta_total + ", valor_venta=" + valor_venta + ", valoriva=" + valoriva + "]";
	}
	public long getCodigo_detalle_venta() {
		return codigo_detalle_venta;
	}
	public void setCodigo_detalle_venta(long codigo_detalle_venta) {
		this.codigo_detalle_venta = codigo_detalle_venta;
	}
	public double getCantidad_productos() {
		return cantidad_productos;
	}
	public void setCantidad_productos(double cantidad_productos) {
		this.cantidad_productos = cantidad_productos;
	}
	public long getCodigo_producto() {
		return codigo_producto;
	}
	public void setCodigo_producto(long codigo_producto) {
		this.codigo_producto = codigo_producto;
	}
	public long getCodigo_venta() {
		return codigo_venta;
	}
	public void setCodigo_venta(long codigo_venta) {
		this.codigo_venta = codigo_venta;
	}
	public double getVenta_total() {
		return venta_total;
	}
	public void setVenta_total(double venta_total) {
		this.venta_total = venta_total;
	}
	public double getValor_venta() {
		return valor_venta;
	}
	public void setValor_venta(double valor_venta) {
		this.valor_venta = valor_venta;
	}
	public double getValoriva() {
		return valoriva;
	}
	public void setValoriva(double valoriva) {
		this.valoriva = valoriva;
	}
	
	
	
	
	

}
