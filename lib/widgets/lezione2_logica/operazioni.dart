import 'dart:io';

eseguiOperazione(int num1, int num2, num Function(int, int) operazione) {
  print(operazione(num1, num2));
}

// eseguiOperazione + lambda
void main() {
  stdout.write('Inserisci il primo numero: ');
  String num1Input = stdin.readLineSync()?.trim() ?? '0';
  int num1 = int.tryParse(num1Input) ?? 0;

  stdout.write('Inserisci il secondo numero: ');
  String num2Input = stdin.readLineSync()?.trim() ?? '0';
  int num2 = int.tryParse(num2Input) ?? 0;

  stdout.write('Inserisci l\'operazione che vuoi eseguire: ');
  String operatore = stdin.readLineSync()?.trim() ?? '';

  // int somma(int num1, int num2) => num1 + num2;
  // int sottrazione(int num1, int num2) => num1 - num2;
  // int moltiplicazione(int num1, int num2) => num1 * num2;
  // double divisione(int num1, int num2) => num1 / num2;

  switch (operatore) {
    case '+':
      eseguiOperazione(num1, num2, (x, y) => x + y);
    case '-':
      eseguiOperazione(num1, num2, (x, y) => x - y);
    case '*':
      eseguiOperazione(num1, num2, (x, y) => x * y);
    case '/':
      eseguiOperazione(num1, num2, (x, y) => x / y);
    default:
      print('Operatore non valido.');
  }
}
