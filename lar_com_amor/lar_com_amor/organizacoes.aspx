<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="organizacoes.aspx.cs" Inherits="lar_com_amor.orgnizacoes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="style/global.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,200;1,300;1,400;1,500;1,600;1,700;1,800&amp;display=swap" rel="stylesheet">
<title>Lar com amor | Organizações</title>
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
            <article class="content-box filtros" id="campo-pesquisa">
                <div class="input-line">
                    <asp:TextBox ID="txtPesquisa" runat="server" CssClass="input-line-100" type="text" ></asp:TextBox>
                    <input type="image" src="../img/icons/search.png" alt="Ícone de lupa para pesquisa">
                </div>
                <div class="grid4">
                    <div class="itemForm">
                        <label for="selCidade">Estado</label>
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="itemForm" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="itemForm">
                        <label for="selCidade">Cidade</label>
                        <asp:DropDownList ID="ddlCidade" runat="server" AutoPostBack="true"></asp:DropDownList>
                    </div>
                </div>
            </article>

            
        <asp:Literal ID="litOrganizacoes" runat="server"></asp:Literal>
        </main>

    </form>
</body>
</html>
