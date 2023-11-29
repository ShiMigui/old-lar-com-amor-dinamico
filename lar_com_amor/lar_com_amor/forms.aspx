<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forms.aspx.cs" Inherits="lar_com_amor.forms" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lar com amor | Formulário</title>
    <link rel="stylesheet" href="./style/global.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,200;1,300;1,400;1,500;1,600;1,700;1,800&amp;display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>

                <section id="pesquisa">
                    <input type="text" class="input">
                    <input type="image" src="./img/icons/search.png" alt="Ícone de pesquisa">
                </section>

                <section id="campo-navegacao" class="flex justEnd alignCenter">
                    <nav ativo="false">
                        <a href="./animais.aspx">Animais</a>
                        <a href="./eventos.aspx">Eventos</a>
                        <a href="./organizacoes.aspx">Organizações</a>
                    </nav>

                    <section id="menu-hamburguer" class="flexColumn square" ativo="false">
                        <div class="line"></div>
                        <div class="line"></div>
                        <div class="line"></div>
                    </section>

                    <asp:Literal Text="" runat="server" ID="litHeader" />
                </section>
            </section>
        </header>

        <main>
            <section class="limiter-700">
                <section id="perguntas" class="flexColumn">
                    <asp:Literal runat="server" ID="litPerguntas" Text=""></asp:Literal>
                </section>
                <div class="space-div"></div>
                <div class="flex justEnd">
                    <asp:Button runat="server" ID="btnEnviar" Text="Enviar" Visible="false" />
                </div>
                <asp:Panel CssClass="flex justCenter alignCenter" runat="server" ID="pnlOrgControll" Visible="false">
                    <asp:Button runat="server" ID="btnAceitar" Text="Aceitar" OnClick="btnAceitar_Click" />
                    <asp:Button runat="server" ID="btnRecusar" Text="Recusar" OnClick="btnRecusar_Click" />
                </asp:Panel>
            </section>
        </main>

        <asp:Literal runat="server" ID="litMsg"></asp:Literal>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>
            </section>
        </footer>
    </form>
    <script src="./script/master.js"></script>
    <script src="./script/header.js"></script>
    <script src="./script/message.js"></script>
</body>
</html>
