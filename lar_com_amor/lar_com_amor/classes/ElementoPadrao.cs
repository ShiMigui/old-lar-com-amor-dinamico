using Org.BouncyCastle.Asn1.Pkcs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace lar_com_amor.classes
{
    public class ElementoPadrao
    {

        static public string gerarTabs(List<Parametro> tabs, string caminho = "")
        {
            string retorno = "<ul class='tabs'>";

            foreach (Parametro tab in tabs) retorno += $@"<li><a href='{caminho}tab={tab.valor}' class='tab' tab='{tab.valor}'>{tab.nome}</a></li>";

            return retorno + "</ul>";
        }
        static public string gerarElPerfil(string cdUsuario = "", string nmUsuario = "", string classes = "")
        {
            string el = $@"<div class='square inputImage {classes}'>{nmUsuario[0]}</div>";

            string link = $@"../img/usuario/{cdUsuario}.jpg";
            if (Arquivo.exists(link)) el = $@"<img src='{link}' class='square inputImage {classes}'/>";
            return el;
        }

        public static string gerarItemGrid(string nmItem = "", List<Parametro> listSubItens = null, string textIfNotExists = "")
        {
            string subEls = "";
            if (listSubItens != null && listSubItens.Count > 0)
            {
                foreach (Parametro p in listSubItens)
                {
                    string mark = !String.IsNullOrEmpty(p.nome) ? $@"<span class='mark'>{p.nome}</span>" : "";
                    subEls += $@"<p>{mark}{p.valor}</p>";
                }
            }
            else if (!String.IsNullOrEmpty(textIfNotExists)) subEls = $@"<p>{textIfNotExists}</p>";

            return $@"<div class='subItemGrid' sub-grid='{nmItem}'><h3>{nmItem}</h3>{subEls}</div>";
        }

        static public string gerarItemGrid(string nmItem = "", string data = "", string textIfNotExists = "")
        {
            List<Parametro> lista = new List<Parametro>();
            if (!String.IsNullOrEmpty(data))
            {
                string[] arrList = data.Split(',');
                foreach (string key in arrList)
                {
                    string[] v = key.Split(':');
                    if (v[1] != null) lista.Add(new Parametro(v[0], v[1]));
                    else lista.Add(new Parametro("", v[0]));
                }
            }
            return ElementoPadrao.gerarItemGrid(nmItem, lista, textIfNotExists);
        }

        static public string gerarInputItem(string lblTxt = "", string vlInp = "", string idTxt = "", string plus = "")
        {
            if (String.IsNullOrEmpty(idTxt)) idTxt = lblTxt;
            return $@"<div class='itemForm'><label for='inp{idTxt}'>{lblTxt}</label><input type='text' id='inp{idTxt}' value='{vlInp}' {plus}/></div>";
        }

        static public string gerarMsg(string text = "", string title = "", string style = "")
        {
            if (!String.IsNullOrEmpty(title)) title = $"<h5 style='color:white;'>{title}</h5>";

            return $@"<article class='message' style='border-radius:10px;padding:10px;position:fixed;right:10px;top:100px;box-shadow:0 0 10px rgba(0, 0, 0, 0.05);{style}'>{title}<div style='color:white;'>{text}</div></article>";
        }

        static public string gerarErrorMsg(string text = "", string title = "")
        {
            return gerarMsg(text, title, "background-color: red;");
        }

        static public string gerarSuccessMsg(string text = "", string title = "")
        {
            return gerarMsg(text, title, "background-color: green;");
        }

        static public void gerarDdl(List<Parametro> list, DropDownList ddl)
        {
            ddl.Items.Clear();
            foreach (Parametro p in list) ddl.Items.Add(new ListItem(p.nome, p.valor));
            ddl.Items.Insert(0, new ListItem("Selecione", "0"));
        }
    }
}