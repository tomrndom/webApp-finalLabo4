using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClienteFormulario : System.Web.UI.Page
{

    string lat;
    string lng;

    protected void Page_Load(object sender, EventArgs e)
    {
        lat = hiddenLat.Value;
        lng = hiddenLng.Value;

        if (Request.QueryString["id"] == null)
        {
            titulo.InnerHtml = "Nuevo Cliente";
        }
        else
        {
            titulo.InnerHtml = "Editar Cliente";

            PedidosDataContext db = new PedidosDataContext();
            var temp = (from cli in db.Clientes 
                        where cli.id_cliente == Convert.ToInt32(Request.QueryString["id"])
                        select cli).Single();

            if (!IsPostBack)
            {
                txtNombre.Text = temp.razonSocial;
                txtCUIT.Text = temp.cuit.ToString();

                var dom = (from d in db.Domicilios
                           where d.id_domicilio == temp.id_domicilio
                           select d).Single();

                txtCalle.Text = dom.calle;
                txtNro.Text = dom.numero.ToString();
                txtLocalidad.Text = dom.localidad;
                lat = dom.latitud;
                lng = dom.longitud;
            }
        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        PedidosDataContext db = new PedidosDataContext();

        if (Request.QueryString["id"] == null)
        {
            Domicilio dom = new Domicilio();
            db.Domicilios.InsertOnSubmit(dom);
            dom.calle = txtCalle.Text;
            dom.numero = Convert.ToInt32(txtNro.Text);
            dom.localidad = txtLocalidad.Text;
            dom.latitud = lat;
            dom.longitud = lng;
            db.SubmitChanges();
            
            Cliente cli = new Cliente();
            cli.razonSocial = txtNombre.Text;
            cli.cuit = txtCUIT.Text;
            cli.saldo = 0;
            db.Clientes.InsertOnSubmit(cli);

            cli.id_domicilio = dom.id_domicilio;
            cli.id_domicilioNegocio = dom.id_domicilio;
            
            db.SubmitChanges();
        }
        else
        {
            var temp = (from cli in db.Clientes
                        where cli.id_cliente == Convert.ToInt32(Request.QueryString["id"])
                        select cli).Single();

            temp.razonSocial = txtNombre.Text;
            temp.cuit = txtCUIT.Text;
            db.SubmitChanges();

            var dom = (from d in db.Domicilios
                       where d.id_domicilio == temp.id_domicilio
                       select d).Single();

            dom.calle = txtCalle.Text;
            dom.numero = Convert.ToInt32(txtNro.Text);
            dom.localidad = txtLocalidad.Text;
            dom.latitud = lat;
            dom.longitud = lng;
            db.SubmitChanges();
            
        }

        Response.Redirect("Clientes.aspx");
    }
}