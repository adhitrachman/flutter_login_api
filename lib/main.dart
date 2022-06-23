import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/AdminPage.dart';
import '/MemberPage.dart';

void main() => runApp(MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => AdminPage(
              username: username,
            ),
        '/MemberPage': (BuildContext context) => MemberPage(
              username: username,
            ),
        '/MyHomePage': (BuildContext context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response = await http.post(
        Uri.parse("http://www.menuku.id/flutter/login_api/login.php"),
        body: {
          "username": user.text,
          "password": pass.text,
        });

    var datauser = json.decode(response.body.toString());

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['level'] == 'member') {
        Navigator.pushReplacementNamed(context, '/MemberPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: user,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
              const Text(
                "Password",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  _login();
                },
              ),
              Text(
                msg,
                style: const TextStyle(fontSize: 20.0, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
