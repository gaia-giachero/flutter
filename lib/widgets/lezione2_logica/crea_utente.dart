import 'dart:io';

// creaUtente named + default
void main() {
  stdout.write('Inserisci il tuo nome: ');
  String nomeInput = stdin.readLineSync()?.trim() ?? '';
  String name = nomeInput == '' ? 'Utente' : nomeInput;

  print('Ciao $name!');
}