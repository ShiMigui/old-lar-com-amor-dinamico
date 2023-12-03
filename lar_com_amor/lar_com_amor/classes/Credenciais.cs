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
using System.Text.RegularExpressions;
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

        public static string GerarCodigo(int length = 8)
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
            if (cep.Length != 8)
                return JObject.Parse("{ok: false, \"msg\": \"CEP deve conter 8 caracteres\"}");

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    Banco banco = new Banco();
                    #region Verificando cep no banco de dados
                    List<Parametro> parametros = new List<Parametro> { new Parametro("pcd_cep", cep) };
                    try
                    {
                        using(MySqlDataReader data = banco.Consultar("PegarCep", parametros))
                        {
                            if (data.Read())
                            {
                                JObject json = new JObject();
                                json.Add("uf", data[0].ToString());
                                json.Add("localidade", data[1].ToString());
                                json.Add("logradouro", data[2].ToString());
                                json.Add("ok", true);
                                json["cep"] = cep;
                                return json;
                            }
                        }
                    }
                    catch
                    {
                        return JObject.Parse("{ok: false, \"msg\": \"Erro ao conectar com o servidor\"}");
                    }
                    #endregion

                    #region Adicionando Cep ao banco caso não exista
                    HttpResponseMessage response = client.GetAsync($"https://viacep.com.br/ws/{cep}/json/").Result;
                    if (response.IsSuccessStatusCode)
                    {
                        string jsonResponse = response.Content.ReadAsStringAsync().Result;
                        JObject json = JObject.Parse(jsonResponse);
                        if (json["erro"] != null) return JObject.Parse("{ok: false, \"msg\": \"Cep não existe\"}");

                        json.Add("ok", true);
                        json["cep"] = cep;
                        if(NovoCep(json)) return json;
                        return JObject.Parse("{ok: false, \"msg\": \"Não foi possível verificar o cep\"}");
                    }
                    else return JObject.Parse("{ok: false, \"msg\": \"Falha ao tentar encontrar cep\"}");
                    #endregion
                }
                catch 
                {
                    return JObject.Parse("{ok: false, \"msg\": \"Erro ao tentar fazer requisição\"}");
                }
            }
        }

        public static bool NovoCep(JObject json)
        {
            List<Parametro> parametros = new List<Parametro>
            {
                 new Parametro ("pcd_cep", json["cep"].ToString()),
                 new Parametro ("pnm_rua", json["logradouro"].ToString()),
                 new Parametro ("pnm_cidade", json["localidade"].ToString()),
                 new Parametro ("psg_estado", json["uf"].ToString()),
            };
            Banco banco = new Banco();
            try
            {
                banco.Executar("NovoCep", parametros);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string ValidatePhone(string numero)
        {
            numero = OnlyNumber(numero.Replace("+55", ""));

            if ((numero.Length >= 10 && numero.Length <= 11)) return numero;
            else return null;
        }

        public static string CalcularIdadeTexto(string dataNascimento)
        {
            if (DateTime.TryParseExact(dataNascimento, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out DateTime dataNasc))
            {
                DateTime dataAtual = DateTime.Today;
                int anos = dataAtual.Year - dataNasc.Year;
                int meses = dataAtual.Month - dataNasc.Month;
                int dias = (dataAtual - dataNasc).Days;

                if (dias >= 365)
                {
                    return $"{anos} {(anos == 1 ? "ano" : "anos")}";
                }
                else if (dias >= 30)
                {
                    int mesesTotal = anos * 12 + meses;
                    return $"{mesesTotal} {(mesesTotal == 1 ? "mês" : "meses")}";
                }
                else
                {
                    return $"{dias} {(dias == 1 ? "dia" : "dias")}";
                }
            }
            else
            {
                throw new ArgumentException("Formato de data inválido. Use o formato dd/MM/yyyy.");
            }
        }
    }
}