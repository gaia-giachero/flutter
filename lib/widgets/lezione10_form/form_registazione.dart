/* 
  Form di registrazione: Schermata Crea account con email, password e conferma. 
  Niente backend: solo validazione UI.
    • Form + GlobalKey<FormState>
    • Tre TextFormField con validator sensati
    • FilledButton “Registrati” → validate / save / SnackBar
    • SingleChildScrollView per la tastiera

  main()
    └─ runApp(const FormRegistrazione())

*/

import 'package:flutter/material.dart';

void main() {
  runApp(FormRegistrazione());
}

class FormRegistrazione extends StatelessWidget {
  const FormRegistrazione({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Registrazione',
      debugShowCheckedModeBanner: false,
      home: ValidazioneRegistrazione(),
    );
  }
}

class ValidazioneRegistrazione extends StatefulWidget {
  const ValidazioneRegistrazione({super.key});

  @override
  State<ValidazioneRegistrazione> createState() =>
      _ValidazioneRegistrazioneState();
}

class _ValidazioneRegistrazioneState extends State<ValidazioneRegistrazione> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _number = '';
  String _password = '';

  bool _obscureText = true;
  bool _obscureTextConferma = true;

  String tempPassword = '';
  String tempConfermaPassword = '';

  void _invia() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registrazione effettuata con successo!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Form')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Nome
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  iconColor: Colors.amber,
                  hintText: "Inserisci il tuo nome...",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                onSaved: (String? value) {
                  _name = value ?? '';
                },
                validator: (String? value) {
                  return (value != null && value.length < 4)
                      ? 'Do not insert a valid name.'
                      : null;
                },
              ),

              SizedBox(height: 20),

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

              // Phone number
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_outlined),
                  iconColor: Colors.amber,
                  hintText: "Inserisci il numero di telefono...",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Telefono',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                onSaved: (String? value) {
                  _number = value ?? '';
                },
                validator: (String? value) {
                  return (value != null && value.length < 10)
                      ? 'Numero inserito non valido.'
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

              // Conferma password
              TextFormField(
                obscureText: _obscureTextConferma,
                decoration: InputDecoration(
                  icon: Icon(Icons.password_outlined),
                  iconColor: Colors.amber,
                  hintText: "Inserisci la password...",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Conferma Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextConferma ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextConferma = !_obscureTextConferma;
                      });
                    },
                  ),
                ),
                // onSaved: (String? value) {},
                validator: (String? value) {
                  tempConfermaPassword = value ?? '';
                  return (tempConfermaPassword != tempPassword)
                      ? 'Le password non coincidono.'
                      : null;
                },
              ),

              SizedBox(height: 20),

              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
                onPressed: _invia,
                child: Text('Registrati'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
