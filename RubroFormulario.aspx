<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RubroFormulario.aspx.cs" Inherits="RubroFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>Rubros</h2>

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
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtCodigo" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>    
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Denominación</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtDenominacion" runat="server" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDenominacion" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Rubro Primario</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">                            
                            <asp:DropDownList ID="ddlRubroPri" runat="server" DataSourceID="SqlDataSource1" DataTextField="denominacion" DataValueField="id_rubro" CssClass="input" AppendDataBoundItems="true">  
                            </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TrabajoFinalLabo4ConnectionString %>" SelectCommand="SELECT * FROM [Rubro]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="false" Name="Habilitado"  Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>                    
                        </div>
                    </div>

                    <br />
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" CssClass="btn bg-blue actions waves-effect" />

                </div>
            </div>
        </div>
    </div>

</asp:Content>

