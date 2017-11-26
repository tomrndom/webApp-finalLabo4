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

        var temp = (from pac in db.Rubros
                    where pac.id_rubro == idSeleccionado
                    select pac).Single();

        db.Rubros.DeleteOnSubmit(temp);
        db.SubmitChanges();
        gridRubros.DataBind();
    }
}