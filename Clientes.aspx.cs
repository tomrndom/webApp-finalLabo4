using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Clientes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnNuevoCliente_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClienteFormulario.aspx");
    }

    protected void btnEditar_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ClienteFormulario.aspx?id=" + e.CommandArgument);
    }

    protected void btnBorrar_Command(object sender, CommandEventArgs e)
    {
        PedidosDataContext db = new PedidosDataContext();
        int idSeleccionado = Convert.ToInt32(e.CommandArgument.ToString());

        var temp = (from pac in db.Clientes
                    where pac.id_cliente == idSeleccionado
                    select pac).Single();

        db.Clientes.DeleteOnSubmit(temp);
        db.SubmitChanges();
        gridClientes.DataBind();
    }

    protected void btnVerPedidos_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Pedidos.aspx?id=" + e.CommandArgument);
    }
}