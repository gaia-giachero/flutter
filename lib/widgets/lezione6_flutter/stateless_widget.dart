/*
  MaterialApp
    └─ Scaffold
        ├─ AppBar
        └─ body: Center
            └─ Text('Ciao')
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Profilo extends StatelessWidget {
  final String nome;
  final String bio;

  const Profilo({super.key, required this.nome, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.account_circle,
          color: Colors.grey,
          size: 70,
        ),
        SizedBox(height: 8),
        Text(nome, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
        SizedBox(height: 8),
        Text(bio, style: TextStyle(fontSize: 15),),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profilo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profilo'),
          centerTitle: true,
          // backgroundColor: Colors.pinkAccent,
          backgroundColor: Color(0xffff4455),
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 5,
        ),
        body: Center(
          child: Profilo(nome: 'Gaia', bio: 'Studentessa Flutter - ITS Academy Piemonte'),
        ),
      ),
    );
  }
}
