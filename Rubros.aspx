<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Rubros.aspx.cs" Inherits="Rubros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Rubros</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Lista de Rubros
                        <asp:LinkButton ID="btnNuevoRubro" runat="server" OnClick="btnNuevoRubro_Click" CssClass="btn bg-blue actions waves-effect pull-right" Text="Nuevo Rubro &nbsp;<i class='material-icons'>add_box</i>"/>
                    </h2>                 
                    <br />
                </div>
                <div class="body">
                    <asp:GridView ID="gridRubros" runat="server" AutoGenerateColumns="False" DataKeyNames="id_rubro" DataSourceID="SqlDataSource1"
                        AllowPaging="True" AllowSorting="True" BorderStyle="None" BorderColor="#CCCCCC" GridLines="Horizontal" CssClass="table table-striped" Style="margin: 0 auto">
                        <Columns>
                            <asp:BoundField DataField="id_rubro" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_rubro" />
                            <asp:BoundField DataField="id_rubroPrimario" HeaderText="ID Padre" SortExpression="id_rubroPrimario" />
                            <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo" />
                            <asp:BoundField DataField="denominacion" HeaderText="Denominación" SortExpression="denominacion" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditar" Text="<i class='material-icons'>create</i>" runat="server" OnCommand="btnEditar_Command" CommandArgument='<%# Eval("id_rubro") %>'></asp:LinkButton>                                
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnBorrar" Text="<i class='material-icons'>delete</i>" runat="server" OnClientClick="return confirm('¿Esta seguro que quiere borrar a este cliente?')" OnCommand="btnBorrar_Command"  CommandArgument='<%# Eval("id_rubro") %>' ImageAlign="Left"></asp:LinkButton>                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>               
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TrabajoFinalLabo4ConnectionString %>" SelectCommand="SELECT * FROM [Rubro]"></asp:SqlDataSource>
    </div>
</asp:Content>

