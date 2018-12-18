import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: height * 0.2,
          ),
          Column(
            children: <Widget>[
              Image.asset('images/diamond.png'),
              SizedBox(height: 10),
              Text(
                "SHRINE",
                style: Theme.of(context).textTheme.headline,
              )
            ],
          ),
          SizedBox(
            height: height * 0.2,
          ),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true,
              labelText: "Username",
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              filled: true,
              labelText: "Password",
            ),
            obscureText: true,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text("CANCEL"),
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                },
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("NEXT"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
