using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Elemento
    {
        public static string AnuncioAnimal(string cd, string nm, string nascimento)
        {
            
            return $@"<a href='./animal.aspx?cd={cd}' cd='{cd}' sg='a' class='animalAnuncio'><div class='images'>{FotoAnuncioAnimal(cd, nm)}</div><div class='texts'><h4>{nm}</h4><p>{nascimento}</p><p class='link textEnd'>ver mais</p></div></a>";
        }
        static public string FotoAnuncioAnimal(string cd, string nm)
        {
            return $"<img class='animalPhoto' src='./img/animal/{cd}.jpg' alt='imagem do animal {nm}'>";
        }
        
        static public string AnuncioEvento(string cd, string nm, string data)
        {
            return $@"<a href='./evento.aspx?cd={cd}' cd='{cd}' sg='e' class='eventoAnuncio'>
                        <div class='images'>{FotoAnuncioEvento(cd, nm)}</div>
                        <div class='texts'>
                            <h4>{nm}</h4>
                            <p>{data}</p>
                            <p class='link textEnd'>ver mais</p>
                        </div>
                    </a>";
        }
        static public string FotoAnuncioEvento(string cd, string nm)
        {
            return $"<img class='eventoPhoto' src='./img/usuario/{cd}.jpg' alt='imagem do evento {nm}'>";
        }
        static public string AnuncioOrganizacao(string cd, string nm, string localizacao)
        {
            return $@"<a href='./organizacao.aspx?cd={cd}' cd='{cd}' sg='o' class='organizacaoAnuncio'>
                    <div class='images'>{FotoAnuncioOrganizacao(cd, nm)}</div>
                        <div class='texts'>
                            <h4>{nm}</h4>
                            <p>{localizacao}</p>
                            <p class='link textEnd'>ver mais</p>
                        </div>
                    </a>";
        }
        static public string FotoAnuncioOrganizacao(string cd, string nm)
        {
            string link = $"./img/usuario/{cd}.jpg";
            if (Arquivo.Exists(link)) return $"<img class='organizacaoPhoto' src='./img/usuario/{cd}.jpg' alt='imagem de {nm}'>";
            else return $"<div class='organizacaoPhoto'>{nm[0]}</div>";
        }


        static public string Mensagem(string mensagem, string type = "error")
        {
            return $@"<article id='message' ativo='true' type='{type}' class='flex justBetween'><p>{mensagem}</p><img src='./img/icons/warning.png' alt='imagem para erro' class='error-icon'><img src='./img/icons/check.png' alt='imagem para success' class='success-icon'></article>";
        }
        static public string Error(string mensagem)
        {
            return Mensagem(mensagem, "error");
        }
        static public string Success(string mensagem)
        {
            return Mensagem(mensagem, "success");
        }
    }
}