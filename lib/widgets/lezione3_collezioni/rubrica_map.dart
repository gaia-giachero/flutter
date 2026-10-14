/* Gaia Giachero - 29-09-2026 */

import 'dart:io';

//  Rubrica map: CRUD da terminale
void main() {
  // inizializzo un map chiamato rubrica
  final rubrica = <String, String>{
    'Anna': '333-111',
    'Luca': '444-222',
    'Marco': '555-333',
  };

  // CREATE
  void creaContatto() {
    // chiedo in input il nome da inserire
    stdout.write('Inserisci il nome da inserire in rubrica: ');
    // leggo il nome inserito
    String? nomeInput = stdin.readLineSync();

    // chiedo in input il numero da inserire
    stdout.write('Inserisci il numero da inserire in rubrica: ');
    // leggo il numero inserito
    String? numeroInput = stdin.readLineSync();

    // se uno dei due è null esco dalla funzione
    if (nomeInput == null || numeroInput == null) {
      print('Input non valido');
      return;
    }

    // stampo a schermo il nome e il numero inserito
    if (rubrica[nomeInput] == null) {
      rubrica[nomeInput] = numeroInput;
      print('Contatto $nomeInput aggiunto in rubrica');
    } else {
      print('Contatto già presente in rubrica');
      print('$nomeInput: $rubrica[nomeInput]');
    }
  }

  // READ
  void leggiContatto() {
    // chiedo in input il nome da cercare
    stdout.write('Inserisci il nome da cercare in rubrica: ');
    // leggo il nome inserito
    String? nomeInput = stdin.readLineSync();

    if (nomeInput == null) {
      print('Input non valido');
      return;
    }

    // stampo a schermo il numero associato al nome inserito
    if (rubrica[nomeInput] == null) {
      print('Nessun contatto con il nome $nomeInput');
    } else {
      print('$nomeInput: ${rubrica[nomeInput]}');
    }
  }

  // UPDATE
  void modificaContatto() {
    // chiedo in input il nome da modificare
    stdout.write('Inserisci il nome da modificare in rubrica: ');
    // leggo il nome inserito
    String? nomeInput = stdin.readLineSync();

    // chiedo in input il numero da modificare
    stdout.write('Inserisci il numero da modificare in rubrica: ');
    // leggo il numero inserito
    String? numeroInput = stdin.readLineSync();

    // se uno dei due è null esco dalla funzione
    if (nomeInput == null || numeroInput == null) {
      print('Input non valido');
      return;
    }

    if(rubrica[nomeInput] == null){
      print('Nessun contatto con il nome $nomeInput');
    } else {
      rubrica[nomeInput] = numeroInput;
      print('Contatto $nomeInput modificato correttamente, $nomeInput: $numeroInput');
    }
  }

  // DELETE
  void cancellaContatto() {
    // chiedo in input il nome da eliminare
    stdout.write('Inserisci il nome da eliminare in rubrica: ');
    // leggo il nome inserito
    String? nomeInput = stdin.readLineSync();

    if(nomeInput == null){
      print('Input non valido');
      return;
    }

    rubrica.remove(nomeInput);
    print('Il contatto $nomeInput è stato cancellato correttamente.');
  }

  int? numero = -1;
  while (numero != 0) {
    print('====== OPZIONI ======');
    print('0. Esci');
    print('1. Crea nuovo contatto');
    print('2. Cerca contatto');
    print('3. Modifica un contatto');
    print('4. Cancella un contatto');
    // chiedo in input il numero per l'azione da eseguire
    stdout.write('Inserisci il numero: ');
    // leggo il numero inserito
    String? numInserito = stdin.readLineSync();

    // converto la stringa in numero
    numero = int.tryParse(numInserito ?? '');

    switch (numero) {
      case 1:
        creaContatto();
      case 2:
        leggiContatto();
      case 3:
        modificaContatto();
      case 4:
        cancellaContatto();
      default:
        print('Opzione non valida');
    }
  }
}
