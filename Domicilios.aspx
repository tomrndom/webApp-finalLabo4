<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Domicilios.aspx.cs" Inherits="Domicilios"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 runat="server">Domicilios</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 pull-left">
                        Lista de Domicilios
                            </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                        <asp:LinkButton ID="btnVolver" runat="server" CausesValidation="false" OnClick="btnVolver_Click" CssClass="btn bg-blue actions waves-effect pull-right" Text="Volver"/>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                        <asp:LinkButton ID="btnNuevoDomicilio" runat="server" OnClick="btnNuevoDomicilio_Click" CssClass="btn bg-blue actions waves-effect pull-right" Text="Nuevo Domicilio &nbsp;<i class='material-icons'>add_box</i>"/>
                        </div>
                    </h2>
                    <br />
                </div>
                <div class="body">
                    <asp:GridView ID="gridDomicilios" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                        DataKeyNames="id_domicilio" BorderStyle="None" BorderColor="#CCCCCC" GridLines="Horizontal" CssClass="table table-striped" Style="margin: 0 auto" >
                        <Columns>
                            <asp:BoundField DataField="calle" HeaderText="Calle" />
                            
                            <asp:BoundField DataField="numero" HeaderText="Número" />
                            <asp:BoundField DataField="localidad" HeaderText="Localidad" />                            
                            <asp:BoundField DataField="tipo_domicilio" HeaderText="Tipo de Domicilio" />                            
                            <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditar" Text="<i class='material-icons'>create</i>" runat="server" OnCommand="btnEditarDomicilio_Command" CommandArgument='<%# Eval("id_domicilio") %>'></asp:LinkButton>                                
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnVerMapa" runat="server" CssClass="btn bg-blue actions waves-effect align-center" Text="Ver en Mapa" OnCommand="btnVerMapa_Command" CommandArgument='<%# Eval("id_domicilio") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>                           
                        </Columns>
                    </asp:GridView>   
                </div>                
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Laboratorio4ConnectionString %>" SelectCommand="SELECT * FROM [Domicilio]"></asp:SqlDataSource>
</asp:Content>

