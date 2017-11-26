using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    PedidosDataContext pedidos = new PedidosDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Se vacia la sesion
        Session["IdUsuario"] = null;
        //Si se registro un nuevo usuario
                
    }
    protected void cstvUsuario_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //Se valida que el usuario ingresado exista en la base de datos y este habilitado
        bool existeUsuario = (from user in pedidos.Usuarios
                              where user.nombreUsuario == txtUsuario.Text == true
                              select user).Any();
        if (existeUsuario)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }

    protected void cstvContrasenia_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //Si el usuario es valido
        if (cstvUsuario.IsValid)
        {
            //Se valida que la contraseña sea correcta
            var usuario = (from user in pedidos.Usuarios
                           where user.nombreUsuario== txtUsuario.Text
                           select user).Single();
            if (usuario.password == txtPassword.Text)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        {
            if (Page.IsValid)
            {
                var usuario = (from user in pedidos.Usuarios
                               where user.nombreUsuario == txtUsuario.Text
                               select user).Single();

                Session["idUsuario"] = usuario.id_usuario;
                Session["nombreUsuario"] = usuario.nombreEmpleado;
                Session["apellidoUsuario"] = usuario.apellidoEmpleado;
                Session["emailUsuario"] = usuario.email;
                Response.Redirect("Inicio.aspx");
            }
        }
    }
}