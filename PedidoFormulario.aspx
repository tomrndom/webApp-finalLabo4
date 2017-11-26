<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PedidoFormulario.aspx.cs" Inherits="PedidoFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                            <asp:Label>Número de Pedido</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:TextBox ID="txtNroPedido" runat="server" style="width: 100%; readonly"/>    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNroPedido" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Fecha del Pedido</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:TextBox ID="txtPedidoFecha" runat="server" TextMode="Date" style="width: 100%;"/>                             
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtPedidoFecha" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Cliente</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:DropDownList ID="ddlCliente" runat="server" DataSourceID="SqlDataSource1" DataTextField="razonSocial" DataValueField="id_cliente" CssClass="input" AppendDataBoundItems="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TrabajoFinalLabo4ConnectionString %>" SelectCommand="SELECT * FROM [Cliente]"></asp:SqlDataSource>                            
                            <asp:RequiredFieldValidator ID="rfvCliente" runat="server" ControlToValidate="ddlCliente" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlEstado" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Fecha Estimada de Entrega</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:TextBox ID="txtFechaEstimada" runat="server" TextMode="Date" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFechaEstimada" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <br />


                    <!-- DataGrid pedidoVentaDetalle -->
                    <div class="row">
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                            <h3>Articulos del Pedido</h3>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:LinkButton ID="btnAgregaArticulo" runat="server" OnClick="btnAgregaArticulo_Click" CssClass="btn bg-blue actions waves-effect" Text="Agregar Articulo &nbsp;<i class='material-icons'>add_box</i>"/>
                        </div>
                    </div>     
                    
                    <asp:GridView ID="gridDetallePedidoVenta" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>                  
                    


                    <br /><br />
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:Label>Sub Total</asp:Label>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:TextBox ID="txtSubTotal" runat="server" CssClass="input" style="width: 100%;" />    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubTotal" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>                    
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:Label>Gastos de Envio</asp:Label>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:TextBox ID="txtGastosEnvio" runat="server" CssClass="input" style="width: 100%;" />    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGastosEnvio" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>                    
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:Label>Monto Total</asp:Label>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <asp:TextBox ID="txtTotal" runat="server" CssClass="input" style="width: 100%;" />    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTotal" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>                                          
                    <br />                                        

                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" CssClass="btn bg-blue actions waves-effect" />
                                                          
                </div>
            </div>
        </div>
    </div>
</asp:Content>

