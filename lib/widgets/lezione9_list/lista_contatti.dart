/*
  Costruisci una rubrica: lista scrollabile; al tap apri una pagina dettaglio con nome, telefono ed email.
    • Almeno 5 contatti (classe modello o Map)
    • ListView.builder + ListTile
    • Navigator.push con MaterialPageRoute
    • Nella dettaglio: bottone o back → Navigator.pop

    main()
    └─ runApp(const RubricaApp())

    Contatto
    ├─ final String nome
    ├─ final String numero
    ├─ final String email
    └─ const Contatto({required this.nome, required this.numero, required this.email})

    RubricaApp (StatelessWidget)
    ├─ const RubricaApp({super.key})
    └─ build() → MaterialApp
        ├─ title: 'Rubrica'
        ├─ debugShowCheckedModeBanner: false
        ├─ theme: ThemeData
        │   ├─ colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)
        │   └─ useMaterial3: true
        └─ home: RubricaPage

    RubricaPage (StatelessWidget)
    ├─ const RubricaPage({super.key})
    ├─ static const _contatti = [Contatto(...), ... almeno 5]
    └─ build()
        ├─ final c = Theme.of(context).colorScheme
        └─ Scaffold
            ├─ AppBar
            │   ├─ centerTitle: true
            │   ├─ title: Text('Rubrica')
            │   ├─ backgroundColor: c.primary
            │   └─ foregroundColor: c.onPrimary
            └─ body: ListView.builder
                ├─ padding: EdgeInsets.all(12)
                ├─ itemCount: _contatti.length
                └─ itemBuilder: (context, index)
                    ├─ final contatto = _contatti[index]
                    └─ Card
                        └─ ListTile
                            ├─ leading: CircleAvatar
                            │   ├─ backgroundColor: c.primaryContainer
                            │   ├─ foregroundColor: c.onPrimaryContainer
                            │   └─ child: Text(contatto.nome[0])
                            ├─ title: Text(contatto.nome)
                            ├─ subtitle: Text(contatto.numero)
                            ├─ trailing: Icon(Icons.chevron_right)
                            └─ onTap: () { Navigator.push(context, MaterialPageRoute → DettaglioPage(contatto: contatto)) }

    DettaglioPage (StatelessWidget)
    ├─ final Contatto contatto
    ├─ const DettaglioPage({super.key, required this.contatto})
    └─ build()
        ├─ final c = Theme.of(context).colorScheme
        ├─ final t = Theme.of(context).textTheme
        └─ Scaffold
            ├─ AppBar
            │   ├─ centerTitle: true
            │   ├─ title: Text('Dettaglio contatto')
            │   ├─ backgroundColor: c.primary
            │   └─ foregroundColor: c.onPrimary
            └─ body: Padding
                └─ Column (crossAxisAlignment: stretch)
                    ├─ SizedBox(height: 16)
                    ├─ Center
                    │   └─ CircleAvatar (radius: 60, colori da c)
                    │       └─ child: Text(contatto.nome[0], style: t.displayMedium)
                    ├─ SizedBox(height: 16)
                    ├─ Text(contatto.nome, style: t.headlineMedium)
                    ├─ SizedBox(height: 24)
                    ├─ Card
                    │   └─ Column
                    │       ├─ ListTile
                    │       │   ├─ leading: Icon(Icons.phone)
                    │       │   ├─ title: Text(contatto.numero)
                    │       │   └─ subtitle: Text('Telefono')
                    │       ├─ Divider
                    │       └─ ListTile
                    │           ├─ leading: Icon(Icons.email)
                    │           ├─ title: Text(contatto.email)
                    │           └─ subtitle: Text('Email')
                    ├─ SizedBox(height: 24)
                    └─ FilledButton.icon
                        ├─ onPressed: Navigator.pop(context)
                        ├─ icon: Icon(Icons.arrow_back)
                        └─ label: Text('Torna indietro')
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const RubricaApp());
}

class Contatto {
  final String nome;
  final String numero;
  final String email;

  const Contatto({
    required this.nome,
    required this.numero,
    required this.email,
  });
}

class RubricaApp extends StatelessWidget {
  const RubricaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rubrica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: RubricaPage(),
    );
  }
}

class RubricaPage extends StatelessWidget {
  static const _contatti = [
    Contatto(
      nome: 'Anna',
      numero: '333 222 1111',
      email: 'anna.rossi@gmail.com',
    ),
    Contatto(
      nome: 'Luca',
      numero: '444 333 2222',
      email: 'luca.verdi@gmail.com',
    ),
    Contatto(
      nome: 'Andrea',
      numero: '555 444 3333',
      email: 'andrea.bianchi@gmail.com',
    ),
    Contatto(
      nome: 'Alessandra',
      numero: '666 555 4444',
      email: 'alessandra1@gmail.com',
    ),
    Contatto(
      nome: 'Riccardo',
      numero: '777 666 5555',
      email: 'riccardo123@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rubrica'),
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _contatti.length,
        itemBuilder: (context, index) {
          final contatto = _contatti[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: c.primaryContainer,
                // colora titolo e freccia indietro
                foregroundColor: c.onPrimaryContainer,
                child: Text(contatto.nome[0]),
              ),
              title: Text(contatto.nome),
              subtitle: Text(contatto.numero),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DettaglioPage(contatto: contatto),
                  ),
                ),
              },
            ),
          );
        },
      ),
    );
  }
}

class DettaglioPage extends StatelessWidget {
  final Contatto contatto;
  const DettaglioPage({super.key, required this.contatto});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dettaglio Contatto'),
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: c.primaryContainer,
                foregroundColor: c.onPrimaryContainer,
                child: Text(
                  contatto.nome[0],
                  style: TextStyle(color: c.onPrimaryContainer, fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              contatto.nome,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(contatto.email),
                    subtitle: const Text('Telefono'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(contatto.numero),
                    subtitle: Text('Email'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Torna indietro'),
            ),
          ],
        ),
      ),
    );
  }
}
