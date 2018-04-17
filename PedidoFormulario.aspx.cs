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
            try
            {
                using (var context = new PedidosDataContext())
                {
                    Cliente cliSel = new Cliente();
                    cliSel.razonSocial = "Seleccione un cliente";
                    cliSel.id_cliente = -1;
                    var listaClientes = (from lCli in context.Cliente select lCli).ToList();
                    listaClientes.Add(cliSel);

                    ddlCliente.DataSource = listaClientes;
                    ddlCliente.DataValueField = "id_cliente";
                    ddlCliente.DataTextField = "razonSocial";
                    ddlCliente.DataBind();
                    ddlCliente.SelectedValue = "-1";
                }
                    
                cargarArticulos();
                detallePedido = new List<DTOPedidoVentaDetalle>();            
            }
            catch (Exception ex)
            {
            }
        }
       
            
        // Solo lectura
        txtSubTotal.ReadOnly = true;
        txtPedidoFecha.ReadOnly = true;
        txtSubTotal.BackColor = System.Drawing.SystemColors.Window;
        txtGastosEnvio.ReadOnly = true;
        txtGastosEnvio.BackColor = System.Drawing.SystemColors.Window;
        txtTotal.ReadOnly = true;
        txtTotal.BackColor = System.Drawing.SystemColors.Window;

        if (Request.QueryString["id"] == null)
        {
            titulo.InnerHtml = "Nuevo Pedido";
            txtPedidoFecha.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
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
                txtPedidoFecha.Text = temp.fechaPedido.ToString("dd/MM/yyyy");
                txtFechaEstimada.Text = temp.fechaEstimadaEntrega.ToString();
                ddlCliente.SelectedValue = temp.id_cliente.ToString();
                //buscarDomicilio();
                ddlDomicilio.SelectedValue = temp.id_domicilio.ToString();
                ddlEstado.SelectedValue = temp.estado.ToString();

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
                Articulo iArtSel = new Articulo();
                iArtSel.denominacion = "Seleccione un artículo";
                iArtSel.id_articulo = -1;
                var listaArticulos = (from lArt in context.Articulo select lArt).ToList();
                listaArticulos.Add(iArtSel);

                ddlArticulos.DataSource = listaArticulos;
                ddlArticulos.DataValueField = "id_articulo";
                ddlArticulos.DataTextField = "denominacion";
                ddlArticulos.DataBind();
                ddlArticulos.SelectedValue = "-1";
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
        txtGastosEnvio.Text = "50";
        txtSubTotal.Text = subTotal.ToString();
        decimal gastoEnvio = Convert.ToDecimal(txtGastosEnvio.Text);
        decimal tempTotal = subTotal + gastoEnvio;
        txtTotal.Text = tempTotal.ToString();
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
                Cliente iCliente;
                iCliente = (from ic in context.Cliente where ic.id_cliente == Convert.ToInt32(ddlCliente.SelectedValue) select ic).Single();
                iCliente.saldo = iCliente.saldo - Convert.ToDecimal(txtTotal.Text);
                
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
                    iPedidoInsertar.fechaPedido = Convert.ToDateTime(txtPedidoFecha.Text);
                    iPedidoInsertar.PedidoVentaDetalle.AddRange(detallePedidoInsertar);
                    iPedidoInsertar.gastosEnvio = 0;
                    iPedidoInsertar.id_cliente = Convert.ToInt32(ddlCliente.SelectedValue);
                    iPedidoInsertar.id_domicilio = Convert.ToInt32(ddlDomicilio.SelectedValue);
                    iPedidoInsertar.nroPedido = 1;
                    iPedidoInsertar.montoTotal = Convert.ToDecimal(txtTotal.Text);
                    iPedidoInsertar.subTotal = Convert.ToDecimal(txtSubTotal.Text);
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
        iPed.cantidad = int.Parse(txtCantidad.Text);
        iPed.subTotal = iPed.cantidad * Convert.ToDecimal(txtPrecio.Text);
        iPed.denominacion = ddlArticulos.SelectedItem.Text;
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

    protected void buscarDomicilio(object sender, EventArgs e)
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
                var listaDomiccilios = (from lDom in context.Domicilio
                                        where lDom.id_cliente == Convert.ToInt32(ddlCliente.SelectedValue)
                                        select lDom).ToList();

                foreach (Domicilio idom in listaDomiccilios)
                {
                    idom.calle = idom.calle + " " + idom.numero;
                }

                ddlDomicilio.Items.Clear();
                ddlDomicilio.DataSource = listaDomiccilios;
                ddlDomicilio.DataValueField = "id_domicilio";
                ddlDomicilio.DataTextField = "calle";
                ddlDomicilio.DataBind();
            }

        }
        catch (Exception)
        {

            throw;
        }
    }
}