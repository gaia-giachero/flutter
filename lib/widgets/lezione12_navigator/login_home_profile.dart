/*
  App a named routes: login con email, home di benvenuto, profile con gli stessi dati,
  logout che resetta lo stack.
    • `initialRoute` + mappa routes
    • Login → pushReplacementNamed Home + arguments
    • Home → Profile con pushNamed
    • Logout → pushNamedAndRemoveUntil Login

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
  
  Login (StatefullWidget)
    ├─ const Login({super.key})
    └─ build() -> Scaffold
          ├─ const MyApp({super.key})
          └─ build() → MaterialApp 
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
      title: 'Login',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  bool _obscureText = true;

  String tempPassword = '';
  String tempConfermaPassword = '';

  void _accedi() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();

      Navigator.pushReplacementNamed(context, '/home', arguments: _email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Login')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Email
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  iconColor: Colors.amber,
                  hintText: "Inserisci l'email...",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                onSaved: (String? value) {
                  _email = value ?? '';
                },
                validator: (String? value) {
                  return (value != null && !(value.contains('@')))
                      ? 'Manca il carattere @'
                      : null;
                },
              ),

              SizedBox(height: 20),

              // Password
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  icon: Icon(Icons.password_outlined),
                  iconColor: Colors.amber,
                  hintText: "Inserisci la password...",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                onSaved: (String? value) {
                  _password = value ?? '';
                },
                validator: (String? value) {
                  tempPassword = value ?? '';
                  if (tempPassword.isEmpty || tempPassword.length < 6) {
                    return 'Password inserita non valida.';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
                onPressed: _accedi,
                child: Text('Accedi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('HomePage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(email),
            SizedBox(height: 10),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              child: Text('Vai al tuo profilo'),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Profilo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ciao! Sei arrivato alla pagina del tuo profilo personale!'),
            SizedBox(height: 5),
            Text('Per tornare al login clicca il bottone qui sotto.'),
            SizedBox(height: 10),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              ),
              child: Text('Esegui il logout'),
            ),
          ],
        ),
      ),
    );
  }
}
