import 'package:flutter/material.dart';
import 'package:flutter_android/widgets/menu.dart';
import 'package:flutter_android/widgets/score.dart';

// ignore: must_be_immutable
class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  int index = 0;
  var _score = 0;
  var map1 = {
    'images/youtube.png': 'youtube',
    'images/discord.png': 'discord',
    'images/instagram.png': 'instagram',
    'images/jenkins.png': 'jenkins',
    'images/Visual-Studio.png': 'visual studio',
    'images/bitdefender.png': 'bitdefender',
    'images/louis.png': "louis vuitton",
    'images/dior.webp': "dior",
    'images/apple.png': "apple",
    'images/docker.png': 'docker',
    'images/YSL.png': 'ysl',
    'images/nike.png': 'nike',
  };

  late List keys = map1.keys.toList();
  late List values = map1.values.toList();
  String _textValue = '';
  final mycontroller = TextEditingController();

  final TextEditingController _textController = TextEditingController();
  String _userInput = '';

  void navigateToAnotherScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Score(message: _score.toString())),
    );
  }

  void _printUserInput() {
    _userInput = _textController.text;
    if (_userInput.toLowerCase() == values[index] &&
        index != (values.length - 1)) {
      setState(() {
        _score++;
        index++;
        _textController.text = "";
      });
    } else if (_userInput.toLowerCase() != values[index] &&
        index != (values.length - 1)) {
      setState(() {
        index++;
        _textController.text = "";
      });
    } else if (_userInput.toLowerCase() == values[index] &&
        index != values.length) {
      _score++;
      _textController.text = "";
      navigateToAnotherScreen(context);
    } else if (_userInput.toLowerCase() != values[index] &&
        index != values.length) {
      navigateToAnotherScreen(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              keys[index],
              height: 270,
              width: 270,
            ),
            Container(
              width: 200.0,
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'Enter your guess',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _printUserInput,
              child: const Text('Check your answer!'),
            ),
            const SizedBox(height: 20),
            Text(
              'Your score is: $_score',
              style: const TextStyle(
                fontSize: 20.0, // Specifies the font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
