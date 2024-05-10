import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Lista de Mensagens'), centerTitle: true),
        body: Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}
