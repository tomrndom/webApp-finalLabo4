<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Pedidos.aspx.cs" Inherits="Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Pedidos</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Lista de Pedidos
                        <asp:LinkButton ID="btnNuevoPedido" runat="server" OnClick="btnNuevoPedido_Click" CssClass="btn bg-blue actions waves-effect pull-right" Text="Nuevo Pedido &nbsp;<i class='material-icons'>add_box</i>"/>
                    </h2>
                    <br />
                </div>
                <div class="body">
                    <asp:GridView ID="gridPedidos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                        DataKeyNames="id_cliente" BorderStyle="None" BorderColor="#CCCCCC" GridLines="Horizontal" CssClass="table table-striped" Style="margin: 0 auto" >
                        <Columns>
                            <asp:BoundField DataField="fechaEstimadaEntrega" HeaderText="fechaEstimadaEntrega" />
                            
                            <asp:BoundField DataField="estado" HeaderText="estado" />
                            <asp:BoundField DataField="entregado" HeaderText="entregado" />
                            <asp:BoundField DataField="fechaPedido" HeaderText="fechaPedido" />
                            <asp:BoundField DataField="subTotal" HeaderText="subTotal" />
                            <asp:BoundField DataField="montoTotal" HeaderText="montoTotal" />
                            <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnBorrar" Text="<i class='material-icons'>delete</i>" runat="server" OnClientClick="return confirm('¿Esta seguro que quiere borrar a este cliente?')" OnCommand="btnBorrar_Command"  CommandArgument='<%# Eval("id_cliente") %>' ImageAlign="Left"></asp:LinkButton>                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditar" Text="<i class='material-icons'>create</i>" runat="server" OnCommand="btnEditar_Command" CommandArgument='<%# Eval("id_pedidoVenta") %>'></asp:LinkButton>                                
                            </ItemTemplate>
                            </asp:TemplateField>                            
                        </Columns>
                    </asp:GridView>                     
                    <asp:label ID="lblNoPedidos" runat="server" text="Este cliente no tiene ningún pedido realizado en su historial" Visible="false"></asp:label>                      
                    <br /><br />
                    <asp:LinkButton ID="btnVolver" runat="server" CausesValidation="false" OnClick="btnVolver_Click" Visible="false" CssClass="btn bg-blue actions waves-effect pull-left" Text="Volver"/>

                    
                    <br />
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Laboratorio4ConnectionString %>" SelectCommand="SELECT * FROM [PedidoVenta]"></asp:SqlDataSource>
    </div>
</asp:Content>