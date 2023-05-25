import 'package:flutter/material.dart';
import 'package:flutter_android/widgets/menu.dart';

void main() {
  runApp(const MyApp()); //inside the run app
}

//StatelessWidget -- the screen will never change
class MyApp extends StatefulWidget {
  //same name with MyApp
  //stateless and statefull
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //flutter is widget inside widget...etc
  String buttonName = 'Click';
  int currrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //the skeleton of the app
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('<- Menu'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: const Center(
        child: Text(
          'Welcome to Logo Guesser!',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontStyle: FontStyle.italic),
        ),
      ),
      drawer: NavDrawer(),
    );
  }
}
