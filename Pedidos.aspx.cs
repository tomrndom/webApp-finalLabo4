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
            using (var db = new PedidosDataContext())
            {
                if (Request.QueryString["id"] != null)
                {
                    btnVolver.Visible = true;

                    var listaPedidos = (from lPedidos in db.PedidoVenta
                                        where lPedidos.id_cliente == Convert.ToInt32(Request.QueryString["id"])
                                        select lPedidos).ToList();
                    if (listaPedidos.Count > 0)
                    {
                        gridPedidos.DataSource = listaPedidos.AsEnumerable();
                        gridPedidos.DataBind();
                    }
                    else
                    {
                        lblNoPedidos.Visible = true;
                    }
                }
                else {
                    var listaPedidos = (from lPedidos in db.PedidoVenta                                        
                                        select lPedidos).ToList();
                    gridPedidos.DataSource = listaPedidos.AsEnumerable();
                    gridPedidos.DataBind();
                }
                
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

        var temp = (from pac in db.PedidoVenta
                    where pac.id_pedidoVenta == idSeleccionado
                    select pac).Single();

        db.PedidoVenta.DeleteOnSubmit(temp);
        db.SubmitChanges();
        gridPedidos.DataBind();
    }

    protected void btnVerPedidos_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("DetallePedido.aspx?id=" + e.CommandArgument);
    }

    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clientes.aspx");
    }
}