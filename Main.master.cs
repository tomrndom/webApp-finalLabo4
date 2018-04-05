using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.MasterPage
{
    PedidosDataContext pedidos = new PedidosDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["nombreUsuario"] == null)
        {
            Response.Redirect("Login.aspx");
            System.Web.UI.HtmlControls.HtmlGenericControl alerta =new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            alerta.ID = "alertaDiv";
            alerta.InnerHtml = "Su tiempo de sesión ha expirado";
            alerta.Attributes["class"] = "alert alert-red";                        
            this.Controls.Add(alerta);
        }

        lblnombreUsuario.Text = (HttpContext.Current.Session["nombreUsuario"].ToString() +" "+ HttpContext.Current.Session["apellidoUsuario"].ToString());
        lblmailUsuario.Text = HttpContext.Current.Session["emailUsuario"].ToString();
        
    }
}
