using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.ConstrainedExecution;
using System.Security.Policy;
using System.Text;
using System.Web;

namespace lar_com_amor.classes
{
    public class Credenciais
    {

        static public string Conexao()
        {
            return "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=larcomamor;";
        }

        static public string OnlyNumber(string nm)
        {
            return new string(nm.Where(char.IsDigit).ToArray());
        }

        public string GerarCodigo(int length = 8)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            StringBuilder codigo = new StringBuilder(length);
            Random random = new Random();

            for (int i = 0; i < length; i++) codigo.Append(chars[random.Next(chars.Length)]);

            return codigo.ToString();
        }

        public static string Formatar(string valor, string formato = "XXX.XXX.XXX")
        {
            char[] caracteres = valor.ToCharArray();
            int index = 0;

            List<char> resultado = formato.ToCharArray().ToList();

            for (int i = 0; i < resultado.Count; i++)
            {
                if (resultado[i] == 'X' && index < caracteres.Length)
                {
                    resultado[i] = caracteres[index];
                    index++;
                }
            }

            return new string(resultado.ToArray());
        }

        public static string DateToInput(string data)
        {
            string[] partesData = data.Split('/');

            return partesData[2] + "-" + partesData[1] + "-" + partesData[0];
        }

        public static JObject GetCep(string cep)
        {
            cep = OnlyNumber(cep);
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    HttpResponseMessage response = client.GetAsync($"https://viacep.com.br/ws/{cep}/json/").Result;

                    if (response.IsSuccessStatusCode)
                    {
                        string jsonResponse = response.Content.ReadAsStringAsync().Result;
                        JObject json = JObject.Parse(jsonResponse);
                        json["ok"] = true;
                        bool bd = AddCepToBd(cep, json);
                        if(!bd) return JObject.Parse("{ok: false, \"msg\": \"Não foi poss´vel adicionar sua cidade ao BD\"}");
                        return json;
                    }
                    else
                    {
                        return JObject.Parse("{ok: false, \"msg\": \"Parece que seu cep não foi encontrado\"}");
                    }
                }
                catch
                {
                    return JObject.Parse("{ok: false, \"msg\": \"Erro ao tentar fazer requisição\"}");
                }
            }
        }

        public static bool AddCepToBd(string cep, JObject json)
        {
            Banco banco = new Banco();
            string cdCidade = "";
            using (MySqlDataReader Data = banco.Consultar($"SELECT cd_cidade FROM cidade WHERE nm_cidade = '{json["localidade"]}'"))
            {
                if (Data.Read()) cdCidade = Data[0].ToString();
                else
                {
                    List<Parametro> parametros = new List<Parametro>();
                    parametros.Add(new Parametro("pnm_cidade", json["localidade"].ToString()));
                    parametros.Add(new Parametro("psg_estado", json["uf"].ToString()));
                    banco.Executar("NovoCidade", parametros);
                }
            }

            using (MySqlDataReader Data = banco.Consultar($"SELECT cd_cidade FROM cidade WHERE nm_cidade = '{json["localidade"]}'"))
            {
                if (Data.Read()) cdCidade = Data[0].ToString();
                else return false;
            }

            using (MySqlDataReader Data = banco.Consultar($"SELECT cd_cep FROM cep WHERE cd_cep = '{cep}'"))
            {
                if (Data.Read()) return true;
            }

            try
            {
                List<Parametro> parametros = new List<Parametro>();
                parametros.Add(new Parametro("pcd_cep", cep));
                parametros.Add(new Parametro("pnm_rua", json["logradouro"].ToString()));
                parametros.Add(new Parametro("pcd_cidade", cdCidade));
                banco.Executar("NovoCEP", parametros);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string CalcularIdadeTexto(string dataNascimento)
        {
            if (DateTime.TryParseExact(dataNascimento, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out DateTime dataNasc))
            {
                DateTime dataAtual = DateTime.Today;
                int anos = dataAtual.Year - dataNasc.Year;
                int meses = dataAtual.Month - dataNasc.Month;

                if (dataAtual.Day < dataNasc.Day)
                {
                    meses--;
                }

                if (meses < 0)
                {
                    anos--;
                    meses += 12;
                }

                if (anos > 0)
                {
                    if (meses > 0)
                    {
                        return $"{anos} {(anos == 1 ? "ano" : "anos")} e {meses} {(meses == 1 ? "mês" : "meses")}";
                    }
                    else
                    {
                        return $"{anos} {(anos == 1 ? "ano" : "anos")}";
                    }
                }
                else
                {
                    return $"{meses} {(meses == 1 ? "mês" : "meses")}";
                }
            }
            else
            {
                throw new ArgumentException("Formato de data inválido. Use o formato dd/MM/yyyy.");
            }
        }
    }
}