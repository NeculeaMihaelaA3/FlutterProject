import 'package:flutter/material.dart';
import 'package:flutter_android/main.dart';
import 'package:flutter_android/widgets/newgame.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.pink,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/famous.jpg'))),
            child: Text(
              '',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Welcome'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.games),
            title: const Text('New Game'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewGame()),
              ),
            },
          ),
        ],
      ),
    );
  }
}
