using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOPedidoVentaDetalle
/// </summary>
/// 
[Serializable]
public class DTOPedidoVentaDetalle 
{
    private int _id_pedidoVentaDetalle;
    public int id_pedidoVentaDetalle
    {
        get
        {
            // to do not break SRP it's better to move check logic out of the getter
            return _id_pedidoVentaDetalle;
        }
        set
        {            
            _id_pedidoVentaDetalle = value;
        }
    }

    public int _cantidad;
    public int cantidad
    {
        get
        {
            // to do not break SRP it's better to move check logic out of the getter
            return _cantidad;
        }
        set
        {
            _cantidad = value;
        }
    }

    public decimal subTotal;

    public System.Nullable<double> porcentajeDescuento;

    private int _id_articulo;
    public int id_articulo
    {
        get
        {
            // to do not break SRP it's better to move check logic out of the getter
            return _id_articulo;
        }
        set
        {
            _id_articulo = value;
        }
    }

    private string _denominacion;
    public string denominacion
    {
        get
        {
            // to do not break SRP it's better to move check logic out of the getter
            return _denominacion;
        }
        set
        {
            _denominacion = value;
        }
    }

    public int id_pedidoVenta;
    public DTOPedidoVentaDetalle()
    {
       
}
}