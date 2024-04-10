import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leonardo Games'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 300, height: 300),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPage()),
                );
              },
              child: Text('Games'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leonardo favourite games'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/cs2.png',
                      width: 150,
                      height: 150,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewPage2()),
                        );
                      },
                      child: Text('Counter-Strike 2'),
                    ),
                  ],
                ),
                SizedBox(width: 20), 
                Column(
                  children: [
                    Image.asset(
                      'assets/images/valorant.png',
                      width: 150,
                      height: 150,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewPage3()),
                        );
                      },
                      child: Text('Valorant'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage2 extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter-Strike 2'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Counter-Strike 2, conhecido também como CS2 é um jogo tático multijogador de tiro em primeira pessoa anunciado em 22 de março de 2023 e lançado em 27 de setembro de 2023. Desenvolvido e publicado pela Valve. É o quinto jogo da série principal Counter-Strike.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Assim como o Global Offensive, o jogo é composto por duas equipes, os Contra-Terroristas e os Terroristas, uma contra a outra em vários modos de jogo baseados em objetivos específicos dependendo do modo de jogo.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Counter-Strike 2 trás várias melhorias em relação ao seu antecessor, incluindo uma mudança do motor de jogo Source para Source 2, gráficos aprimorados e uma nova arquitetura de servidor "sub-tick".',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Além disso, muitos mapas do Global Offensive foram atualizados para aproveitar as vantagens dos recursos do Source 2, com alguns mapas recebendo revisões completas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Após o lançamento, recebeu críticas geralmente favoráveis dos críticos. Contudo, a recepção dos jogadores foi mista; as críticas foram direcionadas à retirada do Global Offensive da Steam, ao desempenho ruim do jogo e à remoção de várias funcionalidades que estavam presentes no Global Offensive. Como resultado, Counter-Strike 2 recebeu milhares de avaliações negativas dos jogadores na Steam, tornando-o um dos títulos da Valve com a pior avaliação na plataforma.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


class NewPage3 extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Valorant foi provocado pela primeira vez sob o título Project A em outubro de 2019. Foi anunciado oficialmente em 1º de março de 2020, com um vídeo de jogabilidade no YouTube chamado "The Round". A versão beta fechada do jogo foi lançada em 7 de abril de 2020 nos Estados Unidos, Canadá, Europa, Rússia e Turquia; no Brasil e na Coreia do Sul, a versão beta foi lançada em 5 de maio. Valorant foi lançado oficialmente em 2 de junho de 2020 para maioria das regiões do mundo através de etapas por cada localidade e seus fusos horários. Começou pela Coreia do Sul, Japão e maior parte da região Ásia-Pacífico. Logo após, chegou a vez dos servidores da Europa, Turquia, Oriente Médio, Norte da África e países da CEI. Pouco depois, o Brasil, América do Norte e América Latina viram o jogo ser disponibilizado. Até o momento, Valorant está disponível exclusivamente para a plataforma Microsoft Windows.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Valorant é um jogo eletrônico multijogador gratuito para jogar de tiro em primeira pessoa desenvolvido e publicado pela Riot Games. É o primeiro jogo do gênero desenvolvido pela empresa, sendo anunciado pela primeira vez com o codinome Project A em outubro de 2019, em um evento de comemoração de 10 anos de League of Legends. Foi lançado em 2 de junho de 2020 para Microsoft Windows. ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Valorant foi desenvolvido e publicado pela Riot Games, o estúdio por trás de League of Legends. O desenvolvimento começou em 2014, dentro de sua divisão de pesquisa e desenvolvimento. Joe Ziegler, diretor de Valorant, é creditado com a ideia inicial de Valorant enquanto formula jogos em potencial com outros desenvolvedores da Riot.David Nottingham é o diretor criativo de Valorant. Trevor Romleski, ex-projetista de League of Legends e Salvatore Garozzo, ex-jogador profissional e projetista de mapas para Counter-Strike: Global Offensive são os projetistas de Valorant. Moby Francke, ex-desenvolvedor da Valve, que foi projetista de arte e personagens para Half-Life 2 e Team Fortress 2, é o diretor de arte.',
              style: TextStyle(fontSize: 16),
            ),
          ]
            ),
  
        ),
      ); 
  }
}
