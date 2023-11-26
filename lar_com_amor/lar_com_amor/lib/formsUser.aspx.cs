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
    public partial class formsUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            int qt = int.Parse(Request["qt"].ToString());
            string msg = ""; bool ok = false;
            // u - cd_usuario/adotante
            // a - cd_animal
            // o - cd_organizacao
            string u = Request["u"].ToString();
            string a = Request["a"].ToString();
            string o = Request["o"].ToString();
            string now = "";

            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", a),
                new Parametro("pcd_adotante", u),
            };

            Banco banco = new Banco();
            try
            {
                using (MySqlDataReader Data = banco.Consultar("NovoPedido", parametros))
                {
                    if (Data.Read()) now = Data[0].ToString().Split(' ')[0];
                }
            }
            catch
            {
                msg = Elemento.Error("Parece que já foi feita uma requisição por este animal recentemente");
                Response.Write(RetornoJson(ok, msg));
                Response.End();
            }


            try
            {
                DateTime parsedDate = DateTime.ParseExact(now, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                string formattedDate = parsedDate.ToString("yyyy-MM-dd");

                string command = "";
                for (int i = 1; i <= qt; i++)
                {
                    string resp = HttpUtility.UrlDecode(Request[$"inp{i}"].ToString());
                    command += InsertCommand(formattedDate, resp, i.ToString(), a, o, u);
                }

                banco.Executar(command);
                msg = Elemento.Success("Pedido enviado");
                ok = true;
                Response.Write(RetornoJson(ok, msg));
            }
            catch
            {
                msg = Elemento.Error("Houve algum erro ao tentar enviar as respostas");
                Response.Write(RetornoJson(ok, msg));
            }
        }

        protected string RetornoJson(bool Ok, string Msg)
        {
            return "{\"ok\":" + Ok.ToString().ToLower() + ", \"msg\":\" " + Msg + " \"}";
        }
        protected string InsertCommand(string now, string valor, string cd, string a, string o, string u)
        {
            return $@"INSERT INTO resposta (nm_resposta, cd_pergunta, cd_animal, cd_organizacao, cd_adotante, dt_pedido) VALUES
            ('{valor}', {cd}, {a}, {o}, {u}, '{now}');";
        }
    }
}