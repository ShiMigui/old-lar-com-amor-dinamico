<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="animal.aspx.cs" Inherits="lar_com_amor.classes.animal" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lar com amor | Animal</title>
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
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor" /></a>

                <section id="pesquisa">
                    <input type="text" class="input" />
                    <input type="image" src="./img/icons/search.png" alt="Ícone de pesquisa" />
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

        <main class="limiter">
            <article class="content-box flex" id="anuncio-panel">
                <section id="left-panel">
                    <asp:Image ID="imgAnimal" runat="server" CssClass="animalPhoto" />
                    <asp:Literal runat="server" ID="litOrganizacao"></asp:Literal>
                </section>
                <section id="right-panel" class="form">
                    <div class="grid2">
                        <div class="itemForm">
                            <label for="inpNome">Nome</label>
                            <asp:TextBox ID="inpNome" MaxLength="40" Visible="false" runat="server"></asp:TextBox>
                            <asp:Literal Text="" ID="litNome" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="inpNascimento">Nascimento</label>
                            <asp:TextBox ID="inpNascimento" TextMode="Date" Visible="false" runat="server"></asp:TextBox>
                            <asp:Literal Text="" ID="litNascimento" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="chkCastrado">Castrado</label>
                            <p class="flex alignCenter justCenter">
                                <asp:CheckBox ID="chkCastrado" Width="10%" Visible="false" runat="server" />
                                <asp:Literal Text="" ID="litCastrado" runat="server" />
                            </p>
                        </div>
                    </div>
                    <div class="itemForm">
                        <label for="inpDescricao">Descrição</label>
                        <asp:TextBox ID="inpDescricao" TextMode="MultiLine" Visible="false" runat="server"></asp:TextBox>
                        <asp:Literal Text="" ID="litDescricao" runat="server" />
                    </div>
                    <div class="grid2">
                        <div class="itemForm">
                            <label for="selGenero">Gênero</label>
                            <asp:DropDownList ID="selGenero" Visible="false" runat="server">
                                <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Macho" Value="M"></asp:ListItem>
                                <asp:ListItem Text="Fêmea" Value="F"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Literal Text="" ID="litGenero" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="selEspecie">Espécie</label>
                            <asp:DropDownList ID="selEspecie" Visible="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="selEspecie_SelectedIndexChanged">
                                <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Literal Text="" ID="litEspecie" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="selRaca">Raça</label>
                            <asp:DropDownList ID="selRaca" Visible="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="selRaca_SelectedIndexChanged">
                                <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Literal Text="" ID="litRaca" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="selPorte">Porte</label>
                            <asp:DropDownList ID="selPorte" Visible="false" runat="server">
                                <asp:ListItem Text="Selecione" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Literal Text="" ID="litPorte" runat="server" />
                        </div>
                    </div>

                    <div class="buttons flex">
                        <%--<a href="forms.aspx" class="button">Pedir adoção</a>--%>
                        <asp:HyperLink ID="lnkBtn" runat="server" CssClass="button">Pedir animal</asp:HyperLink>
                        <asp:Button runat="server" ID="btnAdicionar" Visible="false" Text="Adicionar" OnClick="btnAdicionar_Click" />
                        <asp:Button runat="server" ID="btnExcluir" Visible="false" Text="Excluir" OnClick="btnExcluir_Click" />
                        <asp:Button runat="server" ID="btnSalvar" Visible="false" Text="Salvar" OnClick="btnSalvar_Click" />
                    </div>
                </section>
            </article>
        </main>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor" /></a>
            </section>
        </footer>

        <asp:Literal Text="" ID="litMsg" runat="server"></asp:Literal>

        <script src="./script/master.js"></script>
        <script src="./script/animal.js" id="script-page"></script>
        <script src="./script/header.js"></script>
    </form>
</body>
</html>
