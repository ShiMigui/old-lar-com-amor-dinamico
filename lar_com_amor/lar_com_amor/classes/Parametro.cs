using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Parametro
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
            Banco banco = new Banco();
            List<Parametro> Estados = new List<Parametro>();

            using (MySqlDataReader Data = banco.Consultar($"select sg_estado, nm_estado from estado;"))
            {
                while (Data.Read()) Estados.Add(new Parametro(Data[1].ToString(), Data[0].ToString()));
                return Estados;                
            }
        }

        public List<Parametro> PegarCidade(string sg_estado)
        {
            Banco banco = new Banco();
            List<Parametro> Cidades = new List<Parametro>();

            using (MySqlDataReader Data = banco.Consultar($@"select cd_cidade, nm_cidade from cidade where sg_estado = '{sg_estado}';"))
            {
                while (Data.Read()) Cidades.Add(new Parametro(Data[1].ToString(), Data[0].ToString()));
                return Cidades;
            }
        }

        public List<Parametro> PegarTipoEvento()
        {
            Banco banco = new Banco();
            List<Parametro> Tipos_evento = new List<Parametro>();

            using (MySqlDataReader Data = banco.Consultar($@"select cd_tipo, nm_tipo from tipo_evento;"))
            {
                while (Data.Read())
                {
                    Tipos_evento.Add(new Parametro(Data[1].ToString(), Data[0].ToString()));
                }
                return Tipos_evento;
            }
        }

    }
}