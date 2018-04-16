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
            var temp = (from cli in db.Cliente 
                        where cli.id_cliente == Convert.ToInt32(Request.QueryString["id"])
                        select cli).Single();

            if (!IsPostBack)
            {
                txtNombre.Text = temp.razonSocial;
                txtCUIT.Text = temp.cuit.ToString();

                var dom = (from d in db.Domicilio
                           where d.id_domicilio == temp.id_cliente
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

        lat = hiddenLat.Value;
        lng = hiddenLng.Value;

        if (Request.QueryString["id"] == null)
        {

            Cliente cli = new Cliente();
            cli.razonSocial = txtNombre.Text;
            cli.cuit = txtCUIT.Text;
            cli.saldo = 0;
            db.Cliente.InsertOnSubmit(cli);

            Domicilio dom = new Domicilio();
            db.Domicilio.InsertOnSubmit(dom);
            dom.calle = txtCalle.Text;
            dom.numero = Convert.ToInt32(txtNro.Text);
            dom.localidad = txtLocalidad.Text;
            dom.latitud = lat;
            dom.longitud = lng;
            dom.tipo_domicilio = "PERSONAL";
            dom.Cliente = cli;
            
            db.SubmitChanges();
        }
        else
        {
            var temp = (from cli in db.Cliente
                        where cli.id_cliente == Convert.ToInt32(Request.QueryString["id"])
                        select cli).Single();

            temp.razonSocial = txtNombre.Text;
            temp.cuit = txtCUIT.Text;
            db.SubmitChanges();

            var dom = (from d in db.Domicilio
                       where d.id_domicilio == temp.id_cliente
                       select d).Single();

            dom.calle = txtCalle.Text;
            dom.numero = Convert.ToInt32(txtNro.Text);
            dom.localidad = txtLocalidad.Text;
            dom.latitud = lat;
            dom.longitud = lng;
            dom.tipo_domicilio = "PERSONAL";
            dom.Cliente = temp;
            db.SubmitChanges();
            
        }

        Response.Redirect("Clientes.aspx");
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clientes.aspx");
    }
}