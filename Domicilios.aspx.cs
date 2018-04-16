using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Domicilios : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarDomicilios();
        }

    }

    protected void cargarDomicilios()
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
                var listaDomicilios = (from lDomicilios in context.Domicilio
                                       where lDomicilios.id_domicilio == Convert.ToInt32(Request.QueryString["id"])
                                       select lDomicilios).ToList();
                gridDomicilios.DataSource = listaDomicilios.AsEnumerable();
                gridDomicilios.DataBind();
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    protected void btnNuevoDomicilio_Click(object sender, EventArgs e)
    {

    }

    protected void btnEditarDomicilio_Command(object sender, CommandEventArgs e)
    {

    }

    protected void btnVerMapa_Command(object sender, CommandEventArgs e)
    {
        try
        {
            PedidosDataContext db = new PedidosDataContext();
            var map = (from dom in db.Domicilio
                        where dom.id_domicilio == Convert.ToInt32(Request.QueryString["id"])
                        select dom).Single();

            var mapaLat = map.latitud;
            var mapaLng = map.longitud;

            string url = "www.google.com/maps/@" + map.latitud + "," +   map.longitud+"z";
            string s = "window.open('" + url + "', 'popup_window', 'width=700,height=600,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);

        } catch (Exception ex)
        {

        }

    }

    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clientes.aspx");
    }
}