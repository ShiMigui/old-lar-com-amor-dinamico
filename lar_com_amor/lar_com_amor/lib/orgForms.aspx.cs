using lar_com_amor.classes;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.lib
{
    public partial class orgForms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            #region Pegando parâmetros URL
            int i = int.Parse(Request["i"].ToString()); // inicial
            int qt = int.Parse(Request["qt"].ToString()); // final
            string org = Request["org"].ToString();
            #endregion

            string command = "";

            if(i > qt)
            {
                // inputs foram excluídos
                for(int j = i; j > qt; j--) command += GerarDelete(j, org);
            }

            if (i < qt)
            {
                // inputs foram adicionados
                for (int j = i+1; j <= qt; j++)
                {
                    string pergunta = Request[$"inp{j}"].ToString();
                    command += GerarInsert(j, pergunta, org);
                }
            }

            for(int n = 1; n <= qt; n++)
            {
                string pergunta = Request[$"inp{n}"].ToString();
                command += GerarUpdate(n, pergunta, org);
            }

            try
            {
                Banco banco = new Banco();
                banco.Executar(command);
                Retorno(true, "Alterações salvas");
            }
            catch
            {
                Retorno(false, "Ocorreu um problema ao tentar salvar alterações, tente mais tarde");
            }
        }

        protected string GerarInsert(int cd, string nm, string org)
        {
            return $"INSERT INTO pergunta (cd_pergunta, nm_pergunta, cd_organizacao) VALUES ({cd}, '{nm}', {org});";
        }

        protected string GerarDelete(int cd, string org)
        {
            return $"DELETE FROM resposta WHERE cd_pergunta = {cd}; DELETE FROM pergunta WHERE cd_organizacao = {org} AND cd_pergunta = {cd};";
        }

        protected string GerarUpdate(int cd, string nm, string org)
        {
            return $"UPDATE pergunta SET nm_pergunta = '{nm}' WHERE cd_pergunta = {cd} AND cd_organizacao = {org};";
        }

        protected void Retorno(bool ok = false, string msg = "Ocorreu um erro")
        {
            string message = ok ? Elemento.Success(msg) : Elemento.Error(msg);
            string retorno = "{\"ok\": " + ok.ToString().ToLower() + ", \"msg\":\"" + message + "\"}";
            Response.Write(retorno);
        }
    }
}