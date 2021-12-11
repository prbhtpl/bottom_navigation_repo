// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: JustPage(),
    );
  }
}

class JustPage extends StatefulWidget {
  const JustPage({Key? key}) : super(key: key);

  @override
  _JustPageState createState() => _JustPageState();
}

class _JustPageState extends State<JustPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: 'Enter Your name'),
          ),
        ),
      ],
    );
  }
}
