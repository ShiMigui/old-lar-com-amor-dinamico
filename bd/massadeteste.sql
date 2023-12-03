USE larcomamor;

INSERT INTO estado (sg_estado, nm_estado) VALUES
('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');

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
(11721030, 'Rua Durval Pereira da Fonseca', 3),
(11325110, 'Rua Joaquim Barbosa dos Santos', 2);

INSERT INTO tipo_usuario (sg_tipo, nm_tipo) VALUES
('A', 'Adotante'),
('O','Organização');

INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (1, 'Ng Cachorros', 'ngcachorros@gmail.com', '1395596819', '202cb962ac59075b964b07152d234b70', 'A ONG Ng Cachorros é uma organização dedicada ao bem-estar e à proteção dos melhores amigos de quatro patas. Nossa missão é proporcionar cuidados, abrigo e amor a cães em situações de vulnerabilidade. Com uma equipe comprometida e voluntários apaixonados por animais, buscamos resgatar, reabilitar e encontrar lares amorosos para cães desabrigados, vítimas de abuso ou em risco. Além disso, promovemos programas educacionais para conscientização da comunidade sobre a importância da adoção responsável, esterilização e cuidados adequados aos animais.Ng Cachorros trabalha incansavelmente para criar um mundo onde todos os cães são tratados com compaixão e respeito.', NULL, '56136874000125', 1, '11706010', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (2, 'Viva Bichos', 'bichinhosviva@gmail.com', '21684752299', '81dc9bdb52d04dc20036dbd8313ed055', 'A ONG Viva Bicho é um refúgio e um farol de esperança para os nossos amigos peludos. Nossa missão é resgatar, proteger e cuidar de animais desamparados, principalmente cães e gatos, oferecendo-lhes abrigo, tratamento médico e, acima de tudo, muito amor. Nosso compromisso vai além do resgate: trabalhamos arduamente para encontrar lares amorosos e responsáveis para esses animais, promovendo a adoção consciente. Além disso, educamos a comunidade sobre a importância do respeito e dos cuidados aos animais, fomentando uma cultura de compaixão e empatia. Na Viva Bicho, acreditamos que cada ser merece uma vida digna e estamos empenhados em tornar esse ideal uma realidade.', NULL, '33625781000169', 1, '21625560', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (3, 'Patinhas que Brilham', 'brilhabrilhapatinha@gmail.com', '34321564454', '202cb962ac59075b964b07152d234b70', 'A ONG Patinhas que Brilham é um farol de esperança para os animais necessitados. Nossa missão é proporcionar um lar seguro, cuidados médicos e, acima de tudo, muito amor aos nossos amigos de quatro patas. Nosso foco está em resgatar, reabilitar e encontrar lares afetuosos para cães e gatos em situações de abandono, abuso ou negligência. Além disso, promovemos programas educativos e de conscientização, incentivando a esterilização, a adoção responsável e os cuidados adequados aos animais de estimação. Na Patinhas que Brilham, acreditamos que cada patinha carrega consigo um brilho especial e merece a chance de brilhar em um lar amoroso e acolhedor. Juntos, trabalhamos para criar um mundo onde os animais sejam respeitados, amados e protegidos.', NULL, '66916348000131', 1, '38410150', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (4, 'Ampara Animal', 'ampara@gmail.com', '1399791045', '202cb962ac59075b964b07152d234b70', 'A ONG Ampara Animal é um refúgio e uma voz para os mais vulneráveis entre nós: os animais. Nossa missão é resgatar, cuidar e dar uma nova chance de vida a cães e gatos em situações de abandono, maus-tratos ou risco. Com uma equipe dedicada e apaixonada, trabalhamos incansavelmente para oferecer cuidados médicos, abrigo seguro e, acima de tudo, muito amor a esses seres especiais. Além do resgate e reabilitação, focamos na busca por lares amorosos, promovendo a adoção responsável e consciente. Educar a comunidade sobre a importância da proteção animal e dos direitos dos seres vivos também é um pilar fundamental de nosso trabalho. Na Ampara Animal, acreditamos que cada ser merece compaixão e respeito, e estamos empenhados em fazer do mundo um lugar mais gentil para todas as patinhas e focinhos.', NULL, '70272135000191', 1, '11350420', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (5, 'PetLove', 'lovepet@gmail.com', '27123569841', '202cb962ac59075b964b07152d234b70', 'A ONG PetLove é um reduto de afeto para nossos amigos peludos! Nossa missão é acolher, cuidar e abraçar os bichinhos mais especiais, oferecendo-lhes não apenas abrigo, mas um lar repleto de amor e carinho. Trabalhamos incansavelmente para resgatar e proteger cães e gatos em situações de vulnerabilidade, garantindo-lhes cuidados médicos, alimentação saudável e, é claro, toneladas de afagos. Nosso coração se enche de alegria ao encontrar famílias amorosas que possam dar a eles o lar que merecem. Educar e sensibilizar as pessoas sobre a importância do amor e dos cuidados aos animais é o que nos impulsiona. Na PetLove, acreditamos que cada rabinho abana mais feliz quando está envolto em amor e ternura, e estamos empenhados em espalhar esse afeto por todas as patinhas que cruzarem o nosso caminho.', NULL, '29377582000101', 1, '37170972', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (6, 'Paraíso dos Fucinhos', 'fucinhosdoparaiso@gmail.com', '31321776910', '81dc9bdb52d04dc20036dbd8313ed055', 'O Paraíso dos Focinhos é um santuário encantado, onde as histórias de patinhas e focinhos se entrelaçam em um tecido mágico de cuidado e compaixão. Aqui, nossa missão transcende o comum: é nutrir, proteger e oferecer um refúgio onde cães e gatos, seres especiais, encontram paz e harmonia. Neste santuário, resgatamos vidas, curamos feridas e tecemos laços de amor, acreditando que cada ser possui uma energia única que merece ser celebrada. Buscamos lares onde a magia do encontro transforma vidas, conectando corações de pelagem a corações humanos em um elo indelével de amor. Educar sobre a conexão mística entre nós e esses seres especiais é parte essencial do nosso propósito. No Paraíso dos Focinhos, vemos cada patinha como um elo sagrado entre o reino animal e o místico, e estamos empenhados em honrar essa ligação de maneira transcendental.', NULL, '7695425000101', 1, '35400001', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (7, 'Instituto Caramelo', 'luisamell@gmail.com', '18998641224', '202cb962ac59075b964b07152d234b70', 'O Instituto Caramelo é uma instituição dedicada ao cuidado e à proteção dos animais, promovendo um ambiente de respeito e atenção para cães e gatos desamparados. Nosso compromisso é resgatar, abrigar e fornecer assistência médica e emocional a esses seres queridos, oferecendo-lhes a oportunidade de uma nova vida. Buscamos lares amorosos e responsáveis, promovendo a adoção consciente e garantindo a integração harmoniosa desses animais em seus novos ambientes. Além disso, priorizamos a conscientização e a educação da comunidade sobre a importância dos cuidados adequados aos animais de estimação, visando a construção de uma sociedade mais compassiva e responsável. No Instituto Caramelo, cada ação é pautada pela seriedade e pela dedicação ao bem-estar animal, com o objetivo de garantir um futuro mais digno e acolhedor para cada patinha que cruzar o nosso caminho.', NULL, '74472178000171', 1, '25215090', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (8, 'Rock Bicho', 'bichodorock@gmail.com', '27556982152', '202cb962ac59075b964b07152d234b70', 'O Rock Bicho é uma harmonia de cuidado e paixão pelos animais! Somos uma batida vibrante dedicada a resgatar, proteger e cuidar dos nossos amigos de quatro patas. Nossa melodia é composta por resgates apaixonados, acordes de cuidados médicos e solos de amor incondicional. Buscamos lares onde cada animal possa ser a estrela principal, encontrando famílias afinadas com a responsabilidade e o carinho necessários. Não apenas ajudamos animais, também buscamos acordes de conscientização, promovendo a importância da adoção responsável e dos cuidados adequados. No Rock Bicho, acreditamos que cada patinha tem seu próprio ritmo, sua melodia única, e estamos empenhados em criar um coro de vidas melhores para esses seres especiais.', NULL, '14831830000175', 1, '29055260', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (9, 'Amigo não se compra', 'amigonaosecompra@gmail.com', '2789225462', '202cb962ac59075b964b07152d234b70', 'A ONG "Amigo Não se Compra" é um abraço de pelúcia no mundo dos animais! Aqui, levamos a sério a alegria de resgatar, cuidar e encontrar lares para nossos amigos peludos. Afinal, amigos de verdade não se compram, eles se adotam com amor! Nossa missão é fazer do rabo abanando a trilha sonora dos finais felizes, proporcionando cuidados, amor e muita diversão para nossos companheiros de quatro patas. Além de resgatar e encontrar lares amorosos, espalhamos sorrisos com iniciativas educativas sobre adoção responsável e cuidados animais de uma forma bem divertida! Porque aqui, acreditamos que cada patinha é um convite para um mundo mais alegre. Juntos, vamos provar que a amizade verdadeira não se compra, se adota com um carinho sem igual!', NULL, '79473465000110', 1, '29240000', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (10, 'Oásis', 'oasis@gmail.com', '24542779286', '202cb962ac59075b964b07152d234b70', 'O Lar Temporário Oásis é um enigma desvendado no coração do deserto, uma antiga promessa de cuidado e proteção para as criaturas de quatro patas. Como os mistérios do Nilo, nossa missão é resgatar, nutrir e salvaguardar os animais em necessidade, oferecendo um refúgio transitório, como uma pausa sob as sombras das palmeiras. Neste oásis, os cães e gatos recebem os cuidados dignos de faraós, onde são tratados como verdadeiras joias preciosas do reino animal. Buscamos os lares mais abençoados, onde esses seres mágicos encontrarão seu lar definitivo. Promovemos uma sabedoria ancestral sobre a importância da adoção consciente e do respeito aos seres vivos. No Lar Temporário Oásis, acreditamos que cada patinha é uma relíquia a ser protegida e reverenciada, e estamos comprometidos em traçar hieróglifos de amor e compaixão para o bem-estar destes seres encantados.', NULL, '28311113000127', 1, '27253510', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (11, 'Focinho Carente', 'Focinhocarente@gmail.com', '13991017696', '202cb962ac59075b964b07152d234b70', 'O Focinho Carente é a centelha de esperança para as almas peludas que anseiam por um lar amoroso. Nossa missão é ser o abraço caloroso para aqueles que precisam, resgatando, acolhendo e cuidando de cães e gatos desamparados. Estendemos a eles não só cuidados médicos e físicos, mas um suporte emocional, uma promessa de que dias melhores virão. Buscamos lares onde esses seres tão especiais possam encontrar não apenas um teto, mas um porto seguro de afeto e carinho. Espalhamos o brilho da esperança por meio de programas educativos, compartilhando histórias de superação e amor incondicional. No Focinho Carente, cada patinha representa a chance de um novo começo, e estamos determinados a pintar um futuro repleto de alegria e novas oportunidades para cada um deles.', NULL, '19147052000113', 1, '11350240', 'O');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (12, 'Morada da Floresta', 'Morada@gmail.com', '13988616269', '202cb962ac59075b964b07152d234b70', 'A Morada da Floresta é o capítulo mais nobre e acalentador na história dos seres da mata. Nossa missão é resgatar, proteger e cuidar dos animais que habitam essas terras ancestrais, oferecendo-lhes um refúgio seguro como os antigos bosques. Somos guardiões de uma conexão ancestral, onde cães e gatos desprotegidos são acolhidos com a mesma reverência que os seres da floresta receberam dos antigos povos. Buscamos, como arautos do passado, lares onde esses animais possam ser honrados como membros sagrados de novas tribos, encontrando famílias que respeitem a harmonia entre homem e natureza. Além de acolher, compartilhamos o saber das matas por meio de programas educativos, preservando os laços místicos e o respeito à fauna que há séculos habitam essas terras. Na Morada da Floresta, cada patinha é um elo com os tempos antigos, e estamos empenhados em manter essa tradição de cuidado e proteção ao legado selvagem que nos cerca.', NULL, '40404129000180', 1, '11721030', 'O');

INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (13, 'Joana Silva', 'joana@email.com', '13991027686', '81dc9bdb52d04dc20036dbd8313ed055', '', NULL, '', 1, '11350240', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (14, 'João da Silva', 'joao@gmail.com', '31987654321', '01cfcd4f6b8770febfb40cb906715822', '', NULL, '', 1, '30111000', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (15, 'Lívia Santos', 'livia.santos@gmail.com', '13987654321', '9728a4c86cfea37bba7085d655c2d4dc', '', NULL, '', 1, '11015130', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (16, 'Amélia Moura', 'moura.amelia@gmail.com', '13996654788', '310dcbbf4cce62f762a2aaa148d556bd', '', NULL, '', 1, '38410150', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (17, 'José Augusto', 'zezinho@gmail.com', '2455667890', '0266e33d3f546cb5436a10798e657d97', '', NULL, '', 1, '27253510', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (18, 'Pedro Ferreira', 'ferreirapedro@gmail.com', '1144556739', '564f4bcd11273b8ea6b49fbe2dc2ad1c', '', NULL, '', 1, '11721030', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (19, 'Lavinia Azevedo Rocha', 'LaviniaAzevedoRocha@gmail.com', '1987853064', '0e1ebad68af7f0ae4830b7ac92bc3c6f', '', NULL, '', 1, '13465791', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (20, 'Vinícius Melo Gomes', 'ViniciusMeloGomes@gmail.com', '8187073510', '4d1a65f1c6d24c1f8f714fe7e31d29fc', '', NULL, '', 1, '53504', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (21, 'Cauã Dias Ribeiro', 'CauaDiasRibeiro@gmail.com', '8590613274', 'ce064f3048963690520b63dd9625dac0', '', NULL, '', 1, '60331250', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (22, 'Letícia Cunha Costa', 'LeticiaCunhaCosta@gmail.com', '4564584152', '884ce4bb65d328ecb03c598409e2b168', '', NULL, '', 1, '85679', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (23, 'Manuela Pereira Ribeiro', 'ManuelaPereiraRibeiro@gmail.com', '1124578316', 'ad3019b856147c17e82a5bead782d2a8', '', NULL, '', 1, '13301629', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (24, 'Otávio Correia Melo', 'OtavioCorreiaMelo@gmail.com', '3143235839', 'aa486f25175cbdc3854151288a645c19', '', NULL, '', 1, '35900823', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (25, 'Emily Goncalves Almeida', 'EmilyGoncalvesAlmeida@gmail.com', '8169456531', '1579779b98ce9edb98dd85606f2c119d', '', NULL, '', 1, '54730270', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (26, 'Bianca Cunha Martins', 'BiancaCunhaMartins@gmail.com', '1153697905', '15231a7ce4ba789d13b722cc5c955834', '', NULL, '', 1, '2652140', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (27, 'Beatrice Gomes Goncalves', 'BeatriceGomesGoncalves@gmail.com', '8572848846', '97d0145823aeb8ed80617be62e08bdcc', '', NULL, '', 1, '60764510', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (28, 'Vitór Ferreira Cardoso', 'VitorFerreiraCardoso@gmail.com', '1666627423', 'd5ff135377d39f1de7372c95c74dd962', '', NULL, '', 1, '14080095', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (29, 'Tiago Oliveira Castro', 'TiagoOliveiraCastro@gmail.com', '8557325562', '7b7a53e239400a13bd6be6c91c4f6c4e', '', NULL, '', 1, '60865740', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (30, 'Danilo Alves Castro', 'DaniloAlvesCastro@gmail.com', '6245407092', '4a3e00961a08879c34f91ca0070ea2f5', '', NULL, '', 1, '74915020', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (31, 'Igor Oliveira Pinto', 'IgorOliveiraPinto@gmail.com', '1160038043', '49afa3a1bba5280af6c4bf2fb5ea7669', '', NULL, '', 1, '13222740', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (32, 'Anna Cunha Gomes', 'AnnaCunhaGomes@gmail.com', '1361913159', '83cdcec08fbf90370fcf53bdd56604ff', '', NULL, '', 1, '11495077', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (33, 'Andre Souza Fernandes', 'AndreSouzaFernandes@gmail.com', '1133515149', 'e56b06c51e1049195d7b26d043c478a0', '', NULL, '', 1, '8507310', 'A');
INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, ic_ativo, cd_cep, sg_tipo)
VALUES (34, 'Miguel Nascimento dos Santos', 'miguel.nasto@gmail.com', '13996722405', '33bdf955c5d92555d8977eff1c5815c5', '', NULL, '', 1, '11325110', 'A');

INSERT INTO tipo_evento (cd_tipo, nm_tipo) VALUES 
(1, 'Vacinação'),
(2, 'Banho e Tosa'),
(3, 'Adoção');

INSERT INTO evento (cd_evento, nm_evento, ds_evento, dt_inicio, dt_final, cd_organizacao, cd_tipo) VALUES 
(1, 'Pet day', 'Evento de adoção de animais. Venha conhecer animais adoráveis em busca de um novo lar!', '2024-12-02 13:00', '2024-12-02 19:00', 2, 1),
(2, 'Feira de adoção', 'Junte-se a nós na "Feira de Adoção", um evento emocionante e cheio de amor dedicado a encontrar casais amorosos para animais necessitados. Neste dia especial, teremos uma variedade de cães e gatos adoráveis ​​aguardando ansiosamente por uma nova família. ', '2024-08-01 10:00', '2024-08-01 16:00', 2, 1),
(3, 'Pet Lover''s', 'Um evento caloroso para adoção de animais em busca de lares amorosos.', '2024-12-12 10:00:00', '2024-12-12 17:00:00', 2, 1),
(4, 'Feirinha de adoção', ' Venha conhecer esses companheiros leais, interaja com eles e descubra como você pode fazer a diferença em suas vidas. Uma equipe de adoção estará presente para orientá-lo durante o processo de adoção.  ', '2024-08-01 10:00', '2024-08-01 16:00', 2, 2),
(5, 'Ração traz doação', ' Estamos reunindo amantes de animais e membros da comunidade para compartilhar a alegria de alimentar aqueles que não têm voz. Neste evento, você terá a oportunidade de incluir pacotes de ração nutritiva para cães e gatos, contribuindo assim para garantir que todos os animais tenham acesso a uma refeição saudável.', '2024-06-07 10:00', '2024-06-07 18:00', 2, 2),
(6, 'Achar fofo não enche tigela', ' Neste dia, estaremos coletando e distribuindo sacos de ração nutritiva para cães e gatos que estão em abrigos e lares temporários. Sua contribuição fará toda a diferença na vida desses animais adoráveis, garantindo que eles recebam a nutrição adequada enquanto aguardam por um lar permanente.', '2024-04-09 10:00', '2024-04-09 18:00', 2, 2),
(7, 'Coloque amor e comida nesta tigela', ' Neste evento significativo, estamos reunindo corações compassivos para apoiar nossos amigos de quatro patas que precisam de um pouco mais de ajuda.', '2023-07-16 10:00', '2024-07-16 18:00', 2, 2),
(8, 'Adote um bichinho', 'Um evento caloroso para adoção de animais em busca de lares amorosos.', '2024-09-23 10:00:00', '2024-09-23 17:00:00', 2, 1),
(9, 'Semana Animal', 'O evento, que também celebra o Dia Mundial dos Animais (04 de outubro), o Dia Mundial Contra a Raiva (28 de setembro) e o Dia Internacional do Morcego (1º de outubro), tem o objetivo de conscientizar a população sobre a guarda responsável e oferecer uma série de serviços gratuitos para os pets dos munícipes da cidade de São Paulo, como vacinação antirrábica, castração, emissão do Registro Geral do Animal (RGA) e implantação de microchip.', '2024-09-28 09:00', '2024-10-04 17:00', 6, 1),
(10, 'Campanha de vacinação', 'No sábado, 17 de agosto, das 9h às 16h, acontece o Dia D e última data da Campanha de Vacinação Antirrábica para cães e gatos. A Divisão de Vigilância em Saúde da Prefeitura de Cajati orienta que os bichinhos com idade acima de quatro meses, inclusive fêmeas gestantes, em fase de amamentação ou período de cio sejam levados para tomar a vacina. Para facilitar a aplicação da vacina, a recomendação é utilizar a coleira para os cães e, para os de porte maior, também a focinheira. Para os gatos, a orientação é levá-los nas caixas de transporte. Os responsáveis que tiverem a carteirinha de vacinação do pet, podem levar para o registro da imunização.', '2024-08-17 09:00', '2024-08-17 16:00', 3, 1),
(11, 'Dia D', 'A Prefeitura de São Pedro da Aldeia vai promover mais um mutirão de vacinação antirrábica. O evento será dia (30/09), das 9h às 16h, em 15 pontos distribuídos pela cidade. As doses da vacina contra a raiva animal serão destinadas a cães e gatos.Para vacinar e proteger o seu pet, os donos devem ficar atentos a alguns requisitos. O principal é levar a carteirinha de vacinação animal para ser atualizada com o lote e a validade da vacina.', '2024-09-30 09:00:00', '2024-09-30 16:00:00', 1, 1),
(12, 'Campanha de vacinação', 'Durante a campanha, o Serviço de Vigilância Epidemiológica será um ponto fixo de vacinação de cães e gatos e funcionará de segunda a sexta-feira, das 8h às 12h e das 14h às 17h e aos sábados, das 7h às 17h. O endereço é Marginal Maria Chica, 1.306. É necessário levar a carteirinha de vacinação do animal. A vacinação seguirá aos sábados, nos dias 19 e 26 de agostos, em locais espalhados por toda a cidade.', '2024-08-19 08:00', '2024-08-26 17:00', 8, 1),
(13, 'Adotar é o bicho', 'Com o objetivo de estimular a Educação Ambiental, durante o evento gatos e cachorros, cuidados pelo Centro de Controle de Zoonoses, estarão disponíveis para adoção. Os profissionais da Semam vão orientar a população sobre cuidados com os animais, com informações sobre vacinação, castração, comportamento, vermifugação, entre outras.', '2024-01-07 15:00', '2024-01-07 19:00', 8, 3),
(14, 'Evento de adoção de animais', 'Os interessados em adotar poderão comparecer no local portando documento oficial com foto e comprovante de residência. Após a escolha do pet, o adotante irá participar de uma entrevista de análise de perfil e em seguida assinar o termo de adoção responsável.', '2024-11-28 13:00', '2024-11-28 17:00', 9, 3),
(15, 'Adote um amigo', 'Venha se juntar a nós no evento "Adote um Amigo", onde o amor encontra um lar! No dia 15 de dezembro, das 10h às 16h, o parque central da cidade estará repleto de patinhas e afeto. Traga sua família e descubra uma variedade de amigos peludos aguardando por um lar amoroso. Este evento é uma oportunidade única de encontrar seu companheiro perfeito. Localizado no Parque Central, na rua principal, este é um convite para unir corações e criar laços duradouros. Venha fazer parte desta jornada de amor e adoção!', '2024-12-15 10:00', '2024-12-15 16:00', 5, 3),
(16, 'Sr Day', 'O SR Day está chegando para espalhar amor e encontrar lares para os nossos amigos de quatro patas! Junte-se a nós no dia 15 de dezembro, das 10h às 15h, no Parque da Cidade, onde uma variedade de animais adoráveis aguardam ansiosamente por um lar amoroso. Este evento de adoção oferece uma oportunidade única para conhecer e adotar cães e gatos afetuosos, todos prontos para encher seus corações de alegria. Venha fazer parte deste dia especial e descubra seu mais novo companheiro peludo!', '2024-12-15 10:00', '2024-12-15 15:00', 4, 3),
(17, 'Castração em massa', 'Junte-se a nós no evento "Castração em Massa" para uma jornada de amor pelos nossos amigos de quatro patas!no Parque dos Animais Felizes estaremos promovendo uma megaadoção de gatos e cães resgatados, além de oferecermos serviços de castração gratuitos para ajudar a controlar a população animal e promover cuidados responsáveis. Venha conhecer essas adoráveis criaturas e talvez até encontrar seu novo companheiro de patas!', '2024-12-15 9:00', '2024-12-15 14:00', 6, 3),
(18, 'Campanha de Vacinação', 'Junte-se a nós no evento "Vacinação em Massa" de adoção de animais! Este evento emocionante acontecerá no próximo sábado, dia 15 de dezembro, das 10h às 15h, no Parque Central da cidade. Prepare-se para encontrar uma variedade de adoráveis ​​amigos peludos ansiosos por encontrar um lar amoroso. Além de oferecer uma oportunidade única de adotar um novo membro da família, estaremos fornecendo vacinações gratuitas para todos os animais adotados neste dia. Venha fazer parte deste momento especial e ajude a tornar o Natal desses animais ainda mais brilhante!', '2023-12-15 10:00', '2023-12-15 15:00', 4, 1),
(19, 'Adoção de Amiguinhos', 'Junte-se a nós no evento "Adoção de Amiguinhos"! Uma oportunidade incrível de encontrar seu companheiro peludo perfeito espera por você. Venha nos visitar no sábado, dia 15 de dezembro, das 10h às 15h, no Parque dos Animais Felizes, localizado na Rua das Patinhas, número 123. Estaremos reunindo uma variedade de amigos de quatro patas ansiosos para encontrar um lar amoroso. Haverá atividades interativas, orientação sobre cuidados com animais e, é claro, a chance de conhecer esses amigos adoráveis em busca de um lar para sempre. Não perca essa oportunidade de fazer a diferença na vida de um peludo! A entrada é gratuita e seu futuro companheiro pode estar esperando por você.', '2024-12-15 10:00', '2024-12-15', 8, 3),
(20, 'Feira de Adoção', 'Venha fazer parte desta celebração do amor pelos animais na nossa Feira de Adoção! Junte-se a nós no dia 10 de Janeiro, das 10h às 16h, no Parque Central da Cidade. Prepare-se para encontrar amigos de quatro patas à procura de um lar amoroso. Teremos uma variedade de cães e gatos resgatados, prontos para encher seu coração de alegria e carinho. Traga sua família e amigos para esta experiência única de dar um novo lar a um amigo peludo. Não perca a chance de fazer a diferença na vida de um animalzinho! Junte-se a nós para um dia repleto de amor e adoção.', '2024-01-10 10:00', '2024-01-10', 9, 3),
(21, 'Evento de banho e tosa', 'Junte-se a nós em um dia dedicado ao cuidado e amor pelos nossos amigos de quatro patas no "Evento de Banho e Tosa - Cuide e Adote!" no próximo sábado, dia 23 de dezembro, das 9h às 15h, no Parque dos Animais Felizes. Este é um momento especial para transformar a aparência e o bem-estar dos animais resgatados enquanto buscamos novos lares para eles. Teremos especialistas em banho e tosa prontos para mimar os peludos e deixá-los ainda mais adoráveis para seus futuros lares. Além disso, você terá a oportunidade de encontrar o seu companheiro perfeito entre cães e gatos carinhosamente resgatados. Venha se envolver nesta jornada de cuidado e amor pelos animais. Não perca esta oportunidade de dar um banho de amor e encontrar um amigo fiel para compartilhar momentos inesquecíveis!', '2024-12-23 9:00', '2023-12-23 15:00', 2, 2),
(22, 'Evento de adoção', 'Venha se juntar a nós no nosso Evento de Adoção no próximo sábado, dia 2 de dezembro, das 11h às 15h, no Parque dos Animais Felizes. Esta é a oportunidade perfeita para encontrar seu novo companheiro de quatro patas. Conheça cachorros e gatinhos adoráveis, todos buscando um lar amoroso. Haverá equipes de resgate locais presentes para ajudar a encontrar o par perfeito para você. Venha compartilhar um momento especial com esses animais encantadores e descubra como dar a um animalzinho um lar é uma das melhores decisões que você pode tomar. Junte-se a nós para um dia de alegria, amor e novas amizades peludas!Localização: Parque dos Animais Felizes, Rua das Patinhas, nº 123.', '2023-12-02 11:00', '2023-12-02 15:00', 5, 3),
(23, 'Um parque bom pra cachorro', 'Prepare-se para um dia cheio de alegria e patinhas felizes no evento "Um Parque Bom pra Cachorro"! Junte-se a nós no próximo dia 20 de novembro, das 10h às 15h, no Parque Verde. Venha conhecer uma variedade de amigos de quatro patas buscando um lar amoroso. Teremos cães de todas as raças e tamanhos esperando por uma família para chamar de sua. Além disso, desfrute de atividades divertidas para toda a família, desde áreas de brincadeiras para os peludos até workshops informativos sobre cuidados e adoção responsável. Venha compartilhar amor e alegria nesta jornada de adoção! Não perca a chance de fazer a diferença na vida de um amigo peludo. Traga sua família e amigos para um dia repleto de amor e cauda abanando.',' 2024-11-20 10:00','2024-11-20 15:00', 4, 3),
(24, 'Vacinação Contra Raiva','Junte-se a nós para a nossa campanha de Vacinação contra Raiva, um evento crucial para a saúde dos nossos amigos de quatro patas. No próximo sábado, dia 25 de Fevereiro, das 9h às 15h, estaremos no Parque Municipal, na área coberta próxima à entrada principal. Esta é uma oportunidade imperdível para garantir a saúde e o bem-estar dos seus animais de estimação. A vacinação contra raiva é essencial para prevenir esta doença perigosa, e estaremos oferecendo este serviço de forma gratuita para cães e gatos de todas as idades. Traga seus companheiros peludos e ajude-nos a protegê-los! Contamos com a sua presença para um dia dedicado à saúde e segurança dos nossos amados animais.','2024-02-25 09:00', '2024-02-25 15:00', 8, 1);

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
(1, 'Labrador', 1, 'G'), 
(2, 'Poodle', 1, 'M'),  
(3, 'Bulldog', 1, 'P'), 
(4, 'Pastor Alemão', 1, 'G'),
(5, 'Siamês', 2, 'P'),
(6, 'Persa', 2, 'M'), 
(7, 'Sphynx', 2, 'P'),
(8, 'Maine Coon', 2, 'G'),
(9, 'Holandês', 3, 'P'),
(10, 'Rex', 3, 'M'),
(11, 'Mini Lion', 3, 'P'),
(12, 'Fuzzy Lop', 3, 'G');

-- Animal 1 - ONG 1
CALL NovoAnimal(  'Buddy', 'Buddy, o labrador, é um cão de porte médio a grande, conhecido por sua personalidade amigável e carinhosa. Com um físico atlético e musculoso, ele possui uma pelagem densa e curta, geralmente em tons de preto, amarelo ou chocolate.
Seus olhos expressivos e gentis transmitem uma inteligência notável, enquanto suas orelhas pendentes acrescentam charme ao seu rosto amigável. O nariz largo e úmido é uma característica distintiva, sempre pronto para investigar o ambiente com seu faro aguçado.
A personalidade de Buddy é cativante. Ele é conhecido por ser afetuoso, leal e muito sociável, adorando interagir com pessoas e outros animais. Sua natureza brincalhona faz dele um excelente companheiro para famílias, crianças e outros pets.
Além disso, Buddy é altamente inteligente e ávido por atividades. Ele adora participar de jogos e treinamentos, mostrando-se muito receptivo a aprender truques novos. Sua disposição para agradar seu dono faz dele um cão extremamente obediente e fácil de treinar.
Em resumo, Buddy, o labrador, é um pacote completo de amor, diversão e lealdade, pronto para fazer parte e alegrar a vida de sua família.', '2023-10-25', true, 1, 'M', 1);

-- Animal 2 - ONG 2
CALL NovoAnimal('Molly', 'Molly, a poodle, é uma cadela elegante e encantadora, conhecida por sua pelagem densa e cacheada que exala uma sofisticação única. Ela vem em diferentes tamanhos, desde o miniatura até o padrão, mas independente do tamanho, sua aparência é sempre graciosa.
Seus olhos expressivos e inteligentes são emoldurados por uma pelagem luxuosa e encaracolada que pode ser de várias cores, como branca, preta, marrom ou cinza. Seu focinho alongado e fino complementa sua aparência delicada, enquanto suas orelhas pendentes acrescentam uma dose extra de charme.
A personalidade de Molly é verdadeiramente encantadora. Ela é conhecida por ser carinhosa, inteligente e extremamente leal à sua família. Seu comportamento afetuoso a torna uma excelente companheira para todas as idades, sendo especialmente carinhosa com crianças e idosos.', '2020-03-18', false, 2, 'F', 2);

-- Animal 3 ONG 3
CALL NovoAnimal('Duke', 'Duke, o Bulldog, é uma mistura fascinante de força e doçura embalada em um corpo compacto e musculoso. Com sua expressão facial marcante e inconfundível, ele tem um focinho curto e largo, e seus olhos profundos transmitem uma mistura de calma e curiosidade.
Sua pelagem é curta e densa, frequentemente em tons de fulvo, branco, tigrado ou malhado. As rugas proeminentes ao redor do focinho e da testa adicionam um charme peculiar à sua aparência robusta. As orelhas curtas e caídas complementam seu visual único.
A personalidade de Duke é cativante. Apesar de sua aparência imponente, ele é afetuoso, leal e gentil, sendo um companheiro leal para sua família. Sua natureza tranquila faz dele um ótimo parceiro para quem procura um amigo de quatro patas para relaxar e aproveitar momentos calmos.', '2020-09-08', false, 3, 'M', 3);

-- Animal  4 ONG 4
CALL NovoAnimal('Lola', 'Lola, a Pastor Alemã, é uma cadela majestosa e imponente, conhecida por sua postura nobre e olhar penetrante. Seu corpo atlético e musculoso está coberto por uma pelagem densa e dupla, geralmente em tons de preto e caramelo, que realçam sua presença marcante. Seus olhos castanhos expressam inteligência aguçada e lealdade inabalável, adicionando uma aura de determinação ao seu porte elegante.
Inteligente e altamente treinável, Lola é um exemplo de disciplina e devoção à sua família. Sua natureza protetora e vigilante faz dela uma guardiã confiável, sempre alerta para proteger aqueles que ama. Apesar de sua aparência imponente, seu coração é caloroso e afetuoso com os membros da família, especialmente com as crianças, demonstrando uma ternura inigualável em seu convívio.
Além de sua lealdade inquestionável, Lola é ávida por desafios mentais e físicos. Ela adora participar de atividades ao ar livre, como corridas, caminhadas e jogos que estimulem seu intelecto. Sua determinação e habilidade para aprender rapidamente tornam-na não apenas uma companheira leal, mas também uma parceira excepcional em treinamentos e trabalhos que demandam sua inteligência e destreza.', '2018-07-12', true, 4, 'F', 4);

-- Animal 5 ONG 5
CALL NovoAnimal('Rocky', 'Rocky, o siamês, é uma verdadeira obra de arte felina. Seu corpo esguio e musculoso é adornado por uma pelagem curta, macia e marcante, com uma coloração contrastante entre o corpo claro e extremidades mais escuras, como orelhas, focinho, patas e cauda. Seus olhos intensamente azuis são como duas joias brilhantes, transmitindo uma expressão de inteligência e curiosidade.
Além de sua aparência marcante, Rocky é conhecido por sua personalidade extrovertida e vocal. Ele é comunicativo e expressa suas opiniões e desejos de maneira eloquente, usando sua voz melodiosa para interagir com sua família humana. Inteligente e afetuoso, ele desenvolve laços estreitos com aqueles ao seu redor, demonstrando lealdade e um amor incondicional.
Sua natureza brincalhona e enérgica o mantém em movimento, adorando perseguir brinquedos, explorar novos ambientes e até mesmo realizar acrobacias para entreter a todos. Rocky é uma combinação fascinante de elegância, charme e uma personalidade cativante, tornando-se não apenas um companheiro, mas um verdadeiro membro querido da família.', '2021-01-30', false, 5, 'M', 5);

-- Animal 6 ONG 1
CALL NovoAnimal('Lucy', 'Lucy, a gata persa, é um exemplo vivo de elegância felina. Seu pelo exuberante e longo, em tons de cinza e branco, forma uma pelagem densa e sedosa que realça sua beleza majestosa. Seus olhos grandes e expressivos, frequentemente em tons de âmbar ou verde, parecem contar histórias por si só, revelando sua curiosidade e doçura.
Sua face achatada e focinho arredondado conferem-lhe um ar de serenidade, destacando-se pelas bochechas rechonchudas e pelo nariz pequeno e delicado. Lucy possui uma postura delicada e elegante, com movimentos graciosos que complementam sua natureza tranquila e contemplativa.
Apesar de sua aparência aristocrática, Lucy é afetuosa e desfruta de momentos de carinho e aconchego ao lado de sua família. Seu temperamento calmo e sua tendência a procurar locais confortáveis para descansar fazem dela não apenas uma bela gata, mas também uma companheira tranquila e amorosa para aqueles que têm a sorte de tê-la por perto.', '2019-04-05', true, 6, 'F', 1);

-- Animal 7 ONG 2
CALL NovoAnimal('Bailey', 'Bailey, o Sphynx, é um gato fascinante e distinto, com uma aparência única que cativa à primeira vista. Sua característica mais marcante é a ausência quase total de pelos, revelando uma pele macia e aveludada que proporciona uma sensação diferente ao toque. Sua pele pode apresentar uma variedade de cores e padrões, evidenciando suas rugas suaves e sua aparência musculosa.
Seus olhos expressivos, geralmente grandes e amarelos, destacam-se em contraste com sua pele, emanando uma inteligência cativante. As orelhas grandes e pontudas complementam sua face angular, acrescentando um ar de curiosidade e astúcia.
A personalidade de Bailey é tão única quanto sua aparência. Apesar de não ter pelos para demonstrar afeto, ele é extremamente carinhoso e apegado aos seus donos. Seu comportamento brincalhão e enérgico faz dele um ótimo companheiro para interações divertidas, além de ser conhecido por seu amor por aconchegar-se em busca de calor e carinho. Sua natureza extrovertida o torna um excelente gato para lares ativos, onde sua curiosidade infinita e personalidade afetuosa podem florescer plenamente.', '2020-11-28', false, 7, 'M', 2);

-- Animal 8 ONG 3
CALL NovoAnimal('Sophie', 'Sophie, a majestosa Maine Coon, é uma gata de porte impressionante e beleza estonteante. Com sua pelagem exuberante e longa, em tons variados de creme, ela se destaca pelo seu tamanho impressionante, parecendo quase uma miniatura de um felino selvagem. Seus olhos grandes e expressivos, geralmente dourados ou âmbar, transmitem uma inteligência tranquila e cativante.
Além da sua aparência deslumbrante, Sophie é conhecida por sua personalidade carismática e cativante. Ela é carinhosa, mas independente, desfrutando de momentos de tranquilidade e reflexão em sua própria companhia. No entanto, ela também é uma ótima companheira, apreciando interações afetuosas e participando de atividades familiares.
Sua inteligência aguçada faz dela uma aprendiz ágil, capaz de entender e até mesmo criar brincadeiras desafiadoras. Sophie é uma gata que cria laços fortes com sua família, demonstrando afeto de maneiras únicas e encantadoras, tornando-se não apenas uma presença imponente, mas também um coração amoroso dentro do lar.', '2018-12-17', false, 8, 'F', 3);

-- Animal 9 ONG 4
CALL NovoAnimal('Chloe', 'Chloe, a adorável coelha da raça Holandesa, é uma pequena bola de pelo e charme. Com sua pelagem característica, exibe um contraste marcante entre seu corpo predominantemente branco e suas orelhas e área ao redor dos olhos em preto, criando uma aparência elegante e distintiva. Seus olhos brilhantes e curiosos escondem uma inteligência peculiar.
Além de sua aparência encantadora, Chloe é conhecida por sua natureza brincalhona e enérgica. Ela adora explorar seu ambiente, sempre curiosa para descobrir novos cantos e recantos para investigar. Sua personalidade carinhosa e receptiva a interações humanas a torna uma companheira adorável para quem procura uma coelhinha afetuosa.
Sua agilidade e inteligência a tornam uma ótima aluna para ensinamentos simples e brincadeiras interativas. Chloe é uma coelha que aprecia momentos de carinho e brincadeiras, adicionando uma dose de alegria e vitalidade ao ambiente ao seu redor, transformando cada dia em uma nova aventura cheia de surpresas fofas.', '2021-06-22', true, 9, 'F', 4);

-- Animal 10 ONG 5 
CALL NovoAnimal('Jack', 'Jack, o labrador, é um cão cheio de vida e personalidade. Com sua pelagem brilhante e olhos expressivos, ele personifica a alegria e a lealdade desta adorável raça. Seu pelo curto e denso, geralmente em tons de amarelo, chocolate ou preto, complementa sua aparência atlética e robusta.
Sua natureza amorosa e afetuosa faz de Jack um companheiro excepcional para toda a família. Ele é conhecido por seu espírito brincalhão e disposição para participar de qualquer aventura, seja um passeio ao ar livre ou um jogo animado. Sua inteligência notável e facilidade de treinamento o tornam não apenas um excelente amigo, mas também um aluno dedicado.
Além disso, Jack tem um coração generoso e uma lealdade inabalável aos seus entes queridos. Sua personalidade extrovertida e amigável o torna um ótimo cão de companhia para pessoas de todas as idades, trazendo alegria e entusiasmo para qualquer lar em que ele habita.', '2020-02-14', false, 1, 'M', 5);

-- Animal 11 ONG 1
CALL NovoAnimal('Lily', 'Lily, a encantadora poodle, é um exemplo de elegância e doçura. Com sua pelagem exuberante e cacheada, geralmente em tons de branco ou creme, ela irradia uma aura de graça e charme. Seus olhos expressivos, muitas vezes escuros e penetrantes, são uma janela para sua inteligência notável.
Além da sua beleza cativante, Lily é conhecida por sua personalidade afetuosa e alegre. Ela é carinhosa e leal, sempre pronta para oferecer amor incondicional à sua família. Sua disposição brincalhona e sua energia moderada a tornam uma companhia adorável para todas as idades, especialmente para aqueles que buscam um amigo de quatro patas carinhoso e de fácil convivência.
Lily é uma aprendiz ágil e ansiosa para participar de atividades que desafiem sua mente inteligente. Sua natureza dócil e sociável faz dela não apenas uma excelente companheira, mas também uma adição encantadora e acolhedora para qualquer lar.', '2019-08-09', false, 2, 'F', 1);


-- Animal 12 ONG 2
CALL NovoAnimal('Oliver', 'Oliver, o bulldog, é um cão que personifica a coragem e a doçura. Com seu físico robusto e compacto, ele exibe uma aparência distintiva com rugas marcantes e um focinho encurtado, transmitindo uma expressão adorável e determinada. Sua pelagem curta e densa, muitas vezes em tons de fulvo ou tigrado, complementa sua presença imponente.
Sua personalidade é uma mistura encantadora de lealdade e gentileza. Oliver é afetuoso e protetor com sua família, demonstrando um apego profundo aos que ama. Apesar de sua aparência imponente, ele é amoroso e tranquilo, apreciando momentos relaxantes ao lado de seus entes queridos.
A inteligência notável de Oliver é combinada com uma determinação tranquila, tornando-o um companheiro leal e confiável. Sua natureza paciente e seu caráter afável fazem dele não apenas um excelente cão de companhia, mas também um amigo fiel, sempre pronto para oferecer amor e conforto.', '2017-10-11', true, 3, 'M', 2);

-- Animal 13 ONG 3
CALL NovoAnimal('Zoey', 'Zoey, a pastor alemã, é uma combinação impressionante de beleza e inteligência. Com sua pelagem densa e característica em tons de preto e marrom, ela exibe uma postura elegante e atlética. Seus olhos castanhos profundos transmitem uma inteligência aguçada e uma lealdade inigualável.
Além de sua aparência imponente, Zoey é conhecida por sua devoção inabalável à sua família. Ela é protetora, corajosa e extremamente fiel, pronta para defender aqueles que ama. Sua natureza alerta e sua disposição para aprender e se envolver em atividades a tornam não apenas uma companheira confiável, mas também uma excelente guardiã.
Zoey é uma cadela altamente treinável e trabalhadora. Sua inteligência excepcional e sua vontade de agradar fazem dela uma excelente aluna, pronta para participar de tarefas desafiadoras e mostrar suas habilidades. Sua dedicação e amor incondicional tornam-na não apenas uma parte vital da família, mas também uma parceira incrível para qualquer pessoa em busca de lealdade e companheirismo.', '2021-03-27', false, 4, 'F', 3);


-- Animal 14 ONG 4
CALL NovoAnimal('Leo', 'Leo, o gato siamês, é uma exibição de elegância e charme felino. Com sua pelagem curta e sedosa, em tons de creme ou bege, contrastando com as extremidades mais escuras, ele possui uma aparência única e marcante. Seus olhos azuis intensos, hipnotizantes e expressivos, são uma característica notável que reflete sua personalidade vibrante.
Além da sua aparência deslumbrante, Leo é conhecido por sua natureza extrovertida e sociável. Ele é vocal e comunicativo, expressando suas opiniões e desejos com uma variedade de sons característicos da raça. Sua personalidade carinhosa e afetuosa faz dele um companheiro leal, desfrutando de interações próximas com sua família humana.
A inteligência aguçada de Leo o torna um aprendiz rápido e curioso. Ele adora desafios mentais, demonstrando agilidade em brincadeiras e até mesmo em truques simples. Leo é uma adição cativante para qualquer lar, trazendo não apenas sua beleza notável, mas também sua personalidade envolvente e afetuosa.', '2018-05-04', true, 5, 'M', 4);

-- Animal 15 ONG 5
CALL NovoAnimal('Maggie', 'Maggie, a gata persa, é uma verdadeira princesa felina. Com sua pelagem longa e exuberante, em tons de branco, creme ou até mesmo cinza, ela exala uma elegância majestosa. Seus olhos grandes e expressivos, muitas vezes de cor âmbar ou verde, transmitem uma doçura encantadora e uma serenidade cativante.
Além da sua beleza estonteante, Maggie é conhecida por sua personalidade serena e tranquila. Ela é afetuosa e calma, desfrutando de momentos de relaxamento e carinho ao lado de sua família. Sua natureza dócil a torna uma companhia reconfortante e perfeita para quem busca um amigo de quatro patas amoroso e tranquilo.
A inteligência observadora de Maggie a torna uma excelente observadora e uma ótima ouvinte, respondendo aos gestos e emoções sutis de seus donos. Sua doçura e presença suave acrescentam uma atmosfera serena e acolhedora ao lar, tornando-a não apenas uma gata bonita, mas também uma presença reconfortante e afetuosa na vida de sua família.', '2019-12-19', false, 6, 'F', 5);

-- Animal 16 ONG 1
CALL NovoAnimal('Anubis', 'Anubis, o gato Sphynx, é uma presença cativante e intrigante. Sua pele sem pelos e seu corpo musculoso e esguio destacam sua aparência única e marcante. Seu semblante expressivo, com orelhas grandes e olhos penetrantes, revela uma curiosidade inquisitiva e uma inteligência aguçada.
Além da sua aparência distinta, Anubis é conhecido por sua personalidade extrovertida e afetuosa. Ele é carinhoso e adora estar próximo de seus humanos, procurando calor e aconchego. Sua natureza brincalhona e sociável o torna um companheiro divertido, sempre pronto para interagir e explorar o ambiente ao seu redor.
A inteligência esperta de Anubis o torna um gato que gosta de desafios mentais e atividades interativas. Ele é curioso e está sempre pronto para novas experiências. Sua presença carismática e seu jeito afetuoso o transformam não apenas em um gato de aparência extraordinária, mas também em um companheiro cativante e amoroso para toda a família.', '2020-07-08', true, 7, 'M', 1);

-- Animal 17 ONG 2
CALL NovoAnimal('Visenya', 'Visenya, a majestosa gata Maine Coon, é uma visão impressionante de beleza e imponência felina. Com sua pelagem longa e exuberante, em tons variados de marrom, preto ou prateado, ela exibe uma presença magnífica e elegante. Seus olhos grandes e expressivos, frequentemente dourados ou âmbar, refletem uma inteligência cativante e uma personalidade curiosa.
Além da sua beleza marcante, Visenya é conhecida por sua personalidade carismática e afetuosa. Ela é dócil, gentil e desfruta da companhia de sua família humana, buscando carinho e interações próximas. Sua natureza tranquila a torna uma companhia relaxante e perfeita para aqueles que buscam um amigo de quatro patas amoroso e tranquilo.
A inteligência e a sociabilidade de Visenya a tornam uma gata que gosta de participar de atividades interativas e jogos desafiadores. Ela é observadora e adora explorar seu ambiente, mantendo-se sempre alerta e interessada em tudo ao seu redor. Sua presença graciosa e afetuosa enriquece qualquer lar, oferecendo não apenas sua beleza notável, mas também sua personalidade gentil e envolvente.', '2020-04-14', false, 8, 'F', 2);

-- Animal 18 ONG 3
CALL NovoAnimal('Charlie', 'Charlie, o adorável coelho da raça Holandesa, é uma bola de pelos e charme. Com sua pelagem curta e macia, exibe uma combinação de cores distintiva, com seu corpo predominantemente branco contrastando com suas orelhas e marcações em um tom escuro, criando uma aparência cativante. Seus olhos brilhantes e curiosos mostram uma personalidade ávida por explorar o mundo ao seu redor.
Além de sua aparência encantadora, Charlie é conhecido por sua natureza curiosa e brincalhona. Ele adora investigar seu ambiente, demonstrando uma energia cativante e entusiasmo por novas experiências. Sua disposição afetuosa e sociável o torna um companheiro adorável, especialmente para aqueles que buscam um amigo peludo e carinhoso.
A inteligência observadora de Charlie o torna um coelho ágil e atento, sempre pronto para interagir com jogos e brinquedos desafiadores. Sua natureza dócil e sua disposição para interações humanas tornam-no não apenas uma adição encantadora para qualquer lar, mas também um amigo fiel e amoroso para toda a família.', '2018-09-03', true, 9, 'M', 3);

-- Animal 19 ONG 10
CALL NovoAnimal('Bella', 'Bella, a encantadora labradora, é um pacote de alegria e lealdade. Com sua pelagem brilhante e olhos expressivos, ela exibe uma energia contagiante e uma disposição amigável. Seu pelo preto curto e denso, realça sua presença confiante e atlética.
Além da sua aparência adorável, Bella é conhecida por sua personalidade afetuosa e carinhosa. Ela é amigável e leal, sempre pronta para se envolver com sua família humana. Sua natureza brincalhona e sua disposição para participar de atividades a tornam não apenas uma excelente companheira, mas também uma fonte constante de diversão para todos ao seu redor.
A inteligência aguçada de Bella a torna uma aprendiz ágil, capaz de compreender comandos e responder a treinamentos com facilidade. Sua doçura e presença amorosa fazem dela não apenas uma labradora encantadora, mas também uma amiga confiável e amorosa, pronta para compartilhar momentos inesquecíveis ao lado de sua família.', '2021-08-01', false, 1, 'F', 10);

-- Animal 20 ONG 11
CALL NovoAnimal('Donna', 'Donna, a nossa encantadora labradora de 10 anos, é uma verdadeira dama de quatro patas que conquista corações com seu charme e sabedoria. Com seu pelo dourado reluzente e olhos cheios de ternura, ela é uma companheira leal, pronta para espalhar amor e alegria em qualquer lar.
Ao longo dos anos, Donna desenvolveu uma personalidade serena e gentil, tornando-se a confidente perfeita para longos passeios calmos ou simplesmente para um momento relaxante ao seu lado. Mesmo com sua idade, seu espírito vibrante e leal continua a inspirar, mostrando que a verdadeira beleza está na alma. 
Donna aguarda ansiosamente por uma família dedicada, pronta para acolher a calorosa presença e a experiência única que uma labradora mais sábia pode proporcionar. Venha conhecer Donna, e descubra a beleza atemporal de um amor canino verdadeiro.', '2013-06-12', true, 1, 'F', 11);

-- Animal 21 ONG 12
CALL NovoAnimal('Lyara', 'Conheça Lyara, a deslumbrante pastora alemã que encanta a todos com sua presença majestosa e lealdade inabalável. Com sua pelagem exuberante e expressão inteligente, Lyara é uma visão de beleza canina. Seus olhos atentos contam histórias de sabedoria, refletindo uma alma gentil e protetora. 
Aos seis anos, Lyara é uma companheira vibrante, pronta para aventuras ao ar livre e momentos de ternura em casa. Essa pastora alemã excepcional aguarda por uma família que aprecie não apenas sua imponência física, mas também a doçura e lealdade que ela oferece a quem a acolhe. 
Venha conhecer Lyara e descubra a alegria de compartilhar a vida com uma amiga tão única e dedicada.', '2017-02-01', true, 4, 'F', 12);

-- Animal 22 ONG 3
CALL NovoAnimal('Petyr', 'Conheça Petyr, o bulldog de 4 anos cheio de personalidade e charme. Com seu porte robusto e rugas adoráveis, Petyr é um verdadeiro cavalheiro canino. Seus olhos expressivos transmitem uma mistura única de curiosidade e lealdade, refletindo a natureza afetuosa desse bulldog encantador. 
Petyr é um companheiro brincalhão, sempre pronto para uma boa diversão ou um momento de carinho. Se você está em busca de um amigo leal com uma personalidade vibrante, Petyr está ansioso para trazer alegria e risadas à sua vida. 
Venha conhecê-lo e descubra o encanto irresistível desse bulldog de coração grande.', '2019-08-19', true, 3, 'M', 3);

-- Animal 23 ONG 5
CALL NovoAnimal('Vina', 'Conheça Vina, uma adorável poodle que conquista corações com seu charme e inteligência. Com seus cachos macios e expressão doce, Vina é uma dama elegante de quatro patas, com quatro anos de pura graça canina. Ela é mais do que uma companheira, é uma amiga leal pronta para preencher seu dia com alegria e amor. 
Vina é conhecida por sua natureza brincalhona e disposição para se aconchegar. Se você procura uma amiga peluda que traga alegria e afeto para sua vida, Vina é a poodle perfeita para iluminar seus dias. 
Venha conhecê-la e descubra o encanto irresistível dessa poodle cheia de personalidade.', '2020-12-01', true, 2, 'F', 5);

-- Animal 24 ONG 1
CALL NovoAnimal('Luthor', 'Luthor, o nosso adorável Labrador de 11 anos, é uma verdadeira fonte de alegria e companheirismo em nossa casa. Com seu pelo dourado brilhante e olhos cheios de doçura, ele é muito mais do que um simples animal de estimação; é um membro querido da família. Ao longo dos anos, Luthor conquistou a todos com seu temperamento amigável e leal. Sempre pronto para uma brincadeira ou um afago, ele se destaca por sua energia contagiante e sua capacidade de iluminar até os dias mais nublados.
Mesmo com seus 11 anos, Luthor mantém uma vitalidade incrível, ainda adorando suas caminhadas matinais e demonstrando entusiasmo sempre que a palavra "passeio" é mencionada. Sua inteligência e obediência fazem dele não apenas um excelente companheiro, mas também um cão notavelmente fácil de conviver. Em meio a seu amor pela vida e devoção inabalável à família, Luthor é uma verdadeira inspiração de como a idade pode ser apenas um número quando se trata de amor e felicidade canina. Seu olhar atencioso e leal é um lembrete constante do quanto ele significa para todos nós.', '2012-03-05', true, 1, 'M', 1);

-- Animal 25 ONG 1
CALL NovoAnimal('Arianne', 'Arianne é uma explosão de energia e personalidade na nossa casa. Seu porte robusto e expressão marcante tornam impossível não se apaixonar por ela à primeira vista. Com sua pelagem tigrada e rugas encantadoras, Arianne é uma verdadeira representante do charme irresistível dessa raça.
Apesar de sua juventude, Arianne já demonstra uma inteligência notável e uma curiosidade incessante pelo mundo ao seu redor. Seus olhos brilhantes denunciam uma alegria contagiante, e sua disposição para brincadeiras é interminável. Arianne é a companhia perfeita para aventuras ao ar livre, onde ela exibe sua agilidade e entusiasmo em cada passo. Sua natureza afetuosa e leal faz com que ela se destaque como uma amiga fiel, pronta para conquistar corações com sua personalidade cativante.', '2022-05-11', true, 3, 'F', 1);

-- Animal 26 ONG 1
CALL NovoAnimal('Otto', 'Otto, nosso charmoso Poodle, é uma verdadeira joia de pelagem fofa e olhos brilhantes que iluminam qualquer ambiente. Seu porte elegante e sua expressão inteligente fazem dele não apenas um cão de companhia, mas um membro querido da família. Com sua pelagem cuidadosamente mantida e sua atitude gentil, Otto é a personificação do estilo e da doçura canina.
Apesar de sua aparência elegante, Otto é cheio de vitalidade e brincadeiras, revelando uma alegria contagiante que é difícil de resistir. Seus momentos de brincadeira são uma mistura encantadora de vivacidade e graça, destacando sua agilidade única. Além disso, sua inteligência notável torna o treinamento uma experiência agradável, e sua lealdade incondicional o transforma em um companheiro confiável em todas as situações. Otto é mais do que um simples cão de estimação; é a personificação de amor, elegância e diversão em quatro patas.', '2021-09-21', true, 2, 'M', 1);

-- Animal 27 ONG 1
CALL NovoAnimal('Gaella', 'Gaella, uma Pastor Alemã de 8 anos, cujo olhar sábio e expressão gentil contam a história de uma vida cheia de experiências e lealdade. Seu pelo impecável e marcantes marcas escuras destacam sua beleza atemporal, enquanto seus olhos transmitem a sabedoria adquirida ao longo dos anos. Gaella é uma companheira excepcional, pronta para compartilhar seu afeto e experiência de vida com uma família amorosa.
Aos 8 anos, Gaella ainda está repleta de vitalidade e amor. Seu temperamento equilibrado e sereno faz dela a candidata ideal para um lar acolhedor. Com uma disposição tranquila, ela se adapta facilmente a diferentes ambientes e se dá bem com pessoas de todas as idades. Gaella é uma amiga fiel que, com seu histórico de vida, traz consigo uma incrível capacidade de se conectar emocionalmente com seus cuidadores. Se você está em busca de um companheiro leal, carinhoso e experiente, Gaella é a escolha perfeita para completar a sua família. Adote amor e sabedoria, adote Gaella.', '2015-04-10', true, 4, 'F', 1);

-- Animal 28 ONG 1
CALL NovoAnimal('Maerie', 'Conheça Maerie, uma adorável Buldogue, cuja presença calorosa e olhar meigo conquistam corações instantaneamente. Com seu pelo curto e características faciais distintas, Maerie é um exemplo clássico da doçura e charme dessa raça. Seus sete anos de vida a tornam uma companheira experiente, pronta para preencher um lar com amor e alegria duradouros.
Maerie é muito mais do que uma cadela de porte elegante; ela é uma amiga leal e carinhosa, pronta para se aconchegar nos momentos calmos e participar de brincadeiras animadas. Sua personalidade tranquila e amigável faz dela uma excelente opção para lares de todos os tipos. Maerie se dá bem com crianças e adultos, e sua natureza amorosa torna-a uma candidata ideal para ser parte integrante de uma família amorosa. Se você está pronto para oferecer a Maerie um lar cheio de carinho e atenção, adote essa buldogue encantadora e encha sua vida de momentos especiais. Adote Maerie e descubra o amor incondicional que um cachorro mais experiente pode proporcionar.', '2016-05-31', true, 3, 'F', 1);

-- Animal 29 ONG 1
CALL NovoAnimal('Tintin', 'Apresentamos Tintin, um Poodle cheio de charme e personalidade que está pronto para encher seu lar de alegria e companheirismo. Com seu pelo macio e ondulado, Tintin é um verdadeiro exemplo da elegância canina. Este simpático Poodle, com apenas dois anos de idade, traz consigo uma energia contagiante e uma disposição amigável que o tornam uma adição perfeita para qualquer família.
Tintin é mais do que apenas um rosto bonito; ele é um companheiro inteligente e leal, pronto para se envolver em brincadeiras animadas ou desfrutar de momentos relaxantes de carinho. Sua natureza afetuosa o torna particularmente adequado para lares com crianças e adultos. Tintin já está treinado e é facilmente adaptável, o que facilita a integração dele em novos ambientes. Se você procura um amigo peludo que combine charme, vivacidade e amor, adote Tintin e descubra como a presença dele pode transformar sua casa em um verdadeiro lar. Não perca a chance de dar a Tintin a família amorosa que ele merece.', '2018-07-24', true, 2, 'M', 1);

-- Animal 30 ONG 4
CALL NovoAnimal('Zion', 'Conheça Zion, um coelho Mini Lion que traz consigo uma dose extra de fofura para aquecer qualquer lar. Com sua pelagem exuberante e orelhas caracteristicamente adornadas, Zion é uma verdadeira obra de arte da natureza. Este pequeno amigo, com apenas um ano de idade, é a combinação perfeita de curiosidade e doçura, pronto para encantar seus dias com suas travessuras adoráveis.
Zion é mais do que apenas um coelhinho bonito; ele é um companheiro tranquilo e amoroso, perfeito para lares que buscam um animal de estimação dócil e de fácil convívio. Seu comportamento amigável o torna uma excelente opção para famílias com crianças ou para quem procura uma presença reconfortante em casa. Zion já está acostumado ao ambiente interno e é facilmente treinável, facilitando sua adaptação a novos lares. Adote Zion e descubra como a presença desse coelhinho encantador pode iluminar seus dias com alegria e carinho. Não deixe passar a oportunidade de dar a Zion um lar cheio de amor e cuidado.', '2022-11-27', true, 11, 'M', 2);

-- Animal 31 ONG 4
CALL NovoAnimal('Kaká', 'Apresentamos Kaká, uma coelha Holandesa que esbanja charme e personalidade em suas orelhinhas distintas e pelagem marcante. Com seus olhos curiosos e postura elegante, Kaká, de dois anos de idade, é um encanto em forma de coelhinha. Ela traz consigo uma combinação única de vivacidade e doçura, tornando-a uma adição perfeita para lares que buscam uma companhia carinhosa.
Kaká é uma coelha inteligente e sociável, pronta para se envolver em brincadeiras suaves ou simplesmente relaxar ao lado de seus cuidadores. Sua natureza dócil faz dela uma excelente opção para famílias com crianças ou para quem deseja um animal de estimação afetuoso. Kaká é cuidadosa e receptiva a carinhos, o que torna a interação com ela uma experiência verdadeiramente reconfortante. Se você está em busca de uma coelha adorável e encantadora, adote Kaká e descubra como ela pode transformar seu lar em um refúgio de alegria e carinho. Não perca a chance de dar a Kaká o amor e a atenção que ela merece.', '2020-10-04', true, 9, 'F', 4);

-- Animal 32 ONG 3
CALL NovoAnimal('Jonas', 'Conheça Jonas, um coelho Fuzzy Lop que é a personificação da fofura em quatro patas. Com suas orelhas caídas e pelagem irresistivelmente macia, Jonas é um pequeno encanto de orelhas felpudas. Aos três anos de idade, ele carrega consigo uma mistura única de curiosidade e tranquilidade, tornando-o um coelhinho ideal para quem busca uma companhia adorável.
Jonas é mais do que apenas um rostinho bonito; ele é um coelho inteligente e gentil, pronto para explorar seu novo lar e se aconchegar em momentos de carinho. Sua pelagem densa requer cuidados regulares, tornando a escovação não apenas uma necessidade, mas também uma oportunidade de fortalecer os laços entre você e seu novo amigo peludo. Se você está pronto para acolher um coelho que é uma verdadeira bola de pelos amorosa, adote Jonas e dê a ele um lar repleto de cuidados e afeto. Não perca a chance de ter um coelhinho que vai encher seus dias de alegria e suavidade.', '2020-03-19', true, 12, 'M', 3);

-- Animal 33 ONG 4
CALL NovoAnimal('Regina', 'Conheça Regina, uma coelha Rex que cativa corações com sua pelagem única e personalidade encantadora. Com seu pelo curto, macio e aveludado, Regina é uma verdadeira rainha entre os coelhos, destacando-se por sua beleza distinta. Aos quatro anos de idade, ela traz consigo a serenidade e a graça que tornam os coelhos Rex tão adoráveis.
Regina é mais do que apenas uma coelha bonita; ela é uma companheira afetuosa, pronta para preencher sua casa com carinho e charme. Seus olhos curiosos e orelhas delicadas fazem dela uma adição encantadora para famílias que buscam um coelhinho amigável. Com um temperamento dócil, Regina se adapta facilmente a novos ambientes e está ansiosa para explorar cada cantinho de seu futuro lar. Se você está pronto para dar um lar a uma coelha cheia de graça e ternura, adote Regina e descubra como sua presença pode encher seus dias de alegria. Não perca a oportunidade de acolher essa adorável coelha Rex em sua vida.', '2019-11-12', true, 10, 'F', 4);

-- Animal 34 ONG 2
CALL NovoAnimal('Bolinha', 'Conheça Bolinha, o Mini Lion, conquista corações com sua aparência adorável e personalidade cativante. Com sua pelagem exuberante e a juba que lhe confere um charme único, Bolinha é uma verdadeira bola de fofura em quatro patas.  Este coelhinho traz consigo uma mistura irresistível de curiosidade e doçura.
Bolinha não é apenas uma bolinha de pelos; ele é um coelho inteligente e brincalhão, pronto para se envolver em momentos divertidos e interações amorosas. Seu tamanho compacto e disposição amigável fazem dele o companheiro perfeito para lares que buscam um pet carinhoso e alegre. Bolinha adora receber carinhos e é rápido em se adaptar a novas situações. Se você está pronto para dar um lar a este coelhinho encantador, adote Bolinha e descubra como sua presença pode trazer um toque especial de alegria e amor ao seu dia a dia. Não perca a chance de acolher essa bolinha de pelos cheia de afeto em sua vida.', '2017-05-20', true, 11, 'M', 2);

-- Animal 35 ONG 3
CALL NovoAnimal('Mena', 'Apresentamos Mena, uma coelha Rex de pelagem macia e encantadora, pronta para conquistar um lar com sua doçura incomparável. Com seu pelo curto e aveludado que destaca sua beleza única, Mena é uma adição encantadora para qualquer família em busca de uma companhia afetuosa. Seus olhos curiosos e orelhas delicadas são um convite para momentos de carinho e ternura.
Mena é mais do que uma coelha de aparência graciosa; ela é uma amiga fiel, ansiosa para compartilhar momentos de alegria e brincadeiras em seu novo lar. Sua personalidade dócil e adaptável a tornam uma opção ideal para famílias e lares que procuram uma coelha de temperamento amigável. Mena já está pronta para oferecer e receber amor incondicional, tornando-a a candidata perfeita para quem busca uma amizade peluda repleta de carinho. Se você está pronto para adicionar um toque de suavidade e aconchego à sua vida, adote Mena e descubra como a presença dela pode transformar seus dias em momentos especiais de cumplicidade. Não deixe escapar a oportunidade de acolher essa coelhinha adorável em sua família.', 
'2019-10-12', true, 10, 'F', 3);

-- Animal 36 ONG 5
CALL NovoAnimal('Bruno', ' Bruno tem personalidade marcante e pelagem distintiva. Com suas orelhas curvas e marcações características, Bruno é uma adorável bolinha de pelo pronto para alegrar o coração de sua futura família adotiva. Seu pelo curto e a combinação única de cores fazem dele um coelho não apenas encantador, mas também memorável.
Bruno é mais do que apenas um rosto bonito; ele é um coelho inteligente e brincalhão, pronto para trazer alegria e diversão ao seu novo lar. Sua natureza curiosa e expressão animada o tornam um companheiro encantador para lares que procuram uma energia positiva e afetuosa. Bruno está ansioso para explorar seu ambiente e formar laços especiais com aqueles que o acolherem. Se você está pronto para adotar um coelho Holandês cheio de carisma e charme, Bruno está esperando por você para preencher sua vida com amor peludo. Não perca a oportunidade de fazer de Bruno o membro peludo e carinhoso de sua família.', '2022-09-30', true, 9, 'M', 5);

-- Animal 37 ONG 4
CALL NovoAnimal('Zara', 'Apresentamos Zara, uma coelha Fuzzy Lop de puro encanto e personalidade cativante. Com sua pelagem felpuda e orelhas caídas, Zara é uma verdadeira princesa entre os coelhos, pronta para conquistar corações com sua doçura. Seu pelo macio e olhos expressivos fazem dela não apenas uma coelha adorável, mas uma presença reconfortante para qualquer lar.
Zara não é apenas uma coelha bonita; ela é uma companheira afetuosa e curiosa, ansiosa para se envolver em brincadeiras suaves e momentos de carinho. Sua natureza tranquila e amigável a torna uma opção ideal para famílias e indivíduos em busca de uma coelha de temperamento dócil. Zara está pronta para se integrar ao seu novo lar, trazendo consigo toda a ternura e charme que os coelhos Fuzzy Lop têm a oferecer. Se você está pronto para receber em sua casa um coelhinho cheio de amor e pelagem fofa, adote Zara e descubra como sua presença pode iluminar seus dias com alegria. Não perca a chance de fazer desta coelha Fuzzy Lop uma parte especial da sua vida.', '2019-01-06', true, 12, 'F', 4);

-- Animal 38 ONG 3
CALL NovoAnimal('Liza', 'Com olhos brilhantes e pelagem marcada, Liza está pronta para encantar sua vida com sua presença graciosa. Com suas orelhas distintas e sua combinação de cores expressiva, Liza é uma coelha que se destaca por sua beleza e personalidade única. Seu pelo curto e brilhante adiciona um toque de elegância à sua figura adorável.
Liza é muito mais do que uma coelha bonita; ela é uma amiga carinhosa, ansiosa para compartilhar amor e momentos especiais com sua futura família. Sua natureza curiosa e brincalhona faz dela uma adição perfeita para lares que procuram um pet ativo e afetuoso. Liza está pronta para criar laços duradouros e trazer alegria aos dias de quem a adotar. Se você está pronto para dar um lar acolhedor a uma coelha Holandesa cheia de charme, adote Liza e descubra como a alegria peluda dela pode transformar sua casa em um lugar mais feliz. Não perca a oportunidade de fazer de Liza a companheira carinhosa que você estava esperando.', '2018-03-16', true, 9, 'F', 4);

-- Animal 39 ONG 4
CALL NovoAnimal('Luka', 'Luka, um coelho Rex de pelagem suave e aparência distintiva que certamente roubará seu coração. Com seu pelo curto e denso, Luka destaca-se não apenas pela sua beleza, mas também pela sua personalidade cativante. Seu visual único, com orelhas delicadas e marcações elegantes, torna Luka um verdadeiro protagonista entre os coelhos.
Luka é mais do que apenas um coelho bonito; ele é um companheiro amigável e curioso, pronto para explorar e compartilhar momentos especiais com sua futura família. Sua natureza dócil e atenta faz dele um pet encantador para lares que buscam uma amizade peluda. Luka está ansioso para encontrar um lugar para chamar de lar, onde possa trazer alegria e diversão com suas travessuras e carinho. Se você está pronto para adotar um coelho Rex cheio de charme e personalidade, traga Luka para sua vida e descubra como a presença peluda dele pode fazer toda a diferença. Não perca a oportunidade de dar a Luka um lar amoroso e acolhedor.
', '2023-01-06', true, 10, 'M', 4);

-- Animal 40 ONG 4
CALL NovoAnimal('Bebel', 'Conheça Bebel, uma coelha Fuzzy Lop que é pura fofura em quatro patas. Com sua pelagem incrivelmente macia e suas orelhinhas caídas, Bebel é uma verdadeira princesa peluda. Seu pelo denso e aveludado é uma tentação irresistível para quem busca um coelho repleto de charme e carinho.
Bebel não é apenas um rostinho bonito; ela é uma coelha encantadora, pronta para preencher seu lar com amor e momentos de ternura. Sua natureza brincalhona e curiosa a torna uma companhia divertida, perfeita para famílias que procuram um pet animado. Bebel está ansiosa para encontrar um lar amoroso, onde possa expressar todo o carinho e doçura que carrega consigo. Se você está pronto para adotar uma coelha Fuzzy Lop cheia de personalidade e suavidade, Bebel está aguardando ansiosamente por uma família para chamar de sua. Não perca a chance de dar a Bebel um lar acolhedor e repleto de carinho.', '2020-06-26', true, 12, 'F', 4);



INSERT INTO pergunta (cd_pergunta, nm_pergunta, cd_organizacao) VALUES
(1, 'Qual é seu nome completo?', 1),
(2, 'Qual seu email?', 1),
(3, 'Qual seu telefone para contato?', 1),
(4, 'Qual seu endereço completo? (nome da rua, número e cidade)', 1),
(5, 'Você mora em casa ou apartamento?', 1),
(6, 'Sua casa é totalmente telada, incluindo janelas, cômodos e sacadas?', 1),
(7, 'Você tem outros animais? Quais? São vacinados e castrados?', 1),
(8, 'Já teve outros animais? O que aconteceu com eles?', 1),
(9, 'Você é responsável na sua residência?', 1),
(10, 'Quem será o responsável pelo animal?', 1),
(11, 'Todos da casa estão cientes e concordam com a adoção?', 1),
(12, 'Você sabe dos cuidados necessários, como as vacinas anuais e vermífugos semestrais? São obrigatórios, você se compromete com tudo?', 1),
(13, 'O animal teria acesso total à casa ou ficaria no quintal? Você é a favor do uso de correntes se o animal precisar?', 1),
(14, 'Onde o animal dormiria, exatamente?', 1),
(15, 'Qual seria a sua postura se seu animal subisse no seu sofá ou cama?' , 1),
(16, 'Caso tenha que se mudar para um lugar menor ou que não aceite animais, o que faria com ele?', 1),
(17, 'Já devolveu algum animal adotado?', 1),
(18, 'Já teve que doar algum animal seu? Se sim, qual foi o motivo', 1),
(19, 'Caso o animal seja um cachorro e cresça mais que o esperado, o que você faria?', 1),
(20, 'Caso o animal fique doente e você não tenha condições de levar no veterinário, o que faria?', 1),
(21, 'Quantas pessoas moram com você? Se tiver crianças, qual a idade delas? Como eles reagem com os animais?', 1),
(22, 'Quantas horas por dia o animal passará sozinho?', 1),
(23, 'Se o animal for cão, quantas vezes por dia você passeará com ele?', 1),
(24, 'Você possui imóvel próprio ou mora de aluguel? Pretende se mudar?', 1),
(25, 'Atualmente você está trabalhando? Qual sua profissão?', 1);

INSERT INTO pedido (dt_pedido, ic_permitido, ic_finalizado, cd_animal, cd_adotante) VALUES
('2023-02-12', null, null, 1,  13),
('2023-03-21', true, true, 19, 14),
('2023-05-29', true, null, 16, 15),
('2023-07-30', true, null, 11, 16),
('2023-06-02', false, false, 6, 17),
('2023-09-08', null, null, 20, 18);