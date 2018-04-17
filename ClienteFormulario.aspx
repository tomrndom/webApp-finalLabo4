<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ClienteFormulario.aspx.cs" Inherits="ClienteFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">        
    <h2 runat="server">Clientes</h2>
    
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2 id="titulo" runat="server"></h2>
                </div>
                <div class="body">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>Razón Social</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtNombre" runat="server" style="width: 100%;"/>    
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:Label>CUIT</asp:Label>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:TextBox ID="txtCUIT" runat="server" CssClass="input" style="width: 100%;" />    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCUIT" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                            <asp:RegularExpressionValidator ID="RegularFieldValidatorCUIT" runat="server" ControlToValidate="txtCUIT" ValidationExpression="^[0-9]{2}-[0-9]{8}-[0-9]$" ErrorMessage="* El CUIT ingresado no es válido" Display="Dynamic" CssClass="font-bold col-red"></asp:RegularExpressionValidator>
                        </div>
                    </div>                                        
                    <asp:Label><h3>Domicilio</h3></asp:Label>                    
                    <div class="row">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                            <asp:Label>Calle</asp:Label>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <asp:TextBox ID="txtCalle" runat="server" CssClass="input" style="width: 100%;" />    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCalle" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                            <asp:Label>Nro</asp:Label>
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                            <asp:TextBox ID="txtNro" runat="server" CssClass="input" style="width: 100%;" />    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNro" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>                                                                                    
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                            <asp:Label>Localidad</asp:Label>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <asp:TextBox ID="txtLocalidad" runat="server" CssClass="input" style="width: 100%;" />    
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLocalidad" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        </div>
                    </div>                    

                    <input type="button" value="Geoposicionar" onclick="codeAddress()" class="btn bg-blue actions waves-effect" />
                    
                    <asp:Label CssClass="m-l-20 font-bold" runat="server">Si la dirección no coincide con la ubicación, puede modificarlo manualmente.</asp:Label>

                    <asp:HiddenField ID="hiddenLat" ClientIDMode="Static" runat="server" />
                    <asp:HiddenField ID="hiddenLng" ClientIDMode="Static" runat="server" />                    
                    <asp:CustomValidator ID="validaGeo" runat="server" ErrorMessage="* Debe ubicar su domicilio en el mapa." Display="Dynamic" CssClass="font-bold col-red" OnServerValidate="validaGeo_ServerValidate"></asp:CustomValidator>

                    <br /><br />

                    <div id="googleMap" style="height: 40vh;">

                    </div>

                    <br />

                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" CssClass="btn bg-blue actions waves-effect" />

                    <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" CausesValidation="false" CssClass="btn bg-blue actions waves-effect" />
                                                          
                </div>
            </div>
        </div>
    </div>

</asp:Content>

