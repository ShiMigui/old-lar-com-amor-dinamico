<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="animal.aspx.cs" Inherits="lar_com_amor.classes.animal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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

                    <a href="./perfil.aspx" id="account" class="flex alignCenter">Entrar
                    <img src="./img/icons/account.png" alt="ícone de login" />
                    </a>

                    <img id="arrow-down" src="./img/icons/arrow-down.png" alt="ícone de seta para baixo" />
                </section>
            </section>
        </header>

        <main class="limiter">
            <article class="content-box flex" id="anuncio-panel">
                <section id="left-panel">
                    <asp:Image ID="imgAnimal" runat="server" CssClass="animalPhoto" />
                    <%--<a href="./organizacao.aspx" cd="" class="organizacaoAnuncio">
                        <div class="images">
                            <img class="organizacaoPhoto" src="" alt=""/></div>
                        <div class="texts">
                            <h4>Nome</h4>
                            <p>cidade, UF</p>
                            <p class="link textEnd">ver mais</p>
                        </div>
                    </a>--%>
                    <asp:Literal runat="server" ID="litOrganizacao"></asp:Literal>
                </section>
                <section id="right-panel" class="form">
                    <div class="grid2">
                        <div class="itemForm">
                            <label for="inpNome">Nome</label>
                            <asp:TextBox ID="inpNome" Visible="false" runat="server"></asp:TextBox>
                            <asp:Literal Text="" ID="litNome" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="inpNascimento">Nascimento</label>
                            <asp:TextBox ID="inpNascimento" TextMode="Date" Visible="false" runat="server"></asp:TextBox>
                            <asp:Literal Text="" ID="litNascimento" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="chkCastrado">Castrado</label>
                            <asp:CheckBox ID="chkCastrado" Visible="false" runat="server" />
                            <asp:Literal Text="" ID="litCastrado" runat="server" />
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
                            <asp:DropDownList ID="selGenero" Visible="false" runat="server"></asp:DropDownList>
                            <asp:Literal Text="" ID="litGenero" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="selEspecie">Espécie</label>
                            <asp:DropDownList ID="selEspecie" Visible="false" runat="server"></asp:DropDownList>
                            <asp:Literal Text="" ID="litEspecie" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="selRaca">Raça</label>
                            <asp:DropDownList ID="selRaca" Visible="false" runat="server"></asp:DropDownList>
                            <asp:Literal Text="" ID="litRaca" runat="server" />
                        </div>
                        <div class="itemForm">
                            <label for="selPorte">Porte</label>
                            <asp:DropDownList ID="selPorte" Visible="false" runat="server"></asp:DropDownList>
                            <asp:Literal Text="" ID="litPorte" runat="server" />
                        </div>
                    </div>

                    <div class="buttons">
                        <%--<a href="forms.aspx" class="button">Pedir adoção</a>--%>
                        <asp:Literal Text="" ID="litBtns" runat="server" />
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

        <script src="./script/master.js"></script>
        <script src="./script/animal.js" id="script-page"></script>
        <script src="./script/header.js"></script>
    </form>
</body>
</html>
