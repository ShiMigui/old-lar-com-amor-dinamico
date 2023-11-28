﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="lar_com_amor.build.dashboard" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lar com amor | Dashboard</title>
    <link rel="stylesheet" href="./style/global.css">
    <link rel="stylesheet" href="./style/dashboard.css">
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

        <main class="limiter-90pc">


            <tab-list class="tab-list-processed">
                <asp:Literal Text="" runat="server" ID="litTabs" /></tab-list>

            <asp:Panel Visible="false" runat="server" ID="pnlInfos">
                <article id="infos">
                    <section>
                        <div class="box">
                            <h1>Dados</h1>
                            <div class="grid2">
                                <div>
                                    <h2>Animais</h2>
                                    <ul class="info">
                                        <li>Cadastrados:
                                            <asp:Literal Text="" runat="server" ID="litTtalAnimais" /></li>
                                        <li>Adotados:
                                            <asp:Literal Text="" runat="server" ID="litAdotados" /></li>
                                    </ul>
                                </div>
                                <div>
                                    <h2>Requisições</h2>
                                    <ul class="info">
                                        <li>Novos:
                                            <asp:Literal Text="" runat="server" ID="litPedidosNovos" /></li>
                                        <li>Permitidos:
                                            <asp:Literal Text="" runat="server" ID="litPermitidosPendentes" /></li>
                                        <li>Finalizados:
                                            <asp:Literal Text="" runat="server" ID="litPedidosFinalizados" /></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <h1>Pedidos</h1>
                            <div class="info">
                                <h2>Pendentes</h2>
                                <asp:Literal Text="" ID="litTblPendentes" runat="server"></asp:Literal>
                            </div>

                            <div class="info">
                                <h2>Aceitos</h2>
                                <asp:Literal Text="" ID="litTblAceitos" runat="server"></asp:Literal>
                            </div>
                        </div>

                        <script src="./script/table.js"></script>
                        <script src="./script/order-controller.js"></script>
                    </section>
                    <section class="box sticky">
                        <h1>Adicionar</h1>
                        <ul class="info">
                            <li class="link">
                                <img src="./img/icons/add.png" alt="Ícone da adicionar"><a href="./animal.aspx">Novo
                        animal</a></li>
                            <li class="link">
                                <img src="./img/icons/add.png" alt="Ícone da adicionar"><a href="./evento.aspx">Novo
                        evento</a></li>
                        </ul>
                    </section>
                </article>
            </asp:Panel>

            <asp:Panel ID="pnlHistory" runat="server">
                <article>
                    <section>
                        <div class="box">
                            <asp:Literal ID="litTblHistory" runat="server" Text=""></asp:Literal>
                        </div>
                    </section>
                </article>
            </asp:Panel>
        </main>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>
            </section>
        </footer>

        <script src="./script/master.js"></script>
        <script src="./script/tabController.js"></script>
        <script src="./script/header.js"></script>
        <script src="./script/message.js"></script>
    </form>
</body>
</html>
