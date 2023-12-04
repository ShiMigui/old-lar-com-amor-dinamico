using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace lar_com_amor.classes
{
    public class Event:Banco
    {
        public int codigo { get; set; }
        public string nome { get; set; }
        public string descricao { get; set; }
        public string tipoEvento { get; set; }
        public DateTime inicio { get; set; }
        public DateTime final { get; set; }

        public Entidade Tipo_Evento { get; set; }

        public string maxCodigo()
        {
            string comando = "SELECT COALESCE(MAX(cd_evento)+1,1) FROM evento;";
            string cd = "";


            using (MySqlDataReader data = Consultar(comando))
            {
                if (data.Read())
                {
                   cd = data[0].ToString();
                }
                this.Fechar();
                return cd; ;
            }
        }

        public bool NovoEvento(string pnm_evento, string pds_evento, string pdt_inicio, string pdt_final, string pcd_organizacao, string pcd_tipo)
        {
            try
            {
                List<ListItem> meusparametros = new List<ListItem>();
                meusparametros.Add(new ListItem("pnm_evento", pnm_evento));
                meusparametros.Add(new ListItem("pds_evento", pds_evento));
                meusparametros.Add(new ListItem("pdt_inicio", pdt_inicio));
                meusparametros.Add(new ListItem("pdt_final", pdt_final));
                meusparametros.Add(new ListItem("pcd_organizacao", pcd_organizacao));
                meusparametros.Add(new ListItem("pcd_tipo", pcd_tipo));


                Executar("NovoEvento", meusparametros);

                return true;
            }
            catch
            {
                return false;
            }
        }
        
        public bool ExcluirEvento(string pcd_evento)
        {

            try
            {
                List<ListItem> meusparametros = new List<ListItem>();
                meusparametros.Add(new ListItem("pcd_evento", pcd_evento));
                Executar("DeletarEvento", meusparametros);
                return true;
            }
            catch
            {
                return false;
            }
            


        }

        public bool VerificarOrgEvento(string cd_evento, string cd_organizacao)
        {
            string comando = $@"select nm_evento from evento where cd_evento = {cd_evento} and cd_organizacao = {cd_organizacao};";

            using (MySqlDataReader data = Consultar(comando))
            {
                if (data.Read())
                {
                    this.Fechar();
                    return true;
                }
                else
                {
                    this.Fechar();
                    return false;
                }                
            }
        }

        public Event PegarEventoComCd(string cd)
        {
            List<Parametro> meusparametros = new List<Parametro>();
            Parametro item = new Parametro();
            item.Nm = "pcd_evento";
            item.Vl = cd;
            meusparametros.Add(item);

            Event evento = new Event();
            evento.nome = "";

            using (MySqlDataReader data = Consultar("PegarEventoCodigo", meusparametros))
            {
                if (data.Read())
                {
                    evento.nome = data[0].ToString();
                    evento.descricao = data[1].ToString();
                    evento.inicio = DateTime.Parse(data[2].ToString());
                    evento.final = DateTime.Parse(data[3].ToString());
                    evento.tipoEvento = data[4].ToString();

                    Entidade Tipo_evento = new Entidade();
                    Tipo_evento.nm = data[5].ToString();

                    evento.Tipo_Evento = Tipo_evento;
                }
                this.Fechar();
                return evento;
            }
        }

        public bool UpdateEvento(string pcd_evento, string pnm_evento, string pds_evento, string pdt_inicio, string pdt_final, string pcd_organizacao, string pcd_tipo)
        {
            try
            {
                List<ListItem> meusparametros = new List<ListItem>();
                meusparametros.Add(new ListItem("pcd_evento", pcd_evento));
                meusparametros.Add(new ListItem("pnm_evento", pnm_evento));
                meusparametros.Add(new ListItem("pds_evento", pds_evento));
                meusparametros.Add(new ListItem("pdt_inicio", pdt_inicio));
                meusparametros.Add(new ListItem("pdt_final", pdt_final));
                meusparametros.Add(new ListItem("pcd_organizacao", pcd_organizacao));
                meusparametros.Add(new ListItem("pcd_tipo", pcd_tipo));


                Executar("AtualizarEvento", meusparametros);

                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}