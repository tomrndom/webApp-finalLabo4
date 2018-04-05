<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ArticuloFormulario.aspx.cs" Inherits="ArticuloFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 runat="server">Articulos</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2 id="titulo" runat="server"></h2>
                </div>
                <div class="body">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Código</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtCodigo" runat="server" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigo" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Denominación</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtDenominacion" runat="server" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="tfvDenominacion" runat="server" ControlToValidate="txtDenominacion" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Precio de Compra</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtPrecioCompra" runat="server" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="rfvPrecioCompra" runat="server" ControlToValidate="txtPrecioCompra" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Precio de Venta</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtPrecioVenta" runat="server" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="rfvPrecioVenta" runat="server" ControlToValidate="txtPrecioVenta" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>IVA</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtIva" runat="server" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="rfvIva" runat="server" ControlToValidate="txtIva" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Rubro</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:DropDownList ID="ddlRubro" runat="server" DataSourceID="SqlDataSource1" DataTextField="denominacion" DataValueField="id_rubro" CssClass="input" Width="240px" AppendDataBoundItems="true">                                
                            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TrabajoFinalLabo4ConnectionString %>" SelectCommand="SELECT * FROM [Rubro]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Habilitado"  Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>   
                            <asp:RequiredFieldValidator ID="rfvRubro" runat="server" ControlToValidate="ddlRubro" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" CssClass="btn bg-blue actions waves-effect" />
                </div>                
            </div>

        </div>        
    </div>
</asp:Content>

