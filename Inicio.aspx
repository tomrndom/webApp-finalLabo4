<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Inicio</h2>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Bienvenido
                    </h2>                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box bg-blue hover-expand-effect">
                                 <div class="icon">
                            <i class="material-icons">local_shipping</i>
                            </div>
                            <div class="content">
                                <div class="text">Pedidos Activos</div>
                                <div class="number">10</div>
                            </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box bg-red hover-expand-effect">
                                <div class="icon">
                                    <i class="material-icons">layers</i>
                                </div>
                                <div class="content">
                                    <div class="text">Articulos</div>
                                    <div class="number">2</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box bg-light-green hover-expand-effect">
                                <div class="icon">
                                    <i class="material-icons">library_books</i>
                                </div>
                                <div class="content">
                                    <div class="text">Rubros</div>
                                    <div class="number">6</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box bg-orange hover-expand-effect">
                                <div class="icon">
                                    <i class="material-icons">group</i>
                                </div>
                                <div class="content">
                                    <div class="text">Clientes</div>
                                    <div class="number">5</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    
</asp:Content>

