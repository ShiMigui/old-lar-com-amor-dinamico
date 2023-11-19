using MySqlX.XDevAPI;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.ConstrainedExecution;
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
    }
}