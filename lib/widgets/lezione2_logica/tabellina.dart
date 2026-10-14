import 'dart:io';

// tabellina con for + while
void main() {
  int? numero = -1;

  while (numero != 0) {
    stdout.write(
      'Inserisci un numero per calcolare la tabellina (oppure 0 per uscire): ',
    );
    String? numInput = stdin.readLineSync();

    // tryParse evita crash se l'utente scrive lettere
    numero = int.tryParse(numInput ?? '');

    if (numero == null) {
      print('Numero non valido.');
    } else {
      print('Numero valido.');
      
      if (numero != 0) {
        print('=== Tabellina del $numero ===');
        for (int i = 0; i <= 10; i++) {
          print('$numero x $i = ${numero * i}');
        }
      }
    }
  }
  print('Programma terminato. Arrivederci!');
}
