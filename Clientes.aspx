<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Clientes.aspx.cs" Inherits="Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Clientes</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Lista de Clientes
                        <asp:LinkButton ID="btnNuevoCliente" runat="server" OnClick="btnNuevoCliente_Click" CssClass="btn bg-blue actions waves-effect pull-right" Text="Nuevo Cliente &nbsp;<i class='material-icons'>add_box</i>"/>
                    </h2>                 
                    <br />
                </div>
                <div class="body">
                    <asp:GridView ID="gridClientes" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                        DataKeyNames="id_cliente" BorderStyle="None" BorderColor="#CCCCCC" GridLines="Horizontal" CssClass="table table-striped" Style="margin: 0 auto" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="razonSocial" HeaderText="Razón Social" SortExpression="razonSocial" />
                            <asp:BoundField DataField="cuit" HeaderText="CUIT" SortExpression="cuit" />
                            <asp:BoundField DataField="saldo" HeaderText="Saldo" SortExpression="saldo" />
                            <asp:BoundField DataField="calle" HeaderText="Calle" SortExpression="calle" />
                            <asp:BoundField DataField="numero" HeaderText="Número" SortExpression="numero" />
                            <asp:BoundField DataField="localidad" HeaderText="Localidad" SortExpression="localidad" />
                            <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditar" Text="<i class='material-icons'>create</i>" runat="server" OnCommand="btnEditar_Command" CommandArgument='<%# Eval("id_cliente") %>'></asp:LinkButton>                                
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnBorrar" Text="<i class='material-icons'>delete</i>" runat="server" OnClientClick="return confirm('¿Esta seguro que quiere borrar a este cliente?')" OnCommand="btnBorrar_Command"  CommandArgument='<%# Eval("id_cliente") %>' ImageAlign="Left"></asp:LinkButton>                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnVerPedidos" runat="server" CssClass="btn bg-blue actions waves-effect align-center" Text="Ver Pedidos" OnCommand="btnVerPedidos_Command" CommandArgument='<%# Eval("id_cliente") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>                            
                        </Columns>
                    </asp:GridView>                    
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Laboratorio4ConnectionString %>" SelectCommand="SELECT Cliente.id_cliente, Cliente.razonSocial, Cliente.cuit, Cliente.saldo, Cliente.id_domicilio, Cliente.id_domicilioNegocio, Domicilio.id_domicilio AS Expr1, Domicilio.calle, Domicilio.numero, Domicilio.localidad, Domicilio.latitud, Domicilio.longitud FROM Cliente INNER JOIN Domicilio ON Cliente.id_domicilio = Domicilio.id_domicilio AND Cliente.id_domicilioNegocio = Domicilio.id_domicilio"></asp:SqlDataSource>
    </div>
</asp:Content>

