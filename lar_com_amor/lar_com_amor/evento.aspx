<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="evento.aspx.cs" Inherits="larcomamor.Evento" %>

<!DOCTYPE html>

<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title link="title" processed="true">Lar com amor | Evento</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="stylesheet" href="./style/global.css" remove="false" link="" processed="true">
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
        <main link="main" processed="true" class="limiter">
            <article class="content-box flex" id="anuncio-panel">
                <section id="left-panel">
                    <asp:Panel ID="pnlEventoUser" runat="server" Visible="true">
                        <asp:Literal ID="litFotoEventoUser" runat="server"></asp:Literal>


                    </asp:Panel>
                    <asp:Panel ID="pnlEventoOrg" runat="server" Visible="false">
                        <asp:Literal ID="lit_foto" runat="server"></asp:Literal>
                        <asp:FileUpload ID="foto" runat="server" name="int" placeholder="Escreva aqui o nome do animal" class="escondido" />
                        <!-- COLOOCAR O ANUNCIO DA ORG !-->
                        <%-- <a href="./organizacao.html" cd="" class="organizacaoAnuncio">
                            <div class="images"><img class="organizacaoPhoto" src="" alt=""></div>
                            <div class="texts">
                                <h4>Nome</h4>
                                <p>cidade, UF</p>
                                <p class="link textEnd">ver mais</p>
                            </div>
                        </a>--%>
                    </asp:Panel>
                </section>
                <section id="right-panel" class="form">
                    <asp:Panel ID="pnlEventoDadosOrg" runat="server" Visible="false">
                        <div class="grid2">
                            <div class="itemForm">
                                <label for="inpNome">Nome</label>
                                <asp:TextBox ID="inpNome" runat="server" type="text" name="inpNome"></asp:TextBox>
                            </div>
                            <div class="itemForm">
                                <label for="selTipo">Tipo de evento</label>
                                <asp:DropDownList ID="DdlTipo" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="grid4">
                            <div class="itemForm">
                                <label for="TxtDtInicio">Data início</label>
                                <asp:TextBox ID="TxtDtInicio" runat="server" type="date"></asp:TextBox>
                            </div>
                            <div class="itemForm">
                                <label for="txtHrInicio">Horário início</label>
                                <asp:TextBox ID="txtHrInicio" runat="server" type="time"></asp:TextBox>
                            </div>
                            <div class="itemForm">
                                <label for="txtDataFinal">Data final</label>
                                <asp:TextBox ID="txtDataFinal" runat="server" type="date"></asp:TextBox>
                            </div>
                            <div class="itemForm">
                                <label for="txtHrFinal">Horário final</label>
                                <asp:TextBox ID="txtHrFinal" runat="server" type="time"></asp:TextBox>
                            </div>
                        </div>
                        <div class="itemForm">
                            <label for="inpDescricao">Descrição</label>
                            <textarea rows="2" id="inpDescricao" runat="server"></textarea>
                        </div>
                        <asp:Panel ID="pnlBtnOrgAddEvento" runat="server" class="buttons" Visible="true">
                            <asp:Button ID="btnAdd" runat="server" Text="Adicionar" OnClick="btnAdd_Click" />
                        </asp:Panel>
                        <asp:Panel ID="pnlBtnOrgGerenciaEvento" runat="server" class="buttons" Visible="false">
                            <asp:Button ID="btnUpdateEvento" runat="server" Text="Atualizar" OnClick="btnUpdateEvento_Click" />
                            <asp:Button ID="btnExcluirEvento" runat="server" Text="Excluir" OnClick="btnExcluirEvento_Click" />
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        </asp:Panel>
                        <div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlEventoDadosUser" runat="server" Visible="true">
                        <asp:Literal ID="litDadosEventoUser" runat="server"></asp:Literal>
                    </asp:Panel>

                    <asp:Literal ID="lblResposta" runat="server"></asp:Literal>
                </section>
            </article>
        </main>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>
            </section>
        </footer>

        <script src="script/header.js"></script>
        <script src="script/Evento.js"></script>
        <script src="script/master.js"></script>

    </form>
</body>
</html>
