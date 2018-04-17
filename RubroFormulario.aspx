<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RubroFormulario.aspx.cs" Inherits="RubroFormulario" Explicit="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">        

    <div data-notify="container" class="bootstrap-notify-container alert alert-dismissible alert-danger p-r-35 animated fadeInDown" role="alert" data-notify-position="bottom-right" style="display: inline-block; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out; z-index: 1031; bottom: 260px; right: 20px;"><button type="button" aria-hidden="true" class="close" data-notify="dismiss" style="position: absolute; right: 10px; top: 5px; z-index: 1033;">×</button><span data-notify="icon"></span> <span data-notify="title"></span> <span data-notify="message">Error al guardar los datos</span><a href="#" target="_blank" data-notify="url"></a></div>
    
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
                            <asp:DropDownList ID="ddlRubroPri" runat="server"  >  
                            </asp:DropDownList>                    
                        </div>
                    </div>

                    <br />
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" CssClass="btn bg-blue actions waves-effect" />

                    <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" CausesValidation="false" CssClass="btn bg-blue actions waves-effect" />

                    <br />
                    <br />
                    <asp:label ID="lblError" runat="server" Visible="false" CssClass="font-bold col-red"></asp:label>                      
                    <br />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

