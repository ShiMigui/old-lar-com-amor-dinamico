<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="lar_com_amor.cadastro" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lar com amor | Cadastro</title>
    <link rel="stylesheet" href="./style/global.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,200;1,300;1,400;1,500;1,600;1,700;1,800&amp;display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <main class="grid2 forms alignCenter">


            <div class="flex justCenter">
                <a href="./index.aspx">
                    <img src="./img/icons/logo.png" alt="ícone logotipo"></a>
            </div>
            <section class="form justCenter">

                <asp:Panel ID="pnlCadastro" runat="server" CssClass="limiter-600 flexColumn full-width margin-auto">
                    <tab-list>
                        <asp:Literal Text="" runat="server" ID="litTabs"></asp:Literal>
                    </tab-list>

                    <div class="itemForm">
                        <label for="inpNome">Nome
                            <asp:Literal runat="server" ID="litNome" Text="do adotante"></asp:Literal></label>
                        <asp:TextBox ID="inpNome" runat="server" required=""></asp:TextBox>
                        <%--<input type="text" id="inpNome" required="">--%>
                    </div>

                    <asp:Panel runat="server" Visible="false" CssClass="itemForm" ID="pnlCnpj">
                        <label for="inpCNPJ">CNPJ</label>
                        <asp:TextBox Text="" ID="inpCNPJ" runat="server" required=""></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel runat="server" Visible="false" CssClass="itemForm" ID="pnlDate">
                        <label for="inpDate">Data de nascimento</label>
                        <asp:TextBox Text="" TextMode="Date" ID="inpDate" runat="server" required=""></asp:TextBox>
                    </asp:Panel>

                    <div class="itemForm">
                        <label for="inpEmail">Email</label>
                        <asp:TextBox Text="" ID="inpEmail" TextMode="Email" runat="server" required=""></asp:TextBox>
                    </div>

                    <div class="itemForm">
                        <label for="inpTelefone">Telefone</label>
                        <asp:TextBox Text="" ID="inpTelefone" TextMode="Phone" runat="server" required=""></asp:TextBox>
                    </div>

                    <div class="itemForm">
                        <label for="inpCep">CEP</label>
                        <asp:TextBox Text="" ID="inpCep" runat="server" required="" TextMode="Number" AutoPostBack="true" OnTextChanged="inpCep_TextChanged"></asp:TextBox>
                    </div>

                    <div class="grid2">
                        <div class="itemForm">
                            <label for="inpEstado">UF</label>
                            <asp:TextBox ID="inpEstado" Text="" runat="server" disabled=""></asp:TextBox>
                        </div>
                        <div class="itemForm">
                            <label for="inpCidade">Cidade</label>
                            <asp:TextBox ID="inpCidade" Text="" runat="server" disabled=""></asp:TextBox>
                        </div>
                        <div class="itemForm all-grid">
                            <label for="inpRua">Rua</label>
                            <asp:TextBox ID="inpRua" Text="" runat="server" disabled=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="itemForm">
                        <label for="inpSenha">Senha</label>
                        <asp:TextBox runat="server" ID="inpSenha" TextMode="Password" required=""></asp:TextBox>
                    </div>

                    <div class="itemForm">
                        <label for="inpSenha2">Confirme a senha</label>
                        <asp:TextBox runat="server" ID="inpSenha2" TextMode="Password" required=""></asp:TextBox>
                    </div>

                    <div class="flexColumn alignEnd">
                        <asp:Button runat="server" ID="btnCadastro" Text="Cadastrar-se" OnClick="btnCadastro_Click" />
                    </div>
                    <div class="flexColumn alignCenter">
                        <a href="./login.aspx">Já tenho uma conta</a>
                    </div>
                </asp:Panel>
            </section>
        </main>

        <asp:Literal ID="litMsg" runat="server" Text=""></asp:Literal>

        <script src="./script/master.js"></script>
        <script src="./script/tabController.js" id="tab-controller"></script>
        <script src="./script/header.js"></script>
        <script src="./script/message.js"></script>
    </form>
</body>
</html>
