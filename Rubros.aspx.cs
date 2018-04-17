using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rubros : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnNuevoRubro_Click(object sender, EventArgs e)
    {
        Response.Redirect("RubroFormulario.aspx");
    }
    protected void btnEditar_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("RubroFormulario.aspx?id=" + e.CommandArgument);
    }

    protected void btnBorrar_Command(object sender, CommandEventArgs e)
     {
        PedidosDataContext db = new PedidosDataContext();
        int idSeleccionado = Convert.ToInt32(e.CommandArgument.ToString());

        try
        {
            var temp = (from pac in db.Rubro
                        where pac.id_rubro == idSeleccionado
                        select pac).Single();

            db.Rubro.DeleteOnSubmit(temp);
            db.SubmitChanges();
            gridRubros.DataBind();
        }
        catch (Exception ex)
        {
            try
            {
                var errorNumber = ((System.Data.SqlClient.SqlException)ex).Number;
                if (errorNumber == 547)
                {
                    lblError.Visible = true;
                    lblError.Text = "No puede eliminarse un rubro que posea articulos o rubros asociados.";
                }
                else
                {
                    // error desconocido
                    lblError.Visible = true;
                    lblError.Text = "Ocurrió un error al eliminar el rubro.";
                }
            }
            catch (Exception ex2)
            {
                // error desconocido
                lblError.Visible = true;
                lblError.Text = "Ocurrió un error al eliminar el rubro.";
            }          
        }


    }
}