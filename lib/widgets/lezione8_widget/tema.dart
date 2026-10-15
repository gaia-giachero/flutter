/*
  main()
    └─ runApp(TemaApp)

  TemaApp (StatefulWidget)
    └─ createState() → TemaAppState

  TemaAppState (State<TemaApp>)
    ├─ stato: bool _scuro
    └─ build() → MaterialApp

  TemaPage (StatelessWidget)
    ├─ riceve: scuro
    ├─ riceve: onToggle
    └─ build() → Scaffold

  MaterialApp <- tutto quello che contiene TemaApp per costruire la UI
    ├─ title
    ├─ debugShowCheckedModeBanner: false
    ├─ theme: ThemeData (chiaro)
    ├─ darkTheme: ThemeData (scuro)
    ├─ themeMode: (dipende da _scuro)
    └─ home: TemaPage
        └─ Scaffold
            ├─ AppBar
            │   └─ title: Text('Tema chiaro / scuro')
            └─ body: Padding
                └─ Column
                    ├─ SwitchListTile
                    │   ├─ secondary: Icon (luna / sole)
                    │   ├─ title: Text('Modalità scura')
                    │   ├─ subtitle: Text('Dark theme attivo' / 'Light theme attivo')
                    │   ├─ value: scuro
                    │   └─ onChanged: onToggle
                    ├─ Card
                    │   └─ Padding
                    │       └─ Column
                    │           ├─ Text('Ciao dal tema!')
                    │           └─ Text('I colori arrivano da...')
                    ├─ FilledButton
                    │   └─ Text('Bottone Filled (usa il primary)')
                    └─ OutlinedButton
                        └─ Text('Bottone Outlined')
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const TemaApp());
}

class TemaApp extends StatefulWidget {
  const TemaApp({super.key});

  @override
  State<TemaApp> createState() => TemaAppState();
}

class TemaAppState extends State<TemaApp> {
  bool _scuro = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema chiaro/scuro',
      debugShowCheckedModeBanner: false,
      themeMode: _scuro ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: TemaPage(
        scuro: _scuro,
        onToggle: (v) {
          setState(() => _scuro = v);
        },
      ),
    );
  }
}

class TemaPage extends StatelessWidget {
  final bool scuro;
  final ValueChanged<bool> onToggle;
  const TemaPage({super.key, required this.scuro, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tema chiaro / scuro',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              secondary: Icon(scuro ? Icons.nightlight : Icons.wb_sunny),
              title: Text('Theme'),
              subtitle: Text(
                scuro ? 'Dark theme attivo' : 'Light theme attivo',
              ),
              value: scuro,
              onChanged: onToggle,
            ),
            SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ciao dal tema!',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'I colori arrivano da Theme.of(context).colorScheme. \nCambia lo switch e guarda AppBar, bottoni e card.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {},
              child: Text('Bottone Filled (usa il primary)'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Bottone Outlined')),
          ],
        ),
      ),
    );
  }
}