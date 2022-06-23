import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username = ''});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Admin"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Hallo $username',
            style: const TextStyle(fontSize: 20.0),
          ),
          ElevatedButton(
            child: const Text("LogOUt"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
          ),
        ],
      ),
    );
  }
}
