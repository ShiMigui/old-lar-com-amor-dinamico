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

CALL NovoUsuario('Ng Cachorros', 'ngcachorros@gmail.com', '1395596819', 11706010 , 56136874000125, md5('123'),'O','A ONG Ng Cachorros é uma organização dedicada ao bem-estar e à proteção dos melhores amigos de quatro patas. Nossa missão é proporcionar cuidados, abrigo e amor a cães em situações de vulnerabilidade. Com uma equipe comprometida e voluntários apaixonados por animais, buscamos resgatar, reabilitar e encontrar lares amorosos para cães desabrigados, vítimas de abuso ou em risco. Além disso, promovemos programas educacionais para conscientização da comunidade sobre a importância da adoção responsável, esterilização e cuidados adequados aos animais.Ng Cachorros trabalha incansavelmente para criar um mundo onde todos os cães são tratados com compaixão e respeito.');
CALL NovoUsuario('Viva Bichos', 'bichinhosviva@gmail.com', '21684752299', 21625560, 33625781000169, md5('1234'), 'O', 'A ONG Viva Bicho é um refúgio e um farol de esperança para os nossos amigos peludos. Nossa missão é resgatar, proteger e cuidar de animais desamparados, principalmente cães e gatos, oferecendo-lhes abrigo, tratamento médico e, acima de tudo, muito amor. Nosso compromisso vai além do resgate: trabalhamos arduamente para encontrar lares amorosos e responsáveis para esses animais, promovendo a adoção consciente. Além disso, educamos a comunidade sobre a importância do respeito e dos cuidados aos animais, fomentando uma cultura de compaixão e empatia. Na Viva Bicho, acreditamos que cada ser merece uma vida digna e estamos empenhados em tornar esse ideal uma realidade.');
CALL NovoUsuario('Patinhas que Brilham', 'brilhabrilhapatinha@gmail.com', '34321564454', 38410150, 66916348000131, md5('123'), 'O', 'A ONG Patinhas que Brilham é um farol de esperança para os animais necessitados. Nossa missão é proporcionar um lar seguro, cuidados médicos e, acima de tudo, muito amor aos nossos amigos de quatro patas. Nosso foco está em resgatar, reabilitar e encontrar lares afetuosos para cães e gatos em situações de abandono, abuso ou negligência. Além disso, promovemos programas educativos e de conscientização, incentivando a esterilização, a adoção responsável e os cuidados adequados aos animais de estimação. Na Patinhas que Brilham, acreditamos que cada patinha carrega consigo um brilho especial e merece a chance de brilhar em um lar amoroso e acolhedor. Juntos, trabalhamos para criar um mundo onde os animais sejam respeitados, amados e protegidos.' );
CALL NovoUsuario('Ampara Animal', 'ampara@gmail.com', '1399791045', 11350420,70272135000191, md5('123'), 'O', 'A ONG Ampara Animal é um refúgio e uma voz para os mais vulneráveis entre nós: os animais. Nossa missão é resgatar, cuidar e dar uma nova chance de vida a cães e gatos em situações de abandono, maus-tratos ou risco. Com uma equipe dedicada e apaixonada, trabalhamos incansavelmente para oferecer cuidados médicos, abrigo seguro e, acima de tudo, muito amor a esses seres especiais. Além do resgate e reabilitação, focamos na busca por lares amorosos, promovendo a adoção responsável e consciente. Educar a comunidade sobre a importância da proteção animal e dos direitos dos seres vivos também é um pilar fundamental de nosso trabalho. Na Ampara Animal, acreditamos que cada ser merece compaixão e respeito, e estamos empenhados em fazer do mundo um lugar mais gentil para todas as patinhas e focinhos.');
CALL NovoUsuario('PetLove', 'lovepet@gmail.com', '27123569841', 37170972, 29377582000101, md5('123'), 'O', 'A ONG PetLove é um reduto de afeto para nossos amigos peludos! Nossa missão é acolher, cuidar e abraçar os bichinhos mais especiais, oferecendo-lhes não apenas abrigo, mas um lar repleto de amor e carinho. Trabalhamos incansavelmente para resgatar e proteger cães e gatos em situações de vulnerabilidade, garantindo-lhes cuidados médicos, alimentação saudável e, é claro, toneladas de afagos. Nosso coração se enche de alegria ao encontrar famílias amorosas que possam dar a eles o lar que merecem. Educar e sensibilizar as pessoas sobre a importância do amor e dos cuidados aos animais é o que nos impulsiona. Na PetLove, acreditamos que cada rabinho abana mais feliz quando está envolto em amor e ternura, e estamos empenhados em espalhar esse afeto por todas as patinhas que cruzarem o nosso caminho.');
CALL NovoUsuario('Paraíso dos Fucinhos', 'fucinhosdoparaiso@gmail.com', '31321776910', 35400001, 07695425000101, md5('1234'), 'O', 'O Paraíso dos Focinhos é um santuário encantado, onde as histórias de patinhas e focinhos se entrelaçam em um tecido mágico de cuidado e compaixão. Aqui, nossa missão transcende o comum: é nutrir, proteger e oferecer um refúgio onde cães e gatos, seres especiais, encontram paz e harmonia. Neste santuário, resgatamos vidas, curamos feridas e tecemos laços de amor, acreditando que cada ser possui uma energia única que merece ser celebrada. Buscamos lares onde a magia do encontro transforma vidas, conectando corações de pelagem a corações humanos em um elo indelével de amor. Educar sobre a conexão mística entre nós e esses seres especiais é parte essencial do nosso propósito. No Paraíso dos Focinhos, vemos cada patinha como um elo sagrado entre o reino animal e o místico, e estamos empenhados em honrar essa ligação de maneira transcendental.');
CALL NovoUsuario('Instituto Caramelo', 'luisamell@gmail.com', '18998641224', 25215090, 74472178000171, md5('123'), 'O', 'O Instituto Caramelo é uma instituição dedicada ao cuidado e à proteção dos animais, promovendo um ambiente de respeito e atenção para cães e gatos desamparados. Nosso compromisso é resgatar, abrigar e fornecer assistência médica e emocional a esses seres queridos, oferecendo-lhes a oportunidade de uma nova vida. Buscamos lares amorosos e responsáveis, promovendo a adoção consciente e garantindo a integração harmoniosa desses animais em seus novos ambientes. Além disso, priorizamos a conscientização e a educação da comunidade sobre a importância dos cuidados adequados aos animais de estimação, visando a construção de uma sociedade mais compassiva e responsável. No Instituto Caramelo, cada ação é pautada pela seriedade e pela dedicação ao bem-estar animal, com o objetivo de garantir um futuro mais digno e acolhedor para cada patinha que cruzar o nosso caminho.');
CALL NovoUsuario('Rock Bicho', 'bichodorock@gmail.com', '27556982152', 29055260, 14831830000175, md5('123'), 'O', 'O Rock Bicho é uma harmonia de cuidado e paixão pelos animais! Somos uma batida vibrante dedicada a resgatar, proteger e cuidar dos nossos amigos de quatro patas. Nossa melodia é composta por resgates apaixonados, acordes de cuidados médicos e solos de amor incondicional. Buscamos lares onde cada animal possa ser a estrela principal, encontrando famílias afinadas com a responsabilidade e o carinho necessários. Não apenas ajudamos animais, também buscamos acordes de conscientização, promovendo a importância da adoção responsável e dos cuidados adequados. No Rock Bicho, acreditamos que cada patinha tem seu próprio ritmo, sua melodia única, e estamos empenhados em criar um coro de vidas melhores para esses seres especiais.');
CALL NovoUsuario('Amigo não se compra', 'amigonaosecompra@gmail.com', '2789225462', 29240000, 79473465000110, md5('123'), 'O', 'A ONG "Amigo Não se Compra" é um abraço de pelúcia no mundo dos animais! Aqui, levamos a sério a alegria de resgatar, cuidar e encontrar lares para nossos amigos peludos. Afinal, amigos de verdade não se compram, eles se adotam com amor! Nossa missão é fazer do rabo abanando a trilha sonora dos finais felizes, proporcionando cuidados, amor e muita diversão para nossos companheiros de quatro patas. Além de resgatar e encontrar lares amorosos, espalhamos sorrisos com iniciativas educativas sobre adoção responsável e cuidados animais de uma forma bem divertida! Porque aqui, acreditamos que cada patinha é um convite para um mundo mais alegre. Juntos, vamos provar que a amizade verdadeira não se compra, se adota com um carinho sem igual!');
CALL NovoUsuario('Oásis', 'oasis@gmail.com', '24542779286',27253510, 28311113000127, md5('123'), 'O', 'O Lar Temporário Oásis é um enigma desvendado no coração do deserto, uma antiga promessa de cuidado e proteção para as criaturas de quatro patas. Como os mistérios do Nilo, nossa missão é resgatar, nutrir e salvaguardar os animais em necessidade, oferecendo um refúgio transitório, como uma pausa sob as sombras das palmeiras. Neste oásis, os cães e gatos recebem os cuidados dignos de faraós, onde são tratados como verdadeiras joias preciosas do reino animal. Buscamos os lares mais abençoados, onde esses seres mágicos encontrarão seu lar definitivo. Promovemos uma sabedoria ancestral sobre a importância da adoção consciente e do respeito aos seres vivos. No Lar Temporário Oásis, acreditamos que cada patinha é uma relíquia a ser protegida e reverenciada, e estamos comprometidos em traçar hieróglifos de amor e compaixão para o bem-estar destes seres encantados.');
CALL NovoUsuario('Focinho Carente', 'Focinhocarente@gmail.com', '13991017696',11350240, 19147052000113, md5('123'), 'O', 'O Focinho Carente é a centelha de esperança para as almas peludas que anseiam por um lar amoroso. Nossa missão é ser o abraço caloroso para aqueles que precisam, resgatando, acolhendo e cuidando de cães e gatos desamparados. Estendemos a eles não só cuidados médicos e físicos, mas um suporte emocional, uma promessa de que dias melhores virão. Buscamos lares onde esses seres tão especiais possam encontrar não apenas um teto, mas um porto seguro de afeto e carinho. Espalhamos o brilho da esperança por meio de programas educativos, compartilhando histórias de superação e amor incondicional. No Focinho Carente, cada patinha representa a chance de um novo começo, e estamos determinados a pintar um futuro repleto de alegria e novas oportunidades para cada um deles.');
CALL NovoUsuario('Morada da Floresta', 'Morada@gmail.com', '13988616269', 11721030, 40404129000180, md5('123'), 'O', 'A Morada da Floresta é o capítulo mais nobre e acalentador na história dos seres da mata. Nossa missão é resgatar, proteger e cuidar dos animais que habitam essas terras ancestrais, oferecendo-lhes um refúgio seguro como os antigos bosques. Somos guardiões de uma conexão ancestral, onde cães e gatos desprotegidos são acolhidos com a mesma reverência que os seres da floresta receberam dos antigos povos. Buscamos, como arautos do passado, lares onde esses animais possam ser honrados como membros sagrados de novas tribos, encontrando famílias que respeitem a harmonia entre homem e natureza. Além de acolher, compartilhamos o saber das matas por meio de programas educativos, preservando os laços místicos e o respeito à fauna que há séculos habitam essas terras. Na Morada da Floresta, cada patinha é um elo com os tempos antigos, e estamos empenhados em manter essa tradição de cuidado e proteção ao legado selvagem que nos cerca.');

CALL NovoUsuario('Joana Silva', 'joana@email.com', '13991027686', 11350240, '', md5('1234'), 'A', '');
CALL NovoUsuario('João da Silva', 'joao@gmail.com', '31987654321', 30111000, '', md5('54321'), 'A', '');
CALL NovoUsuario('Lívia Santos', 'livia.santos@gmail.com', '13987654321', 11015130, '', md5('262626'), 'A', '');

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

CALL NovoAnimal('Buddy', 'Descrição do Buddy', '2019-11-25', true, 1, 'M', 1);
CALL NovoAnimal('Molly', 'Descrição da Molly', '2020-03-18', false, 2, 'F', 2);
CALL NovoAnimal('Duke', 'Descrição do Duke', '2020-09-08', false, 3, 'M', 3);
CALL NovoAnimal('Lola', 'Descrição da Lola', '2018-07-12', true, 4, 'F', 4);
CALL NovoAnimal('Rocky', 'Descrição do Rocky', '2021-01-30', false, 5, 'M', 5);
CALL NovoAnimal('Lucy', 'Descrição da Lucy', '2019-04-05', true, 6, 'F', 1);
CALL NovoAnimal('Bailey', 'Descrição do Bailey', '2020-11-28', false, 7, 'M', 2);
CALL NovoAnimal('Sophie', 'Descrição da Sophie', '2018-12-17', false, 8, 'F', 3);
CALL NovoAnimal('Chloe', 'Descrição da Chloe', '2021-06-22', true, 9, 'F', 4);
CALL NovoAnimal('Jack', 'Descrição do Jack', '2020-02-14', false, 1, 'M', 5);
CALL NovoAnimal('Lily', 'Descrição da Lily', '2019-08-09', false, 2, 'F', 1);
CALL NovoAnimal('Oliver', 'Descrição do Oliver', '2017-10-11', true, 3, 'M', 2);
CALL NovoAnimal('Zoey', 'Descrição da Zoey', '2021-03-27', false, 4, 'F', 3);
CALL NovoAnimal('Leo', 'Descrição do Leo', '2018-05-04', true, 5, 'M', 4);
CALL NovoAnimal('Maggie', 'Descrição da Maggie', '2019-12-19', false, 6, 'F', 5);
CALL NovoAnimal('Toby', 'Descrição do Toby', '2020-07-08', true, 7, 'M', 1);
CALL NovoAnimal('Sasha', 'Descrição da Sasha', '2020-04-14', false, 8, 'F', 2);
CALL NovoAnimal('Charlie', 'Descrição do Charlie', '2018-09-03', true, 9, 'M', 3);
CALL NovoAnimal('Bella', 'Descrição da Bella', '2021-08-01', false, 1, 'F', 4);
