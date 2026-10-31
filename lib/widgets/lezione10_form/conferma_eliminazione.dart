/*
  Simula l’eliminazione di un elemento: 
  prima AlertDialog, poi SnackBar solo se confermato.
    • Pagina con un elemento (ListTile / Card)
    • Azione Elimina → showDialog
    • pop(true/false) per distinguere le scelte
    • Opzionale: nascondi l’elemento con setState

  main()
    └─ runApp(const MyApp())

  MyApp (StatelessWidget)
    ├─ const MyApp({super.key})
    └─ build() → MaterialApp
        ├─ title: 'HomePage'
        ├─ debugShowCheckedModeBanner: false
        ├─ theme: ThemeData
        │   ├─ colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)
        │   └─ useMaterial3: true
        └─ home: const HomePage()

  HomePage (StatefulWidget)
    ├─ const HomePage({super.key})
    └─ State<HomePage> createState() => HomePageState()

  HomePageState (extends State<HomePage>)
    ├─ bool eliminato = false;
    │
    ├─ Future<void> elimina() async
    │   ├─ final conferma = await showDialog<bool>(context: context, builder: ...)
    │   │   └─ AlertDialog
    │   │       ├─ title -> Text
    │   │       ├─ content -> Text
    │   │       └─ actions
    │   │           ├─ TextButton (Annulla)
    │   │           │   ├─ onPressed -> Navigator.of(context).pop(false)
    │   │           │   └─ child -> Text
    │   │           └─ TextButton (Elimina)
    │   │               ├─ onPressed -> Navigator.of(context).pop(true)
    │   │               └─ child -> Text
    │   └─ if (conferma == true)
    │       ├─ setState(() => eliminato = true)
    │       └─ ScaffoldMessenger.of(context).showSnackBar
    │           └─ SnackBar -> content -> Text
    │
    └─ build() → Scaffold
        ├─ appBar -> AppBar -> title -> Text
        └─ body -> Column
            └─ if (!eliminato) ListTile
                ├─ leading -> Icon
                ├─ title -> Text
                └─ trailing -> FilledButton
                    ├─ onPressed -> elimina
                    └─ child -> Text
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
      title: 'HomePage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool eliminato = false;

  Future<void> elimina() async {
    final conferma = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Conferma'),
          content: const Text('Vuoi davvero procedere?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Annulla'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Elimina'),
            ),
          ],
        );
      },
    );
    if (conferma == true) {
      setState(() {
        eliminato = true;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Eliminato con successo!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Column(
        children: [
          if (!eliminato)
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text('Sole'),
              trailing: FilledButton(
                onPressed: elimina,
                child: Text('Elimina'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Luna'),
              trailing: FilledButton(
                onPressed: elimina,
                child: Text('Elimina'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Stella'),
              trailing: FilledButton(
                onPressed: elimina,
                child: Text('Elimina'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text('Nuvola'),
              trailing: FilledButton(
                onPressed: elimina,
                child: Text('Elimina'),
              ),
            ),
        ],
      ),
    );
  }
}
