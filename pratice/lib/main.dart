import 'package:flutter/material.dart';

class Game {
  String name;
  late final String description;
  final String imagePath;

  Game({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamesScreen()),
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

class GamesScreen extends StatefulWidget {
  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  TextEditingController _newGameController = TextEditingController();
  List<Game> games = [
    Game(
      name: 'Counter-Strike 2',
      description:
          'Counter-Strike 2 é a tão aguardada sequência do clássico jogo de tiro em primeira pessoa, desenvolvido pela Valve Corporation. Mantendo a essência do original, CS 2 traz novos mapas, armas e mecânicas de jogo para os fãs da série. Com uma comunidade de jogadores dedicada e uma cena competitiva robusta, Counter-Strike 2 continua a ser um dos jogos de tiro mais populares do mundo, oferecendo uma experiência emocionante de estratégia e habilidade.',
      imagePath: 'assets/images/cs2.png',
    ),
    Game(
      name: 'Valorant',
      description:
          'Valorant é um jogo eletrônico de tiro tático em primeira pessoa, desenvolvido e publicado pela Riot Games. Lançado em 2020, o jogo rapidamente se tornou popular por sua combinação única de mecânicas de tiro precisas e habilidades especiais de agentes, criando um ambiente estratégico e dinâmico. Valorant oferece uma experiência competitiva e emocionante, combinando elementos de jogos de tiro táticos com personagens únicos e habilidades especiais, criando um jogo que atrai tanto jogadores casuais quanto profissionais competitivos.',
      imagePath: 'assets/images/valorant.png',
    ),
  ];

  Game? recentlyDeletedGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My fav games'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return ListTile(
            leading: Image.asset(
              game.imagePath,
              width: 50,
              height: 50,
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(game.name),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editGame(context, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteGame(index);
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailsScreen(game: game, games: games),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewGame(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _addNewGame(BuildContext context) async {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add new game'),
        content: TextField(
          controller: _newGameController,
          decoration: InputDecoration(labelText: 'Game name'),
          onChanged: (value) {},
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              String newGameName = _newGameController.text;
              if (newGameName.isNotEmpty) {
                setState(() {
                  games.add(Game(
                    name: newGameName,
                    description: 'Description of $newGameName',
                    imagePath: 'assets/images/games.png',
                  ));
                });
              }
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _editGame(BuildContext context, int index) {
    TextEditingController _editedGameController =
        TextEditingController(text: games[index].name);
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit game'),
        content: TextField(
          controller: _editedGameController,
          decoration: InputDecoration(labelText: 'New name game'),
          onChanged: (value) {},
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              String editedGameName = _editedGameController.text;
              if (editedGameName.isNotEmpty) {
                setState(() {
                  games[index].name = editedGameName;
                });
              }
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteGame(int index) {
    setState(() {
      recentlyDeletedGame = games.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${recentlyDeletedGame!.name} removed'),
        action: SnackBarAction(
          label: 'Cancel',
          onPressed: () {
            setState(() {
              games.insert(index, recentlyDeletedGame!);
            });
          },
        ),
      ),
    );
  }
}

class GameDetailsScreen extends StatefulWidget {
  final Game game;
  final List<Game> games;

  const GameDetailsScreen({Key? key, required this.game, required this.games}) : super(key: key);

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.game.description;
  }

  void _saveDescription(BuildContext context) {
    setState(() {
      widget.game.description = _descriptionController.text;
      
      widget.games[widget.games.indexOf(widget.game)].description = _descriptionController.text;
    });
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.game.imagePath,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Descrição:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter game description',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveDescription(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
