using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.lib
{
    public partial class salvarForms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            #region Pegando variáveis
            string cd_organizacao = Request["cd_organizacao"].ToString();
            string cd = Request["cd"].ToString();
            string txt = Request["txt"].ToString();

            Banco banco = new Banco();
            #endregion

            try
            {
                List<Parametro> parametros = new List<Parametro>
                {
                    new Parametro("pnm_pergunta", txt),
                    new Parametro("pcd_organizacao", cd_organizacao),
                    new Parametro("pcd_pergunta", cd),
                };
                banco.Executar("AtualizarPergunta", parametros);
                Retorno(true, "Perguntas salvas");
            }
            catch (Exception ex)
            {
                Retorno(false, ex.Message);
            }

        }
        protected void Retorno(bool ok = false, string msg = "Ocorreu um erro")
        {
            string retorno = "{\"ok\": " + ok.ToString().ToLower() + ", \"msg\":\"" + msg + "\"}";
            Response.Write(retorno);
        }
    }
}