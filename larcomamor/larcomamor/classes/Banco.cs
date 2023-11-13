using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace larcomamor.classes
{
    public class Banco
    {
        private MySqlConnection conexao = null;
        private MySqlDataReader data = null;

        public Banco()
        {
            this.conexao = new MySqlConnection(Credencial.Conexao());
        }

        public void Abrir()
        {
            Fechar();
            conexao.Open();
        }

        public void Fechar()
        {
            if (conexao != null) if (conexao.State == System.Data.ConnectionState.Open) conexao.Close();
        }

        public void Executar(string comando)
        {
            try
            {
                Abrir();
                using (MySqlCommand cmd = new MySqlCommand(comando, conexao))
                {
                    cmd.ExecuteNonQuery();
                }
            }
            catch
            {
                throw new Exception("Não foi possível conectar-se ao banco de dados");
            }
        }

        public void Executar(string comando, List<ListItem> paramsCmd)
        {
            try
            {
                Abrir();
                using (MySqlCommand cmd = AdicionarParametros(new MySqlCommand(comando, conexao), paramsCmd))
                {
                    cmd.ExecuteNonQuery();
                }
            }
            catch
            {
                throw new Exception("Não foi possível conectar-se ao banco de dados");
            }
        }

        public MySqlDataReader Consultar(string comando)
        {
            try
            {
                Abrir();
                MySqlCommand cmd = new MySqlCommand(comando, conexao);
                data = cmd.ExecuteReader();
                return data;
            }
            catch
            {
                throw new Exception("Não foi possível conectar-se ao banco de dados");
            }
        }

        public MySqlDataReader Consultar(string comando, List<ListItem> paramsCmd)
        {
            try
            {
                Abrir();
                MySqlCommand cmd = AdicionarParametros(new MySqlCommand(comando, conexao), paramsCmd);
                data = cmd.ExecuteReader();
                return data;
            }
            catch
            {
                throw new Exception("Não foi possível conectar-se ao banco de dados");
            }
        }

        private MySqlCommand AdicionarParametros(MySqlCommand cmd, List<ListItem> paramsCmd)
        {
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            if (paramsCmd == null || paramsCmd.Count <= 0) return cmd;
            foreach (ListItem param in paramsCmd)
            {
                if (param != null)
                {
                    cmd.Parameters.AddWithValue(param.Text, param.Value);
                }
            }
            return cmd;
        }
    }
}