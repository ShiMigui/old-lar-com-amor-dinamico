using lar_com_amor.classes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.lib
{
    public partial class responderFormulario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            #region Pegando parametros
            string cd_animal = "";
            string cd_adotante = "";
            string dt_pedido = "";
            string[] cds=null;
            try
            {
                cd_animal = Request["cd_animal"].ToString();
                cd_adotante = Request["cd_adotante"].ToString();
                dt_pedido = Request["dt_pedido"].ToString();
                cds = Request["cds"].ToString().Split(',');
            }
            catch
            {
                Retorno(false, "Problemas de parametros da requisição!");
                Response.End();
            }
            #endregion

            try
            {
                Banco banco = new Banco();

                foreach(string c in cds)
                {
                    string resp = Request[$"inp{c}"].ToString();
                    List<Parametro> parametros = new List<Parametro>
                    {
                        new Parametro("pcd_animal", cd_animal),
                        new Parametro("pcd_adotante", cd_adotante),
                        new Parametro("pdt_pedido", Credenciais.DateToInput(dt_pedido)),
                        new Parametro("pnm_resposta", resp),
                        new Parametro("pcd_pergunta", c),
                    };

                    banco.Executar("NovaRespostaByAnimal", parametros);
                }
                Retorno(true, "Pedido realizado");
            }
            catch 
            {
                Retorno(false, "Ocorreu um erro, tente mais tarde");
            }
        }

        protected void Retorno(bool ok = false, string msg = "Ocorreu um erro")
        {
            string message = ok ? Elemento.Success(msg) : Elemento.Error(msg);
            string retorno = "{\"ok\": " + ok.ToString().ToLower() + ", \"msg\":\"" + message + "\"}";
            Response.Write(retorno);
        }
    }
}