namespace larcomamor.classes
{
    public class Elemento
    {

        static public string AnuncioAnimal()
        {
            return $@"<a href='./animal.aspx?cd=cd_animal' cd='cd_animal' sg='a' class='animalAnuncio'><div class='images'>{FotoAnuncioAnimal()}</div><div class='texts'><h4>nm_animal</h4><p>nm_idade</p><p class='link textEnd'>ver mais</p></div></a>";
        }
        static public string FotoAnuncioAnimal()
        {
            return "<img class='animalPhoto' src='./img/animal/cd_animal.jpg' alt='imagem do animal nm_animal'>";
        }
        static public string AnuncioOrganizacao()
        {
            return $@"<a href='./organizacao.aspx?cd=cd_usuario' cd='cd_usuario' sg='o' class='organizacaoAnuncio'><div class='images'>{FotoAnuncioOrganizacao()}</div><div class='texts'><h4>nm_usuario</h4><p>nm_localizacao</p><p class='link textEnd'>ver mais</p></div></a>";
        }
        static public string FotoAnuncioOrganizacao()
        {
            return "<img class='organizacaoPhoto' src='./img/usuario/cd_usuario.jpg' alt='imagem de nm_usuario'>";
        }
        static public string AnuncioEvento()
        {
            return $@"<a href='./evento.aspx?cd=cd_evento' cd='cd_evento' sg='e' class='eventoAnuncio'><div class='images'>{FotoAnuncioEvento()}</div><div class='texts'><h4>nm_evento</h4><p>dt_evento</p><p class='link textEnd'>ver mais</p></div></a>";
        }
        static public string FotoAnuncioEvento()
        {
            return "<img class='eventoPhoto' src='./img/usuario/cd_evento.jpg' alt='imagem do evento nm_evento'>";
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