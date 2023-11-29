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
            if (String.IsNullOrEmpty(Request["qt"])) Response.Redirect("responderFormulario.aspx");

            #region Pegando parametros
            string cd_animal = "";
            string cd_adotante = "";
            string dt_pedido = "";
            int qt = 0;
            try
            {
                cd_animal = Request["cd_animal"].ToString();
                cd_adotante = Request["cd_adotante"].ToString();
                dt_pedido = Request["dt_pedido"].ToString();
                qt = int.Parse(Request["qt"].ToString());
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

                for (int i = 1; i <= qt; i++)
                {
                    string resp = Request[$"inp{i}"].ToString();
                    List<Parametro> parametros = new List<Parametro>
                    {
                        new Parametro("pcd_animal", cd_animal),
                        new Parametro("pcd_adotante", cd_adotante),
                        new Parametro("pdt_pedido", Credenciais.DateToInput(dt_pedido)),
                        new Parametro("pnm_resposta", resp),
                        new Parametro("pcd_pergunta", i.ToString()),
                    };

                    banco.Executar("NovaRespostaByAnimal", parametros);
                }
                Retorno(true, "Pedido realizado");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
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