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

        if (!Page.IsPostBack) {
            cargarRubros(Request.QueryString["id"]);
            if (Request.QueryString["id"] == null)
            {
                titulo.InnerHtml = "Nuevo Rubro";
            }
            else
            {
                titulo.InnerHtml = "Editar Rubro";

                PrecargarDatos(Int32.Parse(Request.QueryString["id"]));
            }

        } 

        /*ListItem item = new ListItem("", "-1");
        ddlRubroPri.Items.Insert(0, item);

        PedidosDataContext db = new PedidosDataContext();      */  

        
    }


    private void PrecargarDatos(int id)
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
                var temp = (from ru in context.Rubros
                        where ru.id_rubro == Convert.ToInt32(Request.QueryString["id"])
                        select ru).Single();
            txtCodigo.Text = temp.codigo;
            txtDenominacion.Text = temp.denominacion;
            
            if (temp.id_rubroPrimario == null)
                {
                    ddlRubroPri.SelectedValue = "-1";
                }
                else
                {
                    ddlRubroPri.SelectedValue = Convert.ToString(temp.id_rubroPrimario);
                }
           
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    private void cargarRubros(string idModificar)
    {
        try
        {
            using (var context = new PedidosDataContext())
            {
                List<Rubro> ListaRubro = new List<Rubro>();
                if (idModificar == null)
                {
                    ListaRubro = (from iR in context.Rubros select iR).ToList();
                }
                else
                {
                    ListaRubro = (from iR in context.Rubros where iR.id_rubro.ToString() != idModificar select iR).ToList();
                }
              
                Rubro ir = new Rubro();
                ir.id_rubro = -1;
                ir.denominacion = "SIN RUBRO";
                ListaRubro.Add(ir);
                ddlRubroPri.DataSource = ListaRubro;
                ddlRubroPri.DataValueField = "id_rubro";
                ddlRubroPri.DataTextField = "denominacion";
                ddlRubroPri.DataBind();


            }
        }
        catch (Exception)
        {

            throw;
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
            if (ddlRubroPri.SelectedValue == "-1")
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
            if (ddlRubroPri.SelectedValue == "-1")
            {
                temp.id_rubroPrimario = null;
            }
            else {                
                temp.id_rubroPrimario = Int32.Parse(ddlRubroPri.SelectedValue);
            }
            
            
            db.SubmitChanges();

        }

        Response.Redirect("Rubros.aspx");
    }
}
