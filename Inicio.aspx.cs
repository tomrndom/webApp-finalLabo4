using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    PedidosDataContext db = new PedidosDataContext();        

    protected void Page_Load(object sender, EventArgs e)
    {

        int cant_pdidos;
        int cant_art;
        int cant_rubros;
        int cant_cli;

        try {

            var tempPedidos = (from pedido in db.PedidoVentas                              
                              select pedido);
            cant_pdidos = tempPedidos.Count();

            mostrar_pedidos.InnerHtml = cant_pdidos.ToString();

            var tempArticulos = (from art in db.Articulos select art);
            cant_art = tempArticulos.Count();

            mostrar_articulos.InnerHtml = cant_art.ToString();

            var tempRubros = (from rubros in db.Rubros select rubros);
            cant_rubros = tempRubros.Count();

            mostrar_rubros.InnerHtml = cant_rubros.ToString();

            var tempClientes = (from client in db.Clientes select client);
            cant_cli = tempClientes.Count();

            mostrar_clientes.InnerHtml = cant_cli.ToString();
        }
        catch (Exception) {
            throw;
        }
    }

}