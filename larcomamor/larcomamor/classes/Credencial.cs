using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace larcomamor.classes
{
    public class Credencial
    {
        static public string Formatar(string valor, string formato)
        {
            char[] arr = formato.ToCharArray();
            int i = 0;
            string retorno = "";
            foreach (char n in arr)
            {
                if(n == 'X' && i < valor.Length)
                {
                    retorno += valor[i];
                    i++;
                }
                else retorno += n;
            }
            return retorno;
        }

        static public string Conexao()
        {
            return "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=larcomamor;";
        }

        static public string ApenasNumeros(string nm)
        {
            return new string(nm.Where(char.IsDigit).ToArray());
        }
    }
}