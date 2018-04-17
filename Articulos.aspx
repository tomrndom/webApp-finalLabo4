<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Articulos.aspx.cs" Inherits="Articulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Artículos</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Lista de Artículos
                        <asp:LinkButton ID="btnNuevoArticulo" runat="server" OnClick="btnNuevoArticulo_Click" CssClass="btn bg-blue actions waves-effect pull-right" Text="Nuevo Artículo &nbsp;<i class='material-icons'>add_box</i>"/>
                    </h2>
                    <br />
                </div>
                <div class="body">
                    <asp:GridView ID="gridArticulos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                        DataKeyNames="id_articulo" BorderStyle="None" BorderColor="#CCCCCC" GridLines="Horizontal" CssClass="table table-striped" Style="margin: 0 auto" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo" />
                            <asp:BoundField DataField="denominacion" HeaderText="Artículo" SortExpression="denominacion" />
                            <asp:BoundField DataField="Expr1" HeaderText="Rubro" SortExpression="Expr1" />
                            <asp:BoundField DataField="precioCompra" HeaderText="Saldo" SortExpression="precioCompra" />
                            <asp:BoundField DataField="precioVenta" HeaderText="Calle" SortExpression="precioVenta" />
                            <asp:BoundField DataField="iva" HeaderText="IVA" SortExpression="iva" />                            
                            <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditar" Text="<i class='material-icons'>create</i>" runat="server" OnCommand="btnEditar_Command" CommandArgument='<%# Eval("id_articulo") %>'></asp:LinkButton>                                
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnBorrar" Text="<i class='material-icons'>delete</i>" runat="server" OnClientClick="return confirm('¿Esta seguro que quiere borrar a este artículo?')" OnCommand="btnBorrar_Command"  CommandArgument='<%# Eval("id_articulo") %>' ImageAlign="Left"></asp:LinkButton>                                    
                                </ItemTemplate>
                            </asp:TemplateField>                                
                        </Columns>
                    </asp:GridView>    
                    <br />
                    <br />
                    <asp:label ID="lblError" runat="server" Visible="false" CssClass="font-bold col-red"></asp:label>                      
                    <br />
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Laboratorio4ConnectionString %>" SelectCommand="SELECT Articulo.*, Rubro.denominacion AS Expr1 FROM Articulo INNER JOIN Rubro ON Articulo.id_rubro = Rubro.id_rubro"></asp:SqlDataSource>
    </div>
</asp:Content>

