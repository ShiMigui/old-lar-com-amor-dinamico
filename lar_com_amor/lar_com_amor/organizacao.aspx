<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="organizacao.aspx.cs" Inherits="lar_com_amor.organizacao" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lar com amor | Organização</title>
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

        <main class="limiter">


            <article class="content-box flex" id="anuncio-panel">
                <section id="left-panel">
                    <asp:Literal runat="server" ID="litFoto"></asp:Literal>
                </section>
                <section id="right-panel" class="form full-width">
                    <tab-list class="tab-list-processed">
                        <asp:Literal runat="server" ID="litTabs" Text=""></asp:Literal></tab-list>
                    <asp:Panel runat="server" Visible="false" ID="pnlPerfil">
                        <div class="grid2">
                            <div class="itemForm">
                                <label for="inpNome">Nome</label>
                                <p><asp:Literal runat="server" ID="litNome" Text=""></asp:Literal></p>
                            </div>
                            <div class="itemForm">
                                <label for="inpTelefone">Telefone</label>
                                <p><asp:Literal runat="server" ID="litTelefone" Text=""></asp:Literal></p>
                            </div>
                            <div class="itemForm">
                                <label for="inpEmail">Email</label>
                                <p><asp:Literal runat="server" ID="litEmail" Text=""></asp:Literal></p>
                            </div>
                        </div>
                        <div class="itemForm">
                            <label for="inpDescricao">Descrição</label>
                            <p><asp:Literal runat="server" ID="litDescricao" Text=""></asp:Literal></p>
                        </div>
                        <div class="space-div"></div>
                        <div class="flexColumn alignStart">
                            <div class="full-width">
                                <label for="inpCep" class="input-line-25">CEP</label>
                                <p><asp:Literal runat="server" ID="litCep" Text=""></asp:Literal></p>
                            </div>
                            <div class="full-width">
                                <span class="input-line-25 lbl">Rua</span>
                                <p><asp:Literal runat="server" ID="litRua"></asp:Literal></p>
                            </div>
                            <div class="full-width">
                                <span class="input-line-25 lbl">Cidade</span>
                                <p><asp:Literal runat="server" ID="litCidade"></asp:Literal></p>
                            </div>
                            <div class="full-width">
                                <span class="input-line-25 lbl">Estado</span>
                                <p><asp:Literal runat="server" ID="litUf"></asp:Literal></p>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlAnimais" Visible="false">
                        <asp:Literal runat="server" ID="litAnimais" Text=""></asp:Literal>

                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlEventos" Visible="false">
                        <asp:Literal runat="server" ID="litEventos" Text=""></asp:Literal>

                    </asp:Panel>
                </section>
            </article>
        </main>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>
            </section>
        </footer>

        <script src="./script/master.js"></script>
        <script src="./script/table.js"></script>
        <script src="./script/tabController.js"></script>
        <script src="./script/header.js"></script>
    </form>
</body>
</html>
