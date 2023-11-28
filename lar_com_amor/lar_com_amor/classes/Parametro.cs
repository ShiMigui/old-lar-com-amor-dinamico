using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Parametro:Banco
    {
        public string Nm = "";
        public string Vl = "";

        public Parametro(string Nm, string Vl)
        {
            this.Nm = Nm;
            this.Vl = Vl;
        }

        public Parametro()
        {
        }

        public List<Parametro> PegarEstado()
        {
            List<Parametro> Estados = new List<Parametro>();

            using (MySqlDataReader Data = Consultar($"select sg_estado, nm_estado from estado;"))
            {
                while (Data.Read())
                {
                    Estados.Add(new Parametro(data[1].ToString(), data[0].ToString()));
                }
                return Estados;                
            }
        }

        public List<Parametro> PegarCidade(string sg_estado)
        {
            List<Parametro> Cidades = new List<Parametro>();

            using (MySqlDataReader Data = Consultar($@"select cd_cidade, nm_cidade from cidade where sg_estado = '{sg_estado}';"))
            {
                while (Data.Read())
                {
                    Cidades.Add(new Parametro(data[1].ToString(), data[0].ToString()));
                }
                return Cidades;
            }
        }

        public List<Parametro> PegarTipoEvento()
        {
            List<Parametro> Tipos_evento = new List<Parametro>();

            using (MySqlDataReader Data = Consultar($@"select cd_tipo, nm_tipo from tipo_evento;"))
            {
                while (Data.Read())
                {
                    Tipos_evento.Add(new Parametro(data[1].ToString(), data[0].ToString()));
                }
                return Tipos_evento;
            }
        }

    }
}