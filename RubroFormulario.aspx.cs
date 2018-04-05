using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RubroFormulario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListItem item = new ListItem("", "-1");
        ddlRubroPri.Items.Insert(0, item);

        PedidosDataContext db = new PedidosDataContext();        

        if (Request.QueryString["id"] == null)
        {
            titulo.InnerHtml = "Nuevo Rubro";
        }
        else
        {
            titulo.InnerHtml = "Editar Rubro";

            
            var temp = (from ru in db.Rubros
                        where ru.id_rubro == Convert.ToInt32(Request.QueryString["id"])
                        select ru).Single();

            if (!IsPostBack)
            {
                txtCodigo.Text = temp.codigo;
                txtDenominacion.Text = temp.denominacion;
                ddlRubroPri.SelectedIndex = Convert.ToInt32(temp.id_rubroPrimario);                                
            }
        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        PedidosDataContext db = new PedidosDataContext();

        if (Request.QueryString["id"] == null)
        {            
            Rubro ru = new Rubro();
            ru.codigo = txtCodigo.Text;
            ru.denominacion = txtDenominacion.Text;
            db.Rubros.InsertOnSubmit(ru);
            if (ddlRubroPri.SelectedIndex == -1)
            {
                ru.id_rubroPrimario = null;
            }
            else
            {
                ru.id_rubroPrimario = ddlRubroPri.SelectedIndex;                
            }            
            db.SubmitChanges();
        }
        else
        {
            var temp = (from ru in db.Rubros
                        where ru.id_rubro == Convert.ToInt32(Request.QueryString["id"])
                        select ru).Single();

            temp.codigo = txtCodigo.Text;
            temp.denominacion = txtDenominacion.Text;
            if (ddlRubroPri.SelectedIndex == -1)
            {
                temp.id_rubroPrimario = null;
            }
            else {                
                temp.id_rubroPrimario = ddlRubroPri.SelectedIndex;
            }
            
            
            db.SubmitChanges();

        }

        Response.Redirect("Rubros.aspx");
    }
}
