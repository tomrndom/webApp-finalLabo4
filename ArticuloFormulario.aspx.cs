using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArticuloFormulario : System.Web.UI.Page
{        

    protected void Page_Load(object sender, EventArgs e)
    {
        ListItem item = new ListItem("", "-1");
        ddlRubro.Items.Insert(0, item);

        PedidosDataContext db = new PedidosDataContext();
        

        if (Request.QueryString["id"] == null)
        {
            titulo.InnerHtml = "Nuevo Artículo";
        }
        else
        {
            titulo.InnerHtml = "Editar Artículo";

            var temp = (from art in db.Articulos
                        where art.id_articulo == Convert.ToInt32(Request.QueryString["id"])
                        select art).Single();

            if (!IsPostBack)
            {
                txtCodigo.Text = temp.codigo;
                txtDenominacion.Text = temp.denominacion;
                txtPrecioCompra.Text = temp.precioCompra.ToString();
                txtPrecioVenta.Text = temp.precioVenta.ToString();
                txtIva.Text = temp.iva.ToString();
                ddlRubro.SelectedValue = temp.id_rubro.ToString();           
            }
        }

        TrimTextBoxes(Page);
    }


    public static void TrimTextBoxes(Control root)
    {
        foreach (Control control in root.Controls)
        {
            if (control is TextBox)
            {
                var textbox = control as TextBox;
                textbox.Text = textbox.Text.Trim();
            }
            else
            {
                TrimTextBoxes(control);
            }
        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        PedidosDataContext db = new PedidosDataContext();

        if (Request.QueryString["id"] == null)
        {
            Articulo art = new Articulo();
            art.codigo = txtCodigo.Text;
            art.denominacion = txtDenominacion.Text;
            art.precioCompra = Convert.ToDecimal(txtPrecioCompra.Text);
            art.precioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
            art.iva = Convert.ToDecimal(txtIva.Text);                                 
            db.Articulos.InsertOnSubmit(art);
            art.id_rubro = Convert.ToInt32(ddlRubro.SelectedValue);  
            db.SubmitChanges();
        }
        else
        {
            var temp = (from art in db.Articulos
                        where art.id_articulo == Convert.ToInt32(Request.QueryString["id"])
                        select art).Single();

            temp.codigo = txtCodigo.Text;
            temp.denominacion = txtDenominacion.Text;
            temp.precioCompra = Convert.ToDecimal(txtPrecioCompra.Text);
            temp.precioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
            temp.iva = Convert.ToDecimal(txtIva.Text);
            if (ddlRubro.SelectedIndex != -1)
            {
                temp.id_rubro = Convert.ToInt32(ddlRubro.SelectedValue);
            }
            else {
                temp.id_rubro = 0;
            }
            
            //FALTA RUBRO                        
            db.SubmitChanges();

        }

        Response.Redirect("Articulos.aspx");
    }
}

