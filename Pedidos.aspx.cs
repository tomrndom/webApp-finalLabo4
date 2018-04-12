using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pedidos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarPedidos();
        }

    }

    protected void cargarPedidos()
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
                var listaPedidos = (from lPedidos in context.PedidoVentas select lPedidos).ToList();
                gridPedidos.DataSource = listaPedidos.AsEnumerable();
                gridPedidos.DataBind();
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    protected void btnNuevoPedido_Click(object sender, EventArgs e)
    {
        Response.Redirect("PedidoFormulario.aspx");
    }

    protected void btnEditar_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("PedidoFormulario.aspx?id=" + e.CommandArgument);
    }

    protected void btnBorrar_Command(object sender, CommandEventArgs e)
    {
        PedidosDataContext db = new PedidosDataContext();
        int idSeleccionado = Convert.ToInt32(e.CommandArgument.ToString());

        var temp = (from pac in db.PedidoVentas
                    where pac.id_pedidoVenta == idSeleccionado
                    select pac).Single();

        db.PedidoVentas.DeleteOnSubmit(temp);
        db.SubmitChanges();
        gridPedidos.DataBind();
    }

    protected void btnVerPedidos_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("DetallePedido.aspx?id=" + e.CommandArgument);
    }
}