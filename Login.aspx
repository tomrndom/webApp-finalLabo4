<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="index" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Pedidos - Login</title>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />    
    <!-- Favicon-->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Core Css -->
    <link href="../../plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- Waves Effect Css -->
    <link href="../../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="../../css/style.css" rel="stylesheet" />
</head>

<body class="login-page">
    <form id="form1" runat="server">
    <div>
        <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Laboratorio<b>4</b></a>
            <small>Sistema de Gestión de Pedidos</small>
        </div>
        <div class="card">
            <div class="body">                
                    <div class="msg">Ingrese sus datos para iniciar sesión</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <!-- Usuario -->
                        <div class="form-line">
                            <asp:TextBox ID="txtUsuario" runat="server" name="usuario" placeholder="Usuario" class="form-control" autofocus/><br />                            
                        </div>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />                                                        
                            <asp:CustomValidator ID="cstvUsuario" runat="server" OnServerValidate="cstvUsuario_ServerValidate" ErrorMessage="* El usuario no existe" Display="Dynamic" CssClass="font-bold col-red" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <!-- Contraseña -->
                        <div class="form-line">                            
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Contraseña" name="password" TextMode="Password" CssClass="form-control"/><br />                            
                        </div>
                        <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ControlToValidate="txtPassword" ErrorMessage="* Este campo es obligatorio" Display="Dynamic" CssClass="font-bold col-red" />
                        <asp:CustomValidator ID="cstvContrasenia" runat="server" OnServerValidate="cstvContrasenia_ServerValidate" ErrorMessage="* La contraseña no es correcta" Display="Dynamic" CssClass="font-bold col-red" />
                    </div>
                    <div class="row">
                        <div class="col-xs-8 p-t-5">                            
                        </div>
                        <div class="col-xs-4">                            
                            <asp:Button ID="btnLogin" runat="server" Text="ENTRAR" OnClick="btnLogin_Click" CssClass="btn btn-block bg-pink waves-effect"/><br /><br />
                        </div>
                    </div>                
            </div>
        </div>
    </div>
    </div>
    </form>

    <!-- Jquery Core Js -->
    <script src="plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="js/admin.js"></script>
    <script src="js/pages/examples/sign-in.js"></script>
</body>
</html>
