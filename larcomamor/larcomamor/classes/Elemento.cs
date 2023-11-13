using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace larcomamor.classes
{
    public class Elemento
    {


        static public string AnuncioAnimal()
        {
            /*nm_animal,cd_animal,nm_idade*/
            return $@"<a href='./animal.aspx?cd=cd_animal' cd='cd_animal' sg='a' class='animalAnuncio'><div class='images'>{FotoAnuncioAnimal()}</div><div class='texts'><h4>nm_animal</h4><p>nm_idade</p><p class='link textEnd'>ver mais</p></div></a>";
        }

        static public string FotoAnuncioAnimal()
        {
            return "<img class='animalPhoto' src='./img/animal/cd_animal.jpg' alt='imagem do animal nm_animal'>";
        }
        static public string AnuncioOrganizacao()
        {
            /*nm_usuario,cd_usuario,nm*/
            return $@"";
        }

        static public string FotoAnuncioOrganizacao()
        {
            return "<img class='organizacaoPhoto' src='./img/usuario/cd_usuario.jpg' alt='imagem de nm_usuario'>";
        }
        static public string AnuncioEvento()
        {
            /*nm_evento,cd_evento,dt_evento*/
            return $@"<a href='./evento.aspx?cd=cd_evento' cd='cd_evento' sg='e' class='eventoAnuncio'><div class='images'>{FotoAnuncioEvento()}</div><div class='texts'><h4>nm_evento</h4><p>dt_evento</p><p class='link textEnd'>ver mais</p></div></a>";        
        }

        static public string FotoAnuncioEvento()
        {
            return "<img class='eventoPhoto' src='./img/usuario/cd_evento.jpg' alt='imagem do evento nm_evento'>";
        }
    }
}