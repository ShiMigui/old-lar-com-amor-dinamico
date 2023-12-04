using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using larcomamor;
using MySql.Data.MySqlClient;

namespace lar_com_amor.classes
{
    public class Entidade: Banco
    {
        public string nm { get; set; }
        public string cd { get; set; }
        public string sg { get; set; }
        public string ds { get; set; }

        public Entidade(string cd, string nm, string ds)
        {
            this.cd = cd;
            this.nm = nm;
            this.ds = ds;
        }

        public Entidade(string cd, string nm)
        {
            this.nm = nm;
            this.cd = cd;
        }

        public Entidade()
        {

        }

        public List<Entidade> ListarTipoEvento()
        {
            List<Entidade> lista = new List<Entidade>();

            using (MySqlDataReader data = Consultar("PegarTipoEvento", null))
            {
                while (data.Read())
                {

                    Entidade TipoEvento = new Entidade();

                    TipoEvento.nm = data[1].ToString();
                    TipoEvento.cd = data[0].ToString();

                    lista.Add(TipoEvento);
                    
                }
                
                return lista; ;
            }
        }


    }
}