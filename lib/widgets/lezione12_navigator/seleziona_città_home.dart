/*
  Dalla Home apri una lista città; al tap torna indietro e mostra la scelta. 
  Back senza scelta = Home invariata.
    • `await Navigator.push<String>(…)`
    • Lista di almeno 4–5 città
    • `Navigator.pop(context, nome)` al tap
    • Aggiorna UI solo se il risultato non è null

  MyApp (StatelessWidget)
    └── MaterialApp
          └── home: Home()
  
  Home (StatefulWidget)
    ├── State -> _cittaScelta
    |      └── funzione async
    |
    └── Scaffold
          ├── appBar: AppBar (opzionale)
          └── body:
              └── Center
                  └── Column
                      ├── Text
                      └── FilledButton
                          └── child: Text
    
  ListaCitta (StatelessWidget)
    ├── List<String>
    |
    └── Scaffold
          ├── appBar: AppBar
          └── body:
              └── ListView.builder
                  ├── itemCount
                  └── itemBuilder → restituisce un ListTile
                      ├── title: Text
                      └── onTap
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seleziona città -> home',
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _cittaScelta;

  Future<void> apriLista() async {
    final risultato = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ListaCitta()),
    );

    if (!mounted) return;
    if (risultato != null) {
      setState(() {
        _cittaScelta = risultato;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _cittaScelta != null
                  ? 'Città scelta: $_cittaScelta'
                  : 'Nessuna scelta',
            ),
            FilledButton(onPressed: apriLista, child: Text('Apri lista')),
          ],
        ),
      ),
    );
  }
}

class ListaCitta extends StatelessWidget {
  const ListaCitta({super.key});

  final List<String> _citta = const [
    'Roma',
    'Milano',
    'Torino',
    'Bologna',
    'Verona',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista città')),
      body: Center(
        child: ListView.builder(
          itemCount: _citta.length,
          itemBuilder: (context, index) {
            final singolaCitta = _citta[index];
            return ListTile(
              leading: const Icon(Icons.location_city),
              title: Text(singolaCitta),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context, singolaCitta);
              },
            );
          },
        ),
      ),
    );
  }
}
