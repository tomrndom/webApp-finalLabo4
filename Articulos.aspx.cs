using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Articulos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnNuevoArticulo_Click(object sender, EventArgs e)
    {
        Response.Redirect("ArticuloFormulario.aspx");
    }

    protected void btnEditar_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ArticuloFormulario.aspx?id=" + e.CommandArgument);
    }
    protected void btnBorrar_Command(object sender, CommandEventArgs e)
    {
        try
        {

            PedidosDataContext db = new PedidosDataContext();
            int idSeleccionado = Convert.ToInt32(e.CommandArgument.ToString());

            var temp = (from art in db.Articulo
                        where art.id_articulo == idSeleccionado
                        select art).Single();

            db.Articulo.DeleteOnSubmit(temp);
            db.SubmitChanges();
            gridArticulos.DataBind();
        } 
        catch (Exception ex)
        {            
            try
            {
                var errorNumber = ((System.Data.SqlClient.SqlException)ex).Number;
                if (errorNumber == 547)
                {
                    lblError.Visible = true;
                    lblError.Text = "No puede eliminarse un artículo que posea pedidos asociados.";
                }
                else
                {
                    // error desconocido
                    lblError.Visible = true;
                    lblError.Text = "Ocurrió un error al eliminar el artículo.";
                }
            }
            catch (Exception ex2)
            {
                // error desconocido
                lblError.Visible = true;
                lblError.Text = "Ocurrió un error al eliminar el artículo.";
            }
        }
    }
    
}