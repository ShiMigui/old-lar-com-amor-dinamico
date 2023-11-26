using lar_com_amor.classes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.lib
{
    public partial class userForms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string link = "./lib/userForms.aspx?qt=3&&animal=1&&usuario=10&&org=1&&inp1=asd&&inp2=asd&&inp3=asd";
            if (String.IsNullOrEmpty(Request["qt"])) Response.Redirect(link);

            #region Pegando valores da URL
            string animal = Request["animal"].ToString();
            string org = Request["org"].ToString();
            string usuario = Request["usuario"].ToString();
            #endregion

            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", animal),
                new Parametro("pcd_adotante", usuario),
            };

            #region Criando novo pedido
            string data = "";
            Banco banco = new Banco();
            try
            {
                using (MySqlDataReader Data = banco.Consultar("NovoPedido", parametros))
                {
                    if (Data.Read())
                    {
                        data = Data[0].ToString().Split(' ')[0];
                        DateTime parsedDate;

                        if (DateTime.TryParseExact(data, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out parsedDate))
                        {
                            data = parsedDate.ToString("yyyy-MM-dd");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Retorno(false, ex.Message);
                Response.End();
            }
            
            #endregion


            int qt = int.Parse(Request["qt"].ToString());
            string command = "";
            for (int i = 1; i <= qt; i++)
            {
                string resp = Request[$"inp{i}"].ToString();

                command += $@"INSERT INTO resposta (nm_resposta, cd_pergunta, cd_animal, cd_organizacao, cd_adotante, dt_pedido) 
                VALUES ('{resp}', {i}, {animal}, {org}, {usuario}, '{data}');";
            }

            try
            {
                banco.Executar(command);
                Retorno(true, "Pedido realizado!");
            }
            catch(Exception ex)
            {
                Retorno(false, "Ocorreu uma falha ao tentar contatar o servidor!");
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