using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Pedido : Banco
    {
        public List<Pergunta> Perguntas { get; set; }
        public Animal Animal { get; set; }
        public Usuario Adotante { get; set; }

        public string Data { get; set; }

        public Pedido(List<Pergunta> perguntas, Animal animal, Usuario adotante, string data)
        {
            Perguntas = perguntas;
            Animal = animal;
            Adotante = adotante;
            this.Data = data;
        }

        public Pedido()
        {
            Perguntas = new List<Pergunta>();
            Animal = new Animal();
            Adotante = new Usuario();
        }

        internal void NovoPedido(Animal animal, Usuario adotante)
        {
            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", animal.Cd),
                new Parametro("pcd_adotante", adotante.Cd),
            };

            try
            {
                using (MySqlDataReader data = Consultar("NovoPedido", parametros))
                {
                    if (data.Read())
                    {
                        Data = data[0].ToString();
                    }
                }
            }
            catch(Exception ex) 
            {
                throw new Exception(ex.Message);
            }
        }
    }
}