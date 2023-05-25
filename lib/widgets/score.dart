import 'package:flutter/material.dart';
import 'package:flutter_android/widgets/menu.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Score extends StatefulWidget {
  final String message;
  const Score({super.key, required this.message});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  late int score;
  int max_score = 0;

  // // Saving a variable
  Future<void> saveVariable(int variable) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('high_score', variable);
  }

  Future<void> _getAsset() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      max_score = prefs.getInt('high_score') ?? 0;
      if (int.parse(widget.message) > max_score) {
        max_score = int.parse(widget.message);
        saveVariable(int.parse(widget.message));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // getting the current score
    score = int.parse(widget.message);
    _getAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text(
              'The highest score was: ${max_score}',
              style: const TextStyle(
                  fontSize: 20.0, // Specifies the font size
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            const SizedBox(height: 20),
            Text(
              'Your score was: ${widget.message}',
              style: const TextStyle(
                  fontSize: 20.0, // Specifies the font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _share_social_media,
              child: const Text('Share on social media'),
            ),
          ],
        ),
      ),
      drawer: NavDrawer(),
    );
  }

  Future<void> _share_social_media() async {
    final shared = await SharedPreferences.getInstance();
    int current_score = shared.getInt('high_score') ?? 0;

    Share.share("Your score on the Logo Guesser Game was $current_score!",
        subject: 'High score');
  }
}
