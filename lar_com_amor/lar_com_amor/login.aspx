<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="lar_com_amor.login" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lar com amor | Login</title>
    <link rel="stylesheet" href="./style/global.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,200;1,300;1,400;1,500;1,600;1,700;1,800&amp;display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <main class="grid2 forms alignCenter">
            <div class="flex justCenter">
                <a href="./index.aspx"><img src="./img/icons/logo.png" alt="ícone logotipo"/></a>
            </div>
            <section class="form justCenter">
                <div class="itemForm">
                    <label for="inpLogin">Email ou CNPJ</label>
                    <asp:TextBox runat="server" ID="inpLogin" Text="" required=""></asp:TextBox>
                </div>

                <div class="itemForm">
                    <label for="inpSenha">Senha</label>
                    <asp:TextBox runat="server" ID="inpSenha" Text="" TextMode="Password" required=""></asp:TextBox>
                </div>

                <div class="flexColumn alignEnd">
                    <asp:Button runat="server" ID="btnLogin" Text="Entrar" OnClick="btnLogin_Click"/>
                    <a href="./cadastro.aspx">Cadastre-se</a>
                    <a href="./esqueci-senha.aspx">esqueci a senha</a>
                </div>
            </section>
        </main>

        <asp:Literal runat="server" ID="litMsg" Text=""></asp:Literal>

        <script src="./script/master.js"></script>
        <script src="./script/header.js"></script>
        <script src="./script/message.js"></script>
    </form>
</body>
</html>
