import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  MemberPage({this.username = ''});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Member"),
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
