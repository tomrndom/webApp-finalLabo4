<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PedidoFormulario.aspx.cs" Inherits="PedidoFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 runat="server">Pedidos</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2 id="titulo" runat="server"></h2>
                </div>
                <div class="body">
                    <div class="row">                                       
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Fecha del Pedido</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:TextBox ID="txtPedidoFecha" runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="pedido" ID="rfvNombre" runat="server" ControlToValidate="txtPedidoFecha" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Cliente</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:DropDownList ID="ddlCliente" runat="server" autopostback="true" CssClass="input" AppendDataBoundItems="true" OnSelectedIndexChanged="buscarDomicilio"></asp:DropDownList>                            
                            <asp:RequiredFieldValidator ValidationGroup="pedido" ID="rfvCliente" runat="server" ControlToValidate="ddlCliente" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Domicilio</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:DropDownList ID="ddlDomicilio"  runat="server" CssClass="input" AppendDataBoundItems="true"></asp:DropDownList>                            
                            <asp:RequiredFieldValidator ValidationGroup="pedido" ID="rfvDomicilio" runat="server" ControlToValidate="ddlDomicilio" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Estado</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:DropDownList ID="ddlEstado" runat="server">
                                <asp:ListItem Value="Pendiente" Text="Pendiente"></asp:ListItem>
                                <asp:ListItem Value="Enviado" Text="Enviado"></asp:ListItem>
                                <asp:ListItem Value="Entregado" Text="Entregado"></asp:ListItem>
                                <asp:ListItem Value="Anulado" Text="Anulado"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ValidationGroup="pedido" ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlEstado" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Fecha Estimada de Entrega</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:TextBox ID="txtFechaEstimada" runat="server" TextMode="Date" Style="width: 100%;" />
                            <asp:RequiredFieldValidator ValidationGroup="pedido" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFechaEstimada" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>

                    <!-- DataGrid pedidoVentaDetalle -->
                    <div class="row">
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                            <h3>Articulos del Pedido</h3>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:DropDownList CssClass="" AutoPostBack="true" ID="ddlArticulos" runat="server" OnSelectedIndexChanged="BuscarPrecio"></asp:DropDownList>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:TextBox ID="txtCantidad" runat="server" placeholder="Cantidad"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="agregarItem" ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCantidad" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Precio Unitario &nbsp;</asp:Label>
                            <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="agregarItem" ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPrecio" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:LinkButton ID="btnAgregaArticulo" ValidationGroup="agregarItem" runat="server" OnClick="btnAgregaArticulo_Click" CssClass="btn bg-blue actions waves-effect" Text="Agregar Articulo &nbsp;<i class='material-icons'>add_box</i>" />
                        </div>
                    </div>

                

                <asp:GridView ID="gridDetallePedidoVenta"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                    DataKeyNames="id_pedidoVentaDetalle" EnableModelValidation="True"
                    BorderStyle="None" BorderColor="#CCCCCC" GridLines="Horizontal" CssClass="table table-striped" Style="margin: 0 auto" >                    
                    
                    <Columns>
                        <asp:BoundField DataField="id_articulo" HeaderText="ID" ItemStyle-HorizontalAlign="Center" ShowHeader="false">
                            <ItemStyle CssClass="hide" />
                            <HeaderStyle CssClass="hide" />
                        </asp:BoundField>

                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                        <asp:BoundField DataField="denominacion" HeaderText="Descripción" />

                    </Columns>
                </asp:GridView>



                <br />
                <br />
                
                <div class="row">                    
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                        <asp:Label>Sub Total</asp:Label>
                        <asp:TextBox ID="txtSubTotal" runat="server" CssClass="input" />
                        <asp:RequiredFieldValidator ValidationGroup="pedido" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubTotal" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                    </div>                    
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                        <asp:Label>Gastos de Envio</asp:Label>
                        <asp:TextBox ID="txtGastosEnvio" runat="server" CssClass="input" />
                        <asp:RequiredFieldValidator ValidationGroup="pedido" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGastosEnvio" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                    </div>
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                        <asp:Label>Monto Total</asp:Label>
                        <asp:TextBox ID="txtTotal" runat="server" CssClass="input" />
                        <asp:RequiredFieldValidator ValidationGroup="pedido" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTotal" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                    </div>
                </div>
                <br />

                <asp:Button ID="btnGuardar" ValidationGroup="pedido" runat="server" OnClick="btnGuardar_Click" Text="Guardar" CssClass="btn bg-blue actions waves-effect" />


                    </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

