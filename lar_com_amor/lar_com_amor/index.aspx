<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="lar_com_amor.index" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lar com amor | Home</title>
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


            <article class="content-box grid2">
                <section>
                    <h1>Lar com amor</h1>
                    <p>Bem-vindos ao lar com amor!</p>
                    <p>Nosso objetivo facilitar o processo de adoção de animais resgatados, além de proporcionar a oportunidade para doações monetárias e divulgação de outros projetos das organizações que os resgatam e acolhem. Acreditamos que é fundamental criar uma conexão significativa entre os futuros adotantes, as ONGs e os animais em busca de um lar amoroso!</p>
                </section>
                <img src="./img/icons/garota_e_cachorro.png" alt="">
            </article>
            <article class="content-box">
                <h2>Animais</h2>
                <asp:Literal Text="" ID="litAnimais" runat="server" />
            </article>
            <article class="content-box">
                <h2>Eventos</h2>
                <asp:Literal Text="" ID="litEventos" runat="server" />
            </article>
            <article class="content-box">
                <h2>Organizações</h2>
                <asp:Literal Text="" ID="litOrganizacoes" runat="server" />
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
        <script src="./script/carregar-mais.js"></script>
        <script>
            document.querySelectorAll(".btnMaisAnuncios").forEach(el => el.addEventListener("click", carregarMais))
        </script>
    </form>
</body>
</html>
