/*
  main()
  └─ runApp(TemaApp)

  TemaApp (StatefulWidget)
  └─ createState() → TemaAppState

  TemaAppState (State<TemaApp>)
  ├─ stato: bool _scuro
  └─ build() → MaterialApp

  MaterialApp
  ├─ title: 'Impostazioni'
  ├─ debugShowCheckedModeBanner: false
  ├─ themeMode: (ThemeMode.dark / ThemeMode.light in base a _scuro)
  ├─ theme: ThemeData (chiaro, colorScheme Cyan)
  ├─ darkTheme: ThemeData (scuro, colorScheme Cyan)
  └─ home: ImpostazioniPage
      └─ ImpostazioniPage (StatefulWidget)
          └─ createState() → ImpostazioniPageState

  ImpostazioniPageState (State<ImpostazioniPage>)
  ├─ stato locale: bool _notifiche
  ├─ stato locale: bool _suoni
  └─ build() → Scaffold
      ├─ appBar: AppBar
      │   ├─ centerTitle: true
      │   ├─ title: Text('Impostazioni')
      │   └─ backgroundColor: c.primary
      └─ body: Padding (all: 20)
          └─ SingleChildScrollView
              └─ Column
                  ├─ ClipRRect (borderRadius: 75) [NOVITÀ: Ritaglio circolare]
                  │   └─ Image.network (150x150, fit: BoxFit.cover)
                  │       ├─ loadingBuilder → CircularProgressIndicator (con percentuale)
                  │       └─ errorBuilder → Icon (Icons.account_circle, size: 150)
                  ├─ SizedBox (height: 16)
                  ├─ Card (color: c.primary)
                  │   └─ Padding (all: 20)
                  │       └─ Column (crossAxisAlignment: start)
                  │           ├─ Text('Ciao User!', fontSize: 25)
                  │           ├─ SizedBox (height: 5)
                  │           └─ Text('Gestisci le impostazioni...')
                  ├─ SizedBox (height: 16)
                  ├─ Divider
                  ├─ SizedBox (height: 16)
                  ├─ SwitchListTile (Notifiche)
                  │   ├─ secondary: Icon (notifications_active / notifications_off)
                  │   ├─ title: Text('Notifiche')
                  │   ├─ subtitle: Text('Notifiche attivate' / 'disattivate')
                  │   ├─ value: _notifiche
                  │   └─ onChanged: (v) → setState(_notifiche = v)
                  ├─ SwitchListTile (Suoni)
                  │   ├─ secondary: Icon (volume_up / volume_off)
                  │   ├─ title: Text('Suoni')
                  │   ├─ subtitle: Text('Suoni attivati' / 'disattivate')
                  │   ├─ value: _suoni
                  │   └─ onChanged: (v) → setState(_suoni = v)
                  ├─ SwitchListTile (Theme)
                  │   ├─ secondary: Icon (nightlight / wb_sunny)
                  │   ├─ title: Text('Theme')
                  │   ├─ subtitle: Text('Dark theme attivo' / 'Light theme attivo')
                  │   ├─ value: widget.scuro
                  │   └─ onChanged: widget.onToggle
                  ├─ SizedBox (height: 16)
                  ├─ Divider
                  ├─ SizedBox (height: 16)
                  ├─ CheckboxListTile (Termini)
                  │   ├─ title: Text('Accetto i termini')
                  │   ├─ subtitle: Text('Obbligatorio per continuare')
                  │   ├─ tristate: true
                  │   └─ value: null
                  ├─ CheckboxListTile (Pubblicità)
                  │   ├─ title: Text('Ricevere pubblicità...')
                  │   ├─ subtitle: Text('Opzionale')
                  │   └─ value: false
                  ├─ SizedBox (height: 16)
                  ├─ Divider
                  ├─ SizedBox (height: 16)
                  └─ Column (crossAxisAlignment: stretch) [NOVITÀ: Annidamento bottoni]
                      ├─ FilledButton ('Salva impostazioni')
                      ├─ SizedBox (height: 5)
                      └─ OutlinedButton ('Reset impostazioni')
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
      title: 'Impostazioni',
      debugShowCheckedModeBanner: false,
      themeMode: _scuro ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: ImpostazioniPage(
        scuro: _scuro,
        onToggle: (v) {
          setState(() => _scuro = v);
        },
      ),
    );
  }
}

class ImpostazioniPage extends StatefulWidget {
  final bool scuro;
  final ValueChanged<bool> onToggle;
  const ImpostazioniPage({
    super.key,
    required this.scuro,
    required this.onToggle,
  });

  @override
  State<ImpostazioniPage> createState() => ImpostazioniPageState();
}

class ImpostazioniPageState extends State<ImpostazioniPage> {
  bool _notifiche = false;
  bool _suoni = false;

  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Impostazioni', style: TextStyle(color: c.onPrimary)),
        backgroundColor: c.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.network(
                  'https://uploads-ssl.webflow.com/600b6ab92506fd10a1ca3f8a/60168d117ad9e2a335eeabfa_Box%202%20(3).png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 150,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Card(
                color: c.primary,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ciao User!',
                        style: TextStyle(color: c.onPrimary, fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Gestisci le impostazioni seguenti, ricordati di salvare alla fine e se non ti convincono puoi decidere di resettarle.',
                        style: TextStyle(color: c.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              SwitchListTile(
                secondary: Icon(
                  _notifiche
                      ? Icons.notifications_active
                      : Icons.notifications_off,
                ),
                title: Text('Notifiche'),
                subtitle: Text(
                  _notifiche ? 'Notifiche attivate' : 'Notifiche disattivate',
                ),
                value: _notifiche,
                onChanged: (v) {
                  setState(() => _notifiche = v);
                },
              ),
              SwitchListTile(
                secondary: Icon(_suoni ? Icons.volume_up : Icons.volume_off),
                title: Text('Suoni'),
                subtitle: Text(_suoni ? 'Suoni attivati' : 'Suoni disattivati'),
                value: _suoni,
                onChanged: (v) {
                  setState(() => _suoni = v);
                },
              ),
              SwitchListTile(
                secondary: Icon(
                  widget.scuro ? Icons.nightlight : Icons.wb_sunny,
                ),
                title: Text('Theme'),
                subtitle: Text(
                  widget.scuro ? 'Dark theme attivo' : 'Light theme attivo',
                ),
                value: widget.scuro,
                onChanged: widget.onToggle,
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('Accetto i termini'),
                subtitle: Text('Obbligatorio per continuare'),
                tristate: true,
                value: null,
                onChanged: (bool? value) {},
              ),
              CheckboxListTile(
                title: Text('Ricevere pubblicità/novità via email'),
                subtitle: Text('Opzionale'),
                value: false,
                onChanged: (bool? value) {},
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: Text('Salva impostazioni'),
                  ),
                  SizedBox(height: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Reset impostazioni'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
