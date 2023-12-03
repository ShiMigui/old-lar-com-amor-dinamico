<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="animais.aspx.cs" Inherits="lar_com_amor.animais2" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lar com amor | Animais</title>
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



                <section id="campo-navegacao" class="flex justEnd alignCenter">
                    <nav ativo="false">
                        <a href="./animais.aspx" ativo="true">Animais</a>
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

        <main class="limiter">
            <article class="content-box flex alignEnd" id="campo-pesquisa">
                <div class="input-line full-width">
                    <asp:TextBox runat="server" id="inpPesquisa" CssClass="input-line-100"></asp:TextBox>
                    <asp:ImageButton ImageUrl="./img/icons/search.png" AlternateText="Íconde de lupa para pesquisa" runat="server" ID="btnPesquisa" OnClick="btnPesquisa_Click" />
                </div>
                <div class="grid4 full-width">
                    <div class="itemForm">
                        <label for="selGenero">Gênero</label>
                        <asp:DropDownList runat="server" ID="selGenero" AutoPostBack="true">
                            <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Macho" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Fêmea" Value="F"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="itemForm">
                        <label for="selEspecie">Espécie</label>
                        <asp:DropDownList runat="server" ID="selEspecie" AutoPostBack="true" OnSelectedIndexChanged="selEspecie_SelectedIndexChanged">
                            <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="itemForm">
                        <label for="selRaca">Raça</label>
                        <asp:DropDownList runat="server" ID="selRaca" AutoPostBack="true" OnSelectedIndexChanged="selRaca_SelectedIndexChanged">
                            <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="itemForm">
                        <label for="selPorte">Porte</label>
                        <asp:DropDownList runat="server" ID="selPorte">
                            <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </article>
            <article class="content-box">
                <asp:Literal runat="server" ID="litAnimais"></asp:Literal>
            </article>
        </main>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>
            </section>
        </footer>

        <script src="./script/master.js"></script>
        <script src="./script/header.js"></script>
    </form>
</body>
</html>
