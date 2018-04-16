using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PedidoFormulario : System.Web.UI.Page
{
    public List<DTOPedidoVentaDetalle> _detallePedido;


    private IList<DTOPedidoVentaDetalle> detallePedido
    {
        get
        {
            // to do not break SRP it's better to move check logic out of the getter
            return ViewState["_detallePedido"] as List<DTOPedidoVentaDetalle>;
        }
        set
        {
            ViewState["_detallePedido"] = value;
            _detallePedido = value as List<DTOPedidoVentaDetalle>;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarArticulos();
            detallePedido = new List<DTOPedidoVentaDetalle>();
        }


            // Solo lectura
        txtSubTotal.ReadOnly = true;
        txtSubTotal.BackColor = System.Drawing.SystemColors.Window;
        txtGastosEnvio.ReadOnly = true;
        txtGastosEnvio.BackColor = System.Drawing.SystemColors.Window;
        txtTotal.ReadOnly = true;
        txtTotal.BackColor = System.Drawing.SystemColors.Window;

        if (Request.QueryString["id"] == null)
        {
            titulo.InnerHtml = "Nuevo Pedido";
        }
        else
        {
            titulo.InnerHtml = "Editar Pedido";

            PedidosDataContext db = new PedidosDataContext();
            var temp = (from cli in db.PedidoVenta
                        where cli.id_pedidoVenta == Convert.ToInt32(Request.QueryString["id"])
                        select cli).Single();

            if (!IsPostBack)
            {
                txtPedidoFecha.Text = temp.fechaPedido.ToString();

                // Solo lectura
                txtPedidoFecha.ReadOnly = true;
                txtPedidoFecha.BackColor = System.Drawing.SystemColors.Window;

            }
        }
    }

    private void cargarArticulos()
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
                var listaArticulos = (from lArt in context.Articulo select lArt).ToList();
                ddlArticulos.DataSource = listaArticulos;
                ddlArticulos.DataValueField = "id_articulo";
                ddlArticulos.DataTextField = "denominacion";
                ddlArticulos.DataBind();
            }
                
        }
        catch (Exception)
        {

            throw;
        }
    }
    /// <summary>
    /// este metodo se llamaria cada vez que agregues un item, tendrias que ver el tema de los totales como los manejas vos
    /// </summary>
    protected void actualizarTotales()
    {
        decimal subTotal = 0;
        decimal total = 0;
        foreach (DTOPedidoVentaDetalle element in detallePedido)
        {
            subTotal += element.subTotal;
        }
        txtSubTotal.Text = subTotal.ToString();
        txtTotal.Text = subTotal.ToString();
        txtGastosEnvio.Text = "0";
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
              
                    PedidoVenta iPedidoInsertar = new PedidoVenta();

                    List<PedidoVentaDetalle> detallePedidoInsertar = new List<PedidoVentaDetalle>();
                    foreach (DTOPedidoVentaDetalle element in detallePedido)
                    {
                        PedidoVentaDetalle iDetalle = new PedidoVentaDetalle();
                        iDetalle.id_articulo = element.id_articulo;
                        iDetalle.cantidad = element.cantidad;
                        iDetalle.subTotal = element.subTotal;
                        iDetalle.porcentajeDescuento = element.porcentajeDescuento;
                        detallePedidoInsertar.Add(iDetalle);
                    }
                    iPedidoInsertar.fechaEstimadaEntrega = DateTime.Now;
                    iPedidoInsertar.fechaPedido = DateTime.Now;
                    iPedidoInsertar.PedidoVentaDetalle.AddRange(detallePedidoInsertar);
                    iPedidoInsertar.gastosEnvio = 0;
                    iPedidoInsertar.id_cliente = 2;
                    iPedidoInsertar.id_domicilio = 1;
                    iPedidoInsertar.nroPedido = 1;
                    iPedidoInsertar.montoTotal = 10;
                    iPedidoInsertar.subTotal = 10;
                    iPedidoInsertar.estado = ddlEstado.SelectedValue;
                    context.PedidoVenta.InsertOnSubmit(iPedidoInsertar);
                    context.SubmitChanges();

                    
                       Response.Redirect("Pedidos.aspx");
                
            }
              

          
           
        }
        catch (Exception ex)
        {

            //error al guardar    ex.Message();
            throw;
        }
       
    }

    protected void btnAgregaArticulo_Click(object sender, EventArgs e) {
        DTOPedidoVentaDetalle iPed = new DTOPedidoVentaDetalle();
        iPed.id_articulo = int.Parse(ddlArticulos.SelectedValue);
        iPed.porcentajeDescuento = 0;
        iPed.subTotal = 1;
        iPed.denominacion = ddlArticulos.SelectedItem.Text;
        iPed.cantidad = int.Parse(txtCantidad.Text);
        detallePedido.Add(iPed);
        gridDetallePedidoVenta.DataSource = detallePedido;
       gridDetallePedidoVenta.DataBind();
        actualizarTotales();
    }

    protected void BuscarPrecio(object sender, EventArgs e)
    {
        using (var context = new PedidosDataContext())
        {
            txtPrecio.Text = (from iArt in context.Articulo where iArt.id_articulo == int.Parse(ddlArticulos.SelectedValue) select iArt.precioCompra).SingleOrDefault().ToString();
        }
            
    }
}