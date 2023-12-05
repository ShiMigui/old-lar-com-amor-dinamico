using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.lib
{
    public partial class deletarPergunta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            #region Pegando variáveis
            string cd_organizacao = Request["cd_organizacao"].ToString();
            string cd = Request["cd"].ToString();

            Banco banco = new Banco();
            #endregion

            try
            {
                banco.Executar($"Delete from pergunta where cd_pergunta = {cd} AND cd_organizacao = {cd_organizacao}");
                Retorno(true, "Pergunta deletada");
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