using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Pergunta :Banco
    {
        public string Cd {  get; set; }
        public string Nm { get; set;}
        public string Vl { get; set; }

        public Pergunta(string cd, string nm, string vl)
        {
            Cd = cd;
            Nm = nm;
            Vl = vl;
        }

        public Pergunta()
        {
        }

        internal List<Pergunta> ByOrg(string cdOrg)
        {
            List<Parametro> parametros = new List<Parametro> 
            {
                new Parametro("pcd_organizacao", cdOrg)
            };
            List<Pergunta> perguntas = new List<Pergunta>();
            using (MySqlDataReader data = Consultar("PegarPerguntasOrg", parametros))
            {
                while (data.Read())
                {
                    string cd = data["cd_pergunta"].ToString();
                    string nm = data["nm_pergunta"].ToString();
                    perguntas.Add(new Pergunta(cd, nm, ""));
                }
            }
            return perguntas;
        }

        internal List<Pergunta> ByOrgAdotante(string cdOrg, string cdAdotante)
        {
            return new List<Pergunta>();
        }
    }
}