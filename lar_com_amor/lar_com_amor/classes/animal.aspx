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
                <a href="./index.html">
                    <img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"/></a>

                <section id="pesquisa">
                    <input type="text" class="input"/>
                    <input type="image" src="./img/icons/search.png" alt="Ícone de pesquisa"/>
                </section>

                <section id="campo-navegacao" class="flex justEnd alignCenter">
                    <nav ativo="false">
                        <a href="./animais.html">Animais</a>
                        <a href="./eventos.html">Eventos</a>
                        <a href="./organizacoes.html">Organizações</a>
                    </nav>

                    <section id="menu-hamburguer" class="flexColumn square" ativo="false">
                        <div class="line"></div>
                        <div class="line"></div>
                        <div class="line"></div>
                    </section>

                    <a href="./perfil.html" id="account" class="flex alignCenter">Entrar
                    <img src="./img/icons/account.png" alt="ícone de login"/>
                    </a>

                    <img id="arrow-down" src="./img/icons/arrow-down.png" alt="ícone de seta para baixo"/>
                </section>
            </section>
        </header>

        <main class="limiter">


            <%--<article class="content-box flex" id="anuncio-panel">
                <section id="left-panel">
                    <img src="" alt="" class="animalPhoto">

                    <a href="./organizacao.html" cd="" class="organizacaoAnuncio">
                        <div class="images">
                            <img class="organizacaoPhoto" src="" alt=""></div>
                        <div class="texts">
                            <h4>Nome</h4>
                            <p>cidade, UF</p>
                            <p class="link textEnd">ver mais</p>
                        </div>
                    </a>
                </section>
                <section id="right-panel" class="form">
                    <div class="grid2">
                        <div class="itemForm">
                            <label for="inpNome">Nome</label>
                            <input type="text" name="inpNome" id="inpNome">
                        </div>
                        <div class="itemForm">
                            <label for="inpNascimento">Nascimento</label>
                            <input type="date" name="inpNascimento" id="inpNascimento">
                        </div>
                        <div class="flex alignCenter">
                            <input type="checkbox" name="chkCastrado" id="chkCastrado">
                            <label for="chkCastrado">Castrado</label>
                        </div>
                    </div>
                    <div class="itemForm">
                        <label for="inpDescricao">Descrição</label>
                        <textarea name="inpDescricao" id="inpDescricao" rows="2"></textarea>
                    </div>
                    <div class="grid2">
                        <div class="itemForm">
                            <label for="selGenero">Gênero</label>
                            <select name="selGenero" id="selGenero">
                                <option value="0">Selecione</option>
                            </select>
                        </div>
                        <div class="itemForm">
                            <label for="selEspecie">Espécie</label>
                            <select name="selEspecie" id="selEspecie">
                                <option value="0">Selecione</option>
                            </select>
                        </div>
                        <div class="itemForm">
                            <label for="selRaca">Raça</label>
                            <select name="selRaca" id="selRaca">
                                <option value="0">Selecione</option>
                            </select>
                        </div>
                        <div class="itemForm">
                            <label for="selPorte">Porte</label>
                            <select name="selPorte" id="selPorte">
                                <option value="0">Selecione</option>
                            </select>
                        </div>
                        <div class="itemForm">
                            <label for="inpVacinas">Vacina(s) do animal</label>
                            <input type="text" id="inpVacinas" list="listVacinas">
                            <datalist id="listVacinas">
                                <option cd="1" value="AAAA"></option>
                                <option cd="2" value="BBBB"></option>
                                <option cd="3" value="CCCC"></option>
                                <option cd="4" value="DDDD"></option>
                                <option cd="5" value="EEEE"></option>
                            </datalist>
                            <div id="vacinas-panel" class="list">
                                <p class="msg-sem-vacina">Sem vacinas</p>
                            </div>
                        </div>
                    </div>
                    <div class="buttons">
                        <button id="addAnimal">Salvar</button>
                    </div>
                </section>
            </article>--%>

            <!-- ANUNCIO USER -->

            <%--<article class="content-box flex" id="anuncio-panel">
                <section id="left-panel">
                    <img src="" alt="" class="animalPhoto">

                    <a href="./organizacao.html" cd="" class="organizacaoAnuncio">
                        <div class="images">
                            <img class="organizacaoPhoto" src="" alt=""></div>
                        <div class="texts">
                            <h4>Nome</h4>
                            <p>cidade, UF</p>
                            <p class="link textEnd">ver mais</p>
                        </div>
                    </a>
                </section>
                <section id="right-panel" class="form">
                    <div class="grid2">
                        <div class="itemForm">
                            <label for="inpNome">Nome</label>
                            <p>Nome do animal</p>
                        </div>
                        <div class="itemForm">
                            <label for="inpNascimento">Nascimento</label>
                            <p>06/09/2005</p>
                        </div>
                        <div class="itemForm">
                            <label for="chkCastrado">Castrado</label>
                            <p>Castrado</p>
                        </div>
                    </div>
                    <div class="itemForm">
                        <label for="inpDescricao">Descrição</label>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptate, quo fugiat sapiente, harum itaque dolor enim iusto repudiandae doloremque quis quaerat. A facilis quisquam nulla fugit, unde quaerat numquam aut!</p>
                    </div>
                    <div class="grid2">
                        <div class="itemForm">
                            <label for="selGenero">Gênero</label>
                            <p>Macho</p>
                        </div>
                        <div class="itemForm">
                            <label for="selEspecie">Espécie</label>
                            <p>Cachorro</p>
                        </div>
                        <div class="itemForm">
                            <label for="selRaca">Raça</label>
                            <p>Golden Retriever</p>
                        </div>
                        <div class="itemForm">
                            <label for="selPorte">Porte</label>
                            <p>Grande</p>
                        </div>
                    </div>
                    <div class="buttons"><a href="forms.aspx" class="button">Pedir adoção</a></div>
                </section>
            </article>--%>
        </main>

        <footer>
            <section class="limiter flex alignCenter justBetween">
                <a href="./index.html"><img src="./img/icons/logo.png" class="logo" alt="Logotipo Lar com amor"></a>
            </section>
        </footer>

        <script src="./script/master.js"></script>
        <script src="./script/animal.js" id="script-page"></script>
        <script src="./script/header.js"></script>
    </form>
</body>
</html>
