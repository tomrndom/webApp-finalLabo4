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
        try
        {
            PedidosDataContext db = new PedidosDataContext();
            int idSeleccionado = Convert.ToInt32(e.CommandArgument.ToString());

            var tempDom = (from dom in db.Domicilio
                           where dom.id_cliente == idSeleccionado
                           select dom).ToArray();

            for (int i = 0; i < tempDom.Count(); i++)
            {
                db.Domicilio.DeleteOnSubmit(tempDom[i]);
            }

            var temp = (from pac in db.Cliente
                        where pac.id_cliente == idSeleccionado
                        select pac).Single();

            db.Cliente.DeleteOnSubmit(temp);
            db.SubmitChanges();
            gridClientes.DataBind();
        }
        catch (Exception ex)
        {
            try
            {
                var errorNumber = ((System.Data.SqlClient.SqlException)ex).Number;
                if (errorNumber == 547)
                {
                    lblError.Visible = true;
                    lblError.Text = "No puede eliminarse un cliente que posea pedidos asociados.";
                }
                else
                {
                    // error desconocido
                    lblError.Visible = true;
                    lblError.Text = "Ocurrió un error al eliminar el cliente.";
                }
            }
            catch (Exception ex2)
            {
                // error desconocido
                lblError.Visible = true;
                lblError.Text = "Ocurrió un error al eliminar el cliente.";
            }
        }
        
    }

    protected void btnVerPedidos_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Pedidos.aspx?id=" + e.CommandArgument);
    }

    protected void btnDomicilios_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Domicilios.aspx?id=" + e.CommandArgument);
    }
}