using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace lar_com_amor.classes
{
    public class Elemento
    {
        public static string AnuncioAnimal(string cd, string nm, string nascimento)
        {

            return $@"<a href='./animal.aspx?cd={cd}' cd='{cd}' sg='a' class='animalAnuncio'>
                        <div class='images'>{FotoAnuncioAnimal(cd, nm)}</div>
                        <div class='texts'>
                            <h4>{nm}</h4>
                            <p>{nascimento}</p>
                            <p class='link textEnd'>ver mais</p>
                        </div>
                    </a>";
        }
        static public string FotoAnuncioAnimal(string cd, string nm)
        {
            return $"<img class='animalPhoto' src='./img/animal/{cd}.jpg' alt='imagem do animal {nm}'>";
        }

        static public string AnuncioEvento(string cd, string nm, string data)
        {
            return $@"<a href='./evento.aspx?cd={cd}' cd='{cd}' sg='e' class='eventoAnuncio'>
                        <div class='images'>{FotoAnuncioEvento(cd, nm)}</div>
                        <div class='texts'>
                            <h4>{nm}</h4>
                            <p>{data}</p>
                            <p class='link textEnd'>ver mais</p>
                        </div>
                    </a>";
        }
        static public string FotoAnuncioEvento(string cd, string nm)
        {
            return $"<img class='eventoPhoto' src='./img/usuario/{cd}.jpg' alt='imagem do evento {nm}'>";
        }
        static public string AnuncioOrganizacao(string cd, string nm, string localizacao)
        {
            return $@"<a href='./organizacao.aspx?cd={cd}' cd='{cd}' sg='o' class='organizacaoAnuncio'>
                    <div class='images'>{FotoAnuncioOrganizacao(cd, nm)}</div>
                        <div class='texts'>
                            <h4>{nm}</h4>
                            <p>{localizacao}</p>
                            <p class='link textEnd'>ver mais</p>
                        </div>
                    </a>";
        }
        static public string FotoAnuncioOrganizacao(string cd, string nm, bool letterIfNotExists = true)
        {
            string link = $"./img/usuario/{cd}.jpg";
            if (Arquivo.Exists(link)) return $"<img class='organizacaoPhoto' src='./img/usuario/{cd}.jpg' alt='imagem de {nm}'>";
            else if (letterIfNotExists) return $"<div class='organizacaoPhoto'>{nm[0]}</div>";
            else return "";
        }


        static public string Mensagem(string mensagem, string type = "error")
        {
            return $@"<article id='message' class='{type}' ativo>{mensagem}</article>";
        }
        static public string Error(string mensagem)
        {
            return Mensagem(mensagem, "error");
        }
        static public string Success(string mensagem)
        {
            return Mensagem(mensagem, "success");
        }

        static public string GerarAnuncios(List<string> anuncios, string sigla = "a", string message = "Não encontrado")
        {
            string grid = sigla == "e" ? "4" : "6";
            if (anuncios.Count == 0) return $"<p class='textCenter'>{message}</p>";
            string retorno = $"<section class='grid{grid}' sg='{sigla}'>{string.Join("", anuncios)}</section>";
            if (anuncios.Count == int.Parse(grid)) retorno += "<section class='buttons'><button class='btnMaisAnuncios'>Carregar mais</button></section>";
            return retorno;
        }

        public static string GerarMiniAnuncioOrg(Usuario Organizacao)
        {
            return $@"<a href='./organizacao.aspx?cd={Organizacao.Cd}' cd='{Organizacao.Cd}' class='organizacaoAnuncio miniAnuncio'>
                        <div class='images'>
                            {FotoAnuncioOrganizacao(Organizacao.Cd, Organizacao.Nm)}
                        </div>
                        <div class='texts'>
                            <h4>{Organizacao.Nm}</h4>
                            <p class='link textEnd'>ver mais</p>
                        </div>
                    </a>";
        }

        public static void InsertDDLValues(DropDownList ddl, List<Parametro> parametros)
        {
            ddl.Items.Clear();
            foreach (Parametro p in parametros) ddl.Items.Add(new ListItem(p.Nm, p.Vl));
            ddl.Items.Insert(0, new ListItem("Selecione", "0"));
        }

        public static void InsertDDLValues(DropDownList ddl, MySqlDataReader Data, int iNm = 1, int iVl = 0)
        {
            ddl.Items.Clear();
            while (Data.Read()) ddl.Items.Add(new ListItem(Data[iNm].ToString(), Data[iVl].ToString()));
            ddl.Items.Insert(0, new ListItem("Selecione", "0"));
        }

        public static string tab(Parametro parametro, string link)
        {
            return $"<tab tab='{parametro.Vl}'><a href='{link}tab={parametro.Vl}'>{parametro.Nm}</a></tab>";
        }

        public static string tabList(List<Parametro> parametros, string link)
        {
            string retorno = "";
            foreach (Parametro p in parametros) retorno += tab(p, link);
            return retorno;
        }

        public static string PerguntaFormularioOrg(string cd, string nm)
        {
            return $@"
                <div class='flex justBetween position-relative'>
                    <input type='text' value='{nm}' cd='{cd}' class='full-width'>
                    <img src='./img/icons/more.png' class='icon-30 pointer icon-about' alt='icone de mais informações'>
                    <div class='box-acts hidden'>
                        <p class='pointer opt' act='delete'>Remover</p>
                    </div>
                </div>
            ";
        }

        public static string PerguntaFormularioUser(string cd, string nm, string vl)
        {
            return $@"<div class='itemForm'>
                    <label for='inp{cd}'>{nm}</label>
                    <input type='text' cd='{cd}' id='inp{cd}' value='{vl}' required/>
                </div>";
        }
    }
}