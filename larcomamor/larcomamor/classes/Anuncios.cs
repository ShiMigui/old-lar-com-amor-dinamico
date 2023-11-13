using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace larcomamor.classes
{
    public class Anuncios : Banco
    {
        public static string ComandoAnimais(string txt = "")
        {
            string command = $@"SELECT * FROM animal a 
                WHERE (a.nm_animal LIKE '%{txt}%' OR a.ds_animal LIKE '%{txt}%')";
            return command;
        }
    }
}