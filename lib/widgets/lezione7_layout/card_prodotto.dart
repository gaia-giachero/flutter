/*
  MaterialApp
    └─ Scaffold
        ├─ AppBar
        └─ body: Center
            └─ Text('Ciao')
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const CardProdotto());
}

class CardProdotto extends StatelessWidget {
  const CardProdotto({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: 'Esempio card prodotto',
      debugShowCheckedModeBanner: false,
      home: CardProdottoPage(),
    );
  }
}

class CardProdottoPage extends StatelessWidget {
  const CardProdottoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Card prodotto', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1B5E20),
      ),
      backgroundColor: Color(0xFFC8E6C9),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Image.network(
                  'https://static.comet.it/b2c/public/e-cat/CEL08161T/CEL08161T-48c59a3f19-0.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Music Sound Cuffie Wireless MAXI2 Nero',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          '15€',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B5E20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Cuffie wireless around-ear leggere e confortevoli, con suono potente e bilanciato, microfono e controlli sul padiglione. Offrono 22 ore di autonomia con una ricarica di solo 1,5 ore.',
                    ),
                    SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xFF1B5E20),
                      ),
                      child: Text(
                        '🛒 Aggiungi al carrello',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
