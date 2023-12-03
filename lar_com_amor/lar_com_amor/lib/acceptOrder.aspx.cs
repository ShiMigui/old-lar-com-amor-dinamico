using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.lib
{
    public partial class acceptOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            #region Parâmetros
            string u = Request["u"].ToString();
            string a = Request["a"].ToString();
            string dt = Request["dt"].ToString();
            #endregion

            // TODO: Verificar se usuário fez pedido
            // TODO: Trocar todos pedidos do animal para ic_finalizado = false
            // TODO: Mandar email notifcando usuarios
            // TODO: Mandar email notifcando adotante
            

            Banco banco = new Banco();
            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", a),
                new Parametro("pcd_adotante", u),
                new Parametro("pdt_pedido", Credenciais.DateToInput(dt)),
                new Parametro("pic_permitido", "1"),
                new Parametro("pic_finalizado", "1"),
            };
            try
            {
                banco.Executar("AtualizarPedido", parametros);
                Retorno(true, "Pedido aceito!");
            }
            catch
            {
                Retorno(false, "Ocorreu um erro ao tentar contactar o servidor");
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