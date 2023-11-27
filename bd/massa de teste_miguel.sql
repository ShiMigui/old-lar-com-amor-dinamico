USE larcomamor;

INSERT INTO estado (sg_estado, nm_estado) VALUES
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('ES', 'Espírito Santo'),
('MG', 'Minas Gerais');

INSERT INTO cidade (cd_cidade, nm_cidade, sg_estado) VALUES
(1, 'Santos', 'SP'),
(2, 'São Vicente', 'SP'),
(3, 'Praia Grande', 'SP'),
(4, 'Rio de Janeiro', 'RJ'),
(5, 'Duque de Caxias', 'RJ'),
(6, 'Volta Redonda', 'RJ'),
(7, 'Vitória', 'ES'),
(8, 'Alfredo Chaves', 'ES'),
(9, 'Boa Esperança', 'ES'),
(10, 'Belo Horizonte', 'MG'),
(11, 'Ouro Preto', 'MG'),
(12, 'Uberlândia', 'MG');

INSERT INTO cep (cd_cep, nm_rua, cd_cidade)VALUES
(11015130, 'Rua João Guerra', 1),
(11350240, 'Rua Major Saturnino Vítor de Almeida Pilar', 2),
(11706010, 'Rua Nossa Senhora de Praia Grande', 3),
(21625560, 'Rua Vinte e Cinco de Janeiro', 4),
(25215090, 'Rua Duque Estrada', 5),
(27253510, 'Rua Capitão Benedito Lópes Bragança', 6),
(29055260, 'Rua Aleixo Netto ', 7),
(29240000, 'Rua Amelio Legora', 8),
(37170972, 'Rua Doutor Sá Brito', 9),
(30111000, 'Rua do Acre', 10),
(35400001, 'Rua Padre Rolim', 11),
(38410150, 'Rua Agripino Valeriano da Silva', 12),
(11089170, 'Rua Alberto de Carvalho', 1),
(11350420, 'Rua Carlos Marques de Carvalho (Tancredo Neves)', 2),
(11721030, 'Rua Durval Pereira da Fonseca', 3);

INSERT INTO tipo_usuario (sg_tipo, nm_tipo) VALUES
('A', 'Adotante'),
('O','Organização');

CALL NovoUsuario('Ng Cachorros', 'ngcachorros@gmail.com', '1395596819', 11706010 , 56136874000125, '123','O','A ONG Ng Cachorros é uma organização dedicada ao bem-estar e à proteção dos melhores amigos de quatro patas. Nossa missão é proporcionar cuidados, abrigo e amor a cães em situações de vulnerabilidade. Com uma equipe comprometida e voluntários apaixonados por animais, buscamos resgatar, reabilitar e encontrar lares amorosos para cães desabrigados, vítimas de abuso ou em risco. Além disso, promovemos programas educacionais para conscientização da comunidade sobre a importância da adoção responsável, esterilização e cuidados adequados aos animais.Ng Cachorros trabalha incansavelmente para criar um mundo onde todos os cães são tratados com compaixão e respeito.');
CALL NovoUsuario('Viva Bichos', 'bichinhosviva@gmail.com', '21684752299', 21625560, 33625781000169, '1234', 'O', 'A ONG Viva Bicho é um refúgio e um farol de esperança para os nossos amigos peludos. Nossa missão é resgatar, proteger e cuidar de animais desamparados, principalmente cães e gatos, oferecendo-lhes abrigo, tratamento médico e, acima de tudo, muito amor. Nosso compromisso vai além do resgate: trabalhamos arduamente para encontrar lares amorosos e responsáveis para esses animais, promovendo a adoção consciente. Além disso, educamos a comunidade sobre a importância do respeito e dos cuidados aos animais, fomentando uma cultura de compaixão e empatia. Na Viva Bicho, acreditamos que cada ser merece uma vida digna e estamos empenhados em tornar esse ideal uma realidade.');
CALL NovoUsuario('Patinhas que Brilham', 'brilhabrilhapatinha@gmail.com', '34321564454', 38410150, 66916348000131, '123', 'O', 'A ONG Patinhas que Brilham é um farol de esperança para os animais necessitados. Nossa missão é proporcionar um lar seguro, cuidados médicos e, acima de tudo, muito amor aos nossos amigos de quatro patas. Nosso foco está em resgatar, reabilitar e encontrar lares afetuosos para cães e gatos em situações de abandono, abuso ou negligência. Além disso, promovemos programas educativos e de conscientização, incentivando a esterilização, a adoção responsável e os cuidados adequados aos animais de estimação. Na Patinhas que Brilham, acreditamos que cada patinha carrega consigo um brilho especial e merece a chance de brilhar em um lar amoroso e acolhedor. Juntos, trabalhamos para criar um mundo onde os animais sejam respeitados, amados e protegidos.' );
CALL NovoUsuario('Ampara Animal', 'ampara@gmail.com', '1399791045', 11350420,70272135000191, '123', 'O', 'A ONG Ampara Animal é um refúgio e uma voz para os mais vulneráveis entre nós: os animais. Nossa missão é resgatar, cuidar e dar uma nova chance de vida a cães e gatos em situações de abandono, maus-tratos ou risco. Com uma equipe dedicada e apaixonada, trabalhamos incansavelmente para oferecer cuidados médicos, abrigo seguro e, acima de tudo, muito amor a esses seres especiais. Além do resgate e reabilitação, focamos na busca por lares amorosos, promovendo a adoção responsável e consciente. Educar a comunidade sobre a importância da proteção animal e dos direitos dos seres vivos também é um pilar fundamental de nosso trabalho. Na Ampara Animal, acreditamos que cada ser merece compaixão e respeito, e estamos empenhados em fazer do mundo um lugar mais gentil para todas as patinhas e focinhos.');
CALL NovoUsuario('PetLove', 'lovepet@gmail.com', '27123569841', 37170972, 29377582000101, '123', 'O', 'A ONG PetLove é um reduto de afeto para nossos amigos peludos! Nossa missão é acolher, cuidar e abraçar os bichinhos mais especiais, oferecendo-lhes não apenas abrigo, mas um lar repleto de amor e carinho. Trabalhamos incansavelmente para resgatar e proteger cães e gatos em situações de vulnerabilidade, garantindo-lhes cuidados médicos, alimentação saudável e, é claro, toneladas de afagos. Nosso coração se enche de alegria ao encontrar famílias amorosas que possam dar a eles o lar que merecem. Educar e sensibilizar as pessoas sobre a importância do amor e dos cuidados aos animais é o que nos impulsiona. Na PetLove, acreditamos que cada rabinho abana mais feliz quando está envolto em amor e ternura, e estamos empenhados em espalhar esse afeto por todas as patinhas que cruzarem o nosso caminho.');
CALL NovoUsuario('Paraíso dos Fucinhos', 'fucinhosdoparaiso@gmail.com', '31321776910', 35400001, 07695425000101, '1234', 'O', 'O Paraíso dos Focinhos é um santuário encantado, onde as histórias de patinhas e focinhos se entrelaçam em um tecido mágico de cuidado e compaixão. Aqui, nossa missão transcende o comum: é nutrir, proteger e oferecer um refúgio onde cães e gatos, seres especiais, encontram paz e harmonia. Neste santuário, resgatamos vidas, curamos feridas e tecemos laços de amor, acreditando que cada ser possui uma energia única que merece ser celebrada. Buscamos lares onde a magia do encontro transforma vidas, conectando corações de pelagem a corações humanos em um elo indelével de amor. Educar sobre a conexão mística entre nós e esses seres especiais é parte essencial do nosso propósito. No Paraíso dos Focinhos, vemos cada patinha como um elo sagrado entre o reino animal e o místico, e estamos empenhados em honrar essa ligação de maneira transcendental.');
CALL NovoUsuario('Instituto Caramelo', 'luisamell@gmail.com', '18998641224', 25215090, 74472178000171, '123', 'O', 'O Instituto Caramelo é uma instituição dedicada ao cuidado e à proteção dos animais, promovendo um ambiente de respeito e atenção para cães e gatos desamparados. Nosso compromisso é resgatar, abrigar e fornecer assistência médica e emocional a esses seres queridos, oferecendo-lhes a oportunidade de uma nova vida. Buscamos lares amorosos e responsáveis, promovendo a adoção consciente e garantindo a integração harmoniosa desses animais em seus novos ambientes. Além disso, priorizamos a conscientização e a educação da comunidade sobre a importância dos cuidados adequados aos animais de estimação, visando a construção de uma sociedade mais compassiva e responsável. No Instituto Caramelo, cada ação é pautada pela seriedade e pela dedicação ao bem-estar animal, com o objetivo de garantir um futuro mais digno e acolhedor para cada patinha que cruzar o nosso caminho.');
CALL NovoUsuario('Rock Bicho', 'bichodorock@gmail.com', '27556982152', 29055260, 14831830000175, '123', 'O', 'O Rock Bicho é uma harmonia de cuidado e paixão pelos animais! Somos uma batida vibrante dedicada a resgatar, proteger e cuidar dos nossos amigos de quatro patas. Nossa melodia é composta por resgates apaixonados, acordes de cuidados médicos e solos de amor incondicional. Buscamos lares onde cada animal possa ser a estrela principal, encontrando famílias afinadas com a responsabilidade e o carinho necessários. Não apenas ajudamos animais, também buscamos acordes de conscientização, promovendo a importância da adoção responsável e dos cuidados adequados. No Rock Bicho, acreditamos que cada patinha tem seu próprio ritmo, sua melodia única, e estamos empenhados em criar um coro de vidas melhores para esses seres especiais.');
CALL NovoUsuario('Amigo não se compra', 'amigonaosecompra@gmail.com', '2789225462', 29240000, 79473465000110, '123', 'O', 'A ONG "Amigo Não se Compra" é um abraço de pelúcia no mundo dos animais! Aqui, levamos a sério a alegria de resgatar, cuidar e encontrar lares para nossos amigos peludos. Afinal, amigos de verdade não se compram, eles se adotam com amor! Nossa missão é fazer do rabo abanando a trilha sonora dos finais felizes, proporcionando cuidados, amor e muita diversão para nossos companheiros de quatro patas. Além de resgatar e encontrar lares amorosos, espalhamos sorrisos com iniciativas educativas sobre adoção responsável e cuidados animais de uma forma bem divertida! Porque aqui, acreditamos que cada patinha é um convite para um mundo mais alegre. Juntos, vamos provar que a amizade verdadeira não se compra, se adota com um carinho sem igual!');
CALL NovoUsuario('Oásis', 'oasis@gmail.com', '24542779286',27253510, 28311113000127, '123', 'O', 'O Lar Temporário Oásis é um enigma desvendado no coração do deserto, uma antiga promessa de cuidado e proteção para as criaturas de quatro patas. Como os mistérios do Nilo, nossa missão é resgatar, nutrir e salvaguardar os animais em necessidade, oferecendo um refúgio transitório, como uma pausa sob as sombras das palmeiras. Neste oásis, os cães e gatos recebem os cuidados dignos de faraós, onde são tratados como verdadeiras joias preciosas do reino animal. Buscamos os lares mais abençoados, onde esses seres mágicos encontrarão seu lar definitivo. Promovemos uma sabedoria ancestral sobre a importância da adoção consciente e do respeito aos seres vivos. No Lar Temporário Oásis, acreditamos que cada patinha é uma relíquia a ser protegida e reverenciada, e estamos comprometidos em traçar hieróglifos de amor e compaixão para o bem-estar destes seres encantados.');
CALL NovoUsuario('Focinho Carente', 'Focinhocarente@gmail.com', '13991017696',11350240, 19147052000113, '123', 'O', 'O Focinho Carente é a centelha de esperança para as almas peludas que anseiam por um lar amoroso. Nossa missão é ser o abraço caloroso para aqueles que precisam, resgatando, acolhendo e cuidando de cães e gatos desamparados. Estendemos a eles não só cuidados médicos e físicos, mas um suporte emocional, uma promessa de que dias melhores virão. Buscamos lares onde esses seres tão especiais possam encontrar não apenas um teto, mas um porto seguro de afeto e carinho. Espalhamos o brilho da esperança por meio de programas educativos, compartilhando histórias de superação e amor incondicional. No Focinho Carente, cada patinha representa a chance de um novo começo, e estamos determinados a pintar um futuro repleto de alegria e novas oportunidades para cada um deles.');
CALL NovoUsuario('Morada da Floresta', 'Morada@gmail.com', '13988616269', 11721030, 40404129000180, '123', 'O', 'A Morada da Floresta é o capítulo mais nobre e acalentador na história dos seres da mata. Nossa missão é resgatar, proteger e cuidar dos animais que habitam essas terras ancestrais, oferecendo-lhes um refúgio seguro como os antigos bosques. Somos guardiões de uma conexão ancestral, onde cães e gatos desprotegidos são acolhidos com a mesma reverência que os seres da floresta receberam dos antigos povos. Buscamos, como arautos do passado, lares onde esses animais possam ser honrados como membros sagrados de novas tribos, encontrando famílias que respeitem a harmonia entre homem e natureza. Além de acolher, compartilhamos o saber das matas por meio de programas educativos, preservando os laços místicos e o respeito à fauna que há séculos habitam essas terras. Na Morada da Floresta, cada patinha é um elo com os tempos antigos, e estamos empenhados em manter essa tradição de cuidado e proteção ao legado selvagem que nos cerca.');

CALL NovoUsuario('Joana Silva', 'joana@email.com', '13991027686', 11350240, '', '1234', 'A', '');
CALL NovoUsuario('João da Silva', 'joao@gmail.com', '31987654321', 30111000, '', '54321', 'A', '');
CALL NovoUsuario('Lívia Santos', 'livia.santos@gmail.com', '13987654321', 11015130, '', '262626', 'A', '');

INSERT INTO tipo_evento (cd_tipo, nm_tipo) VALUES (1, 'Vacinação'),
(2, 'Banho e Tosa'),
(3, 'Adoção');

INSERT INTO evento (cd_evento, nm_evento, ds_evento, dt_inicio, dt_final, cd_organizacao, cd_tipo) VALUES (1, 'Pet day', 'Evento de adoção de animais. Venha conhecer animais adoráveis em busca de um novo lar!', '2024-12-02 13:00', '2024-12-02 19:00', 2, 1),
(2, 'Feira de adoção', 'Junte-se a nós na "Feira de Adoção", um evento emocionante e cheio de amor dedicado a encontrar casais amorosos para animais necessitados. Neste dia especial, teremos uma variedade de cães e gatos adoráveis ​​aguardando ansiosamente por uma nova família. ', '2024-08-01 10:00', '2024-08-01 16:00', 2, 1),
(3, 'Pet Lover''s', 'Um evento caloroso para adoção de animais em busca de lares amorosos.', '2024-12-12 10:00:00', '2024-12-12 17:00:00', 2, 1),
(4, 'Feirinha de adoção', ' Venha conhecer esses companheiros leais, interaja com eles e descubra como você pode fazer a diferença em suas vidas. Uma equipe de adoção estará presente para orientá-lo durante o processo de adoção.  ', '2024-08-01 10:00', '2024-08-01 16:00', 2, 2),
(5, 'Ração traz doação', ' Estamos reunindo amantes de animais e membros da comunidade para compartilhar a alegria de alimentar aqueles que não têm voz. Neste evento, você terá a oportunidade de incluir pacotes de ração nutritiva para cães e gatos, contribuindo assim para garantir que todos os animais tenham acesso a uma refeição saudável.', '2024-06-07 10:00', '2024-06-07 18:00', 2, 2),
(6, 'Achar fofo não enche tigela', ' Neste dia, estaremos coletando e distribuindo sacos de ração nutritiva para cães e gatos que estão em abrigos e lares temporários. Sua contribuição fará toda a diferença na vida desses animais adoráveis, garantindo que eles recebam a nutrição adequada enquanto aguardam por um lar permanente.', '2024-04-09 10:00', '2024-04-09 18:00', 2, 2),
(7, 'Coloque amor e comida nesta tigela', ' Neste evento significativo, estamos reunindo corações compassivos para apoiar nossos amigos de quatro patas que precisam de um pouco mais de ajuda.', '2023-07-16 10:00', '2024-07-16 18:00', 2, 2),
(8, 'Adote um bichinho', 'Um evento caloroso para adoção de animais em busca de lares amorosos.', '2024-09-23 10:00:00', '2024-09-23 17:00:00', 2, 1);

INSERT INTO porte (sg_porte, nm_porte) VALUES 
('G', 'Grande'),
('M','Médio'),
('P', 'Pequeno');

INSERT INTO genero (sg_genero, nm_genero) VALUES 
("M", "Macho"),
("F", "Fêmea");

INSERT INTO especie(cd_especie, nm_especie) VALUES
(1, 'Cachorro'),
(2, 'Gato'),
(3, 'Coelho'),
(4, 'Ave');

INSERT INTO raca(cd_raca, nm_raca, cd_especie, sg_porte) VALUES
-- Raças para Cachorros (cd_especie = 1)
(1, 'Labrador', 1, 'G'), -- Grande
(2, 'Poodle', 1, 'M'),   -- Médio
(3, 'Bulldog', 1, 'P'),  -- Pequeno
(4, 'Pastor Alemão', 1, 'G'), -- Grande

-- Raças para Gatos (cd_especie = 2)
(5, 'Siamês', 2, 'P'),   -- Pequeno
(6, 'Persa', 2, 'M'),    -- Médio
(7, 'Sphynx', 2, 'P'),   -- Pequeno
(8, 'Maine Coon', 2, 'G'), -- Grande

-- Raças para Coelhos (cd_especie = 3)
(9, 'Holandês', 3, 'P'), -- Pequeno
(10, 'Rex', 3, 'M'),     -- Médio
(11, 'Mini Lion', 3, 'P'), -- Pequeno
(12, 'Fuzzy Lop', 3, 'G'); -- Grande

CALL NovoAnimal('Buddy', 'Buddy, o labrador, é um cão de porte médio a grande, conhecido por sua personalidade amigável e carinhosa. Com um físico atlético e musculoso, ele possui uma pelagem densa e curta, geralmente em tons de preto, amarelo ou chocolate.
Seus olhos expressivos e gentis transmitem uma inteligência notável, enquanto suas orelhas pendentes acrescentam charme ao seu rosto amigável. O nariz largo e úmido é uma característica distintiva, sempre pronto para investigar o ambiente com seu faro aguçado.
A personalidade de Buddy é cativante. Ele é conhecido por ser afetuoso, leal e muito sociável, adorando interagir com pessoas e outros animais. Sua natureza brincalhona faz dele um excelente companheiro para famílias, crianças e outros pets.
Além disso, Buddy é altamente inteligente e ávido por atividades. Ele adora participar de jogos e treinamentos, mostrando-se muito receptivo a aprender truques novos. Sua disposição para agradar seu dono faz dele um cão extremamente obediente e fácil de treinar.
Em resumo, Buddy, o labrador, é um pacote completo de amor, diversão e lealdade, pronto para fazer parte e alegrar a vida de sua família.', '2023-10-25', true, 1, 'M', 1);
CALL NovoAnimal('Molly', 'Molly, a poodle, é uma cadela elegante e encantadora, conhecida por sua pelagem densa e cacheada que exala uma sofisticação única. Ela vem em diferentes tamanhos, desde o miniatura até o padrão, mas independente do tamanho, sua aparência é sempre graciosa.
Seus olhos expressivos e inteligentes são emoldurados por uma pelagem luxuosa e encaracolada que pode ser de várias cores, como branca, preta, marrom ou cinza. Seu focinho alongado e fino complementa sua aparência delicada, enquanto suas orelhas pendentes acrescentam uma dose extra de charme.
A personalidade de Molly é verdadeiramente encantadora. Ela é conhecida por ser carinhosa, inteligente e extremamente leal à sua família. Seu comportamento afetuoso a torna uma excelente companheira para todas as idades, sendo especialmente carinhosa com crianças e idosos.', '2020-03-18', false, 2, 'F', 2);
CALL NovoAnimal('Duke', 'Duke, o Bulldog, é uma mistura fascinante de força e doçura embalada em um corpo compacto e musculoso. Com sua expressão facial marcante e inconfundível, ele tem um focinho curto e largo, e seus olhos profundos transmitem uma mistura de calma e curiosidade.
Sua pelagem é curta e densa, frequentemente em tons de fulvo, branco, tigrado ou malhado. As rugas proeminentes ao redor do focinho e da testa adicionam um charme peculiar à sua aparência robusta. As orelhas curtas e caídas complementam seu visual único.
A personalidade de Duke é cativante. Apesar de sua aparência imponente, ele é afetuoso, leal e gentil, sendo um companheiro leal para sua família. Sua natureza tranquila faz dele um ótimo parceiro para quem procura um amigo de quatro patas para relaxar e aproveitar momentos calmos.', '2020-09-08', false, 3, 'M', 3);
CALL NovoAnimal('Lola', 'Lola, a Pastor Alemã, é uma cadela majestosa e imponente, conhecida por sua postura nobre e olhar penetrante. Seu corpo atlético e musculoso está coberto por uma pelagem densa e dupla, geralmente em tons de preto e caramelo, que realçam sua presença marcante. Seus olhos castanhos expressam inteligência aguçada e lealdade inabalável, adicionando uma aura de determinação ao seu porte elegante.
Inteligente e altamente treinável, Lola é um exemplo de disciplina e devoção à sua família. Sua natureza protetora e vigilante faz dela uma guardiã confiável, sempre alerta para proteger aqueles que ama. Apesar de sua aparência imponente, seu coração é caloroso e afetuoso com os membros da família, especialmente com as crianças, demonstrando uma ternura inigualável em seu convívio.
Além de sua lealdade inquestionável, Lola é ávida por desafios mentais e físicos. Ela adora participar de atividades ao ar livre, como corridas, caminhadas e jogos que estimulem seu intelecto. Sua determinação e habilidade para aprender rapidamente tornam-na não apenas uma companheira leal, mas também uma parceira excepcional em treinamentos e trabalhos que demandam sua inteligência e destreza.', '2018-07-12', true, 4, 'F', 4);
CALL NovoAnimal('Rocky', 'Rocky, o siamês, é uma verdadeira obra de arte felina. Seu corpo esguio e musculoso é adornado por uma pelagem curta, macia e marcante, com uma coloração contrastante entre o corpo claro e extremidades mais escuras, como orelhas, focinho, patas e cauda. Seus olhos intensamente azuis são como duas joias brilhantes, transmitindo uma expressão de inteligência e curiosidade.
Além de sua aparência marcante, Rocky é conhecido por sua personalidade extrovertida e vocal. Ele é comunicativo e expressa suas opiniões e desejos de maneira eloquente, usando sua voz melodiosa para interagir com sua família humana. Inteligente e afetuoso, ele desenvolve laços estreitos com aqueles ao seu redor, demonstrando lealdade e um amor incondicional.
Sua natureza brincalhona e enérgica o mantém em movimento, adorando perseguir brinquedos, explorar novos ambientes e até mesmo realizar acrobacias para entreter a todos. Rocky é uma combinação fascinante de elegância, charme e uma personalidade cativante, tornando-se não apenas um companheiro, mas um verdadeiro membro querido da família.', '2021-01-30', false, 5, 'M', 5);
CALL NovoAnimal('Lucy', 'Lucy, a gata persa, é um exemplo vivo de elegância felina. Seu pelo exuberante e longo, em tons de cinza e branco, forma uma pelagem densa e sedosa que realça sua beleza majestosa. Seus olhos grandes e expressivos, frequentemente em tons de âmbar ou verde, parecem contar histórias por si só, revelando sua curiosidade e doçura.
Sua face achatada e focinho arredondado conferem-lhe um ar de serenidade, destacando-se pelas bochechas rechonchudas e pelo nariz pequeno e delicado. Lucy possui uma postura delicada e elegante, com movimentos graciosos que complementam sua natureza tranquila e contemplativa.
Apesar de sua aparência aristocrática, Lucy é afetuosa e desfruta de momentos de carinho e aconchego ao lado de sua família. Seu temperamento calmo e sua tendência a procurar locais confortáveis para descansar fazem dela não apenas uma bela gata, mas também uma companheira tranquila e amorosa para aqueles que têm a sorte de tê-la por perto.', '2019-04-05', true, 6, 'F', 1);
CALL NovoAnimal('Bailey', 'Bailey, o Sphynx, é um gato fascinante e distinto, com uma aparência única que cativa à primeira vista. Sua característica mais marcante é a ausência quase total de pelos, revelando uma pele macia e aveludada que proporciona uma sensação diferente ao toque. Sua pele pode apresentar uma variedade de cores e padrões, evidenciando suas rugas suaves e sua aparência musculosa.
Seus olhos expressivos, geralmente grandes e amarelos, destacam-se em contraste com sua pele, emanando uma inteligência cativante. As orelhas grandes e pontudas complementam sua face angular, acrescentando um ar de curiosidade e astúcia.
A personalidade de Bailey é tão única quanto sua aparência. Apesar de não ter pelos para demonstrar afeto, ele é extremamente carinhoso e apegado aos seus donos. Seu comportamento brincalhão e enérgico faz dele um ótimo companheiro para interações divertidas, além de ser conhecido por seu amor por aconchegar-se em busca de calor e carinho. Sua natureza extrovertida o torna um excelente gato para lares ativos, onde sua curiosidade infinita e personalidade afetuosa podem florescer plenamente.', '2020-11-28', false, 7, 'M', 2);
CALL NovoAnimal('Sophie', 'Sophie, a majestosa Maine Coon, é uma gata de porte impressionante e beleza estonteante. Com sua pelagem exuberante e longa, em tons variados como marrom, prateado ou creme, ela se destaca pelo seu tamanho impressionante, parecendo quase uma miniatura de um felino selvagem. Seus olhos grandes e expressivos, geralmente dourados ou âmbar, transmitem uma inteligência tranquila e cativante.
Além da sua aparência deslumbrante, Sophie é conhecida por sua personalidade carismática e cativante. Ela é carinhosa, mas independente, desfrutando de momentos de tranquilidade e reflexão em sua própria companhia. No entanto, ela também é uma ótima companheira, apreciando interações afetuosas e participando de atividades familiares.
Sua inteligência aguçada faz dela uma aprendiz ágil, capaz de entender e até mesmo criar brincadeiras desafiadoras. Sophie é uma gata que cria laços fortes com sua família, demonstrando afeto de maneiras únicas e encantadoras, tornando-se não apenas uma presença imponente, mas também um coração amoroso dentro do lar.', '2018-12-17', false, 8, 'F', 3);
CALL NovoAnimal('Chloe', 'Chloe, a adorável coelha da raça Holandesa, é uma pequena bola de pelo e charme. Com sua pelagem característica, exibe um contraste marcante entre seu corpo predominantemente branco e suas orelhas e área ao redor dos olhos em preto, criando uma aparência elegante e distintiva. Seus olhos brilhantes e curiosos escondem uma inteligência peculiar.
Além de sua aparência encantadora, Chloe é conhecida por sua natureza brincalhona e enérgica. Ela adora explorar seu ambiente, sempre curiosa para descobrir novos cantos e recantos para investigar. Sua personalidade carinhosa e receptiva a interações humanas a torna uma companheira adorável para quem procura uma coelhinha afetuosa.
Sua agilidade e inteligência a tornam uma ótima aluna para ensinamentos simples e brincadeiras interativas. Chloe é uma coelha que aprecia momentos de carinho e brincadeiras, adicionando uma dose de alegria e vitalidade ao ambiente ao seu redor, transformando cada dia em uma nova aventura cheia de surpresas fofas.', '2021-06-22', true, 9, 'F', 4);
CALL NovoAnimal('Jack', 'Jack, o labrador, é um cão cheio de vida e personalidade. Com sua pelagem brilhante e olhos expressivos, ele personifica a alegria e a lealdade desta adorável raça. Seu pelo curto e denso, geralmente em tons de amarelo, chocolate ou preto, complementa sua aparência atlética e robusta.
Sua natureza amorosa e afetuosa faz de Jack um companheiro excepcional para toda a família. Ele é conhecido por seu espírito brincalhão e disposição para participar de qualquer aventura, seja um passeio ao ar livre ou um jogo animado. Sua inteligência notável e facilidade de treinamento o tornam não apenas um excelente amigo, mas também um aluno dedicado.
Além disso, Jack tem um coração generoso e uma lealdade inabalável aos seus entes queridos. Sua personalidade extrovertida e amigável o torna um ótimo cão de companhia para pessoas de todas as idades, trazendo alegria e entusiasmo para qualquer lar em que ele habita.', '2020-02-14', false, 1, 'M', 5);
CALL NovoAnimal('Lily', 'Lily, a encantadora poodle, é um exemplo de elegância e doçura. Com sua pelagem exuberante e cacheada, geralmente em tons de branco ou creme, ela irradia uma aura de graça e charme. Seus olhos expressivos, muitas vezes escuros e penetrantes, são uma janela para sua inteligência notável.
Além da sua beleza cativante, Lily é conhecida por sua personalidade afetuosa e alegre. Ela é carinhosa e leal, sempre pronta para oferecer amor incondicional à sua família. Sua disposição brincalhona e sua energia moderada a tornam uma companhia adorável para todas as idades, especialmente para aqueles que buscam um amigo de quatro patas carinhoso e de fácil convivência.
Lily é uma aprendiz ágil e ansiosa para participar de atividades que desafiem sua mente inteligente. Sua natureza dócil e sociável faz dela não apenas uma excelente companheira, mas também uma adição encantadora e acolhedora para qualquer lar.', '2019-08-09', false, 2, 'F', 1);
CALL NovoAnimal('Oliver', 'Oliver, o bulldog, é um cão que personifica a coragem e a doçura. Com seu físico robusto e compacto, ele exibe uma aparência distintiva com rugas marcantes e um focinho encurtado, transmitindo uma expressão adorável e determinada. Sua pelagem curta e densa, muitas vezes em tons de fulvo ou tigrado, complementa sua presença imponente.
Sua personalidade é uma mistura encantadora de lealdade e gentileza. Oliver é afetuoso e protetor com sua família, demonstrando um apego profundo aos que ama. Apesar de sua aparência imponente, ele é amoroso e tranquilo, apreciando momentos relaxantes ao lado de seus entes queridos.
A inteligência notável de Oliver é combinada com uma determinação tranquila, tornando-o um companheiro leal e confiável. Sua natureza paciente e seu caráter afável fazem dele não apenas um excelente cão de companhia, mas também um amigo fiel, sempre pronto para oferecer amor e conforto.', '2017-10-11', true, 3, 'M', 2);
CALL NovoAnimal('Zoey', 'Zoey, a pastor alemã, é uma combinação impressionante de beleza e inteligência. Com sua pelagem densa e característica em tons de preto e marrom, ela exibe uma postura elegante e atlética. Seus olhos castanhos profundos transmitem uma inteligência aguçada e uma lealdade inigualável.
Além de sua aparência imponente, Zoey é conhecida por sua devoção inabalável à sua família. Ela é protetora, corajosa e extremamente fiel, pronta para defender aqueles que ama. Sua natureza alerta e sua disposição para aprender e se envolver em atividades a tornam não apenas uma companheira confiável, mas também uma excelente guardiã.
Zoey é uma cadela altamente treinável e trabalhadora. Sua inteligência excepcional e sua vontade de agradar fazem dela uma excelente aluna, pronta para participar de tarefas desafiadoras e mostrar suas habilidades. Sua dedicação e amor incondicional tornam-na não apenas uma parte vital da família, mas também uma parceira incrível para qualquer pessoa em busca de lealdade e companheirismo.', '2021-03-27', false, 4, 'F', 3);
CALL NovoAnimal('Leo', 'Leo, o gato siamês, é uma exibição de elegância e charme felino. Com sua pelagem curta e sedosa, em tons de creme ou bege, contrastando com as extremidades mais escuras, ele possui uma aparência única e marcante. Seus olhos azuis intensos, hipnotizantes e expressivos, são uma característica notável que reflete sua personalidade vibrante.
Além da sua aparência deslumbrante, Leo é conhecido por sua natureza extrovertida e sociável. Ele é vocal e comunicativo, expressando suas opiniões e desejos com uma variedade de sons característicos da raça. Sua personalidade carinhosa e afetuosa faz dele um companheiro leal, desfrutando de interações próximas com sua família humana.
A inteligência aguçada de Leo o torna um aprendiz rápido e curioso. Ele adora desafios mentais, demonstrando agilidade em brincadeiras e até mesmo em truques simples. Leo é uma adição cativante para qualquer lar, trazendo não apenas sua beleza notável, mas também sua personalidade envolvente e afetuosa.', '2018-05-04', true, 5, 'M', 4);
CALL NovoAnimal('Maggie', 'Maggie, a gata persa, é uma verdadeira princesa felina. Com sua pelagem longa e exuberante, em tons de branco, creme ou até mesmo cinza, ela exala uma elegância majestosa. Seus olhos grandes e expressivos, muitas vezes de cor âmbar ou verde, transmitem uma doçura encantadora e uma serenidade cativante.
Além da sua beleza estonteante, Maggie é conhecida por sua personalidade serena e tranquila. Ela é afetuosa e calma, desfrutando de momentos de relaxamento e carinho ao lado de sua família. Sua natureza dócil a torna uma companhia reconfortante e perfeita para quem busca um amigo de quatro patas amoroso e tranquilo.
A inteligência observadora de Maggie a torna uma excelente observadora e uma ótima ouvinte, respondendo aos gestos e emoções sutis de seus donos. Sua doçura e presença suave acrescentam uma atmosfera serena e acolhedora ao lar, tornando-a não apenas uma gata bonita, mas também uma presença reconfortante e afetuosa na vida de sua família.', '2019-12-19', false, 6, 'F', 5);
CALL NovoAnimal('Anubis', 'Anubis, o gato Sphynx, é uma presença cativante e intrigante. Sua pele sem pelos e seu corpo musculoso e esguio destacam sua aparência única e marcante. Seu semblante expressivo, com orelhas grandes e olhos penetrantes, revela uma curiosidade inquisitiva e uma inteligência aguçada.
Além da sua aparência distinta, Anubis é conhecido por sua personalidade extrovertida e afetuosa. Ele é carinhoso e adora estar próximo de seus humanos, procurando calor e aconchego. Sua natureza brincalhona e sociável o torna um companheiro divertido, sempre pronto para interagir e explorar o ambiente ao seu redor.
A inteligência esperta de Anubis o torna um gato que gosta de desafios mentais e atividades interativas. Ele é curioso e está sempre pronto para novas experiências. Sua presença carismática e seu jeito afetuoso o transformam não apenas em um gato de aparência extraordinária, mas também em um companheiro cativante e amoroso para toda a família.', '2020-07-08', true, 7, 'M', 1);
CALL NovoAnimal('Visenya', '
Visenya, a majestosa gata Maine Coon, é uma visão impressionante de beleza e imponência felina. Com sua pelagem longa e exuberante, em tons variados de marrom, preto ou prateado, ela exibe uma presença magnífica e elegante. Seus olhos grandes e expressivos, frequentemente dourados ou âmbar, refletem uma inteligência cativante e uma personalidade curiosa.
Além da sua beleza marcante, Visenya é conhecida por sua personalidade carismática e afetuosa. Ela é dócil, gentil e desfruta da companhia de sua família humana, buscando carinho e interações próximas. Sua natureza tranquila a torna uma companhia relaxante e perfeita para aqueles que buscam um amigo de quatro patas amoroso e tranquilo.
A inteligência e a sociabilidade de Visenya a tornam uma gata que gosta de participar de atividades interativas e jogos desafiadores. Ela é observadora e adora explorar seu ambiente, mantendo-se sempre alerta e interessada em tudo ao seu redor. Sua presença graciosa e afetuosa enriquece qualquer lar, oferecendo não apenas sua beleza notável, mas também sua personalidade gentil e envolvente.', '2020-04-14', false, 8, 'F', 2);
CALL NovoAnimal('Charlie', '
Charlie, o adorável coelho da raça Holandesa, é uma bola de pelos e charme. Com sua pelagem curta e macia, exibe uma combinação de cores distintiva, com seu corpo predominantemente branco contrastando com suas orelhas e marcações em um tom escuro, criando uma aparência cativante. Seus olhos brilhantes e curiosos mostram uma personalidade ávida por explorar o mundo ao seu redor.
Além de sua aparência encantadora, Charlie é conhecido por sua natureza curiosa e brincalhona. Ele adora investigar seu ambiente, demonstrando uma energia cativante e entusiasmo por novas experiências. Sua disposição afetuosa e sociável o torna um companheiro adorável, especialmente para aqueles que buscam um amigo peludo e carinhoso.
A inteligência observadora de Charlie o torna um coelho ágil e atento, sempre pronto para interagir com jogos e brinquedos desafiadores. Sua natureza dócil e sua disposição para interações humanas tornam-no não apenas uma adição encantadora para qualquer lar, mas também um amigo fiel e amoroso para toda a família.', '2018-09-03', true, 9, 'M', 3);
CALL NovoAnimal('Balla', 'Balla, a encantadora labradora, é um pacote de alegria e lealdade. Com sua pelagem brilhante e olhos expressivos, ela exibe uma energia contagiante e uma disposição amigável. Seu pelo curto e denso, frequentemente em tons de amarelo, chocolate ou preto, realça sua presença confiante e atlética.
Além da sua aparência adorável, Balla é conhecida por sua personalidade afetuosa e carinhosa. Ela é amigável e leal, sempre pronta para se envolver com sua família humana. Sua natureza brincalhona e sua disposição para participar de atividades a tornam não apenas uma excelente companheira, mas também uma fonte constante de diversão para todos ao seu redor.
A inteligência aguçada de Balla a torna uma aprendiz ágil, capaz de compreender comandos e responder a treinamentos com facilidade. Sua doçura e presença amorosa fazem dela não apenas uma labradora encantadora, mas também uma amiga confiável e amorosa, pronta para compartilhar momentos inesquecíveis ao lado de sua família.', '2021-08-01', false, 1, 'F', 1);

INSERT INTO pergunta (cd_pergunta, nm_pergunta, cd_organizacao) VALUES
(1, 'Qual é seu nome completo?', 1),
(2, 'Qual a sua idade?', 1),
(3, 'Qual seu email?', 1),
(4, 'Qual seu telefone para contato?', 1),
(5, 'Qual é sua cidade?', 1),
(6, 'Qual é seu estado?', 1),
(7, 'Qual seu endereço completo?', 1),
(8, 'Qual é seu nome completo?', 2),
(9, 'Qual a sua idade?', 2),
(10, 'Qual seu email?', 2),
(11, 'Qual seu telefone para contato?', 2),
(12, 'Qual é sua cidade?', 2),
(13, 'Qual é seu estado?', 2),
(14, 'Qual seu endereço completo?', 2),
(15, 'Qual é seu nome completo?', 3),
(16, 'Qual a sua idade?', 3),
(17, 'Qual seu email?', 3),
(18, 'Qual seu telefone para contato?', 2),
(19, 'Qual é sua cidade?', 3),
(20, 'Qual é seu estado?', 3),
(21, 'Qual seu endereço completo?', 3);
