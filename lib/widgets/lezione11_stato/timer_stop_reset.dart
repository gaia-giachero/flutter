/* 
  Cronometro: secondi grandi a schermo, tre azioni, e dispose che cancella il Timer.
    • `import 'dart:async';`
    • Start → periodic 1s + setState
    • Stop cancella senza azzerare;
    • Reset ferma e azzera
    • In dispose → `_timer?.cancel()`

  main()
    └─ runApp(const TimerApp())

  TimerApp (Stateless)
    ├─ const TimerApp({super.key})
    └─ build() → MaterialApp
        ├─ title: 'Timer'
        ├─ debugShowCheckedModeBanner: false
        ├─ theme: ThemeData
        │   ├─ colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)
        │   └─ useMaterial3: true
        └─ home: TimerPage

  TimerPage (Stateless)
    ├─ const TimerPage({super.key})
    └─ build()
        ├─ final c = Theme.of(context).colorScheme
        └─ Scaffold
            ├─ AppBar
            │   ├─ centerTitle: true
            │   └─ title: Text('Timer')
            └─ body: Center
                ├─ IconButton (avvio timer)
                └─ onPressed > Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const Timer()))

  TimerStart (Stateful)
    ├─ const TimerStart({super.key})
    └─ State<TimerStart> createState() => _TimerState()

  TimerState (extend State<TimerStart>)
    ├─ late final TextEditingController _controller
    ├─ @override void initState() { super.initState(); _controller = TextEditingController(text: 'valore inziale')}
    ├─ @override void dispose() { _controller.dispose(); super.dispose()}
    └─ @override Widget build(BuildContext context) { return (_) => setState(() => _sec++) }
*/

import 'package:flutter/material.dart';

import 'dart:async';

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      debugShowCheckedModeBanner: false,
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer'), centerTitle: true),
      body: Center(
        child: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TimerStart()),
          ),
          icon: const Icon(Icons.play_arrow),
          color: Colors.black,
          iconSize: 50.0,
          tooltip: 'Avvia Timer',
          style: IconButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TimerStart extends StatefulWidget {
  const TimerStart({super.key});

  @override
  State<TimerStart> createState() => _TimerState();
}

class _TimerState extends State<TimerStart> {
  Timer? _timer;
  int _sec = 0;

  bool _timerIsActive() {
    return _timer?.isActive ?? false;
  }

  void _stop() {
    _timer?.cancel();
    _timer = null;
    setState(() {});
  }

  void _reset() {
    setState(() => _sec = 0);
  }

  void _resume() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_) => setState(() => _sec++),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _resume();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${(_sec ~/ 60).toString().padLeft(2, '0')}:${(_sec % 60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _timerIsActive() ? _stop : _resume,
                  icon: _timerIsActive()
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: _reset,
                  icon: const Icon(Icons.restart_alt),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
