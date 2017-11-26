using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PedidoFormulario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            var temp = (from cli in db.PedidoVentas
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

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        PedidosDataContext db = new PedidosDataContext();

        if (Request.QueryString["id"] == null)
        {            
            txtPedidoFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
            txtPedidoFecha.ReadOnly = true;            
        }
        else
        {            

        }

        Response.Redirect("Pedidos.aspx");
    }

    protected void btnAgregaArticulo_Click(object sender, EventArgs e) {

    }
}