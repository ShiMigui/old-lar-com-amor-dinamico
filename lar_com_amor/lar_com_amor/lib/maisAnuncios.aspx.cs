using lar_com_amor.classes;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.lib
{
    public partial class maisAnuncios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request["sg"])) Response.Redirect("./maisAnuncios.aspx?offset=6&&sg=a");

            #region Variáveis
            string sg = Request["sg"].ToString().ToLower();
            string offset = Request["offset"].ToString();

            JObject response = new JObject();
            JObject anunciosJson = new JObject();
            Anuncios anuncios = new Anuncios();
            List<string> list = new List<string>();
            #endregion

            #region Gerando anuncios
            if (sg == "a")
            {
                list = anuncios.GetAnimais(offset: offset);
                response.Add("more", (list.Count == 6).ToString().ToLower());
            }
            else if (sg == "o")
            {
                list = anuncios.GetOrganizacoes(offset: offset, plus: ".");
                response.Add("more", (list.Count == 6).ToString().ToLower());
            }
            else if (sg == "e")
            {
                list = anuncios.GetEventos(offset: offset);
                response.Add("more", (list.Count == 4).ToString().ToLower());
            }
            #endregion

            for (int i = 0; i < list.Count; i++) anunciosJson.Add(i.ToString(), list[i]);
            response.Add("anuncios", anunciosJson);
            Retorno(response, true);
        }

        protected void Retorno(JObject json, bool ok = false)
        {
            Response.ContentType = "application/json";
            json.Add("ok", ok.ToString().ToLower());
            Response.Write(json.ToString());
        }
    }
}