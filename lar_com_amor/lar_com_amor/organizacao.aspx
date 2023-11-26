<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="organizacao.aspx.cs" Inherits="lar_com_amor.organizacao" %>

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
                <section id="right-panel" class="form">
                    <tab-list class="tab-list-processed">
                        <asp:Literal runat="server" ID="litTabs" Text=""></asp:Literal>
                    </tab-list>
                    <asp:Panel runat="server" Visible="false" ID="pnlPerfil">
                        <div class="grid2">
                            <div class="itemForm">
                                <label for="inpNome">Nome</label>
                                <asp:TextBox ID="inpNome" runat="server" Text="" require="require" Visible="false"></asp:TextBox>
                                <asp:Literal runat="server" ID="litNome" Text="" Visible="false"></asp:Literal>
                            </div>
                            <div class="itemForm">
                                <label for="inpTelefone">Telefone</label>
                                <asp:TextBox runat="server" ID="inpTelefone" Text="" Visible="false"></asp:TextBox>
                                <asp:Literal runat="server" ID="litTelefone" Text="" Visible="false"></asp:Literal>
                            </div>
                        </div>
                        <div class="itemForm">
                            <label for="inpDescricao">Descrição</label>
                            <asp:TextBox runat="server" ID="inpDescricao" TextMode="MultiLine" Text="" Visible="false"></asp:TextBox>
                            <asp:Literal runat="server" ID="litDescricao" Text="" Visible="false"></asp:Literal>
                        </div>
                        <div class="grid2">
                            <div class="flexColumn">
                                <p class="lbl">Localização</p>
                                <div class="input-line alignCenter">
                                    <label for="inpCep" class="input-line-25">CEP</label>
                                    <asp:TextBox runat="server" ID="inpCep" Text="" Visible="false" OnTextChanged="inpCep_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    <asp:Literal runat="server" ID="litCep" Text="" Visible="false"></asp:Literal>
                                </div>
                                <div class="input-line alignCenter">
                                    <span class="input-line-25 lbl">Rua</span><p>
                                        <asp:Literal runat="server" ID="litRua"></asp:Literal>
                                    </p>
                                </div>
                                <div class="input-line alignCenter">
                                    <span class="input-line-25 lbl">Cidade</span><p>
                                        <asp:Literal runat="server" ID="litCidade"></asp:Literal>
                                    </p>
                                </div>
                                <div class="input-line alignCenter">
                                    <span class="input-line-25 lbl">Estado</span><p>
                                        <asp:Literal runat="server" ID="litUf"></asp:Literal>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <asp:Panel runat="server" ID="buttons" CssClass="buttons" Visible="false">
                            <asp:Button runat="server" ID="btnSalvar" Text="Salvar alterações" OnClick="btnSalvar_Click" />
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlForms" Visible="false">
                        <asp:Literal runat="server" ID="litForms" Text=""></asp:Literal>
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

        <asp:Literal runat="server" ID="litMsg"></asp:Literal>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>
            </section>
        </footer>

        <script src="./script/master.js"></script>
        <script src="./script/organizacao.js" id="script-page"></script>
        <script src="./script/tabController.js" id="tab-controller"></script>
        <script src="./script/header.js"></script>
        <script src="./script/message.js"></script>
    </form>

</body>
</html>
